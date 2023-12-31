CREATE DATABASE ADVANCED_SQL;
USE ADVANCED_SQL;

CREATE TABLE STUDENT
(
ID INT NOT NULL AUTO_INCREMENT,
STUDNAME VARCHAR(30) NOT NULL,
AGE INT NOT NULL,
GENDER VARCHAR(10) NOT NULL,
CITY VARCHAR(30) NOT NULL,
CONTACT VARCHAR(10) NOT NULL,
COM VARCHAR(5) NOT NULL,
COURSEID INT NOT NULL,
ROLLNO INT NOT NULL,
PRIMARY KEY(ID)
);

INSERT INTO STUDENT (STUDNAME,AGE,GENDER,CITY,CONTACT,COM,COURSEID,ROLLNO)
VALUES 
('RAJU_BHAI',23,'MALE','BANGALADESH','9876543290','BC',1,001),
('PRANAV',25,'MALE','KARNATAKA','9800543290','MBC',2,002),
('GOVARDHANI',26,'FEMALE','ANDHRA PRADESH','9876543290','AC',1,003),
('SANDY',21,'MALE','TRIPUR','8906543290','MBC',3,004),
('LINGESH',22,'MALE','CHENNAI','6546543290','ABC',3,005),
('ANGEL',24,'FEMALE','SALEM','9000543290','ABC',3,006),
('SHWETHA',22,'FEMALE','MAHARASHTRA','656543290','BC',2,007),
('RUCHA',29,'FEMALE','UDUPI','996543290','BMC',2,008),
('THARANYA',28,'FEMALE','CHENNAI','0076543290','AC',1,009);


CREATE TABLE COURSE
(
CID INT NOT NULL AUTO_INCREMENT,
COURSENAME VARCHAR(20),
PRIMARY KEY(CID)
);

INSERT INTO COURSE(CID,COURSENAME) 
VALUES
(1,'TESTING_COURSE'),
(2,'MANAGEMENT_COURSE'),
(3,'DEVELOPMENT_COURSE');




CREATE TABLE MARKS
(
 MID INT NOT NULL AUTO_INCREMENT,
 STUDID INT NOT NULL,
 SUB1 INT NOT NULL,
 SUB2 INT NOT NULL,
 SUB3 INT NOT NULL,
 PRIMARY KEY(MID)
);

INSERT INTO MARKS (STUDID,SUB1,SUB2,SUB3)
VALUES
(1,50,60,100),
(2,56,78,59),
(3,67,98,89),
(4,69,67,68),
(5,78,76,74),
(6,78,79,90),
(7,58,86,57),
(8,90,91,95),
(9,89,88,80);


SELECT * FROM STUDENT;
SELECT * FROM COURSE;
SELECT * FROM MARKS;

-- WITHOUT INNER JOIN
SELECT STUDNAME,ROLLNO,COURSEID FROM STUDENT;

-- WITH INNER JOIN
SELECT STUDENT.STUDNAME,STUDENT.ROLLNO ,COURSE.COURSENAME
FROM STUDENT
INNER JOIN COURSE
ON STUDENT.COURSEID=COURSE.CID;

SELECT STUDENT.STUDNAME,STUDENT.ROLLNO,COURSE.COURSENAME,MARKS. SUB1,
MARKS.SUB2,MARKS.SUB3 FROM STUDENT
INNER JOIN COURSE ON STUDENT.COURSEID=COURSE.CID
INNER JOIN MARKS ON STUDENT.ID=MARKS.STUDID;

