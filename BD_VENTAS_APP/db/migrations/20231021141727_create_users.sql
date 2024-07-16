-- migrate:up

CREATE TABLE users (
  id	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  user	VARCHAR(30),
  password	VARCHAR(30),
  perfil_id	INTEGER NOT NULL,
  FOREIGN KEY (perfil_id) REFERENCES perfils (id)
);

-- migrate:down

DROP TABLE IF EXISTS users;
