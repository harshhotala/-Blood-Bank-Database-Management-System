DROP DATABASE IF EXISTS BLOOD_BANK_PROJECT;
CREATE DATABASE BLOOD_BANK_PROJECT;
USE BLOOD_BANK_PROJECT;

-- blood_bank
DROP TABLE IF EXISTS blood_bank;
CREATE TABLE blood_bank (
  state VARCHAR(20),
  city VARCHAR(20),
  blood_bank_id VARCHAR(20) PRIMARY KEY
) ENGINE=InnoDB;

-- donor
DROP TABLE IF EXISTS donor;
CREATE TABLE donor (
  donor_name VARCHAR(20),
  donor_id VARCHAR(20) PRIMARY KEY,
  gender VARCHAR(20),
  blood_group VARCHAR(20),
  date_of_birth DATE,
  donation_date_time TIMESTAMP,
  city VARCHAR(20),
  phone_number VARCHAR(20),
  blood_bank_id VARCHAR(20),
  FOREIGN KEY (blood_bank_id) REFERENCES blood_bank(blood_bank_id)
) ENGINE=InnoDB;

-- blood
DROP TABLE IF EXISTS blood;
CREATE TABLE blood (
  blood_group VARCHAR(20),
  quantity_mL INT,
  donor_id VARCHAR(20),
  PRIMARY KEY (donor_id, blood_group, quantity_mL),
  FOREIGN KEY (donor_id) REFERENCES donor(donor_id)
) ENGINE=InnoDB;

-- Employee
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (
  Employee_id INT PRIMARY KEY,
  E_mail VARCHAR(30),
  Employee_Name VARCHAR(30),
  Salary INT,
  Joining_date DATE,
  blood_bank_id VARCHAR(20),
  FOREIGN KEY (blood_bank_id) REFERENCES blood_bank(blood_bank_id)
) ENGINE=InnoDB;

-- Employee_Phone (fixed column names & FK)
DROP TABLE IF EXISTS Employee_Phone;
CREATE TABLE Employee_Phone (
  Phone_No VARCHAR(20),
  Employee_id INT,
  PRIMARY KEY (Phone_No, Employee_id),
  FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id)
) ENGINE=InnoDB;

-- hospital
DROP TABLE IF EXISTS hospital;
CREATE TABLE hospital (
  hospital_id INT PRIMARY KEY,
  hospital_name VARCHAR(30),
  street VARCHAR(20),
  city VARCHAR(40)
) ENGINE=InnoDB;

-- Patient (fixed FK reference to blood_bank)
DROP TABLE IF EXISTS Patient;
CREATE TABLE Patient (
  patient_id INT PRIMARY KEY,
  Patient_Name VARCHAR(30),
  Date_of_birth DATE,
  blood_group VARCHAR(50),
  Gender VARCHAR(50),
  house_no INT,
  Street VARCHAR(30),
  city VARCHAR(30),
  State VARCHAR(30),
  quantity INT,
  date_of_receiving DATE,
  blood_bank_id VARCHAR(20),
  admission_time TIMESTAMP,
  discharge_time TIMESTAMP,
  hospital_id INT,
  FOREIGN KEY (blood_bank_id) REFERENCES blood_bank(blood_bank_id),
  FOREIGN KEY (hospital_id) REFERENCES hospital(hospital_id)
) ENGINE=InnoDB;

-- Volunteer
DROP TABLE IF EXISTS Volunteer;
CREATE TABLE Volunteer (
  Volunteer_id INT PRIMARY KEY,
  Volunteer_Name VARCHAR(50),
  Join_date DATE,
  Date_of_birth DATE,
  E_mail VARCHAR(100),
  blood_bank_id VARCHAR(20),
  CONSTRAINT fk_volunteer_bloodbank FOREIGN KEY (blood_bank_id)
    REFERENCES blood_bank(blood_bank_id)
) ENGINE=InnoDB;

