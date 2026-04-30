-- AI Team Starter Kit — v0.1 Archivist schema
-- Run on first startup; idempotent via IF NOT EXISTS.

PRAGMA journal_mode = WAL;
PRAGMA foreign_keys = ON;
PRAGMA user_version = 1;

-- ---------- Core: one row per ingested file ----------
CREATE TABLE IF NOT EXISTS items (
  id               INTEGER PRIMARY KEY AUTOINCREMENT,
  original_filename TEXT    NOT NULL,
  archived_path    TEXT    NOT NULL,
  file_type        TEXT    NOT NULL,         -- lowercase extension
  kind             TEXT    NOT NULL          -- one of 7 buckets
                   CHECK (kind IN ('document','spreadsheet','image','pdf','email','note','other')),
  title            TEXT,
  summary          TEXT,
  extracted_text   TEXT,
  metadata         TEXT    DEFAULT '{}'      -- JSON; validate with json_valid in app
                   CHECK (json_valid(metadata)),
  source           TEXT    NOT NULL DEFAULT 'team_inbox',
  dropped_at       TEXT,                     -- ISO 8601, file mtime
  archived_at      TEXT    NOT NULL DEFAULT (datetime('now')),
  byte_size        INTEGER,
  content_hash     TEXT    UNIQUE            -- SHA-256, dedupe key
);

CREATE INDEX IF NOT EXISTS idx_items_archived_at ON items(archived_at DESC);
CREATE INDEX IF NOT EXISTS idx_items_kind        ON items(kind);
CREATE INDEX IF NOT EXISTS idx_items_file_type   ON items(file_type);

-- ---------- Tags: flat, free-form ----------
CREATE TABLE IF NOT EXISTS tags (
  id   INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS item_tags (
  item_id INTEGER NOT NULL REFERENCES items(id) ON DELETE CASCADE,
  tag_id  INTEGER NOT NULL REFERENCES tags(id)  ON DELETE CASCADE,
  PRIMARY KEY (item_id, tag_id)
);

CREATE INDEX IF NOT EXISTS idx_item_tags_tag ON item_tags(tag_id);

-- ---------- Full-text search (external content, mirrors items) ----------
CREATE VIRTUAL TABLE IF NOT EXISTS items_fts USING fts5(
  title, summary, extracted_text,
  content='items', content_rowid='id',
  tokenize='porter unicode61'
);

-- Sync triggers
CREATE TRIGGER IF NOT EXISTS items_ai AFTER INSERT ON items BEGIN
  INSERT INTO items_fts(rowid, title, summary, extracted_text)
  VALUES (new.id, new.title, new.summary, new.extracted_text);
END;

CREATE TRIGGER IF NOT EXISTS items_ad AFTER DELETE ON items BEGIN
  INSERT INTO items_fts(items_fts, rowid, title, summary, extracted_text)
  VALUES ('delete', old.id, old.title, old.summary, old.extracted_text);
END;

CREATE TRIGGER IF NOT EXISTS items_au AFTER UPDATE ON items BEGIN
  INSERT INTO items_fts(items_fts, rowid, title, summary, extracted_text)
  VALUES ('delete', old.id, old.title, old.summary, old.extracted_text);
  INSERT INTO items_fts(rowid, title, summary, extracted_text)
  VALUES (new.id, new.title, new.summary, new.extracted_text);
END;

-- ---------- Convenience view ----------
CREATE VIEW IF NOT EXISTS v_items_recent AS
SELECT
  i.id, i.title, i.summary, i.kind, i.file_type,
  i.archived_path, i.archived_at, i.dropped_at,
  GROUP_CONCAT(t.name, ', ') AS tags
FROM items i
LEFT JOIN item_tags it ON it.item_id = i.id
LEFT JOIN tags t       ON t.id = it.tag_id
GROUP BY i.id
ORDER BY i.archived_at DESC;
