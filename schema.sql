CREATE DATABASE yeticave;

USE yeticave;

/* Создание сущностей проекта */

CREATE TABLE `categories` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(50) NULL DEFAULT NULL,
	`slug` VARCHAR(50) NULL DEFAULT NULL,
	PRIMARY KEY (`id`),
	UNIQUE INDEX `name` (`name`),
	UNIQUE INDEX `slug` (`slug`)
)
CHARACTER SET utf8 
COLLATE='utf8_general_ci'
;

CREATE TABLE `lots` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`creation_date` DATETIME NOT NULL,
	`name` VARCHAR(255) NOT NULL,
	`description` TEXT NULL DEFAULT NULL,
	`image` VARCHAR(255) NULL DEFAULT NULL,
	`start_price` INT(10) NOT NULL,
	`expiration_date` DATE NOT NULL,
	`bet_step` INT(10) NOT NULL,
	`author_id` INT(11) NOT NULL,
	`winner_id` INT(11) NULL,
	`category_id` INT(11) NOT NULL,
	PRIMARY KEY (`id`),
	INDEX `creation_date` (`creation_date`),
	INDEX `name` (`name`),
	INDEX `expiration_date` (`expiration_date`)
)
CHARACTER SET utf8 
COLLATE='utf8_general_ci'
;

CREATE TABLE `bets` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`creation_date` DATETIME NOT NULL,
	`price` INT(10) NOT NULL,
	`author_id` INT(11) NOT NULL,
	`lot_id` INT(11) NOT NULL,
	PRIMARY KEY (`id`),
	INDEX `creation_date` (`creation_date`),
	INDEX `price` (`price`)
)
CHARACTER SET utf8 
COLLATE='utf8_general_ci'
;


CREATE TABLE `users` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`registration_date` DATETIME NOT NULL,
	`email` VARCHAR(255) NOT NULL,
	`name` VARCHAR(255) NOT NULL,
	`password` CHAR(32) NOT NULL,
	`contacts` VARCHAR(255) NULL DEFAULT NULL,
	PRIMARY KEY (`id`),
	UNIQUE INDEX `email` (`email`),
	INDEX `registration_date` (`registration_date`),
	INDEX `name` (`name`)
)
CHARACTER SET utf8 
COLLATE='utf8_general_ci'
;

/* Создание связей проекта */

ALTER TABLE lots
ADD FOREIGN KEY (`author_id`) REFERENCES users(`id`),
ADD FOREIGN KEY (`winner_id`) REFERENCES users(`id`),
ADD FOREIGN KEY (`category_id`) REFERENCES categories(`id`);

ALTER TABLE bets
ADD FOREIGN KEY (`author_id`) REFERENCES users(`id`),
ADD FOREIGN KEY (`lot_id`) REFERENCES lots(`id`);

CREATE TABLE `users_bets` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`user_id` INT(11) NOT NULL,
	`bet_id` INT(11) NOT NULL,
	PRIMARY KEY (`id`)
)
CHARACTER SET utf8 
COLLATE='utf8_general_ci'
;

SELECT * FROM users u
INNER JOIN users_bets ub ON u.id = ub.user_id
INNER JOIN bets b ON ub.bet_id = b.id;

CREATE TABLE `users_lots` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`user_id` INT(11) NOT NULL,
	`lot_id` INT(11) NOT NULL,
	PRIMARY KEY (`id`)
)
CHARACTER SET utf8 
COLLATE='utf8_general_ci'
;

SELECT * FROM users u
INNER JOIN users_lots ul ON u.id = ul.user_id
INNER JOIN lots l ON ul.lot_id = l.id;