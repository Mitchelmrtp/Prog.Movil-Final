-- migrate:up

CREATE TABLE productos (
  id	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  name	VARCHAR(40),
  image_url VARCHAR(50),
  video_url VARCHAR(80),
  description TEXT,
  category_id	INTEGER NOT NULL,
  FOREIGN KEY (category_id) REFERENCES categorys (id)
);

-- migrate:down

DROP TABLE IF EXISTS productos;