-- Volunteer_Phone_no
DROP TABLE IF EXISTS Volunteer_Phone_no;
CREATE TABLE Volunteer_Phone_no (
  Phone_no_1 VARCHAR(20),
  Phone_no_2 VARCHAR(20),
  Volunteer_id INT,
  PRIMARY KEY (Volunteer_id, Phone_no_1),
  FOREIGN KEY (Volunteer_id) REFERENCES Volunteer(Volunteer_id)
) ENGINE=InnoDB;

-- Medical_equipment
DROP TABLE IF EXISTS Medical_equipment;
CREATE TABLE Medical_equipment (
  Remarks VARCHAR(20),
  Date_of_purchase DATE,
  Maintainance_due VARCHAR(20),
  equipment_id VARCHAR(8) PRIMARY KEY,
  blood_bank_id VARCHAR(20),
  eqpmnt_name VARCHAR(40),
  price INT,
  FOREIGN KEY (blood_bank_id) REFERENCES blood_bank(blood_bank_id)
) ENGINE=InnoDB;

-- INSERTS
INSERT INTO blood_bank VALUES ('AndhraPradesh','Vishakapatnam','v1');
INSERT INTO blood_bank VALUES ('AndhraPradesh','Guntur','G1');
INSERT INTO blood_bank VALUES ('AndhraPradesh','Warangal','w1');
INSERT INTO blood_bank VALUES ('AndhraPradesh','Rajamudhry','r1');
INSERT INTO blood_bank VALUES ('AndhraPradesh','Khammam','kh1');
INSERT INTO blood_bank VALUES ('AndhraPradesh','Secunderabad','s1');

INSERT INTO Medical_equipment VALUES ('working','2002-08-23','600','eq1','v1','Hematology Analyzer',137648);
INSERT INTO Medical_equipment VALUES ('working','1999-08-24','2000','eq2','G1','Centrifuge machine',74738);
INSERT INTO Medical_equipment VALUES ('working','2000-08-25','211','eq3','r1','Rhview box',37479);
INSERT INTO Medical_equipment VALUES ('working','2007-10-23','255','eq4','kh1','Storage Refrigerator',74844);
INSERT INTO Medical_equipment VALUES ('working','2012-11-23','456','eq5','s1','Plasma Expressor',87654);
INSERT INTO Medical_equipment VALUES ('working','2013-07-23','655','eq6','w1','Storage Refrigerator',7648);

INSERT INTO donor VALUES ('Allu','d101','M','B+','2000-11-12','2021-03-10 00:02:23','Vishakapatnam','534567891','v1');
INSERT INTO donor VALUES ('sahithi','d102','F','B-','2000-10-12','2021-03-10 00:03:23','Warangal','544567891','v1');
INSERT INTO donor VALUES ('john','d103','M','AB-','2000-09-12','2021-02-10 00:04:12','Ongole','235567891','G1');
INSERT INTO donor VALUES ('Pavan','d104','M','A+','2001-11-22','2021-02-10 11:01:23','Madras','234567591','kh1');
INSERT INTO donor VALUES ('syam','d105','F','O-','2000-01-12','2021-01-10 00:05:23','Pali','124567891','w1');
INSERT INTO donor VALUES ('latha','d106','F','AB+','2002-11-12','2021-04-10 05:01:23','Thalli','345567891','s1');
INSERT INTO donor VALUES ('Somal','d107','M','A+','2005-11-14','2021-01-10 15:01:23','Kolkata','569567891','r1');
INSERT INTO donor VALUES ('Bittu','d108','M','B+','2000-10-12','2021-02-10 12:01:23','Khammam','784567891','s1');
INSERT INTO donor VALUES ('Bhaskar','d109','F','O+','2012-11-12','2021-03-10 23:01:23','Vizag','268367891','w1');

INSERT INTO blood VALUES ('B+',100,'d101');
INSERT INTO blood VALUES ('B-',200,'d102');
INSERT INTO blood VALUES ('AB-',300,'d103');
INSERT INTO blood VALUES ('A+',100,'d104');
INSERT INTO blood VALUES ('O-',200,'d105');
INSERT INTO blood VALUES ('AB+',300,'d106');
INSERT INTO blood VALUES ('A+',100,'d107');
INSERT INTO blood VALUES ('B+',200,'d108');
INSERT INTO blood VALUES ('O+',300,'d109');

