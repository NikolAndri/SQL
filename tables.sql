-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ClassMates
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ClassMates
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ClassMates` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `ClassMates` ;

-- -----------------------------------------------------
-- Table `ClassMates`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ClassMates`.`Users` (
  `idUsers` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `UserName` VARCHAR(45) NOT NULL,
  `UserPasscode` VARCHAR(45) NOT NULL,
  `fName` VARCHAR(45) NOT NULL,
  `lName` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `dob` VARCHAR(45) NOT NULL,
  `schoolName` VARCHAR(45) NOT NULL,
  `grad_year` DATE NOT NULL,
  `join_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`idUsers`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `UserName_UNIQUE` (`UserName` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ClassMates`.`friends`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ClassMates`.`friends` (
  `idfriends` VARCHAR(45) NOT NULL,
  `idUsers` VARCHAR(45) NOT NULL,
  `date_added` DATE NOT NULL,
  PRIMARY KEY (`idfriends`, `idUsers`),
  INDEX `idUsers_idx` (`idUsers` ASC) VISIBLE,
  CONSTRAINT `idUsers`
    FOREIGN KEY (`idUsers`)
    REFERENCES `ClassMates`.`Users` (`idUsers`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ClassMates`.`likes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ClassMates`.`likes` (
  `idlikes` INT NOT NULL AUTO_INCREMENT,
  `idUsers` VARCHAR(45) NOT NULL,
  `date_liked` DATE NOT NULL,
  PRIMARY KEY (`idlikes`),
  INDEX `idUsers` (`idUsers` ASC) VISIBLE,
  CONSTRAINT `likes_ibfk_1`
    FOREIGN KEY (`idUsers`)
    REFERENCES `ClassMates`.`Users` (`idUsers`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ClassMates`.`order_premium`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ClassMates`.`order_premium` (
  `idOrder` INT NOT NULL AUTO_INCREMENT,
  `idUsers` VARCHAR(45) NOT NULL,
  `idcategory` VARCHAR(45) NOT NULL,
  `date_purchased` DATE NOT NULL,
  `expiration_date` DATE NOT NULL,
  `payment` INT NOT NULL,
  PRIMARY KEY (`idOrder`, `idcategory`),
  INDEX `idUsers` (`idUsers` ASC) VISIBLE,
  CONSTRAINT `order_premium_ibfk_1`
    FOREIGN KEY (`idUsers`)
    REFERENCES `ClassMates`.`Users` (`idUsers`))
ENGINE = InnoDB
AUTO_INCREMENT = 571
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ClassMates`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ClassMates`.`payment` (
  `idpayment` INT NOT NULL AUTO_INCREMENT,
  `idOrder` INT NOT NULL,
  `amount` INT NOT NULL,
  `card_type` VARCHAR(20) NOT NULL,
  `card_Number` INT NOT NULL,
  `cvv` INT NOT NULL,
  `Name_on_card` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idpayment`),
  INDEX `idOrder` (`idOrder` ASC) VISIBLE,
  CONSTRAINT `payment_ibfk_1`
    FOREIGN KEY (`idOrder`)
    REFERENCES `ClassMates`.`order_premium` (`idOrder`))
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ClassMates`.`posts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ClassMates`.`posts` (
  `idposts` INT NOT NULL AUTO_INCREMENT,
  `idUsers` VARCHAR(45) NOT NULL,
  `date_posted` DATE NOT NULL,
  PRIMARY KEY (`idposts`, `idUsers`),
  INDEX `posts_ibfk_1` (`idUsers` ASC) VISIBLE,
  CONSTRAINT `posts_ibfk_1`
    FOREIGN KEY (`idUsers`)
    REFERENCES `ClassMates`.`Users` (`idUsers`))
ENGINE = InnoDB
AUTO_INCREMENT = 5650
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ClassMates`.`premium`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ClassMates`.`premium` (
  `idpremium` INT NOT NULL AUTO_INCREMENT,
  `idcategory` INT NOT NULL,
  PRIMARY KEY (`idpremium`))
ENGINE = InnoDB
AUTO_INCREMENT = 476335
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ClassMates`.`texts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ClassMates`.`texts` (
  `idtexts` INT NOT NULL AUTO_INCREMENT,
  `idUsers` VARCHAR(45) NOT NULL,
  `text` TEXT NOT NULL,
  PRIMARY KEY (`idtexts`),
  INDEX `idUsers` (`idUsers` ASC) VISIBLE,
  CONSTRAINT `texts_ibfk_1`
    FOREIGN KEY (`idUsers`)
    REFERENCES `ClassMates`.`Users` (`idUsers`))
ENGINE = InnoDB
AUTO_INCREMENT = 19
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
