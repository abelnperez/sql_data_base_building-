-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema movies
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema movies
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `movies` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `movies` ;

-- -----------------------------------------------------
-- Table `movies`.`actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies`.`actor` (
  `actor_id` INT NOT NULL,
  `first_name` VARCHAR(20) NOT NULL,
  `last_name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`actor_id`),
  INDEX `idx_actor_id` (`actor_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `movies`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies`.`category` (
  `category_id` INT NOT NULL,
  `category_name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`category_id`),
  INDEX `idx_category_id` (`category_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `movies`.`language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies`.`language` (
  `language_id` INT NOT NULL,
  `language_name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`language_id`),
  INDEX `idx_language_id` (`language_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `movies`.`film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies`.`film` (
  `film_id` INT NOT NULL,
  `title` VARCHAR(50) NOT NULL,
  `description` MEDIUMTEXT NULL DEFAULT NULL,
  `release_year` INT NOT NULL,
  `language_id` INT NOT NULL,
  `rental_duration` INT NOT NULL,
  `rental_rate` INT NOT NULL,
  `length` INT NOT NULL,
  `replacement_cost` INT NOT NULL,
  `rating` VARCHAR(50) NOT NULL,
  `special_features` VARCHAR(60) NOT NULL,
  `category_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  INDEX `idx_film_id` (`film_id` ASC) VISIBLE,
  INDEX `fk_film_category` (`category_id` ASC) VISIBLE,
  INDEX `fk_film_language` (`language_id` ASC) VISIBLE,
  CONSTRAINT `fk_film_category`
    FOREIGN KEY (`category_id`)
    REFERENCES `movies`.`category` (`category_id`),
  CONSTRAINT `fk_film_language`
    FOREIGN KEY (`language_id`)
    REFERENCES `movies`.`language` (`language_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `movies`.`characters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies`.`characters` (
  `actor_id` INT NOT NULL,
  `film_id` INT NOT NULL,
  PRIMARY KEY (`actor_id`, `film_id`),
  INDEX `film_id` (`film_id` ASC) VISIBLE,
  CONSTRAINT `characters_ibfk_1`
    FOREIGN KEY (`actor_id`)
    REFERENCES `movies`.`actor` (`actor_id`),
  CONSTRAINT `characters_ibfk_2`
    FOREIGN KEY (`film_id`)
    REFERENCES `movies`.`film` (`film_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `movies`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies`.`customer` (
  `customer_id` INT NOT NULL,
  `cu_fname` VARCHAR(20) NOT NULL,
  `cu_lname` VARCHAR(20) NOT NULL,
  `address` VARCHAR(50) NOT NULL,
  `phone` VARCHAR(50) NULL DEFAULT NULL,
  `city` VARCHAR(40) NOT NULL,
  `state` VARCHAR(20) NOT NULL,
  `zip` INT NOT NULL,
  PRIMARY KEY (`customer_id`),
  INDEX `idx_customer_id` (`customer_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `movies`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies`.`inventory` (
  `inventory_id` INT NOT NULL,
  `film_id` INT NOT NULL,
  PRIMARY KEY (`inventory_id`),
  INDEX `idx_inventory_id` (`inventory_id` ASC) VISIBLE,
  INDEX `fk_inventory_film` (`film_id` ASC) VISIBLE,
  CONSTRAINT `fk_inventory_film`
    FOREIGN KEY (`film_id`)
    REFERENCES `movies`.`film` (`film_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `movies`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies`.`staff` (
  `staff_id` INT NOT NULL,
  `s_fname` VARCHAR(20) NOT NULL,
  `s_lname` VARCHAR(20) NOT NULL,
  `s_address` VARCHAR(50) NOT NULL,
  `s_phone` VARCHAR(50) NULL DEFAULT NULL,
  `s_city` VARCHAR(40) NOT NULL,
  `s_state` VARCHAR(20) NOT NULL,
  `s_zip` INT NOT NULL,
  PRIMARY KEY (`staff_id`),
  INDEX `idx_staff_id` (`staff_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `movies`.`rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies`.`rental` (
  `rental_id` INT NOT NULL,
  `rental_date` DATETIME NULL DEFAULT NULL,
  `inventory_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `return_date` DATETIME NULL DEFAULT NULL,
  `staff_id` INT NOT NULL,
  PRIMARY KEY (`rental_id`),
  INDEX `idx_rental_id` (`rental_id` ASC) VISIBLE,
  INDEX `fk_rental_customer` (`customer_id` ASC) VISIBLE,
  INDEX `fk_rental_staff` (`staff_id` ASC) VISIBLE,
  INDEX `fk_rental_inventory` (`inventory_id` ASC) VISIBLE,
  CONSTRAINT `fk_rental_customer`
    FOREIGN KEY (`customer_id`)
    REFERENCES `movies`.`customer` (`customer_id`),
  CONSTRAINT `fk_rental_inventory`
    FOREIGN KEY (`inventory_id`)
    REFERENCES `movies`.`inventory` (`inventory_id`),
  CONSTRAINT `fk_rental_staff`
    FOREIGN KEY (`staff_id`)
    REFERENCES `movies`.`staff` (`staff_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
