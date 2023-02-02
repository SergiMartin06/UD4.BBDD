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
-- Table `mydb`.`Alumne`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Alumne` (
  `Matricula` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognom` VARCHAR(45) NOT NULL,
  `DNI` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Matricula`),
  UNIQUE INDEX `Matricula_UNIQUE` (`Matricula` ASC) VISIBLE,
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Matricula` (
  `Assignatura` VARCHAR(45) NOT NULL,
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Fecha` VARCHAR(45) NOT NULL,
  `Alumne_Matricula` INT NOT NULL,
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  PRIMARY KEY (`ID`),
  INDEX `fk_Matricula_Alumne1_idx` (`Alumne_Matricula` ASC) VISIBLE,
  CONSTRAINT `fk_Matricula_Alumne1`
    FOREIGN KEY (`Alumne_Matricula`)
    REFERENCES `mydb`.`Alumne` (`Matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Assignatures`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Assignatures` (
  `Nom` INT NOT NULL AUTO_INCREMENT,
  `Departament` VARCHAR(45) NOT NULL,
  `Professor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Nom`),
  UNIQUE INDEX `Nom_UNIQUE` (`Nom` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Departament`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Departament` (
  `Assignatures_Nom` INT NOT NULL,
  `ID` INT NOT NULL AUTO_INCREMENT,
  INDEX `fk_Departament_Assignatures1_idx` (`Assignatures_Nom` ASC) VISIBLE,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  CONSTRAINT `fk_Departament_Assignatures1`
    FOREIGN KEY (`Assignatures_Nom`)
    REFERENCES `mydb`.`Assignatures` (`Nom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Professor` (
  `Departament_ID` VARCHAR(45) NOT NULL,
  `Titulación` VARCHAR(45) NOT NULL,
  `DNI` INT NOT NULL AUTO_INCREMENT,
  INDEX `fk_Professor_Departament1_idx` (`Departament_ID` ASC) VISIBLE,
  PRIMARY KEY (`DNI`),
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Professor_Departament1`
    FOREIGN KEY (`Departament_ID`)
    REFERENCES `mydb`.`Departament` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`AssignaturaMatricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`AssignaturaMatricula` (
  `Matricula_ID` VARCHAR(45) NOT NULL,
  `Assignatures_Nom` INT NOT NULL,
  `Professor_DNI` VARCHAR(45) NOT NULL,
  INDEX `fk_AssignaturaMatricula_Matricula_idx` (`Matricula_ID` ASC) VISIBLE,
  INDEX `fk_AssignaturaMatricula_Assignatures1_idx` (`Assignatures_Nom` ASC) VISIBLE,
  INDEX `fk_AssignaturaMatricula_Professor1_idx` (`Professor_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_AssignaturaMatricula_Matricula`
    FOREIGN KEY (`Matricula_ID`)
    REFERENCES `mydb`.`Matricula` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AssignaturaMatricula_Assignatures1`
    FOREIGN KEY (`Assignatures_Nom`)
    REFERENCES `mydb`.`Assignatures` (`Nom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AssignaturaMatricula_Professor1`
    FOREIGN KEY (`Professor_DNI`)
    REFERENCES `mydb`.`Professor` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
