CREATE DATABASE yeticave;

USE yeticave;

CREATE TABLE `category` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(50) NULL DEFAULT NULL,
	`slug` VARCHAR(50) NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	UNIQUE INDEX `name` (`name`) USING BTREE,
	UNIQUE INDEX `slug` (`slug`) USING BTREE
)
CHARACTER SET utf8 
COLLATE='utf8_general_ci'
;

CREATE TABLE `lot` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`creation_date` DATETIME NOT NULL,
	`name` VARCHAR(255) NOT NULL,
	`description` TEXT NULL DEFAULT NULL,
	`image` VARCHAR(255) NULL DEFAULT NULL,
	`start_price` INT(10) NOT NULL,
	`expiration_date` DATE NOT NULL,
	`bet_step` INT(10) NOT NULL,
	`author` INT(11) NOT NULL,
	`winner` INT(11) NOT NULL,
	`category` INT(11) NOT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `creation_date` (`creation_date`) USING BTREE,
	INDEX `name` (`name`) USING BTREE,
	INDEX `expiration_date` (`expiration_date`) USING BTREE
)
CHARACTER SET utf8 
COLLATE='utf8_general_ci'
;


CREATE TABLE `bet` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`creation_date` DATETIME NOT NULL,
	`price` INT(10) NOT NULL,
	`author` INT(11) NOT NULL,
	`lot` INT(11) NOT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `creation_date` (`creation_date`) USING BTREE,
	INDEX `price` (`price`) USING BTREE
)
CHARACTER SET utf8 
COLLATE='utf8_general_ci'
;


CREATE TABLE `user` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`registration_date` DATETIME NOT NULL,
	`email` VARCHAR(255) NOT NULL,
	`name` VARCHAR(255) NOT NULL,
	`password` CHAR(32) NOT NULL,
	`contacts` VARCHAR(255) NULL DEFAULT NULL,
	`lot` INT(11) NOT NULL,
	`bet` INT(11) NOT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	UNIQUE INDEX `email` (`email`) USING BTREE,
	INDEX `registration_date` (`registration_date`) USING BTREE,
	INDEX `name` (`name`) USING BTREE
)
CHARACTER SET utf8 
COLLATE='utf8_general_ci'
;

ALTER TABLE lot
ADD FOREIGN KEY (`author`) REFERENCES user(`id`),
ADD FOREIGN KEY (`winner`) REFERENCES user(`id`),
ADD FOREIGN KEY (`category`) REFERENCES category(`id`);

ALTER TABLE bet
ADD FOREIGN KEY (`author`) REFERENCES user(`id`),
ADD FOREIGN KEY (`lot`) REFERENCES lot(`id`);

ALTER TABLE user
ADD FOREIGN KEY (`lot`) REFERENCES lot(`id`),
ADD FOREIGN KEY (`bet`) REFERENCES bet(`id`);
