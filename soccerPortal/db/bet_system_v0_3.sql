SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `bet_system` ;
CREATE SCHEMA IF NOT EXISTS `bet_system` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `bet_system` ;

-- -----------------------------------------------------
-- Table `bet_system`.`User`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bet_system`.`User` (
  `userID` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NULL ,
  `firstname` VARCHAR(45) NULL ,
  `email` VARCHAR(45) NOT NULL ,
  `city` VARCHAR(45) NULL ,
  `username` VARCHAR(45) NOT NULL ,
  `password` VARCHAR(45) NOT NULL ,
  `salt` VARCHAR(45) NOT NULL ,
  `isadmin` TINYINT(1) NOT NULL ,
  `balance` INT NOT NULL ,
  PRIMARY KEY (`userID`) ,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) ,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bet_system`.`Userdescription`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bet_system`.`Userdescription` (
  `User_userId` INT NOT NULL ,
  `description` TEXT NOT NULL ,
  PRIMARY KEY (`User_userId`) ,
  CONSTRAINT `fk_Userdescription_User1`
    FOREIGN KEY (`User_userId` )
    REFERENCES `bet_system`.`User` (`userID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bet_system`.`Complaint`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bet_system`.`Complaint` (
  `complaintID` INT NOT NULL AUTO_INCREMENT ,
  `User_userID1` INT NOT NULL ,
  `User_userID2` INT NOT NULL ,
  `state` TINYINT(1) NOT NULL ,
  `description` TEXT NOT NULL ,
  PRIMARY KEY (`complaintID`) ,
  INDEX `fk_Complaint_User1_idx` (`User_userID1` ASC) ,
  INDEX `fk_Complaint_User2_idx` (`User_userID2` ASC) ,
  CONSTRAINT `fk_Complaint_User1`
    FOREIGN KEY (`User_userID1` )
    REFERENCES `bet_system`.`User` (`userID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Complaint_User2`
    FOREIGN KEY (`User_userID2` )
    REFERENCES `bet_system`.`User` (`userID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bet_system`.`Sport`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bet_system`.`Sport` (
  `sportID` INT NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(45) NOT NULL ,
  `description` TEXT NULL ,
  PRIMARY KEY (`sportID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bet_system`.`Image`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bet_system`.`Image` (
  `imageID` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  `description` TEXT NULL ,
  `imgdata` BLOB NOT NULL ,
  `imgtype` VARCHAR(20) NOT NULL ,
  PRIMARY KEY (`imageID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bet_system`.`Team`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bet_system`.`Team` (
  `teamID` INT NOT NULL AUTO_INCREMENT ,
  `Sport_sportID` INT NOT NULL ,
  `Image_imageID` INT NULL ,
  `title` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`teamID`) ,
  INDEX `fk_Team_Sport1_idx` (`Sport_sportID` ASC) ,
  INDEX `fk_Team_Image1_idx` (`Image_imageID` ASC) ,
  UNIQUE INDEX `title_UNIQUE` (`title` ASC) ,
  CONSTRAINT `fk_Team_Sport1`
    FOREIGN KEY (`Sport_sportID` )
    REFERENCES `bet_system`.`Sport` (`sportID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Team_Image1`
    FOREIGN KEY (`Image_imageID` )
    REFERENCES `bet_system`.`Image` (`imageID` )
    ON DELETE RESTRICT
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bet_system`.`Season`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bet_system`.`Season` (
  `seasonID` INT NOT NULL AUTO_INCREMENT ,
  `begin_date` DATETIME NOT NULL ,
  `end_date` DATETIME NOT NULL ,
  PRIMARY KEY (`seasonID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bet_system`.`Game`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bet_system`.`Game` (
  `gameID` INT NOT NULL AUTO_INCREMENT ,
  `Team_home` INT NOT NULL ,
  `Team_guest` INT NOT NULL ,
  `Season_seasonID` INT NOT NULL ,
  `quote_home` DECIMAL(5,2) NOT NULL ,
  `quote_guest` DECIMAL(5,2) NOT NULL ,
  `quote_draw` DECIMAL(5,2) NOT NULL ,
  `date` DATETIME NOT NULL ,
  `iscombiebet` TINYINT(1) NOT NULL ,
  `resHome` TINYINT NULL ,
  `resGuest` TINYINT NULL ,
  `result` TINYINT NULL ,
  PRIMARY KEY (`gameID`) ,
  INDEX `fk_Partie_Team_home_idx` (`Team_home` ASC) ,
  INDEX `fk_Partie_Team_guest_idx` (`Team_guest` ASC) ,
  INDEX `fk_Game_Season1_idx` (`Season_seasonID` ASC) ,
  CONSTRAINT `fk_Game_Team_home`
    FOREIGN KEY (`Team_home` )
    REFERENCES `bet_system`.`Team` (`teamID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Game_Team_guest`
    FOREIGN KEY (`Team_guest` )
    REFERENCES `bet_system`.`Team` (`teamID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Game_Season1`
    FOREIGN KEY (`Season_seasonID` )
    REFERENCES `bet_system`.`Season` (`seasonID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bet_system`.`Bet`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bet_system`.`Bet` (
  `betID` BIGINT NOT NULL AUTO_INCREMENT ,
  `User_userID` INT NOT NULL ,
  `Game_gameID` INT NOT NULL ,
  `tipp` TINYINT NOT NULL ,
  `bet_amount` INT NOT NULL ,
  `quote` DECIMAL(5,2) NOT NULL ,
  `result` TINYINT(1) NULL ,
  PRIMARY KEY (`betID`) ,
  INDEX `fk_Bet_User1_idx` (`User_userID` ASC) ,
  INDEX `fk_Bet_Game1_idx` (`Game_gameID` ASC) ,
  CONSTRAINT `fk_Bet_User1`
    FOREIGN KEY (`User_userID` )
    REFERENCES `bet_system`.`User` (`userID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bet_Game1`
    FOREIGN KEY (`Game_gameID` )
    REFERENCES `bet_system`.`Game` (`gameID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bet_system`.`Combibet`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bet_system`.`Combibet` (
  `combibetID` INT NOT NULL AUTO_INCREMENT ,
  `User_userID` INT NOT NULL ,
  PRIMARY KEY (`combibetID`) ,
  INDEX `fk_Combibet_User1_idx` (`User_userID` ASC) ,
  CONSTRAINT `fk_Combibet_User1`
    FOREIGN KEY (`User_userID` )
    REFERENCES `bet_system`.`User` (`userID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bet_system`.`Partbet`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bet_system`.`Partbet` (
  `partbetID` INT NOT NULL AUTO_INCREMENT ,
  `Combibet_combibetID` INT NOT NULL ,
  `Game_gameID` INT NOT NULL ,
  `tipp` TINYINT NOT NULL ,
  `bet_amount` INT NOT NULL ,
  `quote` DECIMAL(5,2) NOT NULL ,
  `result` TINYINT(1) NULL ,
  PRIMARY KEY (`partbetID`) ,
  INDEX `fk_Partbet_Combibet1_idx` (`Combibet_combibetID` ASC) ,
  INDEX `fk_Partbet_Game1_idx` (`Game_gameID` ASC) ,
  CONSTRAINT `fk_Partbet_Combibet1`
    FOREIGN KEY (`Combibet_combibetID` )
    REFERENCES `bet_system`.`Combibet` (`combibetID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Partbet_Game1`
    FOREIGN KEY (`Game_gameID` )
    REFERENCES `bet_system`.`Game` (`gameID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bet_system`.`PrivateMessage`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bet_system`.`PrivateMessage` (
  `privateMessagesId` BIGINT NOT NULL AUTO_INCREMENT ,
  `User_sender` INT NOT NULL ,
  `User_reseiver` INT NOT NULL ,
  `datetime` TIMESTAMP NOT NULL ,
  `subject` VARCHAR(45) NULL ,
  `message` TEXT NOT NULL ,
  PRIMARY KEY (`privateMessagesId`) ,
  INDEX `fk_PrivateMessages_User1_idx` (`User_sender` ASC) ,
  INDEX `fk_PrivateMessages_User2_idx` (`User_reseiver` ASC) ,
  CONSTRAINT `fk_PrivateMessages_User1`
    FOREIGN KEY (`User_sender` )
    REFERENCES `bet_system`.`User` (`userID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PrivateMessages_User2`
    FOREIGN KEY (`User_reseiver` )
    REFERENCES `bet_system`.`User` (`userID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bet_system`.`Blocked`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bet_system`.`Blocked` (
  `User_userId` INT NOT NULL ,
  `free_date` DATETIME NOT NULL ,
  `block_date` DATETIME NOT NULL ,
  `description` TEXT NOT NULL ,
  INDEX `fk_Blocked_User1_idx` (`User_userId` ASC) ,
  PRIMARY KEY (`User_userId`) ,
  CONSTRAINT `fk_Blocked_User1`
    FOREIGN KEY (`User_userId` )
    REFERENCES `bet_system`.`User` (`userID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bet_system`.`Contest`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bet_system`.`Contest` (
  `contestID` INT NOT NULL ,
  `sport_sportID` INT NOT NULL ,
  `titel` VARCHAR(45) NOT NULL ,
  `description` TEXT NULL ,
  `begin_date` DATETIME NOT NULL ,
  `end_date` DATETIME NOT NULL ,
  PRIMARY KEY (`contestID`, `sport_sportID`) ,
  INDEX `fk_contest_sport1_idx` (`sport_sportID` ASC) ,
  CONSTRAINT `fk_contest_sport1`
    FOREIGN KEY (`sport_sportID` )
    REFERENCES `bet_system`.`Sport` (`sportID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bet_system`.`Contest_has_team`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bet_system`.`Contest_has_team` (
  `Contest_contestID` INT NOT NULL ,
  `Team_teamID` INT NOT NULL ,
  PRIMARY KEY (`Contest_contestID`, `Team_teamID`) ,
  INDEX `fk_contest_has_Team_Team1_idx` (`Team_teamID` ASC) ,
  INDEX `fk_contest_has_Team_contest1_idx` (`Contest_contestID` ASC) ,
  CONSTRAINT `fk_contest_has_Team_contest1`
    FOREIGN KEY (`Contest_contestID` )
    REFERENCES `bet_system`.`Contest` (`contestID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contest_has_Team_Team1`
    FOREIGN KEY (`Team_teamID` )
    REFERENCES `bet_system`.`Team` (`teamID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bet_system`.`Statistic`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bet_system`.`Statistic` (
  `Team_teamID` INT NOT NULL ,
  `Season_seasonID` INT NOT NULL ,
  `won` INT NULL ,
  `lost` INT NULL ,
  `draw` INT NULL ,
  INDEX `fk_Statistic_Team1_idx` (`Team_teamID` ASC) ,
  PRIMARY KEY (`Team_teamID`, `Season_seasonID`) ,
  INDEX `fk_Statistic_Season1_idx` (`Season_seasonID` ASC) ,
  CONSTRAINT `fk_Statistic_Team1`
    FOREIGN KEY (`Team_teamID` )
    REFERENCES `bet_system`.`Team` (`teamID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Statistic_Season1`
    FOREIGN KEY (`Season_seasonID` )
    REFERENCES `bet_system`.`Season` (`seasonID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bet_system`.`Cupons`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bet_system`.`Cupons` (
  `cuponsID` INT NOT NULL AUTO_INCREMENT ,
  `User_userID` INT NOT NULL ,
  `amount` INT NOT NULL ,
  `code` VARCHAR(8) NOT NULL ,
  PRIMARY KEY (`cuponsID`) ,
  INDEX `fk_Cupons_User1_idx` (`User_userID` ASC) ,
  CONSTRAINT `fk_Cupons_User1`
    FOREIGN KEY (`User_userID` )
    REFERENCES `bet_system`.`User` (`userID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bet_system`.`Friend`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bet_system`.`Friend` (
  `User_userID1` INT NOT NULL ,
  `User_userID2` INT NOT NULL ,
  PRIMARY KEY (`User_userID1`, `User_userID2`) ,
  INDEX `fk_User_has_User_User2_idx` (`User_userID2` ASC) ,
  INDEX `fk_User_has_User_User1_idx` (`User_userID1` ASC) ,
  CONSTRAINT `fk_User_has_User_User1`
    FOREIGN KEY (`User_userID1` )
    REFERENCES `bet_system`.`User` (`userID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_User_User2`
    FOREIGN KEY (`User_userID2` )
    REFERENCES `bet_system`.`User` (`userID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bet_system`.`Shout`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bet_system`.`Shout` (
  `shoutID` BIGINT NOT NULL AUTO_INCREMENT ,
  `User_userID` INT NOT NULL ,
  `date` TIMESTAMP NOT NULL ,
  `message` TEXT NOT NULL ,
  PRIMARY KEY (`shoutID`) ,
  INDEX `fk_Shout_User1_idx` (`User_userID` ASC) ,
  CONSTRAINT `fk_Shout_User1`
    FOREIGN KEY (`User_userID` )
    REFERENCES `bet_system`.`User` (`userID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `bet_system`.`User`
-- -----------------------------------------------------
START TRANSACTION;
USE `bet_system`;
INSERT INTO `bet_system`.`User` (`userID`, `name`, `firstname`, `email`, `city`, `username`, `password`, `salt`, `isadmin`, `balance`) VALUES (1, 'wurst', 'hans', 'hans@wurst.de', 'a', 'hanswurst', 'x', 'x', false, 200);
INSERT INTO `bet_system`.`User` (`userID`, `name`, `firstname`, `email`, `city`, `username`, `password`, `salt`, `isadmin`, `balance`) VALUES (2, 'hermann', 'günther', 'günther@hermann', 'a', 'ghermann', 'x', 'x', false, 100);
INSERT INTO `bet_system`.`User` (`userID`, `name`, `firstname`, `email`, `city`, `username`, `password`, `salt`, `isadmin`, `balance`) VALUES (3, 'Rompf', 'Kevin', 'kevin.rompf@mni.thm.de', 't', 'kevin', 'x', 'x', true, 0);
INSERT INTO `bet_system`.`User` (`userID`, `name`, `firstname`, `email`, `city`, `username`, `password`, `salt`, `isadmin`, `balance`) VALUES (4, 'Bakkal', 'Selcuk', 'selcukbakkal@hotmail.de', 'b', 'selcuk', 'x', 'x', true, 200);
INSERT INTO `bet_system`.`User` (`userID`, `name`, `firstname`, `email`, `city`, `username`, `password`, `salt`, `isadmin`, `balance`) VALUES (5, 'Becker', 'Lars', 'lars.becker@mni.thm.de', 'e', 'lars', 'x', 'x', true, 200);
INSERT INTO `bet_system`.`User` (`userID`, `name`, `firstname`, `email`, `city`, `username`, `password`, `salt`, `isadmin`, `balance`) VALUES (6, 'Naumann', 'Julian', 'julian.naumann@mni.thm.de', 'b', 'julian', 'x', 'x', true, 0);
INSERT INTO `bet_system`.`User` (`userID`, `name`, `firstname`, `email`, `city`, `username`, `password`, `salt`, `isadmin`, `balance`) VALUES (7, 'janauschek', 'peter', 'peter.janauschek@mni.thm.de', 'e', 'peter', 'x', 'x', true, 200);
INSERT INTO `bet_system`.`User` (`userID`, `name`, `firstname`, `email`, `city`, `username`, `password`, `salt`, `isadmin`, `balance`) VALUES (8, 'schlosser', 'benjamin', 'benjamin.schlosser@mni.thm.de', 'b', 'benjamin', 'x', 'x', true, 0);
INSERT INTO `bet_system`.`User` (`userID`, `name`, `firstname`, `email`, `city`, `username`, `password`, `salt`, `isadmin`, `balance`) VALUES (9, 'nachname9', 'vorname9', 'test9@email.de', 'c', 'nutzer9', 'x', 'x', false, 0);
INSERT INTO `bet_system`.`User` (`userID`, `name`, `firstname`, `email`, `city`, `username`, `password`, `salt`, `isadmin`, `balance`) VALUES (10, 'nachname10', 'vorname10', 'test10@email.de', 'c', 'nutzer10', 'x', 'x', false, 200);
INSERT INTO `bet_system`.`User` (`userID`, `name`, `firstname`, `email`, `city`, `username`, `password`, `salt`, `isadmin`, `balance`) VALUES (11, 'nachname11', 'vorname11', 'test11@email.de', 'c', 'nutzer11', 'x', 'x', false, 0);
INSERT INTO `bet_system`.`User` (`userID`, `name`, `firstname`, `email`, `city`, `username`, `password`, `salt`, `isadmin`, `balance`) VALUES (12, 'nachname12', 'vorname12', 'test12@email.de', 'd', 'nutzer12', 'x', 'x', false, 200);
INSERT INTO `bet_system`.`User` (`userID`, `name`, `firstname`, `email`, `city`, `username`, `password`, `salt`, `isadmin`, `balance`) VALUES (13, 'nachname13', 'vorname13', 'test13@email.de', 'd', 'nutzer13', 'x', 'x', false, 100);
INSERT INTO `bet_system`.`User` (`userID`, `name`, `firstname`, `email`, `city`, `username`, `password`, `salt`, `isadmin`, `balance`) VALUES (14, 'nachname14', 'vorname14', 'test14@email.de', 't', 'nutzer14', 'x', 'x', false, 0);
INSERT INTO `bet_system`.`User` (`userID`, `name`, `firstname`, `email`, `city`, `username`, `password`, `salt`, `isadmin`, `balance`) VALUES (15, 'nachname15', 'vorname15', 'test15@email.de', 'd', 'nutzer15', 'x', 'x', false, 200);
INSERT INTO `bet_system`.`User` (`userID`, `name`, `firstname`, `email`, `city`, `username`, `password`, `salt`, `isadmin`, `balance`) VALUES (16, 'nachname16', 'vorname16', 'test16@email.de', 'r', 'nutzer16', 'x', 'x', false, 200);
INSERT INTO `bet_system`.`User` (`userID`, `name`, `firstname`, `email`, `city`, `username`, `password`, `salt`, `isadmin`, `balance`) VALUES (17, 'nachname17', 'vorname17', 'test17@email.de', 'd', 'nutzer17', 'x', 'x', false, 100);
INSERT INTO `bet_system`.`User` (`userID`, `name`, `firstname`, `email`, `city`, `username`, `password`, `salt`, `isadmin`, `balance`) VALUES (18, 'nachname18', 'vorname18', 'test18@email.de', 'd', 'nutzer18', 'x', 'x', false, 0);
INSERT INTO `bet_system`.`User` (`userID`, `name`, `firstname`, `email`, `city`, `username`, `password`, `salt`, `isadmin`, `balance`) VALUES (19, 'nachname19', 'vorname19', 'test19@email.de', 'f', 'nutzer19', 'x', 'x', false, 0);
INSERT INTO `bet_system`.`User` (`userID`, `name`, `firstname`, `email`, `city`, `username`, `password`, `salt`, `isadmin`, `balance`) VALUES (20, 'nachname20', 'vorname20', 'test20@email.de', 'f', 'nutzer20', 'x', 'x', false, 200);
INSERT INTO `bet_system`.`User` (`userID`, `name`, `firstname`, `email`, `city`, `username`, `password`, `salt`, `isadmin`, `balance`) VALUES (21, 'nachname21', 'vorname21', 'test21@email.de', 'a', 'nutzer21', 'x', 'x', false, 0);
INSERT INTO `bet_system`.`User` (`userID`, `name`, `firstname`, `email`, `city`, `username`, `password`, `salt`, `isadmin`, `balance`) VALUES (22, 'nachname22', 'vorname22', 'test22@email.de', 'a', 'nutzer22', 'x', 'x', false, 0);
INSERT INTO `bet_system`.`User` (`userID`, `name`, `firstname`, `email`, `city`, `username`, `password`, `salt`, `isadmin`, `balance`) VALUES (23, 'nachname23', 'vorname23', 'test23@email.de', 't', 'nutzer23', 'x', 'x', false, 200);
INSERT INTO `bet_system`.`User` (`userID`, `name`, `firstname`, `email`, `city`, `username`, `password`, `salt`, `isadmin`, `balance`) VALUES (24, 'nachname24', 'vorname24', 'test24@email.de', 'b', 'nutzer24', 'x', 'x', false, 0);
INSERT INTO `bet_system`.`User` (`userID`, `name`, `firstname`, `email`, `city`, `username`, `password`, `salt`, `isadmin`, `balance`) VALUES (25, 'nachname25', 'vorname25', 'test25@email.de', 'e', 'nutzer25', 'x', 'x', false, 200);
INSERT INTO `bet_system`.`User` (`userID`, `name`, `firstname`, `email`, `city`, `username`, `password`, `salt`, `isadmin`, `balance`) VALUES (26, 'nachname26', 'vorname26', 'test26@email.de', 'b', 'nutzer26', 'x', 'x', false, 100);
INSERT INTO `bet_system`.`User` (`userID`, `name`, `firstname`, `email`, `city`, `username`, `password`, `salt`, `isadmin`, `balance`) VALUES (27, 'nachname27', 'vorname27', 'test27@email.de', 'e', 'nutzer27', 'x', 'x', false, 0);
INSERT INTO `bet_system`.`User` (`userID`, `name`, `firstname`, `email`, `city`, `username`, `password`, `salt`, `isadmin`, `balance`) VALUES (28, 'nachname28', 'vorname28', 'test28@email.de', 'b', 'nutzer28', 'x', 'x', false, 200);
INSERT INTO `bet_system`.`User` (`userID`, `name`, `firstname`, `email`, `city`, `username`, `password`, `salt`, `isadmin`, `balance`) VALUES (29, 'nachname29', 'vorname29', 'test29@email.de', 'c', 'nutzer29', 'x', 'x', false, 200);
INSERT INTO `bet_system`.`User` (`userID`, `name`, `firstname`, `email`, `city`, `username`, `password`, `salt`, `isadmin`, `balance`) VALUES (30, 'nachname30', 'vorname30', 'test30@email.de', 'c', 'nutzer30', 'x', 'x', false, 100);

COMMIT;

-- -----------------------------------------------------
-- Data for table `bet_system`.`Userdescription`
-- -----------------------------------------------------
START TRANSACTION;
USE `bet_system`;
INSERT INTO `bet_system`.`Userdescription` (`User_userId`, `description`) VALUES (2, 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.');
INSERT INTO `bet_system`.`Userdescription` (`User_userId`, `description`) VALUES (1, 'At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.');
INSERT INTO `bet_system`.`Userdescription` (`User_userId`, `description`) VALUES (6, 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.');
INSERT INTO `bet_system`.`Userdescription` (`User_userId`, `description`) VALUES (14, 'At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.');
INSERT INTO `bet_system`.`Userdescription` (`User_userId`, `description`) VALUES (17, 'At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.');
INSERT INTO `bet_system`.`Userdescription` (`User_userId`, `description`) VALUES (11, 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.');

COMMIT;

-- -----------------------------------------------------
-- Data for table `bet_system`.`Complaint`
-- -----------------------------------------------------
START TRANSACTION;
USE `bet_system`;
INSERT INTO `bet_system`.`Complaint` (`complaintID`, `User_userID1`, `User_userID2`, `state`, `description`) VALUES (1, 13, 16, false, 'beschwerde1');
INSERT INTO `bet_system`.`Complaint` (`complaintID`, `User_userID1`, `User_userID2`, `state`, `description`) VALUES (2, 12, 13, true, 'beschwerde2');
INSERT INTO `bet_system`.`Complaint` (`complaintID`, `User_userID1`, `User_userID2`, `state`, `description`) VALUES (3, 2, 4, false, 'beschwerde3');
INSERT INTO `bet_system`.`Complaint` (`complaintID`, `User_userID1`, `User_userID2`, `state`, `description`) VALUES (4, 5, 12, false, 'beschwerde4');
INSERT INTO `bet_system`.`Complaint` (`complaintID`, `User_userID1`, `User_userID2`, `state`, `description`) VALUES (5, 12, 3, true, 'beschwerde5');
INSERT INTO `bet_system`.`Complaint` (`complaintID`, `User_userID1`, `User_userID2`, `state`, `description`) VALUES (6, 12, 7, false, 'beschwerde 6');
INSERT INTO `bet_system`.`Complaint` (`complaintID`, `User_userID1`, `User_userID2`, `state`, `description`) VALUES (7, 14, 5, true, 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.');
INSERT INTO `bet_system`.`Complaint` (`complaintID`, `User_userID1`, `User_userID2`, `state`, `description`) VALUES (8, 5, 18, false, 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.');

COMMIT;

-- -----------------------------------------------------
-- Data for table `bet_system`.`Sport`
-- -----------------------------------------------------
START TRANSACTION;
USE `bet_system`;
INSERT INTO `bet_system`.`Sport` (`sportID`, `title`, `description`) VALUES (1, 'Fußball', 'Fußball ist eine Ballsportart, bei der zwei Mannschaften mit dem Ziel gegeneinander antreten, mehr Tore als der Gegner zu erzielen und so das Spiel zu gewinnen. Die Spielzeit ist üblicherweise zweimal 45 Minuten (exklusive Nachspielzeit und eventuell Verlängerung), jedoch gibt es auch Varianten mit kürzerer Spielzeit. Eine Mannschaft besteht in der Regel aus elf Spielern, wovon einer der Torwart ist. Der Ball darf mit dem Fuß und anderen Körperteilen gespielt werden, mit Ausnahme der Hände und Arme. Nur der Torwart darf den Ball innerhalb des eigenen Strafraums auch mit diesen Körperteilen berühren.');

COMMIT;

-- -----------------------------------------------------
-- Data for table `bet_system`.`Image`
-- -----------------------------------------------------
START TRANSACTION;
USE `bet_system`;
INSERT INTO `bet_system`.`Image` (`imageID`, `name`, `description`, `imgdata`, `imgtype`) VALUES (1, 'keins', 'kein Bild', 0x89504E470D0A1A0A0000000D4948445200000046000000460806000000712EE2840000001974455874536F6674776172650041646F626520496D616765526561647971C9653C0000036469545874584D4C3A636F6D2E61646F62652E786D7000000000003C3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D7043656869487A7265537A4E54637A6B633964223F3E203C783A786D706D65746120786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D70746B3D2241646F626520584D5020436F726520352E302D633036302036312E3133343737372C20323031302F30322F31322D31373A33323A30302020202020202020223E203C7264663A52444620786D6C6E733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F30322F32322D7264662D73796E7461782D6E7323223E203C7264663A4465736372697074696F6E207264663A61626F75743D222220786D6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F6D6D2F2220786D6C6E733A73745265663D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F73547970652F5265736F75726365526566232220786D6C6E733A786D703D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F2220786D704D4D3A4F726967696E616C446F63756D656E7449443D22786D702E6469643A32433246343232413243353545333131393043303839453944453832393344412220786D704D4D3A446F63756D656E7449443D22786D702E6469643A34363833324538463541423631314533414635354231303541343531444636412220786D704D4D3A496E7374616E636549443D22786D702E6969643A34363833324538453541423631314533414635354231303541343531444636412220786D703A43726561746F72546F6F6C3D2241646F62652050686F746F73686F70204353352057696E646F7773223E203C786D704D4D3A4465726976656446726F6D2073745265663A696E7374616E636549443D22786D702E6969643A4334414232344235394435414533313142373839424142434132393236464432222073745265663A646F63756D656E7449443D22786D702E6469643A3243324634323241324335354533313139304330383945394445383239334441222F3E203C2F7264663A4465736372697074696F6E3E203C2F7264663A5244463E203C2F783A786D706D6574613E203C3F787061636B657420656E643D2272223F3E8953E80A00001F084944415478DADC5C797C14E5DDFFCEEC994DB2B90890031210210412624140B922B4400B28B6D4E20DE201A216B515B5AD4DADAF62A1120BA256FB822F02221E140A2A5648384441240720204202841039721F7BCCECFB7B9E99D97D76B281D0D7BFDEDDCF2FBFB9779EEFFCEEE73791028100FE0F1F89C8B8804CA476B0ADDD47511417FD76362DA611EF6EDC07E3440A5109D15997CB75DA7C6E7D7DBD711C4CE7452455552FB93FD231D27F008CA493AA0F1CC2724027D9BC9F7E6724235A1E457C3051B748838A30481F6DDA477C27D10E9D5FBCDC40AF1408F3F6CE02631E6840E07207E7C411DDA183318578542781B8A404E8FBCA89DE23DA44B4EF87941463DBE5803103D2D1310101AC094463E8BAB31938E681761688CBA987407B8856A6FFA4FB52284C47E93C55E39C68F9BB1D159D9694CBA9922819D265EC8B71EC54A29F11CDBC1C18ECD3E269C1E1CA6F70E642156A6A6BE842017610BFA22CCB18909983E4B8AE48494CE92C40CC26ADCE9890B6D00CD0B79F1DEFB4A45C0A18B3BA481D4888B1FD6AA2FB89E6750406FB7C7D741FB6971661C781ED283BBE1F357504861CE05791E81B90F463A57045B559EDC8CD1C84A1570FC3F07ED7E3DABE431113157B2980980D5A7AD5CF32D67270888E7EFCDD6581B89C8D1155461CBCDC01780F10BD481415098C83270E60DDB6B5585BBC1A672E56F1B33800920E00AD4B92B64DD210222BADB6B362FC72AAB6ECB43A3136E7C7B8F9BA691833F006582DD68E06BB84E8D17E93AF52BED9F06DA7A4E4723646BE846A19CB6C582B88A6479292ED254558F8CE02EC3AB41312038324834B0707460D5E41A5AF244B9A1A09B2C9C111CDBB000CE31C3BA26EB1DD317BE25CFCFCFA6988B2BB220DF010F18789B65E0A8C48EB223072076E59DCC7D687102D21BAC62C2565C74AF1C4AB8FE1EBEFF641B20880B0653612E22A01139298800682D45E6183E0E8141080811A6E43E29CF19837F9714C1F7D7B4786F519E27FEE2C3806305207764404C758BF9D682151822825F5CDF578F61FCF606DD11A7DF00AE7B01259E8072D0128B2A2490C8D4A913475613760FC02573184A497EF13801141092821700C3BC278564A360AA6FF19037AE644026719F1B99702C3EC953A521D1114C6E73250CC52F2D5A1BDF8F5CB7351555B05890341073BC862D8E8C72C9A94280C2899430295B8C2466161E76B37A3F835105431480E0852A30A52A386DCB0010827BFB62EAB16CC9DF030EE1D3F3B9254BC43FCD6CE488D088C283922288CEE247ACD6C4BFEB1F10D2C5AF3229708C900C449A4AB906255B94D61EAA3487E2E490CA480A4498DF655B80156153AD6072E3541F526A630C989A4468A4962FCFAB25F5B1E7ED5F55834F365386D4EF3E09713BFE77252D31130564172C6D331A423701A37ACA80AFE6BF99FF1CED655B0D82C906D12AC51560D14A64AB2CA2542A13B642A14A0751FFC1C203F2DA9B2C2A58601E40F689C7DF94D7935900CF509AAD4A5D4C8040AE704729FE4ABB1F89EA5E81AD7AD43B5EA486A0C6064936D31B625E9F9498621254CBC7FFBF263D8BAFFDFB03AACB039ADB0BA08149BA6469C981AC99AA4F87549F1C2C381F2B3BF12C14477CFA527A068D2C301D26E4E6953B581D25752A590D498D54804C450275F3838C9D15DF1EAFD6F223531CD3CF83944AF752435918031C842FBD6114D3040619F82BF3F83CD5F6C849500B13BECB0C510380E1BB72FB25DE6B684A9918F0061CBDE808703C124C647CB6C89A9150388EDD39489AD69E070C951E9063D011D002DC6E15264B62BA294281A102228064F77F7C0927B5F4717771733007944A51D016311D448D2D548A6ED4F113D2DC639AFBCBB046F7FF2161C510E92141BECD17644C546C16A93215B640247E2F686AB08A90B07814142C0B405DA68C94B5FFAABB6E9FB3470184C5C99021A4CECE6F80DB6696A2591E354D540505AC254C81F02270C149F204144BD93FA60D9FD6F046D8E0EC0EE9123475E6F8C6FDBB66D41602C050505062016435268673EF157838688AC63D1574558FCCE22B8A25D70BAA2388F898B86D31185A82817919382AC285A27D04892AC562B1C761B64ABCCED8EC56AD1833CBA1E6D0B90C75248DD0C9B24F15FA79BB26AC7C804B22A690F85012EC9E1BE52D20902D78367ED1C293C9FA96DBA88EAF3D518D57F8C084C8F8A8A0A7F6666E60E76CCF1E3C7C324C66A5221ABA228EB74A3CB2F7ABAE634663E7B170D4C81333A8A83104DA0C4C6C490F1B5C2E97468005014CB06E521B9F06BCAC3BFAD6A33DA686B5BA085965B68C943BC95AB9637A01F475C61768644C2AFFAF5A49284A3455321455725B30A891263488721357CD92B4810D143E3E7E1A6A13F37DB9551E3C68DDBF9E9A79F06B75BCDF10B81F200ED181F0C27E8A0856FBDC045DCE974728A8E8E46823B11510488C3E1E45262210961E0B047E4251D602AD3A236C14383974915981195742FA3DD101BA866CC03DCC2C83C2952685DA663D956665FE0D4062D2B125F372CA2966385248627767A5E2589318F35DCD5BFB9F5755CD76F0492DD5D5915D1006616EDDD1954615D9544D72CD38EC5ACD4C8D4871DF0F1E71FE1FD6DEF91FA38B9FA44BB5C888F4B803B2616EEE838C4C52450B61BC3975D4E17EC361B6C3607E756521F99887927D92271F5E1168DC538328DD6AA0581CC9DF3E8588F98258BC4CF615CD2DD02974693EA485278FE1291EB6EDFE07E9F1F5517AA909F3D560426EFD8B163FB69F9885962B8F6FAFDFED9CC521B21B9C7EBC16BEB5EE15EC7E1707062F6C445E024C42422C64580C4B83920369B9DDFA89764D743C6B5C9D7048B6225B240B1F8B874F829FE616AA2A83E245813D133360389CE64748FEACE0D71ADF7223E3FBF1D65F5FBB9D470EF240742551F1A1D33F2AA4F0D562782558A407B896199077F10AA6E4175FEC5779FE3C0C932F4ED9E25DA9B9B8936445225E689C2B2E50F3F7B1FF52DF570C5B081DB101D150D1701E38E7223D6158B447712126313394876BB83AB478BBF190DDE0658BD76C83E32B2FE00DC16857B9721C9C33030311759F103E0B246E358E35134F8EB71A8B10C431286232B76001E2F9F83B2160D1845D5226AEEA675C31B50D4A04804C1314A13624E650D016100C40492733A66F9F637F1C22D8B20A8CF0CA25769794F18303E9F8F15AB071BC0787D5EACD9B21A168B8583C2BC8CD5C63C8D83D4C64D2A148F9484540225015D6293E120F561C6B3C9DB045B8B4DF32A6DE48E250FBABBFB6262E664382C4E6C39B309FFAAFE005FD4EE424B808C72A015BFCB7A8E83F241F51AAC3BFBB676AEAA0D40566428366DC522D3B2202D30EA5A11A424C82DBA6B9775A9D1970F5695A3BCB214FDD30688867892088CAC833156CC838AF716E17CED3972C931BCD4C8C0B1596D70DAC9D8925B8E71C670C9E91E978258A79B03C852059BC5A6A91419DF3652A954F7208C4C1B83BDE77663C3A9F770CE578306B5811798C802E12F59AF6074D258ACAF7917F3BF7D9822682934EFC02545E54F9A5D54A564939DC34CB50148580E25AA8D08860090561FD27E6253C94664A5660781213E8DF81F0D60B8E0D1CA143149DC50BC9E1B3FF694985E3BB8E7B170001867815234195D97239A03C6A253B68F7D9CB636B86C51E81A3D103DDD3DB1B97203CAEAF621C61E8349193763E3D9F771B0A914F37B17705016553C87E56796F1E8994B09AF62593417CD0668D30CAD4CA3E2C52DC396A88294A8C2E02D11A4C5440CD83D2776A3B1B59124D9610093CD663588EFE4D879BDDEDEB492650053D750873DE55F86C7C37AAD84490F8B3118B7C8567EB312DABB871EEE0C64B833B1F5F4169C68FA0E4E6B147EDDFF492439BA700F7363EA348C4F9E8C870FCF4471C316C43ADCFCC97297CF9E2AD9258B4D7B30466D47B208F9982009A1D054581641902317529823D87D7467D0CEE8C480D10E61018E9861EEFC7A07B7171A1C81B08BB2ED2AA98C4FA138C543718ABF4D0FCC02FC69FA697BAC9D0CB333097B6A76E39CE77B9E1CC6D9DD38D356C5AFF9F3D45FA197AB0F9A95262CEAFB1A36E66EC75BD91F904AC67217CE12521EED3217CF0646A0F48CC90C03270C2461F092593AC4A8586E0FE0BEE37BCCC0DCC8380F7F68E13AD1BE7C59FE8596CCE95F168479FDDE6092D7E66B43435B039ABDCDA86FADE73F6A97ED1C2056468877C6F36B79550F0FD852A253393055ADA770D65B857F9E5B87A64003C6B64EC423E9F3F9B169F674ACEAF72FFCEAD844D4FA2FC22DC5635AC2EDB82E7A0C46C48DC1AEDA62DCBEEFA6901D89A01E6120180160847D4C0803FA64F2A13387B86D64A1812E18D7111E562BF77681C0085162F61EDCA3DB3F959FC410F42B7E78152FDABCAD68F1B5A08100A969ACA11F91B88BB65BEC5C327A25F40E6A557EDA8F51DD5285EAD62A2E4199D1576159C55F79D2C8CA11B352E6068F7DA1FA193CD8ED716CEEF7390EB69662BC7B324E7B2AF1D1C50D7CFF294F054675B9418B86F534A0BEB50E6535251A081D002546C8413512EAFFECE19EA8398E9E4919628A30D84AF6C54E0BBD45377DEAEC29385C764DB498B410207ED5018FCFC325A7D5DB82DA965AC8369987F3511E16F1DAF90F5F957875588EF1D1A90DDC95FF22FE56BC7DEA4DECA9FF5C2F332888B6C484D9A629C747E2A1E4F970CB6E8C3F3214654DFB916DCFC57D290FE3FEF447381D682C45BDB70E71D678F4746562D227F9282770DA8170A99AA41A2E41D5B567909ED0430CF6FA3160FA8B6A74ACF25BF8FD3E9E9B5829726540D8141B07C5E6B7A189EC8AA5CDC22B77A40F94FC7911A3B849626C5CCC0F9C2BC3C0E45C2DF96C3E4936A6069448E0C5237F4295B7522B3C485E44514CC30B51FA9D8F734FC4DAC61578F6DC1350FC0A27B6EB406B0906EFBB0A279B2AB8BB0E268A44AB86ADC7826B0B31E95FF91DB71E449AEF08844FA556D756892E5B0386490B2F1FEAC09CA83A1E541F6E3348857C0414931A2F8163F111286D3237841E9E1D7BD0E86F4494238A0766FBCFB60681293EF36FD4FBEA50ED3B43D93565D6F4F550C0E7937CB8A5FB9D747D3FACBCF4078C8D9D8854B23315BEE39A75D3A75898D7636A1490DA4F25B36BD7B7D5857B4FE9D27D1A9211E308C79DAD3B6B06A60F4B031244FB52575FA781428050EEA4814280B479DB38B57A5AD0E2D56C4C33494F1DE9F9C5960BA86E3C830BC47BC56B36A6A2E1384A2F7C8D66B23F6D4A0B79A0666E8C19D9641BEEEEF600DEBFB03AECBEFF90FC226202EEE01CB63153C08CEFFC8C02AE3EC66764723E6ECDBC1B2F9415B49F66E9E86311000984EA36CD6DCDFA981583C73189891155A9B1A55193184AFE98BDB1F829C023927C12D91659ABD0914BD5B2617AE2AA95AB1A4B34558A3D86A40CE3D7EAE64A41823311C79ABFA5B4A08D248540955A388D4B9AC88F79FEE41F30CA3D8E4B0AFBFC247612DECBDC827B4E4C23C939C16F7249AFE5F855F25D5A6C64CFC083253390E3CEC3AAE1EB31F7CB9938D95811198480A959057AD4AB84D68DDDCCCB8A250786099318BB8816D91C9EF069EAA47070288FE29976AB8794C1475E89106E6A6BE22EBBA9AD118D9E46EE2106260FE2811CFB44B1806EE09398983A9917B31B7D8DE4BD5AD046714FB2AD1BBE6AF882EC96174BAA5E0C1B4FB63317BF8CBF931B4856C339D97622B86F53CD7ADC9636031BAF2FC253A5F3B0FAF88AF079A74004400211EC0CC2258CD94F532C13C3EA2F2DA22AB1F09E81C2D48819406663D889864A3170984A351330AC95A3C9D3CCC16174E4DC37618374595DF865AFDBF1C6F0559895F920C526091CE083F565E8E7CA2697AB622D258DDFB494879D37206A102F2DB0CC7CD3B97FE2F3BA62DC597A336E4D9D81A5B9CBF15499064A40354DFA9BC9D807DDB64450B780DE2820A811E3F54C959AC41CC9E570718961C4C090C83BA95E9547A42C6761CB6C5E88726D38243B640A202C9498C8AA8C2F4F7D8E97762FC063D73D1936D0686B0CA6F5BC8DD3198A691A943AC45A2901B5A6E284F73BFCA27C02165FFD3A26244EE1C70F24607879927EF220B9E7A78FCEC3CA9CF588B3C5E3A1FD33B1BA6245874004E7BAC504530A979280C926D92C76B3F16D6201DE591198C4F8242DA0238961F514F2ACFC44AE6294E93A60E795362B3D0256FDD7809139802C0BFEE0D0BB283F5F824786FE06D7741BD24EF553A3D2908A34BC7F660DE550C7B5F92756C1139E62BA2343F31C01CD83B028B84754060765D58915ED6622C50E8880192CA30CEA133AAD444E146D8B3603738E15BE0F8BAA94999A199CC361C44A81CC35B37A0C8F384962AC943C3260AC94C4F014926C019318497F42A5D5FB316BF3EDB8266D306EECF30B8CED311EB1B6D8E0C0DF3FBD068F963DC0CB9AD1B4FDFDDC2D18109B1BDCCF326FFE5BAA367DB2F35C11765D28C6ECDEF3B0EAD88AF07925C53458255C82B8C13526E4021188B6274577311BDF6356A7D359D9D2D212442BB55B1A2C9285EB1A9B3363A0C874735E0F057A04884A89067BC27E5666A0E358A19B81C238BF199B56C466A5809D95C5D851B58D7BB1ACE46CF44BCCE6F595B5A756F26BC4CAB1F860480894838D6578F15801765D2CD602B94068B00FEE9D811DE34AF0426E219EDC332F0C94302E4ECAC91DD81E9384254627B503C6B260C102B5BEBE7EAAD86BBB65D727B8D0704133587A1F8BD1C2C1022DADC70530A6E5FD7A88AF7DFDDAF42B2B2749FA3C23A5F7D5AD67505EBB9FA854FB71FA767574C3EF063C179414B63E2E7922AF0F1FA0E358EA610C920572DFB79EC51F07BD402EBA1265DF9704A768E18F40C6DCAA38B5A208532BC6B40B998A1F678F87CBEE12812960B3043201934D2B430D753A595D89FD87BF0E961C9838F2160D596BFC9174501848BCA543D22640540D0E1ED1F2259E6DFBB552059F690CB57EB09BA8F35C44BC230183938605C171C84E8C48CAC7CC8CD964CF9C28BF50429EAC8D0FA2FC5C0932A27BE1C9BC3FE2544325CACF96844FE41BDC70CFA6594AF84C40D27A3C058D3F1938510485F510FF46D62604D45DA29D19927DAD9686331DF73343AC15B37D646F8CF5C7A7CCC77F3FF03662C870F948CDFC5E8A92BD3EAE728A4FE1EBCC60331BC5D6996D62A4705234774C37F6D4DE47F1FAD1BFB533D26E5B1CE667FF1165932BB0ECDA15989432153D1D9998BF731E0E9C2FC5B21B9663644A7EFBC1D367ED5DEBF1F4388A94EDF1E1AA66EAC462E76524669A63984F82AD66C78F1F4F247EC10086C52A63EE1AC16BB63C952192793390843B7E7A17E2E3E33179D88D283F558A91D96330E6F961BC1584972089F834ABEEDE998D0A5855BDBB4A8B9879EB99AC86AA6D74EAC0C44178E1DAC518D16D4CA7DAD31B3CF5F8D99A7C945695049FBED1F4D9333613AFFF72057A2664E2FEFF9E81ED078A288AD3D5C9E0ACDDA419F8D5B5B7A37F6AB6E8911E64B3055C137BF7EE7D9136EE3350B35BED1837EC275A04ACC7342A055B4C5AD8FE91D9A3F1F6D6FF41654D05EA9A6BD123AE27498B9F4B82CFA3717EBC4F930E76233CFEF10534B7E935B83E854A74E0FB524CD93416933FBA019B2BFF797950560BA0285AB981BB655AAE6BACC36FDF9B8757FE5D8877E7AEC7BB8FAC87DB191F262DAA4F8BCEFB74BBDA2C313B99E39185A9D80F0DD4184DC9BFC9D4C1A4799B951FBDC5D17DF19E4518D83317D317FE0217EA2F903B7693DA682AA2E88030B50910187E022B088E01100385B57A78B527C8DA3E148F8A1D9545B875F354E4BCDD0B4FED7A143BAB8AD1E0AD0F82B2F354710814DD8806E798E83E73BBE661F7E325F8E491224C1E34153F7E6E346F5EE455457F78A7C480941CEE59055098709487756D1E3E7CB81F2D1F167B44EE7CE2367C73FA90AE12E482ED92A65AA4166306D3CD9D2CC19B8F2E474EAF41FC693DB1E6316C3EB001AAAE3ABC67C6A67536C01AB9806D1875496AFF3E4BC0D4C6DA2EB0137B81751BB37B5E09EE7F6B06FE7EE70AC4B90890A878F47D3013F5B575C15A0E5908CA1C81D9F90F2329264954A32788F33EC3A0C4646565B179DBBF8B11E0DD5367EA464AEB6C82D0C554FC751132923291933908FDE7F4C6F0F983F1F48DCF209DD40A423149F5EABD75BE500702930C462A1174550A44200814DC66B85A84DE81F9686611EE1834838332FCF93C4CC9998AEDDF14A1ACA2044B3615A2BEBE2EE4B5F46BF4EBDA9F8322484B3DD15A633DAC6393367C2A063A63AECDC755697D3830CC66B00B1BB683815376B404F54D94F738E2505B7F916EA414A3FA8CD180F087B75F70BB220EAE0330029E4B80E4D32506DA5C92119F949D2EC16BD39763E96785FCB8517DF3313A2B1F75746FCFAD290873D3EC78C92F6354BF7CB36D61D3B3272302939393F31E6D7C4F3C61FE3D4FF17C8881A3E880B041337018487F5EF927EC79693FD6FEF6434C19721386F41A86334B2FE2D0F3C73169E04DBA5D09E8A4494944A9F0844B88B8CE8FF50BD356AAB6CEB6FF655221B61F29C22BDB5EC64337CC23371F4F36EF3C566F7F1BF7BD3C23D42FE3D70C2E5B1F9A391C5D62BA9833EA0FC5F5763DBE22304C6AB27AF7C78D63A68672135F20080E036BC3F6F5183A270F4B3E28C4B4E7A762FCA089183A3F0F3F7D6E2CEE187E377252F2B8B4E0522AD281947052F4528AAE3686379BD2772A0E3D55C1EDDCC6AFD6E38955F3B8FA542FABC5E9F3A751F8C1A21028CC0BE960C75A6371FDD523CDD24209C0823DE23673E3107EF4A31FADDDBB77EF08BD079F1F34FB9607B1EFD0573875FE64D02D729BA7CF50D6D6D561FBFE220CEA9BC75D78E5990A6E5CEF5D3603EB7EB31E19C964FC5AC885BE3B0F3B8E1585A64D85172DDAD56A8D295684A425CE118FBF4C2D4406C527A5A43E5A3742A8DFEEB72BE6E1376FCE0BC535A2A478C02B0093074FE549B0D01B53457CA1D1FA628C39E20B5AB463916E8CF841ACC3E1D9079F4394252A7233A0AEBBA5474A505C5A842F17956034E9F0EF7F5EC0F5BCDF2399B865F1545E4F993C602A9E9E5880DF4D2840060562CCBD8AD211D07B61E2C89BF4746772A33AAA673E1FD8C70F1461E3FEF598F0D77C64C46762DBA1CFB0707A21BFAEE1F683F6CB2780D2A66D1FD5271F6909E9EDA465E1C285170D600C7562B9523B60D2D3D3EB4F9E3C79D198E86707BA63E290969C8E9D5F6FD7722849EF523275306D2F2BC2A75F7F8C8CAE99888B8EE7790E5BAF6BAE43DF942C2CBABD10AF7C5CC855A0F8E92F909B4E5E84E28DA1BD86E3D36F3E0E763A5CF84B2B7253AEE1C6FDA1FC7970520EC58EBBFF1F33F8A0FB76CB424373036A6ACFE2C8C9C3A8397F36243D4AB8A430A0FA771F801BB2C799EB2EEF2C5AB468BE3186CD9B3777EE9DC81D3B76BC41FBEF151BF93EDAB10985AB5F0AC625465C037D8E596B80D6D420DE1D8F45B30B91DB3B0FCFAD2DC0A0ABF2307A403E9F5918949187789756F51FFE2CA9E0C5F0A276F3EB0144DFAF35D7312FF3BB1B0B5079BE82C725195D3251F97D0557D5FA86BAB0770920AA8FEEC97A25F6C14D836FD65E180B81C202B9BCC58B17075F60983B776EA7DF89445151D1663AF0A76283F0FAAD1FE28DF5AF6980E8200481B2A25D30171F478349C9E405F3DFDF52A04DAD56962037330F7327FC1AAE1952BB77E9BE7CB6042B77ACE0C7DD316A06CA4E9460E94785DC0D17B3DC47155CB058A4F209A0D0BE1E0919B879F03458648B595A461228BBC4B1CE993327B8DF7AB9648D0E9AA9BFB5916F9C3465CC8D48884DC04B6F2FE4B518B1101F908CBEB55095AC8E8C737D4309972AE64247E7E423B7571EBE38BC1BB93DF234713701C36CD36892149621AFFC6C859608D2B58A4B8AC2CB994224AC2A82B7A3E5EC9481189F3351EB2C0F2F44CD292C2CDC1561AC9D97185EB8DAB2A52F7B539568A878F2816FCBB178CD4BA86DBE10CCA445E96140C8117A56245968B98ED46E49B7F4EEFCF5D8B8673D566E5D11AAE40522D4740D409450640D8AD287F7BE1ED75D3DC22C258C3FF9F2CB2FBF18699CF7DD77DF950123C74AD8F4EEE61FE9CD7B43C51F624D46CBD62DC5FE6FF705558BAB901CB23DBC21481680904D1CE15DDD107AEC822BAA893340D47040186831B6584CCA9B82D4843433208CFF894029E8689CB366CDBAB217D2E568890F62C39A8DDDE8C45574CE38F393D8B97F07DEDBBA0EDFD79D0D4A4F102093C4C8E6BE157430E76C0646EB990EB32F868D6185F96B7A0CC6D03EC379D944BC3F22F62F11E6FCED6F7F7BE352E39C3973E61502E394824FFE83951FB2D9CB557481E9E627C26280E27DDBF0CFED1FF23691762D611D34F984812299E69FCD557D7F78A66DA16F4E7A2E86F71D81285B54242939C66CCA92254BFE7DB971DE7DF7DD57060C2F370883529B0258B76EDD7C3A7741041DE63397C55F6DC3E6DDFF42635B63A8BD4B50274936BD6D697E5D554558F766D0D8EA12C30CEA80B41C5CD7EF7ADE351A0110E355BF7B0894D6CE5405EFB8E38E2BFBA717AC174EEC6F535BB573DE79E71DD6C8F7A4DE1FDBEEE6D854EF8163E5F8F2D0173878A21C1EBFA76389317521848123484C7A620F64A5F547DFD42CFEB68BF9778D309F45B404C8D22BF96F1EB7DD76DB95195F4992C23C0A7FC94AF8AC5CB972167B5141EF5FEBE8E9A1B2BA02DF9E3E8AAAF35538575783EA8BD51CBC8876867E22C9DD850781EC5F19F4E8D2136949E9BC8FB8A3EB136769CC4BEC4D7D02E5E295FE9B93E9D3A7FF07C0C094F845E8797BE3AF6F3EA4B79E0FBE1440667EAEEE7BB479DAB44648B2AE5DE3BB9AA3D4CB712F9310E2FF7865D592935CED04833DEBD67B3B3CBFA36B5E19300877B361FDB30240CB16BCFA185D779AD10D7A25205D213FC2FE5D0AF19504C8113320866B9F79DB3D9DBEE6150143B6A4D3489B789E6E7FD87B0A6389DB7F0040588EC3FE6FCC4E9D5FF1A03B738CB533BA670AA7AFE447D9BF2E2911D699048DD201EB473C87B8ED12D73E4AFC04ABDCB3B779D9D406FB6F433F94C45D6ADF0F064C27F96EE2BB236CCF325ADE04A9F0FCD083BD9263A5FFE33FEFFA7FFBF95F010600C34A6D56545F39780000000049454E44AE426082, 'png');

COMMIT;

-- -----------------------------------------------------
-- Data for table `bet_system`.`Team`
-- -----------------------------------------------------
START TRANSACTION;
USE `bet_system`;
INSERT INTO `bet_system`.`Team` (`teamID`, `Sport_sportID`, `Image_imageID`, `title`) VALUES (1, 1, 1, 'Mannschaft1');
INSERT INTO `bet_system`.`Team` (`teamID`, `Sport_sportID`, `Image_imageID`, `title`) VALUES (2, 1, 1, 'Mannschaft2');
INSERT INTO `bet_system`.`Team` (`teamID`, `Sport_sportID`, `Image_imageID`, `title`) VALUES (3, 1, 1, 'Mannschaft3');
INSERT INTO `bet_system`.`Team` (`teamID`, `Sport_sportID`, `Image_imageID`, `title`) VALUES (4, 1, 1, 'Mannschaft4');
INSERT INTO `bet_system`.`Team` (`teamID`, `Sport_sportID`, `Image_imageID`, `title`) VALUES (5, 1, 1, 'Mannschaft5');
INSERT INTO `bet_system`.`Team` (`teamID`, `Sport_sportID`, `Image_imageID`, `title`) VALUES (6, 1, 1, 'Mannschaft6');
INSERT INTO `bet_system`.`Team` (`teamID`, `Sport_sportID`, `Image_imageID`, `title`) VALUES (7, 1, 1, 'Mannschaft7');
INSERT INTO `bet_system`.`Team` (`teamID`, `Sport_sportID`, `Image_imageID`, `title`) VALUES (8, 1, 1, 'Mannschaft8');

COMMIT;

-- -----------------------------------------------------
-- Data for table `bet_system`.`Season`
-- -----------------------------------------------------
START TRANSACTION;
USE `bet_system`;
INSERT INTO `bet_system`.`Season` (`seasonID`, `begin_date`, `end_date`) VALUES (1, '11.11.2012', '11.11.2013');
INSERT INTO `bet_system`.`Season` (`seasonID`, `begin_date`, `end_date`) VALUES (2, '11.11.2013', '11.11.2014');
INSERT INTO `bet_system`.`Season` (`seasonID`, `begin_date`, `end_date`) VALUES (3, '11.11.2014', '11.11.2015');

COMMIT;

-- -----------------------------------------------------
-- Data for table `bet_system`.`Game`
-- -----------------------------------------------------
START TRANSACTION;
USE `bet_system`;
INSERT INTO `bet_system`.`Game` (`gameID`, `Team_home`, `Team_guest`, `Season_seasonID`, `quote_home`, `quote_guest`, `quote_draw`, `date`, `iscombiebet`, `resHome`, `resGuest`, `result`) VALUES (1, 1, 2, 1, 4, 2.5, 1.33, '10.10.2013', true, 3, 2, 1);
INSERT INTO `bet_system`.`Game` (`gameID`, `Team_home`, `Team_guest`, `Season_seasonID`, `quote_home`, `quote_guest`, `quote_draw`, `date`, `iscombiebet`, `resHome`, `resGuest`, `result`) VALUES (2, 3, 4, 1, 5, 3, 2, '10.10.2013', true, 5, 1, 1);
INSERT INTO `bet_system`.`Game` (`gameID`, `Team_home`, `Team_guest`, `Season_seasonID`, `quote_home`, `quote_guest`, `quote_draw`, `date`, `iscombiebet`, `resHome`, `resGuest`, `result`) VALUES (3, 5, 6, 2, 1.2, 4, 1.3, '10.10.2014', true, 1, 1, 0);
INSERT INTO `bet_system`.`Game` (`gameID`, `Team_home`, `Team_guest`, `Season_seasonID`, `quote_home`, `quote_guest`, `quote_draw`, `date`, `iscombiebet`, `resHome`, `resGuest`, `result`) VALUES (4, 7, 8, 2, 2, 3, 2, '10.10.2014', true, 1, 2, 2);
INSERT INTO `bet_system`.`Game` (`gameID`, `Team_home`, `Team_guest`, `Season_seasonID`, `quote_home`, `quote_guest`, `quote_draw`, `date`, `iscombiebet`, `resHome`, `resGuest`, `result`) VALUES (5, 2, 1, 1, 6, 1.5, 1.33, '20.10.2013', false, 3, 2, 1);
INSERT INTO `bet_system`.`Game` (`gameID`, `Team_home`, `Team_guest`, `Season_seasonID`, `quote_home`, `quote_guest`, `quote_draw`, `date`, `iscombiebet`, `resHome`, `resGuest`, `result`) VALUES (6, 4, 3, 1, 4, 2, 1.5, '20.10.2013', false, 1, 5, 2);
INSERT INTO `bet_system`.`Game` (`gameID`, `Team_home`, `Team_guest`, `Season_seasonID`, `quote_home`, `quote_guest`, `quote_draw`, `date`, `iscombiebet`, `resHome`, `resGuest`, `result`) VALUES (7, 6, 5, 2, 1.8, 3, 2, '20.10.2014', false, 1, 1, 0);
INSERT INTO `bet_system`.`Game` (`gameID`, `Team_home`, `Team_guest`, `Season_seasonID`, `quote_home`, `quote_guest`, `quote_draw`, `date`, `iscombiebet`, `resHome`, `resGuest`, `result`) VALUES (8, 8, 7, 2, 3, 1.2, 1.1, '10.10.2014', true, 2, 2, 0);
INSERT INTO `bet_system`.`Game` (`gameID`, `Team_home`, `Team_guest`, `Season_seasonID`, `quote_home`, `quote_guest`, `quote_draw`, `date`, `iscombiebet`, `resHome`, `resGuest`, `result`) VALUES (9, 1, 2, 3, 4, 2.5, 1.33, '10.10.2015', true, 3, 2, 1);
INSERT INTO `bet_system`.`Game` (`gameID`, `Team_home`, `Team_guest`, `Season_seasonID`, `quote_home`, `quote_guest`, `quote_draw`, `date`, `iscombiebet`, `resHome`, `resGuest`, `result`) VALUES (10, 3, 4, 3, 5, 3, 2, '10.10.2015', true, 5, 1, 1);
INSERT INTO `bet_system`.`Game` (`gameID`, `Team_home`, `Team_guest`, `Season_seasonID`, `quote_home`, `quote_guest`, `quote_draw`, `date`, `iscombiebet`, `resHome`, `resGuest`, `result`) VALUES (11, 5, 6, 3, 1.2, 4, 1.3, '10.10.2015', true, 1, 1, 0);
INSERT INTO `bet_system`.`Game` (`gameID`, `Team_home`, `Team_guest`, `Season_seasonID`, `quote_home`, `quote_guest`, `quote_draw`, `date`, `iscombiebet`, `resHome`, `resGuest`, `result`) VALUES (12, 7, 8, 3, 2, 3, 2, '10.10.2015', false, 1, 2, 2);

COMMIT;

-- -----------------------------------------------------
-- Data for table `bet_system`.`Bet`
-- -----------------------------------------------------
START TRANSACTION;
USE `bet_system`;
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (1, 2, 2, 1, 200, 5, true);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (2, 3, 3, 2, 300, 4, false);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (3, 4, 4, 0, 100, 2, false);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (4, 5, 5, 1, 200, 6, true);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (5, 6, 6, 2, 300, 2, true);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (6, 7, 7, 0, 100, 2, true);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (7, 8, 8, 1, 200, 3, false);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (8, 9, 9, 2, 300, 2.5, false);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (9, 10, 10, 0, 100, 2, false);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (10, 11, 11, 1, 200, 1.2, false);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (11, 12, 12, 2, 300, 3, true);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (12, 13, 1, 0, 100, 1.33, false);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (13, 14, 2, 1, 200, 5, true);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (14, 15, 3, 2, 300, 4, false);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (15, 16, 4, 0, 100, 2, false);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (16, 17, 5, 1, 200, 6, true);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (17, 18, 6, 2, 300, 2, true);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (18, 19, 7, 0, 100, 2, true);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (19, 20, 8, 1, 200, 3, false);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (20, 21, 9, 2, 300, 2.5, false);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (21, 22, 10, 0, 100, 2, false);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (22, 23, 11, 1, 200, 1.2, false);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (23, 24, 12, 2, 300, 3, true);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (24, 25, 1, 0, 100, 1.33, false);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (25, 26, 2, 1, 200, 5, true);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (26, 27, 3, 2, 300, 4, false);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (27, 28, 4, 0, 100, 2, false);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (28, 29, 5, 1, 200, 6, true);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (29, 30, 6, 2, 300, 2, true);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (30, 1, 7, 0, 100, 2, true);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (31, 2, 8, 1, 200, 3, false);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (32, 3, 9, 2, 300, 2.5, false);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (33, 4, 10, 0, 100, 2, false);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (34, 5, 11, 1, 200, 1.2, false);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (35, 6, 12, 2, 300, 3, true);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (36, 7, 1, 0, 100, 1.33, false);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (37, 8, 2, 1, 200, 5, true);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (38, 9, 3, 2, 300, 4, false);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (39, 10, 4, 0, 100, 2, false);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (40, 11, 5, 1, 200, 6, true);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (41, 12, 6, 2, 300, 2, true);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (42, 13, 7, 0, 100, 2, true);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (43, 14, 8, 1, 200, 3, false);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (44, 15, 9, 2, 300, 2.5, false);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (45, 16, 10, 0, 100, 2, false);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (46, 17, 11, 1, 200, 1.2, false);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (47, 18, 12, 2, 300, 3, true);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (48, 19, 1, 0, 100, 1.33, false);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (49, 20, 2, 1, 200, 5, true);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (50, 21, 3, 2, 300, 4, false);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (51, 22, 4, 0, 100, 2, false);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (52, 23, 5, 1, 200, 6, true);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (53, 24, 6, 2, 300, 2, true);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (54, 25, 7, 0, 100, 2, true);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (55, 26, 8, 1, 200, 3, false);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (56, 27, 9, 2, 300, 2.5, false);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (57, 28, 10, 0, 100, 2, false);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (58, 29, 11, 1, 200, 1.2, false);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (59, 30, 12, 2, 300, 3, true);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (60, 1, 1, 0, 100, 1.33, false);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (61, 2, 2, 1, 200, 5, true);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (62, 3, 3, 2, 300, 4, false);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (63, 4, 4, 0, 100, 2, false);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (64, 5, 5, 1, 200, 6, true);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (65, 6, 6, 2, 300, 2, true);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (66, 7, 7, 0, 100, 2, true);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (67, 8, 8, 1, 200, 3, false);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (68, 9, 9, 2, 300, 2.5, false);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (69, 10, 10, 0, 100, 2, false);
INSERT INTO `bet_system`.`Bet` (`betID`, `User_userID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (70, 11, 11, 1, 200, 1.2, false);

COMMIT;

-- -----------------------------------------------------
-- Data for table `bet_system`.`Combibet`
-- -----------------------------------------------------
START TRANSACTION;
USE `bet_system`;
INSERT INTO `bet_system`.`Combibet` (`combibetID`, `User_userID`) VALUES (1, 5);
INSERT INTO `bet_system`.`Combibet` (`combibetID`, `User_userID`) VALUES (2, 28);
INSERT INTO `bet_system`.`Combibet` (`combibetID`, `User_userID`) VALUES (3, 5);
INSERT INTO `bet_system`.`Combibet` (`combibetID`, `User_userID`) VALUES (4, 1);
INSERT INTO `bet_system`.`Combibet` (`combibetID`, `User_userID`) VALUES (5, 2);
INSERT INTO `bet_system`.`Combibet` (`combibetID`, `User_userID`) VALUES (6, 7);
INSERT INTO `bet_system`.`Combibet` (`combibetID`, `User_userID`) VALUES (7, 11);
INSERT INTO `bet_system`.`Combibet` (`combibetID`, `User_userID`) VALUES (8, 5);
INSERT INTO `bet_system`.`Combibet` (`combibetID`, `User_userID`) VALUES (9, 13);
INSERT INTO `bet_system`.`Combibet` (`combibetID`, `User_userID`) VALUES (10, 15);
INSERT INTO `bet_system`.`Combibet` (`combibetID`, `User_userID`) VALUES (11, 20);
INSERT INTO `bet_system`.`Combibet` (`combibetID`, `User_userID`) VALUES (12, 22);
INSERT INTO `bet_system`.`Combibet` (`combibetID`, `User_userID`) VALUES (13, 1);
INSERT INTO `bet_system`.`Combibet` (`combibetID`, `User_userID`) VALUES (14, 4);
INSERT INTO `bet_system`.`Combibet` (`combibetID`, `User_userID`) VALUES (15, 30);
INSERT INTO `bet_system`.`Combibet` (`combibetID`, `User_userID`) VALUES (16, 4);

COMMIT;

-- -----------------------------------------------------
-- Data for table `bet_system`.`Partbet`
-- -----------------------------------------------------
START TRANSACTION;
USE `bet_system`;
INSERT INTO `bet_system`.`Partbet` (`partbetID`, `Combibet_combibetID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (1, 1, 2, 1, 200, 5, true);
INSERT INTO `bet_system`.`Partbet` (`partbetID`, `Combibet_combibetID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (2, 1, 8, 1, 200, 3, false);
INSERT INTO `bet_system`.`Partbet` (`partbetID`, `Combibet_combibetID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (3, 1, 2, 1, 200, 5, true);
INSERT INTO `bet_system`.`Partbet` (`partbetID`, `Combibet_combibetID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (4, 2, 3, 2, 300, 4, false);
INSERT INTO `bet_system`.`Partbet` (`partbetID`, `Combibet_combibetID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (5, 2, 9, 2, 300, 2.5, false);
INSERT INTO `bet_system`.`Partbet` (`partbetID`, `Combibet_combibetID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (6, 2, 3, 2, 300, 4, false);
INSERT INTO `bet_system`.`Partbet` (`partbetID`, `Combibet_combibetID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (7, 3, 4, 0, 100, 2, false);
INSERT INTO `bet_system`.`Partbet` (`partbetID`, `Combibet_combibetID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (8, 3, 10, 0, 100, 2, false);
INSERT INTO `bet_system`.`Partbet` (`partbetID`, `Combibet_combibetID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (9, 3, 4, 0, 100, 2, false);
INSERT INTO `bet_system`.`Partbet` (`partbetID`, `Combibet_combibetID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (10, 4, 8, 1, 200, 3, false);
INSERT INTO `bet_system`.`Partbet` (`partbetID`, `Combibet_combibetID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (11, 4, 2, 1, 200, 5, true);
INSERT INTO `bet_system`.`Partbet` (`partbetID`, `Combibet_combibetID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (12, 4, 8, 1, 200, 3, false);
INSERT INTO `bet_system`.`Partbet` (`partbetID`, `Combibet_combibetID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (13, 5, 9, 2, 300, 2.5, false);
INSERT INTO `bet_system`.`Partbet` (`partbetID`, `Combibet_combibetID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (14, 5, 3, 2, 300, 4, false);
INSERT INTO `bet_system`.`Partbet` (`partbetID`, `Combibet_combibetID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (15, 5, 9, 2, 300, 2.5, false);
INSERT INTO `bet_system`.`Partbet` (`partbetID`, `Combibet_combibetID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (16, 6, 10, 0, 100, 2, false);
INSERT INTO `bet_system`.`Partbet` (`partbetID`, `Combibet_combibetID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (17, 6, 4, 0, 100, 2, false);
INSERT INTO `bet_system`.`Partbet` (`partbetID`, `Combibet_combibetID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (18, 6, 10, 0, 100, 2, false);
INSERT INTO `bet_system`.`Partbet` (`partbetID`, `Combibet_combibetID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (19, 7, 11, 1, 200, 1.2, false);
INSERT INTO `bet_system`.`Partbet` (`partbetID`, `Combibet_combibetID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (20, 7, 11, 1, 200, 1.2, false);
INSERT INTO `bet_system`.`Partbet` (`partbetID`, `Combibet_combibetID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (21, 8, 2, 1, 200, 5, true);
INSERT INTO `bet_system`.`Partbet` (`partbetID`, `Combibet_combibetID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (22, 8, 8, 1, 200, 3, false);
INSERT INTO `bet_system`.`Partbet` (`partbetID`, `Combibet_combibetID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (23, 9, 3, 2, 300, 4, false);
INSERT INTO `bet_system`.`Partbet` (`partbetID`, `Combibet_combibetID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (24, 9, 9, 2, 300, 2.5, false);
INSERT INTO `bet_system`.`Partbet` (`partbetID`, `Combibet_combibetID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (25, 10, 4, 0, 100, 2, false);
INSERT INTO `bet_system`.`Partbet` (`partbetID`, `Combibet_combibetID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (26, 10, 10, 0, 100, 2, false);
INSERT INTO `bet_system`.`Partbet` (`partbetID`, `Combibet_combibetID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (27, 11, 8, 1, 200, 3, false);
INSERT INTO `bet_system`.`Partbet` (`partbetID`, `Combibet_combibetID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (28, 11, 2, 1, 200, 5, true);
INSERT INTO `bet_system`.`Partbet` (`partbetID`, `Combibet_combibetID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (29, 12, 9, 2, 300, 2.5, false);
INSERT INTO `bet_system`.`Partbet` (`partbetID`, `Combibet_combibetID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (30, 12, 3, 2, 300, 4, false);
INSERT INTO `bet_system`.`Partbet` (`partbetID`, `Combibet_combibetID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (31, 13, 10, 0, 100, 2, false);
INSERT INTO `bet_system`.`Partbet` (`partbetID`, `Combibet_combibetID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (32, 13, 4, 0, 100, 2, false);
INSERT INTO `bet_system`.`Partbet` (`partbetID`, `Combibet_combibetID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (33, 14, 2, 1, 200, 5, true);
INSERT INTO `bet_system`.`Partbet` (`partbetID`, `Combibet_combibetID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (34, 14, 8, 1, 200, 3, false);
INSERT INTO `bet_system`.`Partbet` (`partbetID`, `Combibet_combibetID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (35, 15, 3, 2, 300, 4, false);
INSERT INTO `bet_system`.`Partbet` (`partbetID`, `Combibet_combibetID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (36, 15, 9, 2, 300, 2.5, false);
INSERT INTO `bet_system`.`Partbet` (`partbetID`, `Combibet_combibetID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (37, 16, 4, 0, 100, 2, false);
INSERT INTO `bet_system`.`Partbet` (`partbetID`, `Combibet_combibetID`, `Game_gameID`, `tipp`, `bet_amount`, `quote`, `result`) VALUES (38, 16, 10, 0, 100, 2, false);

COMMIT;

-- -----------------------------------------------------
-- Data for table `bet_system`.`PrivateMessage`
-- -----------------------------------------------------
START TRANSACTION;
USE `bet_system`;
INSERT INTO `bet_system`.`PrivateMessage` (`privateMessagesId`, `User_sender`, `User_reseiver`, `datetime`, `subject`, `message`) VALUES (1, 12, 14, '12.12.2012', 'test1', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.');
INSERT INTO `bet_system`.`PrivateMessage` (`privateMessagesId`, `User_sender`, `User_reseiver`, `datetime`, `subject`, `message`) VALUES (2, 4, 7, '01.03.2013', 'test2', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.');
INSERT INTO `bet_system`.`PrivateMessage` (`privateMessagesId`, `User_sender`, `User_reseiver`, `datetime`, `subject`, `message`) VALUES (3, 5, 2, '11.11.2013', 'test3', 'Lorem ipsum dolor sit amet, consetetur sadipscing');
INSERT INTO `bet_system`.`PrivateMessage` (`privateMessagesId`, `User_sender`, `User_reseiver`, `datetime`, `subject`, `message`) VALUES (4, 8, 11, '12.12.2012', 'test4', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.');
INSERT INTO `bet_system`.`PrivateMessage` (`privateMessagesId`, `User_sender`, `User_reseiver`, `datetime`, `subject`, `message`) VALUES (5, 5, 15, '01.03.2013', NULL, 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.');
INSERT INTO `bet_system`.`PrivateMessage` (`privateMessagesId`, `User_sender`, `User_reseiver`, `datetime`, `subject`, `message`) VALUES (6, 15, 4, '11.11.2013', NULL, 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua');
INSERT INTO `bet_system`.`PrivateMessage` (`privateMessagesId`, `User_sender`, `User_reseiver`, `datetime`, `subject`, `message`) VALUES (7, 4, 3, '11.11.2013', 'test7', 'test ewq dsdsaD');
INSERT INTO `bet_system`.`PrivateMessage` (`privateMessagesId`, `User_sender`, `User_reseiver`, `datetime`, `subject`, `message`) VALUES (8, 1, 7, '12.12.2012', 'test8', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.');
INSERT INTO `bet_system`.`PrivateMessage` (`privateMessagesId`, `User_sender`, `User_reseiver`, `datetime`, `subject`, `message`) VALUES (9, 7, 18, '11.11.2013', NULL, 'Lorem ipsum dolor sit amet, consetetur sadipscing');
INSERT INTO `bet_system`.`PrivateMessage` (`privateMessagesId`, `User_sender`, `User_reseiver`, `datetime`, `subject`, `message`) VALUES (10, 5, 14, '01.03.2013', NULL, 'Lorem ipsum dolor sit amet, consetetur sadipscing');
INSERT INTO `bet_system`.`PrivateMessage` (`privateMessagesId`, `User_sender`, `User_reseiver`, `datetime`, `subject`, `message`) VALUES (11, 16, 3, '12.12.2012', 'test11', 'test ewq dsdsaD');
INSERT INTO `bet_system`.`PrivateMessage` (`privateMessagesId`, `User_sender`, `User_reseiver`, `datetime`, `subject`, `message`) VALUES (12, 4, 7, '01.03.2013', 'test12', 'Lorem ipsum dolor sit amet, consetetur sadipscing');
INSERT INTO `bet_system`.`PrivateMessage` (`privateMessagesId`, `User_sender`, `User_reseiver`, `datetime`, `subject`, `message`) VALUES (13, 7, 4, '01.03.2013', 'test13', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.');
INSERT INTO `bet_system`.`PrivateMessage` (`privateMessagesId`, `User_sender`, `User_reseiver`, `datetime`, `subject`, `message`) VALUES (14, 4, 7, '04.12.2013', 'test14', 'wer');
INSERT INTO `bet_system`.`PrivateMessage` (`privateMessagesId`, `User_sender`, `User_reseiver`, `datetime`, `subject`, `message`) VALUES (15, 4, 7, '04.12.2013', NULL, 'was');
INSERT INTO `bet_system`.`PrivateMessage` (`privateMessagesId`, `User_sender`, `User_reseiver`, `datetime`, `subject`, `message`) VALUES (16, 4, 7, '04.12.2013', NULL, 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.');

COMMIT;

-- -----------------------------------------------------
-- Data for table `bet_system`.`Blocked`
-- -----------------------------------------------------
START TRANSACTION;
USE `bet_system`;
INSERT INTO `bet_system`.`Blocked` (`User_userId`, `free_date`, `block_date`, `description`) VALUES (2, '19.03.2013', '03.06.2014', 'troll');
INSERT INTO `bet_system`.`Blocked` (`User_userId`, `free_date`, `block_date`, `description`) VALUES (6, '19.11.2013', '11.11.2014', 'test');
INSERT INTO `bet_system`.`Blocked` (`User_userId`, `free_date`, `block_date`, `description`) VALUES (8, '11.11.2012', '11.11.2014', 'test2');
INSERT INTO `bet_system`.`Blocked` (`User_userId`, `free_date`, `block_date`, `description`) VALUES (13, '11.11.2010', '11.11.2015', 'test3');

COMMIT;

-- -----------------------------------------------------
-- Data for table `bet_system`.`Contest`
-- -----------------------------------------------------
START TRANSACTION;
USE `bet_system`;
INSERT INTO `bet_system`.`Contest` (`contestID`, `sport_sportID`, `titel`, `description`, `begin_date`, `end_date`) VALUES (1, 1, 'WM 2013', 'Weltmeisterschaft des Jahres 2013', '01.01.2013', '31.12.2013');
INSERT INTO `bet_system`.`Contest` (`contestID`, `sport_sportID`, `titel`, `description`, `begin_date`, `end_date`) VALUES (2, 1, 'WM 2014', 'Weltmeisterschaft des Jahres 2014', '01.01.2014', '31.12.2014');
INSERT INTO `bet_system`.`Contest` (`contestID`, `sport_sportID`, `titel`, `description`, `begin_date`, `end_date`) VALUES (3, 1, 'WM 2015', 'Weltmeisterschaft des Jahres 2015', '01.01.2015', '31.12.2015');

COMMIT;

-- -----------------------------------------------------
-- Data for table `bet_system`.`Contest_has_team`
-- -----------------------------------------------------
START TRANSACTION;
USE `bet_system`;
INSERT INTO `bet_system`.`Contest_has_team` (`Contest_contestID`, `Team_teamID`) VALUES (1, 1);
INSERT INTO `bet_system`.`Contest_has_team` (`Contest_contestID`, `Team_teamID`) VALUES (1, 2);
INSERT INTO `bet_system`.`Contest_has_team` (`Contest_contestID`, `Team_teamID`) VALUES (1, 3);
INSERT INTO `bet_system`.`Contest_has_team` (`Contest_contestID`, `Team_teamID`) VALUES (1, 4);
INSERT INTO `bet_system`.`Contest_has_team` (`Contest_contestID`, `Team_teamID`) VALUES (1, 5);
INSERT INTO `bet_system`.`Contest_has_team` (`Contest_contestID`, `Team_teamID`) VALUES (1, 6);
INSERT INTO `bet_system`.`Contest_has_team` (`Contest_contestID`, `Team_teamID`) VALUES (1, 7);
INSERT INTO `bet_system`.`Contest_has_team` (`Contest_contestID`, `Team_teamID`) VALUES (1, 8);
INSERT INTO `bet_system`.`Contest_has_team` (`Contest_contestID`, `Team_teamID`) VALUES (2, 1);
INSERT INTO `bet_system`.`Contest_has_team` (`Contest_contestID`, `Team_teamID`) VALUES (2, 3);
INSERT INTO `bet_system`.`Contest_has_team` (`Contest_contestID`, `Team_teamID`) VALUES (2, 4);
INSERT INTO `bet_system`.`Contest_has_team` (`Contest_contestID`, `Team_teamID`) VALUES (2, 5);
INSERT INTO `bet_system`.`Contest_has_team` (`Contest_contestID`, `Team_teamID`) VALUES (2, 8);
INSERT INTO `bet_system`.`Contest_has_team` (`Contest_contestID`, `Team_teamID`) VALUES (3, 1);
INSERT INTO `bet_system`.`Contest_has_team` (`Contest_contestID`, `Team_teamID`) VALUES (3, 5);

COMMIT;

-- -----------------------------------------------------
-- Data for table `bet_system`.`Statistic`
-- -----------------------------------------------------
START TRANSACTION;
USE `bet_system`;
INSERT INTO `bet_system`.`Statistic` (`Team_teamID`, `Season_seasonID`, `won`, `lost`, `draw`) VALUES (1, 1, 1, 1, 0);
INSERT INTO `bet_system`.`Statistic` (`Team_teamID`, `Season_seasonID`, `won`, `lost`, `draw`) VALUES (2, 1, 1, 1, 0);
INSERT INTO `bet_system`.`Statistic` (`Team_teamID`, `Season_seasonID`, `won`, `lost`, `draw`) VALUES (3, 1, 2, 0, 0);
INSERT INTO `bet_system`.`Statistic` (`Team_teamID`, `Season_seasonID`, `won`, `lost`, `draw`) VALUES (4, 1, 0, 2, 0);
INSERT INTO `bet_system`.`Statistic` (`Team_teamID`, `Season_seasonID`, `won`, `lost`, `draw`) VALUES (5, 2, 0, 0, 2);
INSERT INTO `bet_system`.`Statistic` (`Team_teamID`, `Season_seasonID`, `won`, `lost`, `draw`) VALUES (6, 2, 0, 0, 2);
INSERT INTO `bet_system`.`Statistic` (`Team_teamID`, `Season_seasonID`, `won`, `lost`, `draw`) VALUES (7, 2, 0, 1, 1);
INSERT INTO `bet_system`.`Statistic` (`Team_teamID`, `Season_seasonID`, `won`, `lost`, `draw`) VALUES (8, 2, 1, 0, 1);
INSERT INTO `bet_system`.`Statistic` (`Team_teamID`, `Season_seasonID`, `won`, `lost`, `draw`) VALUES (1, 3, 1, 0, 0);
INSERT INTO `bet_system`.`Statistic` (`Team_teamID`, `Season_seasonID`, `won`, `lost`, `draw`) VALUES (2, 3, 0, 1, 0);
INSERT INTO `bet_system`.`Statistic` (`Team_teamID`, `Season_seasonID`, `won`, `lost`, `draw`) VALUES (3, 3, 1, 0, 0);
INSERT INTO `bet_system`.`Statistic` (`Team_teamID`, `Season_seasonID`, `won`, `lost`, `draw`) VALUES (4, 3, 0, 1, 0);
INSERT INTO `bet_system`.`Statistic` (`Team_teamID`, `Season_seasonID`, `won`, `lost`, `draw`) VALUES (5, 3, 0, 0, 1);
INSERT INTO `bet_system`.`Statistic` (`Team_teamID`, `Season_seasonID`, `won`, `lost`, `draw`) VALUES (6, 3, 0, 0, 1);
INSERT INTO `bet_system`.`Statistic` (`Team_teamID`, `Season_seasonID`, `won`, `lost`, `draw`) VALUES (7, 3, 0, 1, 0);
INSERT INTO `bet_system`.`Statistic` (`Team_teamID`, `Season_seasonID`, `won`, `lost`, `draw`) VALUES (8, 3, 1, 0, 0);

COMMIT;

-- -----------------------------------------------------
-- Data for table `bet_system`.`Cupons`
-- -----------------------------------------------------
START TRANSACTION;
USE `bet_system`;
INSERT INTO `bet_system`.`Cupons` (`cuponsID`, `User_userID`, `amount`, `code`) VALUES (1, 1, 1000, 'abcdef01');
INSERT INTO `bet_system`.`Cupons` (`cuponsID`, `User_userID`, `amount`, `code`) VALUES (2, 2, 1000, 'abcdef02');
INSERT INTO `bet_system`.`Cupons` (`cuponsID`, `User_userID`, `amount`, `code`) VALUES (3, 3, 1000, 'abcdef03');
INSERT INTO `bet_system`.`Cupons` (`cuponsID`, `User_userID`, `amount`, `code`) VALUES (4, 4, 1000, 'abcdef04');
INSERT INTO `bet_system`.`Cupons` (`cuponsID`, `User_userID`, `amount`, `code`) VALUES (5, 5, 1000, 'abcdef05');
INSERT INTO `bet_system`.`Cupons` (`cuponsID`, `User_userID`, `amount`, `code`) VALUES (6, 6, 1000, 'abcdef06');
INSERT INTO `bet_system`.`Cupons` (`cuponsID`, `User_userID`, `amount`, `code`) VALUES (7, 7, 1000, 'abcdef07');
INSERT INTO `bet_system`.`Cupons` (`cuponsID`, `User_userID`, `amount`, `code`) VALUES (8, 8, 1000, 'abcdef08');
INSERT INTO `bet_system`.`Cupons` (`cuponsID`, `User_userID`, `amount`, `code`) VALUES (9, 9, 1000, 'abcdef09');
INSERT INTO `bet_system`.`Cupons` (`cuponsID`, `User_userID`, `amount`, `code`) VALUES (10, 10, 1000, 'abcdef10');
INSERT INTO `bet_system`.`Cupons` (`cuponsID`, `User_userID`, `amount`, `code`) VALUES (11, 11, 1000, 'abcdef11');
INSERT INTO `bet_system`.`Cupons` (`cuponsID`, `User_userID`, `amount`, `code`) VALUES (12, 12, 1000, 'abcdef12');
INSERT INTO `bet_system`.`Cupons` (`cuponsID`, `User_userID`, `amount`, `code`) VALUES (13, 13, 1000, 'abcdef13');
INSERT INTO `bet_system`.`Cupons` (`cuponsID`, `User_userID`, `amount`, `code`) VALUES (14, 14, 1000, 'abcdef14');
INSERT INTO `bet_system`.`Cupons` (`cuponsID`, `User_userID`, `amount`, `code`) VALUES (15, 15, 1000, 'abcdef15');
INSERT INTO `bet_system`.`Cupons` (`cuponsID`, `User_userID`, `amount`, `code`) VALUES (16, 16, 1000, 'abcdef16');
INSERT INTO `bet_system`.`Cupons` (`cuponsID`, `User_userID`, `amount`, `code`) VALUES (17, 17, 1000, 'abcdef17');
INSERT INTO `bet_system`.`Cupons` (`cuponsID`, `User_userID`, `amount`, `code`) VALUES (18, 18, 1000, 'abcdef18');

COMMIT;

-- -----------------------------------------------------
-- Data for table `bet_system`.`Friend`
-- -----------------------------------------------------
START TRANSACTION;
USE `bet_system`;
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (1, 2);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (1, 3);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (1, 4);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (2, 5);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (2, 6);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (2, 7);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (3, 8);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (3, 9);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (3, 10);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (4, 11);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (4, 12);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (4, 13);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (4, 14);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (5, 16);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (5, 17);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (5, 18);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (5, 19);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (5, 20);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (5, 21);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (5, 22);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (5, 23);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (5, 24);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (5, 25);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (5, 26);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (5, 27);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (5, 28);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (5, 29);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (5, 30);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (5, 1);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (5, 2);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (5, 3);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (5, 4);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (5, 5);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (5, 6);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (5, 7);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (5, 8);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (5, 9);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (5, 10);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (5, 11);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (5, 12);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (5, 13);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (5, 14);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (5, 15);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (6, 16);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (7, 17);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (8, 18);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (9, 19);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (10, 20);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (11, 21);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (12, 22);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (12, 23);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (12, 24);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (13, 25);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (13, 26);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (13, 27);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (14, 28);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (14, 29);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (14, 30);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (15, 1);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (15, 2);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (15, 3);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (16, 4);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (16, 5);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (16, 6);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (17, 7);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (17, 8);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (17, 9);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (18, 10);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (18, 11);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (18, 12);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (19, 13);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (19, 14);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (19, 15);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (20, 16);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (20, 17);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (20, 18);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (21, 19);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (21, 20);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (21, 21);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (22, 22);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (22, 23);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (22, 24);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (23, 25);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (23, 26);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (23, 27);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (24, 28);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (24, 29);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (24, 30);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (25, 1);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (25, 2);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (25, 3);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (26, 4);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (26, 5);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (26, 6);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (27, 7);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (27, 8);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (27, 9);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (28, 10);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (28, 11);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (28, 12);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (29, 13);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (29, 14);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (29, 15);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (30, 16);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (30, 17);
INSERT INTO `bet_system`.`Friend` (`User_userID1`, `User_userID2`) VALUES (30, 18);

COMMIT;

-- -----------------------------------------------------
-- Data for table `bet_system`.`Shout`
-- -----------------------------------------------------
START TRANSACTION;
USE `bet_system`;
INSERT INTO `bet_system`.`Shout` (`shoutID`, `User_userID`, `date`, `message`) VALUES (1, 1, 'NOW()', 'test1test1test1test1test1test1test1test1test1');
INSERT INTO `bet_system`.`Shout` (`shoutID`, `User_userID`, `date`, `message`) VALUES (2, 2, 'NOW()', 'test2');
INSERT INTO `bet_system`.`Shout` (`shoutID`, `User_userID`, `date`, `message`) VALUES (3, 3, 'NOW()', 'test3test3test3test3test3test3');
INSERT INTO `bet_system`.`Shout` (`shoutID`, `User_userID`, `date`, `message`) VALUES (4, 4, 'NOW()', 'test4test4test4test4test4test4test4');
INSERT INTO `bet_system`.`Shout` (`shoutID`, `User_userID`, `date`, `message`) VALUES (5, 5, 'NOW()', 'test5test5');
INSERT INTO `bet_system`.`Shout` (`shoutID`, `User_userID`, `date`, `message`) VALUES (6, 6, 'NOW()', 'test6test6test6test6');
INSERT INTO `bet_system`.`Shout` (`shoutID`, `User_userID`, `date`, `message`) VALUES (7, 7, 'NOW()', 'test7test7test7test7test7test7test7');
INSERT INTO `bet_system`.`Shout` (`shoutID`, `User_userID`, `date`, `message`) VALUES (8, 8, 'NOW()', 'test8test8test8test8');
INSERT INTO `bet_system`.`Shout` (`shoutID`, `User_userID`, `date`, `message`) VALUES (9, 9, 'NOW()', 'test9test9');
INSERT INTO `bet_system`.`Shout` (`shoutID`, `User_userID`, `date`, `message`) VALUES (10, 10, 'NOW()', 'test10test10test10test10test10test10test10test10test10');
INSERT INTO `bet_system`.`Shout` (`shoutID`, `User_userID`, `date`, `message`) VALUES (11, 11, 'NOW()', 'test11test11test11test11test11test11test11test11test11test11');
INSERT INTO `bet_system`.`Shout` (`shoutID`, `User_userID`, `date`, `message`) VALUES (12, 12, 'NOW()', 'test12test12test12');
INSERT INTO `bet_system`.`Shout` (`shoutID`, `User_userID`, `date`, `message`) VALUES (13, 13, 'NOW()', 'test13test13');
INSERT INTO `bet_system`.`Shout` (`shoutID`, `User_userID`, `date`, `message`) VALUES (14, 14, 'NOW()', 'test14test14test14test14test14test14test14test14');
INSERT INTO `bet_system`.`Shout` (`shoutID`, `User_userID`, `date`, `message`) VALUES (15, 15, 'NOW()', 'test15test15test15test15test15test15test15');
INSERT INTO `bet_system`.`Shout` (`shoutID`, `User_userID`, `date`, `message`) VALUES (16, 16, 'NOW()', 'test16test16test16');
INSERT INTO `bet_system`.`Shout` (`shoutID`, `User_userID`, `date`, `message`) VALUES (17, 17, 'NOW()', 'test17test17test17test17test17test17test17test17');
INSERT INTO `bet_system`.`Shout` (`shoutID`, `User_userID`, `date`, `message`) VALUES (18, 18, 'NOW()', 'test18test18test18test18test18test18test18test18');
INSERT INTO `bet_system`.`Shout` (`shoutID`, `User_userID`, `date`, `message`) VALUES (19, 19, 'NOW()', 'test19test19');
INSERT INTO `bet_system`.`Shout` (`shoutID`, `User_userID`, `date`, `message`) VALUES (20, 20, 'NOW()', 'test20test20test20test20test20test20test20test20test20');

COMMIT;
