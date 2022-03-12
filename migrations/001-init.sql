-- Up
CREATE TABLE `users` (
  id INTEGER PRIMARY KEY,
  firstName TEXT NOT NULL,
  lastName TEXT NOT NULL
);

INSERT INTO `users` (id, firstname, lastname) VALUES (1, 'Kevin', 'Craig');
INSERT INTO `users` (id, firstname, lastname) VALUES (2, 'Rhianna', 'Kidd');

-- Down
DROP TABLE IF EXISTS `users`;