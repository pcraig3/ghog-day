-- Up
CREATE TABLE predictions (
  id INTEGER PRIMARY KEY,
  ghog_id INTEGER,
  year INTEGER,
  shadow BOOLEAN,
  details TEXT,
  UNIQUE (ghog_id, year)
);

INSERT INTO predictions (ghog_id, year, shadow, details) VALUES (1, 2020, 1, 'Shadow, Six More Weeks of Winter!');
INSERT INTO predictions (ghog_id, year, shadow, details) VALUES (1, 2021, 0, 'No Shadow, Early Spring!');

-- Down
DROP TABLE IF EXISTS predictions;
