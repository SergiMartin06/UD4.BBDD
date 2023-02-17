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
-- Table `mydb`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Client` (
  `DNI` VARCHAR(45) NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognom` VARCHAR(45) NOT NULL,
  `Adreça` VARCHAR(45) NOT NULL,
  `Movil` VARCHAR(45) NOT NULL,
  `Vip` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DNI`),
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TipoPolissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TipoPolissa` (
  `ID` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vendedor` (
  `DNI` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Cognom` VARCHAR(45) NOT NULL,
  `Adreça` VARCHAR(45) NOT NULL,
  `Movil` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Polissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Polissa` (
  `N. Polissa` INT NOT NULL AUTO_INCREMENT,
  `Importe` VARCHAR(45) NOT NULL,
  `Fecha de inicio` DATE NOT NULL,
  `Fecha de Fin` DATE NOT NULL,
  `Tipo de pago` VARCHAR(45) NOT NULL,
  `TipoPolissa_ID` INT NOT NULL,
  `Client_DNI` INT NOT NULL,
  `Vendedor_DNI` INT NOT NULL,
  PRIMARY KEY (`N. Polissa`),
  INDEX `fk_Polissa_TipoPolissa_idx` (`TipoPolissa_ID` ASC) VISIBLE,
  INDEX `fk_Polissa_Client1_idx` (`Client_DNI` ASC) VISIBLE,
  INDEX `fk_Polissa_Vendedor1_idx` (`Vendedor_DNI` ASC) VISIBLE,
  UNIQUE INDEX `N. Polissa_UNIQUE` (`N. Polissa` ASC) VISIBLE,
  CONSTRAINT `fk_Polissa_TipoPolissa`
    FOREIGN KEY (`TipoPolissa_ID`)
    REFERENCES `mydb`.`TipoPolissa` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Polissa_Client1`
    FOREIGN KEY (`Client_DNI`)
    REFERENCES `mydb`.`Client` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Polissa_Vendedor1`
    FOREIGN KEY (`Vendedor_DNI`)
    REFERENCES `mydb`.`Vendedor` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
