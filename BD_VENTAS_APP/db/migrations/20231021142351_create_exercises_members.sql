-- migrate:up

CREATE TABLE productos_perfiles (
  id	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  reps	INTEGER,
  sets	INTEGER,
  producto_id	INTEGER NOT NULL,
  perfil_id	INTEGER NOT NULL,
  FOREIGN KEY (perfil_id) REFERENCES perfils (id),
  FOREIGN KEY (producto_id) REFERENCES productos (id)
);

-- migrate:down

DROP TABLE IF EXISTS productos_perfiles;