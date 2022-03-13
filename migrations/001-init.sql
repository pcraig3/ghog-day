-- Up
CREATE TABLE groundhogs (
  id INTEGER PRIMARY KEY,
  name TEXT,
  fullname TEXT,
  city TEXT,
  country TEXT,
  source TEXT
);

CREATE TABLE predictions (
  id INTEGER PRIMARY KEY,
  ghogId INTEGER,
  year INTEGER,
  shadow BOOLEAN,
  details TEXT,
  UNIQUE (ghogId, year)
);

/* Insert rows */
INSERT INTO groundhogs (id, name, fullname, city, country, source) VALUES (1, 'Phil', 'Punxatawney Phil', 'Punxatawney', 'USA', 'https://www.groundhog.org/history-past-predictions');
INSERT INTO groundhogs (id, name, fullname, city, country, source) VALUES (2, 'Willie', 'Wiarton Willie', 'Wiarton', 'Canada', 'https://www.southbrucepeninsula.com/en/explore-and-play/wiarton-willie.aspx#Past-predictions');

-- Down
DROP TABLE IF EXISTS predictions;
DROP TABLE IF EXISTS groundhogs;
