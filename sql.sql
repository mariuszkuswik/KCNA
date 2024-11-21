-- Create the database
CREATE DATABASE IF NOT EXISTS `your_database_name`;

-- Switch to the database
USE `your_database_name`;

-- Table for items
CREATE TABLE IF NOT EXISTS `items` (
    `id` BIGINT PRIMARY KEY, -- Assuming 'id' is unique
    `name` VARCHAR(255) NOT NULL,
    `price` DECIMAL(10, 2) NOT NULL,
    `suggested_price` DECIMAL(10, 2) NOT NULL,
    `discount` INT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `tradehold` TINYINT NOT NULL,
    `type_id` INT NOT NULL,
    `skin_id` INT NOT NULL,
    UNIQUE KEY `unique_item` (`id`, `type_id`, `skin_id`)
);

-- Table for price history
CREATE TABLE IF NOT EXISTS `price_history` (
    `history_id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `asset_id` BIGINT NOT NULL,
    `price` DECIMAL(10, 2) NOT NULL,
    `change_date` DATETIME NOT NULL,
    `type_id` INT NOT NULL,
    `skin_id` INT NOT NULL,
    UNIQUE KEY `unique_price_entry` (`type_id`, `skin_id`, `change_date`)
);

-- Table for daily price history
CREATE TABLE IF NOT EXISTS `daily_price_history` (
    `history_id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `asset_id` BIGINT NOT NULL,
    `price` DECIMAL(10, 2) NOT NULL,
    `change_date` DATE NOT NULL,
    `type_id` INT NOT NULL,
    `skin_id` INT NOT NULL,
    UNIQUE KEY `unique_daily_price_entry` (`asset_id`, `type_id`, `skin_id`, `change_date`)
);


