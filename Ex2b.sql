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
-- Table `mydb`.`Pel·licula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pel·licula` (
  `Titol` VARCHAR(45) NOT NULL,
  `Genere` VARCHAR(45) NOT NULL,
  `Per a` VARCHAR(45) NOT NULL,
  `ID` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Projecció`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Projecció` (
  `Cine` VARCHAR(45) NOT NULL,
  `Data` INT NOT NULL AUTO_INCREMENT,
  `Sala` VARCHAR(45) NOT NULL,
  `ID Peli` VARCHAR(45) NOT NULL,
  `Pel·licula_ID` VARCHAR(45) NOT NULL,
  UNIQUE INDEX `Cine_UNIQUE` (`Cine` ASC) VISIBLE,
  PRIMARY KEY (`Data`),
  UNIQUE INDEX `Data_UNIQUE` (`Data` ASC) VISIBLE,
  UNIQUE INDEX `ID Peli_UNIQUE` (`ID Peli` ASC) VISIBLE,
  INDEX `fk_Projecció_Pel·licula1_idx` (`Pel·licula_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Projecció_Pel·licula1`
    FOREIGN KEY (`Pel·licula_ID`)
    REFERENCES `mydb`.`Pel·licula` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cine` (
  `Nom` VARCHAR(45) NOT NULL,
  `Adreça` VARCHAR(45) NOT NULL,
  `Telefon` VARCHAR(45) NOT NULL,
  `Num de sales` VARCHAR(45) NOT NULL,
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Projecció_Data` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_Cine_Projecció1_idx` (`Projecció_Data` ASC) VISIBLE,
  UNIQUE INDEX `Nom_UNIQUE` (`Nom` ASC) VISIBLE,
  CONSTRAINT `fk_Cine_Projecció1`
    FOREIGN KEY (`Projecció_Data`)
    REFERENCES `mydb`.`Projecció` (`Data`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EntradaCIne`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EntradaCIne` (
  `D_Cine` VARCHAR(45) NOT NULL,
  `D_Tipus_Tarifa` VARCHAR(45) NOT NULL,
  `Data` VARCHAR(45) NOT NULL,
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Cine_ID` VARCHAR(45) NOT NULL,
  UNIQUE INDEX `D_Cine_UNIQUE` (`D_Cine` ASC) VISIBLE,
  UNIQUE INDEX `D_Tipus_Tarifa_UNIQUE` (`D_Tipus_Tarifa` ASC) VISIBLE,
  INDEX `fk_EntradaCIne_Cine1_idx` (`Cine_ID` ASC) VISIBLE,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  CONSTRAINT `fk_EntradaCIne_Cine1`
    FOREIGN KEY (`Cine_ID`)
    REFERENCES `mydb`.`Cine` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TIpoDeTarifa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TIpoDeTarifa` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Preu` VARCHAR(45) NOT NULL,
  `Descripcio` VARCHAR(45) NOT NULL,
  `TIpoDeTarifacol` VARCHAR(45) NOT NULL,
  `EntradaCIne_ID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  UNIQUE INDEX `Preu_UNIQUE` (`Preu` ASC) VISIBLE,
  INDEX `fk_TIpoDeTarifa_EntradaCIne_idx` (`EntradaCIne_ID` ASC) VISIBLE,
  CONSTRAINT `fk_TIpoDeTarifa_EntradaCIne`
    FOREIGN KEY (`EntradaCIne_ID`)
    REFERENCES `mydb`.`EntradaCIne` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
