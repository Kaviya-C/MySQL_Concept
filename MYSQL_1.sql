CREATE DATABASE Learning;
USE LEARNING;
CREATE TABLE USERS
(
ID INT NOT NULL AUTO_INCREMENT,
NAME VARCHAR(30) NOT NULL,
AGE INT NOT NULL,
PRIMARY KEY(ID)
);

-- IT DISPLAY ALL THE TABLES IN THIS LEARNING DATABASE
SHOW TABLES;
DESCRIBE USERS;
SELECT * FROM USERS;

-- IF U WANT TO ADD THE NEW  COLUMN IN THE EXISTING TABLE
ALTER TABLE USERS ADD GENDER VARCHAR(5);

-- IF WE WANT TO ADD MULTIPLE COLUMNS MEAN 
ALTER TABLE USERS
		ADD CITY VARCHAR(30) NOT NULL,
        ADD CONTACT VARCHAR(20) NOT NULL;
        
SELECT * FROM USERS;

-- IF WE WANT TO MODIFY THE SIZE OF THE SPECIFIC COLUMN
ALTER TABLE USERS
		MODIFY COLUMN CITY VARCHAR(20) NOT NULL;
DESC USERS;

-- WANT TO RENAME THE TABLE NAME
ALTER TABLE USERS RENAME TO STUDENTS;
SHOW TABLES;

-- WANT TO RENAME THE PARTICULAR COLUMN NAME IN THIS TABLE

ALTER TABLE STUDENTS RENAME COLUMN CONTACT TO PHONE_NO;
DESC STUDENTS;

-- CHANGE THE SIZE OF THE DATATYPES IN THIS TABLE
ALTER TABLE STUDENTS
MODIFY COLUMN GENDER VARCHAR(10) NOT NULL;



SELECT * FROM STUDENTS;
-- WE CAN INSERT THE DATA IN 3 WAYS--
-- 1 ST WAY
INSERT INTO  STUDENTS VALUES(NULL,'RAM','24','MALE','SALEM',6785847364);


-- 2 ND WAY TO INSERT THE DATA INTO THE TABLE
INSERT INTO STUDENTS (NAME,AGE,GENDER,CITY,PHONE_NO)
VALUES ('SEETHA',21,'FEMALE','CHENNAI',8978899076);

-- 3 RD WAY WE CAN INSERT MULTIPLE INSERTION AT A TIME
INSERT INTO STUDENTS (NAME,AGE,GENDER,CITY,PHONE_NO)
VALUES ('BANU',26,'FEMALE','DELHI',765432109),
('FAHAN',23,'MALE','HYDERBAD',9087655234);

SELECT * FROM STUDENTS;

-- WE CAN DELETE THE DATA BY USING PRIMARY KEY
DELETE FROM STUDENTS WHERE ID=3;

-- IF I WANT TO UPDATE THE EXISTING RECORD OF CITY FOR RAM
UPDATE STUDENTS
SET CITY='MUMBAI'
WHERE NAME='RAM';

-- DISPLAY ALL THE RECORDS IN THE STUDENTS
SELECT * FROM STUDENTS;

-- TRUCATE TABLES JUST DELETE ALL THE RECORDS IN THE TABLE
TRUNCATE TABLE STUDENTS;
SHOW TABLES;
-- THIS WILL DELETE THE RECORDS OF THE SPECIFIED CONDITION
DELETE FROM STUDENTS ;

-- WANT TO DELETE THE WHOLE TABLE 
DROP TABLE STUDENTS;
SHOW TABLES;
-- NOW TABLE ITSELF DELETED


CREATE TABLE STUDENTS
(
ID INT NOT NULL AUTO_INCREMENT,
STUDNAME VARCHAR(30) NOT NULL,
AGE INT NOT NULL,
GENDER VARCHAR(10) NOT NULL,
CONTACT VARCHAR(12) NOT NULL,
CITY VARCHAR(40),
PRIMARY KEY(ID)
);


INSERT INTO STUDENTS (STUDNAME,AGE,GENDER,CONTACT,CITY)
VALUES
('FARITHA',21,'FEMALE','9088887880','HOSUR'),
('MUGHIL',27,'MALE','9087656789','CHENNAI'),
('RADHA',31,'FEMALE','9080976880','HYDERABAD'),
('FAHAN',33,'MALE','6788887800','MUMBAI'),
('GURU',35,'MALE','8908887880','CHENNAI'),
('MALATHI',31,'FEMALE','6789887880','HOSUR'),
('RAJESH',28,'MALE','8888007880','NAMAKKAL'),
('KARTHIKA',27,'FEMALE','8880087880','HOSUR'),
('SANKAR',27,'MALE','667787880','NAMAKKAL'),
('LALITHA',24,'FEMALE','9000887880','VILUPURAM'),
('YOKESH',29,'FEMALE','9778807880','SALEM'),
('ISHU',20,'FEMALE','9788045365','HOGENAKKAL'),
('LILLY',22,'FEMALE','9076898000','SALEM');

SELECT * FROM STUDENTS;

-- FILTERATION IN SQL
-- I NEED ONLY STUDENT NAME AND AGE
SELECT STUDNAME,AGE FROM STUDENTS;