SELECT STUDENT.STUDNAME,STUDENT.ROLLNO,COURSE.COURSENAME,MARKS.SUB1,
MARKS.SUB2,MARKS.SUB3,
(MARKS.SUB1+MARKS.SUB2+MARKS.SUB3) AS TOTAL,
ROUND((MARKS.SUB1+MARKS.SUB2+MARKS.SUB3)/3 ,0)AS AVERAGE,
CASE
WHEN MARKS.SUB1>=35 AND MARKS.SUB2>=35 AND MARKS.SUB3>=35 THEN 'PASS'
ELSE 'FAIL'
END AS RESULT,
CASE
WHEN MARKS.SUB1>=35 AND MARKS.SUB2>=35 AND MARKS.SUB3>=35 THEN 
CASE
	WHEN ROUND((MARKS.SUB1+MARKS.SUB2+MARKS.SUB3)/3 ,0)>=90
    AND ROUND((MARKS.SUB1+MARKS.SUB2+MARKS.SUB3)/3 ,0)<=100 THEN 'A-GRADE'
    
    WHEN ROUND((MARKS.SUB1+MARKS.SUB2+MARKS.SUB3)/3 ,0)>=80
    AND ROUND((MARKS.SUB1+MARKS.SUB2+MARKS.SUB3)/3 ,0)<=90 THEN 'B-GRADE'
    
    
    WHEN ROUND((MARKS.SUB1+MARKS.SUB2+MARKS.SUB3)/3 ,0)>=70
    AND ROUND((MARKS.SUB1+MARKS.SUB2+MARKS.SUB3)/3 ,0)<=80 THEN 'C-GRADE'
    
    ELSE 'D-GRADE'
END 
ELSE 'NO GRADE'
END AS GRADE 
FROM STUDENT
INNER JOIN COURSE ON STUDENT.COURSEID=COURSE.CID
INNER JOIN MARKS ON STUDENT.ID=MARKS.STUDID;



SELECT STUDENT.STUDNAME,STUDENT.ROLLNO,COURSE.COURSENAME,MARKS.SUB1,
MARKS.SUB2,MARKS.SUB3,
(MARKS.SUB1+MARKS.SUB2+MARKS.SUB3) AS TOTAL,
ROUND((MARKS.SUB1+MARKS.SUB2+MARKS.SUB3)/3 ,0)AS AVERAGE,
CASE
WHEN MARKS.SUB1>=35 AND MARKS.SUB2>=35 AND MARKS.SUB3>=35 THEN 'PASS'
ELSE 'FAIL'
END AS RESULT,
CASE
WHEN MARKS.SUB1>=35 AND MARKS.SUB2>=35 AND MARKS.SUB3>=35 THEN 
CASE
	WHEN ROUND((MARKS.SUB1+MARKS.SUB2+MARKS.SUB3)/3 ,0)>=90
    AND ROUND((MARKS.SUB1+MARKS.SUB2+MARKS.SUB3)/3 ,0)<=100 THEN 'A-GRADE'
    
    WHEN ROUND((MARKS.SUB1+MARKS.SUB2+MARKS.SUB3)/3 ,0)>=80
    AND ROUND((MARKS.SUB1+MARKS.SUB2+MARKS.SUB3)/3 ,0)<=90 THEN 'B-GRADE'
    
    
    WHEN ROUND((MARKS.SUB1+MARKS.SUB2+MARKS.SUB3)/3 ,0)>=70
    AND ROUND((MARKS.SUB1+MARKS.SUB2+MARKS.SUB3)/3 ,0)<=80 THEN 'C-GRADE'
    
    ELSE 'D-GRADE'
END 
ELSE 'NO GRADE'
END AS GRADE 
FROM STUDENT
INNER JOIN COURSE ON STUDENT.COURSEID=COURSE.CID
INNER JOIN MARKS ON STUDENT.ID=MARKS.STUDID
WHERE COURSE.COURSENAME='TESTING_COURSE' HAVING GRADE='D-GRADE';


