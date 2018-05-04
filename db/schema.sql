DROP DATABASE IF EXISTS jello_db;

CREATE DATABASE jello_db;
USE jello_db;

CREATE TABLE boards
(
	id INTEGER UNSIGNED AUTO_INCREMENT NOT NULL,
	name VARCHAR(40) NOT NULL,
	starred BOOLEAN DEFAULT 0,
	PRIMARY KEY (id)
);

CREATE TABLE lists
(
	id INTEGER UNSIGNED AUTO_INCREMENT NOT NULL,
	name VARCHAR(40) NOT NULL,
	board_id INTEGER UNSIGNED NOT NULL,
	starred BOOLEAN DEFAULT 0,
	PRIMARY KEY (id),
	FOREIGN KEY(board_id) REFERENCES boards(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE cards
(
	id INTEGER UNSIGNED AUTO_INCREMENT NOT NULL,
	text VARCHAR(200) NOT NULL,
	list_id INTEGER UNSIGNED NOT NULL,
	starred BOOLEAN DEFAULT 0,
	PRIMARY KEY (id),
	FOREIGN KEY(list_id) REFERENCES lists(id) ON UPDATE CASCADE ON DELETE CASCADE
);