-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ideas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ideas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ideas` DEFAULT CHARACTER SET utf8mb4 ;
USE `ideas` ;

-- -----------------------------------------------------
-- Table `ideas`.`catagories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ideas`.`catagories` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 20
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `ideas`.`cities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ideas`.`cities` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `costPerAcer` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 36
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `ideas`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ideas`.`products` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `description` LONGTEXT NOT NULL,
  `rationale` LONGTEXT NULL DEFAULT NULL,
  `marketPotential` LONGTEXT NOT NULL,
  `rawMaterial` LONGTEXT NOT NULL,
  `technology` LONGTEXT NOT NULL,
  `benefits` LONGTEXT NOT NULL,
  `catagories_id` INT(11) NOT NULL,
  `cities_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_products_catagories_idx` (`catagories_id` ASC),
  INDEX `fk_products_cities1_idx` (`cities_id` ASC),
  CONSTRAINT `fk_products_catagories`
    FOREIGN KEY (`catagories_id`)
    REFERENCES `ideas`.`catagories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_cities1`
    FOREIGN KEY (`cities_id`)
    REFERENCES `ideas`.`cities` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `ideas`.`costs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ideas`.`costs` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `machinery` INT(11) NOT NULL,
  `labor` INT(11) NOT NULL,
  `cities_id` INT(11) NOT NULL,
  `products_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_costs_cities1_idx` (`cities_id` ASC),
  INDEX `fk_costs_products1_idx` (`products_id` ASC),
  CONSTRAINT `fk_costs_cities1`
    FOREIGN KEY (`cities_id`)
    REFERENCES `ideas`.`cities` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