SELECT STUDENT.STUDNAME,STUDENT.ROLLNO,COURSE.COURSENAME,MARKS.SUB1,
MARKS.SUB2,MARKS.SUB3,
(MARKS.SUB1+MARKS.SUB2+MARKS.SUB3) AS TOTAL,
ROUND((MARKS.SUB1+MARKS.SUB2+MARKS.SUB3)/3 ,0)AS AVERAGE,
CASE
WHEN MARKS.SUB1>=35 AND MARKS.SUB2>=35 AND MARKS.SUB3>=35 THEN 'PASS'
ELSE 'FAIL'
END AS RESULT,
CASE
WHEN MARKS.SUB1>=35 AND MARKS.SUB2>=35 AND MARKS.SUB3>=35 THEN 
CASE
	WHEN ROUND((MARKS.SUB1+MARKS.SUB2+MARKS.SUB3)/3 ,0)>=90
    AND ROUND((MARKS.SUB1+MARKS.SUB2+MARKS.SUB3)/3 ,0)<=100 THEN 'A-GRADE'
    
    WHEN ROUND((MARKS.SUB1+MARKS.SUB2+MARKS.SUB3)/3 ,0)>=80
    AND ROUND((MARKS.SUB1+MARKS.SUB2+MARKS.SUB3)/3 ,0)<=90 THEN 'B-GRADE'
    
    
    WHEN ROUND((MARKS.SUB1+MARKS.SUB2+MARKS.SUB3)/3 ,0)>=70
    AND ROUND((MARKS.SUB1+MARKS.SUB2+MARKS.SUB3)/3 ,0)<=80 THEN 'C-GRADE'
    
    ELSE 'D-GRADE'
END 
ELSE 'NO GRADE'
END AS GRADE 
FROM STUDENT
INNER JOIN COURSE ON STUDENT.COURSEID=COURSE.CID
INNER JOIN MARKS ON STUDENT.ID=MARKS.STUDID
WHERE COURSE.COURSENAME='DEVELOPMENT_COURSE' HAVING GRADE='B-GRADE';


CREATE VIEW REPORT AS 
SELECT STUDENT.STUDNAME,STUDENT.ROLLNO,COURSE.COURSENAME,MARKS.SUB1,
MARKS.SUB2,MARKS.SUB3,
(MARKS.SUB1+MARKS.SUB2+MARKS.SUB3) AS TOTAL,
ROUND((MARKS.SUB1+MARKS.SUB2+MARKS.SUB3)/3 ,0)AS AVERAGE,
CASE
WHEN MARKS.SUB1>=35 AND MARKS.SUB2>=35 AND MARKS.SUB3>=35 THEN 'PASS'
ELSE 'FAIL'
END AS RESULT,
CASE
WHEN MARKS.SUB1>=35 AND MARKS.SUB2>=35 AND MARKS.SUB3>=35 THEN 
CASE
	WHEN ROUND((MARKS.SUB1+MARKS.SUB2+MARKS.SUB3)/3 ,0)>=90
    AND ROUND((MARKS.SUB1+MARKS.SUB2+MARKS.SUB3)/3 ,0)<=100 THEN 'A-GRADE'
    
    WHEN ROUND((MARKS.SUB1+MARKS.SUB2+MARKS.SUB3)/3 ,0)>=80
    AND ROUND((MARKS.SUB1+MARKS.SUB2+MARKS.SUB3)/3 ,0)<=90 THEN 'B-GRADE'
    
    
    WHEN ROUND((MARKS.SUB1+MARKS.SUB2+MARKS.SUB3)/3 ,0)>=70
    AND ROUND((MARKS.SUB1+MARKS.SUB2+MARKS.SUB3)/3 ,0)<=80 THEN 'C-GRADE'
    
    ELSE 'D-GRADE'
END 
ELSE 'NO GRADE'
END AS GRADE 
FROM STUDENT
INNER JOIN COURSE ON STUDENT.COURSEID=COURSE.CID
INNER JOIN MARKS ON STUDENT.ID=MARKS.STUDID;



SHOW TABLES;
SHOW FULL TABLES;
SELECT STUDNAME,COURSENAME,GRADE FROM REPORT WHERE AVERAGE>=70;
DROP VIEW REPORT;


SELECT * FROM STUDENT;
SELECT * FROM COURSE;
SELECT * FROM MARKS;


SELECT STUDENT.STUDNAME,STUDENT.ROLLNO,
MARKS.SUB1,MARKS.SUB2,MARKS.SUB3
FROM STUDENT
INNER JOIN MARKS
ON STUDENT.ID=MARKS.STUDID;


UPDATE MARKS INNER JOIN STUDENT
ON STUDENT.ID=MARKS.STUDID
SET SUB1=100,SUB2=100,SUB3=100
WHERE STUDENT.ROLLNO=6;









