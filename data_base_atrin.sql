-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema atrin_model
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema atrin_model
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `atrin_model` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `atrin_model` ;

-- -----------------------------------------------------
-- Table `atrin_model`.`patients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atrin_model`.`patients` (
  `No, C/C` INT NOT NULL,
  `City of residence` TEXT NULL DEFAULT NULL,
  `Sex` TEXT NULL DEFAULT NULL,
  `Age (years)` INT NULL DEFAULT NULL,
  PRIMARY KEY (`No, C/C`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `atrin_model`.`basic_param`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atrin_model`.`basic_param` (
  `No, C/C` INT NOT NULL,
  `Height (cm)` INT NULL DEFAULT NULL,
  `Weight (kg)` INT NULL DEFAULT NULL,
  `Temp°` TEXT NULL DEFAULT NULL,
  `Respiratory Rate` INT NULL DEFAULT NULL,
  `Oxygen Saturation (%)` INT NULL DEFAULT NULL,
  `Heart Rate (bpm)` INT NULL DEFAULT NULL,
  `patients_No, C/C` INT NOT NULL,
  PRIMARY KEY (`No, C/C`, `patients_No, C/C`),
  INDEX `fk_basic_param_patients1_idx` (`patients_No, C/C` ASC),
  CONSTRAINT `fk_basic_param_patients1`
    FOREIGN KEY (`patients_No, C/C`)
    REFERENCES `atrin_model`.`patients` (`No, C/C`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `atrin_model`.`hosbital`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atrin_model`.`hosbital` (
  `Center` TEXT NULL DEFAULT NULL,
  `No, C/C` INT NOT NULL,
  `Date Admission` TEXT NULL DEFAULT NULL,
  `Date Discharge/Exitus` TEXT NULL DEFAULT NULL,
  `Outcome` TEXT NULL DEFAULT NULL,
  `patients_No, C/C` INT NOT NULL,
  PRIMARY KEY (`No, C/C`, `patients_No, C/C`),
  INDEX `fk_hosbital_patients1_idx` (`patients_No, C/C` ASC),
  CONSTRAINT `fk_hosbital_patients1`
    FOREIGN KEY (`patients_No, C/C`)
    REFERENCES `atrin_model`.`patients` (`No, C/C`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `atrin_model`.`lab_values_analysis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atrin_model`.`lab_values_analysis` (
  `No, C/C` INT NOT NULL,
  `Hemoglobin` TEXT NULL DEFAULT NULL,
  `Platelets` INT NULL DEFAULT NULL,
  `Creatinine` TEXT NULL DEFAULT NULL,
  `eGFR (CKD-EPI)` TEXT NULL DEFAULT NULL,
  `AST` INT NULL DEFAULT NULL,
  `ALT` INT NULL DEFAULT NULL,
  `C-Reactive Protein` TEXT NULL DEFAULT NULL,
  `patients_No, C/C` INT NOT NULL,
  PRIMARY KEY (`No, C/C`, `patients_No, C/C`),
  INDEX `fk_lab_values_analysis_patients1_idx` (`patients_No, C/C` ASC),
  CONSTRAINT `fk_lab_values_analysis_patients1`
    FOREIGN KEY (`patients_No, C/C`)
    REFERENCES `atrin_model`.`patients` (`No, C/C`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `atrin_model`.`medical_treatment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atrin_model`.`medical_treatment` (
  `No, C/C` INT NOT NULL,
  `antivirals` TEXT NULL DEFAULT NULL,
  `monoclonal Abs` TEXT NULL DEFAULT NULL,
  `Antibiotic` TEXT NULL DEFAULT NULL,
  `patients_No, C/C` INT NOT NULL,
  PRIMARY KEY (`No, C/C`, `patients_No, C/C`),
  INDEX `fk_medical_treatment_patients1_idx` (`patients_No, C/C` ASC),
  CONSTRAINT `fk_medical_treatment_patients1`
    FOREIGN KEY (`patients_No, C/C`)
    REFERENCES `atrin_model`.`patients` (`No, C/C`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `atrin_model`.`oxygen_therapy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atrin_model`.`oxygen_therapy` (
  `No, C/C` INT NOT NULL,
  `Nasal Cannula/Glasses` TEXT NULL DEFAULT NULL,
  `Venturi Mask` TEXT NULL DEFAULT NULL,
  `NIV` TEXT NULL DEFAULT NULL,
  `IOT` TEXT NULL DEFAULT NULL,
  `patients_No, C/C` INT NOT NULL,
  PRIMARY KEY (`No, C/C`, `patients_No, C/C`),
  INDEX `fk_oxygen_therapy_patients1_idx` (`patients_No, C/C` ASC),
  CONSTRAINT `fk_oxygen_therapy_patients1`
    FOREIGN KEY (`patients_No, C/C`)
    REFERENCES `atrin_model`.`patients` (`No, C/C`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `atrin_model`.`total`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atrin_model`.`total` (
  `Center` TEXT NULL DEFAULT NULL,
  `No, C/C` INT NOT NULL,
  `Date Admission` TEXT NULL DEFAULT NULL,
  `Date Discharge/Exitus` TEXT NULL DEFAULT NULL,
  `Outcome` TEXT NULL DEFAULT NULL,
  `No, C/C_[0]` INT NULL DEFAULT NULL,
  `City of residence` TEXT NULL DEFAULT NULL,
  `Sex` TEXT NULL DEFAULT NULL,
  `Age (years)` INT NULL DEFAULT NULL,
  `No, C/C_[1]` INT NULL DEFAULT NULL,
  `Height (cm)` INT NULL DEFAULT NULL,
  `Weight (kg)` INT NULL DEFAULT NULL,
  `Temp°` TEXT NULL DEFAULT NULL,
  `Respiratory Rate` INT NULL DEFAULT NULL,
  `Oxygen Saturation (%)` INT NULL DEFAULT NULL,
  `Heart Rate (bpm)` INT NULL DEFAULT NULL,
  `No, C/C_[2]` INT NULL DEFAULT NULL,
  `Hemoglobin` TEXT NULL DEFAULT NULL,
  `Platelets` INT NULL DEFAULT NULL,
  `Creatinine` TEXT NULL DEFAULT NULL,
  `eGFR (CKD-EPI)` TEXT NULL DEFAULT NULL,
  `AST` INT NULL DEFAULT NULL,
  `ALT` INT NULL DEFAULT NULL,
  `C-Reactive Protein` TEXT NULL DEFAULT NULL,
  `No, C/C_[3]` INT NULL DEFAULT NULL,
  `Nasal Cannula/Glasses` TEXT NULL DEFAULT NULL,
  `Venturi Mask` TEXT NULL DEFAULT NULL,
  `NIV` TEXT NULL DEFAULT NULL,
  `IOT` TEXT NULL DEFAULT NULL,
  `No, C/C_[4]` INT NULL DEFAULT NULL,
  `antivirals` TEXT NULL DEFAULT NULL,
  `monoclonal Abs` TEXT NULL DEFAULT NULL,
  `Antibiotic` TEXT NULL DEFAULT NULL,
  `patients_No, C/C` INT NOT NULL,
  PRIMARY KEY (`No, C/C`, `patients_No, C/C`),
  INDEX `fk_total_patients1_idx` (`patients_No, C/C` ASC),
  CONSTRAINT `fk_total_patients1`
    FOREIGN KEY (`patients_No, C/C`)
    REFERENCES `atrin_model`.`patients` (`No, C/C`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