-- I WANT FULL DETAILS OF STUDENT WHO COMING FROM HOSUR
SELECT * FROM STUDENTS WHERE CITY='HOSUR';

-- I NEED THE NAME AGE CITY WHERE STUDENT COMING FROM HOSUR AND AGE SHOULD BE ABOVE 25
SELECT STUDNAME,AGE ,CITY FROM STUDENTS WHERE AGE>25 AND CITY='HOSUR';

-- IF ANY OF THE STUDENT HOSUR AND MAY NOT ABOVE AGE 25
-- MAY NOT BE HOSUR
-- OK THAT MEANT USE OR OPERATOR
SELECT ID,STUDNAME,AGE,CITY FROM STUDENTS WHERE AGE>25 OR CITY='HOSUR';

-- I WANT TO DISPLAY ALPHABETICALLY OF CITY
-- BY DEFAULT IT IS ASCENDING ORDER IF U WANT REVERSE USE 'DESC'
SELECT * FROM STUDENTS ORDER BY CITY;

-- I WANT TO DISPLAY THE CITY 
SELECT  CITY FROM STUDENTS;

-- I DON'T WANT TO DISPLAY THE SAME CITY AGAIN THEN USE SELECT DISTINCT
SELECT DISTINCT CITY FROM STUDENTS;

-- I WANT TO COUNT THE CITY 
SELECT COUNT(CITY) AS CITYCOUNTS FROM STUDENTS;

-- I WANT TO COUNT ONLY THE UNIQUE CITY
SELECT COUNT( DISTINCT CITY) AS  CITYUNIQUE FROM STUDENTS;

-- I WANT TO DISPLAY ONLY FEW STUDENTS USE LIMIT
SELECT * FROM STUDENTS LIMIT 0,5;

-- I WANT TO DISPLAY THE FIRST STUDENT DETAILS
SELECT * FROM STUDENTS LIMIT 0,1;

-- I WANT TO DISPLAY THE LAST STUDENT DETAILS
SELECT * FROM STUDENTS ORDER BY ID DESC LIMIT 0,1;

-- I WANT TO DISPLAY THE MAXIMUM AGE OF STUDENT
SELECT MAX(AGE) AS MAXIMUMAGE FROM STUDENTS;

-- I WANT TO DISPLAY THE MINIMUM AGE OF STUDENT
SELECT MIN(AGE) AS MINIMUMAGE  FROM STUDENTS;

-- I WANT TO DISPLAY THE OVERALL STUDENT AVERAGE AGE
SELECT AVG(AGE) AS AVERAGE FROM STUDENTS;

-- I DON'T WANT THIS AVERAGE IN DECIMAL USE 'ROUND()'
SELECT ROUND(AVG(AGE),0) AS AVERAGEAGES FROM STUDENTS;

-- SUM OF AGES
SELECT SUM(AGE) FROM STUDENTS;
-- USE THIS SUM METHOD FOR ADDING THE SUBJECT MARKS,OVERALL PRODUCT QUANTITY ETC.,


-- I WANT TO DISPLAY GENDER WISE COUNT
-- COMPULSORY WE SHOULD USE GROUP BY THEN ONLY IT SEPERATE AS MALE AND FEMLAE:
SELECT GENDER,COUNT(ID) AS TOTAL FROM STUDENTS GROUP BY GENDER;

-- I WANT TO DISPLAY THE CITY NAME FOR EACH CITY HOW MANY STUDENTS COMMING
SELECT CITY ,COUNT(ID) AS TOTAL FROM STUDENTS GROUP BY CITY;

-- WILDCARDS SEARCH
-- PRACTICAL EXAMPLE IF WE SEARCH ANYTHING IN GOOGLE IT SHOWS SOME
-- SUGGESTION THAT IS BECOZ OF THIS WILDCARDS

-- STARTS WITH F AND  % REPRESENTS ANY NO OF CHARACTERS AFTER THE 'F'
SELECT STUDNAME FROM STUDENTS WHERE STUDNAME LIKE 'F%';

-- START WITH ANY LETTER CONTAINS 'AL' THEN ENDS WITH ANY LETTER
SELECT STUDNAME FROM STUDENTS WHERE STUDNAME LIKE '%AL%';

-- I WANT ALL THE STUDENT NAME AND AGE OF SALEM AND HOSUR
SELECT ID ,STUDNAME,AGE FROM STUDENTS WHERE CITY IN('SALEM','HOSUR');

-- NOT IN SALEM AND HOSUR AND MUMBAI
SELECT ID ,STUDNAME,AGE FROM STUDENTS WHERE CITY NOT IN('SALEM','HOSUR','MUMBAI');

-- STUDENT NAME NOT START WITH R
SELECT STUDNAME FROM STUDENTS WHERE STUDNAME NOT LIKE 'R%'; 

-- I WANT TO DISPLAY THE STUDENT NAME AND AGE WHERE AGES BETWEEN 20 TO 25
SELECT STUDNAME ,AGE FROM STUDENTS WHERE AGE BETWEEN 20 AND 25 ORDER BY AGE;

-- I WANT TO DISPLAY THE AGES NOT BETWEEN 20 TO 29
SELECT STUDNAME ,AGE FROM STUDENTS WHERE AGE NOT BETWEEN 20 AND 29 ORDER BY AGE;

-- ----------------------------------------------------------------------------