INSERT INTO Employee VALUES (2001,'rahul@gmail.com','Rahul',50000,'2000-08-23','v1');
INSERT INTO Employee VALUES (2002,'ramesh@gmail.com','Ramesh',40000,'2000-07-23','r1');
INSERT INTO Employee VALUES (2003,'Sultan@gmail.com','Sultan',48000,'2000-08-13','G1');
INSERT INTO Employee VALUES (2004,'Mani@gmail.com','Mani',79000,'2001-08-23','kh1');
INSERT INTO Employee VALUES (2005,'Mayank@gmail.com','Mayank',56000,'2020-08-23','w1');
INSERT INTO Employee VALUES (2006,'Harshit@gmail.com','Harshit',44000,'2000-08-17','w1');
INSERT INTO Employee VALUES (2007,'Ravi@gmail.com','Ravi',23000,'2002-08-23','v1');
INSERT INTO Employee VALUES (2008,'Vanshi@gmail.com','Vanshika',100000,'2000-05-10','r1');

INSERT INTO Employee_Phone VALUES ('9307593908',2001);
INSERT INTO Employee_Phone VALUES ('9587497',2002);
INSERT INTO Employee_Phone VALUES ('9938788',2003);
INSERT INTO Employee_Phone VALUES ('9656644',2004);
INSERT INTO Employee_Phone VALUES ('9423955',2005);
INSERT INTO Employee_Phone VALUES ('9987732',2006);
INSERT INTO Employee_Phone VALUES ('9123224',2007);
INSERT INTO Employee_Phone VALUES ('9098087',2008);
INSERT INTO Employee_Phone VALUES ('9324423',2005);

INSERT INTO Hospital VALUES (101,'Lifeline','Ramnagar','Vishakapatnam');
INSERT INTO Hospital VALUES (102,'SaveIn','APJColony','Secunderabad');
INSERT INTO Hospital VALUES (103,'AIIMS','GandhiNagar','Rajamudhry');
INSERT INTO Hospital VALUES (104,'Rohini','Hanamkonda1','Warangal');
INSERT INTO Hospital VALUES (105,'JeevanJyoti','Hanamkonda2','Guntur');
INSERT INTO Hospital VALUES (106,'OneBlood','KakatiyaColony','Khammam');

INSERT INTO patient VALUES (1,'Prudvi','1984-06-21','O+','M',4,'st21','Vishakapatnam','AndhraPradesh',500,'2016-07-14','v1','2016-07-14 18:30:00',NULL,101);
INSERT INTO patient VALUES (2,'kamesh','1981-07-13','AB+','M',12,'14avenue','Vishakapatnam','AndhraPradesh',350,'2014-08-08','v1','2014-08-08 10:12:00','2014-08-11 14:50:00',101);
INSERT INTO patient VALUES (3,'Vidya','1991-04-24','A+','F',19,'19thSt','Secunderabad','AndhraPradesh',260,'2015-11-19','s1','2015-11-19 14:30:00','2015-11-26 16:25:00',102);
INSERT INTO patient VALUES (4,'Lohith','1968-11-09','B+','M',6,'18thSt','Secunderabad','AndhraPradesh',750,'2016-07-16','s1','2016-07-16 19:44:00',NULL,102);
INSERT INTO patient VALUES (5,'Ritika','1994-12-16','A+','F',10,'Ramnagar','Warangal','AndhraPradesh',400,'2015-09-11','w1','2015-09-11 11:16:00','2015-09-22',104);
INSERT INTO patient VALUES (6,'Rakhi','1978-09-13','AB-','F',11,'ShivNagar','Warangal','AndhraPradesh',325,'2016-07-15','w1','2016-07-15 06:54:00',NULL,104);
INSERT INTO patient VALUES (7,'Sai Pavan','1972-02-29','O+','M',17,'Karimnagar','Rajamudhry','AndhraPradesh',600,'2014-10-01','r1','2014-10-01 11:45:00','2014-10-09',103);
INSERT INTO patient VALUES (8,'Rajesh','1995-03-06','AB+','M',20,'St06','Rajamudhry','AndhraPradesh',650,'2016-07-16','r1','2016-07-16 17:13:00',NULL,103);
INSERT INTO patient VALUES (9,'Avinash','1967-05-29','A+','F',18,'Station_Road','Guntur','AndhraPradesh',250,'2015-10-25','G1','2015-10-25 09:19:00','2015-10-28 09:44:00',105);
INSERT INTO patient VALUES (10,'Nikhila','1968-02-18','AB+','F',1,'PostOfficeRoad','Guntur','AndhraPradesh',600,'2016-07-15','G1','2016-07-15 12:08:00',NULL,105);
INSERT INTO patient VALUES (11,'Somal','1977-01-14','B+','M',19,'St11','Khammam','AndhraPradesh',550,'2015-12-16','kh1','2015-12-15 15:19:00','2015-12-24 22:10:00',106);
INSERT INTO patient VALUES (12,'Karun','1979-06-19','O+','M',13,'St14','Khammam','AndhraPradesh',440,'2014-08-24','kh1','2014-08-24 19:23:00','2014-08-29 20:35:00',106);

