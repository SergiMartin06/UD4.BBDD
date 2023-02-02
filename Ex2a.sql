-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Pacient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pacient` (
  `Cognom` VARCHAR(45) NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Numero Especial` INT NOT NULL AUTO_INCREMENT,
  `DNI` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Numero Especial`),
  UNIQUE INDEX `Numero Especial_UNIQUE` (`Numero Especial` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Metge`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Metge` (
  `Nom col·legiat` INT NOT NULL AUTO_INCREMENT,
  `Cognom` VARCHAR(45) NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `DNI` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Nom col·legiat`),
  UNIQUE INDEX `Nom col·legiat_UNIQUE` (`Nom col·legiat` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Consulta` (
  `NomiCognoom_Numero Especial` VARCHAR(45) NOT NULL,
  `Metge_Nom col·legiat` INT NOT NULL,
  INDEX `fk_Consulta_NomiCognoom_idx` (`NomiCognoom_Numero Especial` ASC) VISIBLE,
  INDEX `fk_Consulta_Metge1_idx` (`Metge_Nom col·legiat` ASC) VISIBLE,
  CONSTRAINT `fk_Consulta_NomiCognoom`
    FOREIGN KEY (`NomiCognoom_Numero Especial`)
    REFERENCES `mydb`.`Pacient` (`Numero Especial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consulta_Metge1`
    FOREIGN KEY (`Metge_Nom col·legiat`)
    REFERENCES `mydb`.`Metge` (`Nom col·legiat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
