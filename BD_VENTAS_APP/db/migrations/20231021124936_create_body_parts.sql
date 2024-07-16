-- migrate:up

CREATE TABLE categorys (
  id	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  name	VARCHAR(30)
);

-- migrate:down

DROP TABLE IF EXISTS categorys;
