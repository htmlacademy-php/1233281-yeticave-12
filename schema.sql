CREATE DATABASE yeticave;

USE yeticave;

CREATE TABLE `category` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`slug` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	PRIMARY KEY (`id`) USING BTREE,
	UNIQUE INDEX `name` (`name`) USING BTREE,
	UNIQUE INDEX `slug` (`slug`) USING BTREE
);

CREATE TABLE `lot` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`creation_date` DATE NOT NULL,
	`name` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`description` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`image` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	`start_price` DOUBLE NOT NULL,
	`expiration_date` DATE NOT NULL,
	`bet_step` DOUBLE NOT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `creation_date` (`creation_date`) USING BTREE,
	INDEX `name` (`name`) USING BTREE,
	INDEX `start_price` (`start_price`) USING BTREE,
	INDEX `expiration_date` (`expiration_date`) USING BTREE,
	INDEX `bet_step` (`bet_step`) USING BTREE,
	INDEX `image` (`image`) USING BTREE
);

CREATE TABLE `bet` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`creation_date` DATETIME NOT NULL,
	`price` DOUBLE NOT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `creation_date` (`creation_date`) USING BTREE,
	INDEX `price` (`price`) USING BTREE
);

CREATE TABLE `user` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`registration_date` DATETIME NOT NULL,
	`email` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`name` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`password` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`contacts` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
	PRIMARY KEY (`id`) USING BTREE,
	UNIQUE INDEX `email` (`email`) USING BTREE,
	INDEX `registration_date` (`registration_date`) USING BTREE,
	INDEX `name` (`name`) USING BTREE,
	INDEX `password` (`password`) USING BTREE
);
