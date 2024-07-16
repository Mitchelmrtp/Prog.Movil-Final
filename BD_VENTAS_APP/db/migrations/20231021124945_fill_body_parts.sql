-- migrate:up

INSERT INTO categorys (id, name) VALUES (1, "ABDOMEN");
INSERT INTO categorys (id, name) VALUES (2, "PIERNAS");
INSERT INTO categorys (id, name) VALUES (3, "PANTORRILLA");
INSERT INTO categorys (id, name) VALUES (4, "PECTORAL");
INSERT INTO categorys (id, name) VALUES (5, "ESPALDA");
INSERT INTO categorys (id, name) VALUES (6, "HOMBROS");
INSERT INTO categorys (id, name) VALUES (7, "BICEPS");
INSERT INTO categorys (id, name) VALUES (8, "TRICEPS");

-- migrate:down

DELETE FROM categorys;
