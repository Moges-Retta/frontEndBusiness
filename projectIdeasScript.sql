-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`catagories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`catagories` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`projects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`projects` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `catagories_id` INT NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_projects_catagories_idx` (`catagories_id` ASC),
  CONSTRAINT `fk_projects_catagories`
    FOREIGN KEY (`catagories_id`)
    REFERENCES `mydb`.`catagories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` LONGTEXT NOT NULL,
  `rationale` LONGTEXT NOT NULL,
  `marketPotential` LONGTEXT NOT NULL,
  `rawMaterial` LONGTEXT NOT NULL,
  `technology` LONGTEXT NOT NULL,
  `benefits` LONGTEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Landcost`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Landcost` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cost` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Projectline`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Projectline` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `machineryCost` VARCHAR(45) NOT NULL,
  `workingCapital` VARCHAR(45) NOT NULL,
  `projects_id` INT NOT NULL,
  `products_id` INT NOT NULL,
  `Landcost_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Projectline_projects1_idx` (`projects_id` ASC),
  INDEX `fk_Projectline_products1_idx` (`products_id` ASC),
  INDEX `fk_Projectline_Landcost1_idx` (`Landcost_id` ASC),
  CONSTRAINT `fk_Projectline_projects1`
    FOREIGN KEY (`projects_id`)
    REFERENCES `mydb`.`projects` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Projectline_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `mydb`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Projectline_Landcost1`
    FOREIGN KEY (`Landcost_id`)
    REFERENCES `mydb`.`Landcost` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