INSERT INTO Volunteer VALUES (101,'Abhi','2014-01-12',NULL,'ab@gmail.com','v1');
INSERT INTO Volunteer VALUES (102,'Anil','2014-02-24',NULL,'ani@gmail.com','v1');
INSERT INTO Volunteer VALUES (103,'Aadarsh','2015-01-12',NULL,'aad@gmail.com','w1');
INSERT INTO Volunteer VALUES (104,'virat','2015-01-12',NULL,'vi@gmail.com','w1');
INSERT INTO Volunteer VALUES (105,'divillers','2014-01-12',NULL,'di@gmail.com','G1');
INSERT INTO Volunteer VALUES (106,'prabhas','2014-01-12',NULL,'pra@gmail.com','G1');
INSERT INTO Volunteer VALUES (107,'srihari','2016-01-12',NULL,'sri@gmail.com','kh1');
INSERT INTO Volunteer VALUES (108,'sricharan','2016-01-12',NULL,'srich@gmail.com','kh1');
INSERT INTO Volunteer VALUES (109,'shami','2017-01-12',NULL,'sh@gmail.com','r1');
INSERT INTO Volunteer VALUES (110,'chahal','2017-01-12',NULL,'cha@gmail.com','r1');
INSERT INTO Volunteer VALUES (111,'siraj','2018-01-12',NULL,'si@gmail.com','s1');
INSERT INTO Volunteer VALUES (112,'gayle','2018-01-12',NULL,'ga@gmail.com','s1');

INSERT INTO Volunteer_Phone_no VALUES ('9722344567','9698521478',101);
INSERT INTO Volunteer_Phone_no VALUES ('9123654789','9369852147',101);
INSERT INTO Volunteer_Phone_no VALUES ('9823654789','9969852147',102);
INSERT INTO Volunteer_Phone_no VALUES ('9723654789','9769852147',102);
INSERT INTO Volunteer_Phone_no VALUES ('9623654785','9669852145',103);
INSERT INTO Volunteer_Phone_no VALUES ('9123654782','9369852142',103);
INSERT INTO Volunteer_Phone_no VALUES ('9523654789','9369852145',104);
INSERT INTO Volunteer_Phone_no VALUES ('9163654789','9369852146',104);
INSERT INTO Volunteer_Phone_no VALUES ('9177654789','9369852149',105);
INSERT INTO Volunteer_Phone_no VALUES ('9103654789','9369852141',105);
INSERT INTO Volunteer_Phone_no VALUES ('9193654789','9369852117',106);
INSERT INTO Volunteer_Phone_no VALUES ('9133654789','9369852167',106);
INSERT INTO Volunteer_Phone_no VALUES ('9711928998','9698527478',107);
INSERT INTO Volunteer_Phone_no VALUES ('9123854789','9369856147',108);





