-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Ice_Cream_Buisness_DB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ice_Cream_Buisness_DB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ice_Cream_Buisness_DB` DEFAULT CHARACTER SET utf8 ;
USE `Ice_Cream_Buisness_DB` ;

-- -----------------------------------------------------
-- Table `Ice_Cream_Buisness_DB`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ice_Cream_Buisness_DB`.`customer` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(95) NOT NULL,
  `last_name` VARCHAR(95) NOT NULL,
  `phone_number` VARCHAR(95) NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ice_Cream_Buisness_DB`.`vendors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ice_Cream_Buisness_DB`.`vendors` (
  `vendor_id` INT NOT NULL,
  `vendor_name` VARCHAR(45) NOT NULL,
  `vendor_balance` VARCHAR(95) NOT NULL,
  `last_payment_date` INT NOT NULL,
  PRIMARY KEY (`vendor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ice_Cream_Buisness_DB`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ice_Cream_Buisness_DB`.`products` (
  `product_id` INT NOT NULL,
  `product_name` VARCHAR(95) NULL,
  `product_price` DECIMAL(5,2) NULL,
  `current_product_inventory` DECIMAL(5,2) NULL,
  `vendor_id` INT NULL,
  PRIMARY KEY (`product_id`),
  INDEX `vendor_id_idx` (`vendor_id` ASC) VISIBLE,
  CONSTRAINT `vendor_id`
    FOREIGN KEY (`vendor_id`)
    REFERENCES `Ice_Cream_Buisness_DB`.`vendors` (`vendor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ice_Cream_Buisness_DB`.`toppings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ice_Cream_Buisness_DB`.`toppings` (
  `toppings_id` INT NOT NULL,
  `toppings_name` VARCHAR(45) NOT NULL,
  `toppings_price` DECIMAL(5,2) NOT NULL,
  `toppings_inventory` DECIMAL(5,2) NOT NULL,
  `vendor_id` INT NOT NULL,
  PRIMARY KEY (`toppings_id`),
  INDEX `vendor_id_idx` (`vendor_id` ASC) VISIBLE,
  CONSTRAINT `vendor_id_top`
    FOREIGN KEY (`vendor_id`)
    REFERENCES `Ice_Cream_Buisness_DB`.`vendors` (`vendor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ice_Cream_Buisness_DB`.`Sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ice_Cream_Buisness_DB`.`Sales` (
  `sale_id` INT NOT NULL AUTO_INCREMENT,
  `sale_datetime` DATETIME(6) NOT NULL,
  `customer_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `toppings_id` INT NULL,
  `sale_amount` INT NOT NULL,
  PRIMARY KEY (`sale_id`),
  INDEX `customer_id_idx` (`customer_id` ASC) VISIBLE,
  INDEX `toppings_id_idx` (`toppings_id` ASC) VISIBLE,
  INDEX `product_id_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `customer_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `Ice_Cream_Buisness_DB`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `toppings_id`
    FOREIGN KEY (`toppings_id`)
    REFERENCES `Ice_Cream_Buisness_DB`.`toppings` (`toppings_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `Ice_Cream_Buisness_DB`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
