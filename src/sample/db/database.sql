CREATE DATABASE COURSE_REGISTER;
USE COURSE_REGISTER;

CREATE TABLE COURSE(
 COURSE_ID CHAR(6) NOT NULL,
 COURSE_NAME VARCHAR(100) NOT NULL,
 PRIMARY KEY(COURSE_ID)
 );
 
 CREATE TABLE STUDENT(
  MATRIC_NUMBER CHAR(6) NOT NULL,
  STU_NAME VARCHAR(30) NOT NULL,
  STU_IC_NUM CHAR(5) NOT NULL,
  ACADEMIC_STATUS VARCHAR(8) NOT NULL,
  SEMESTER_REGISTERED CHAR(3) NOT NULL,
  STU_CGPA DECIMAL(3,2) NOT NULL,
  STU_YEAR CHAR(1) NOT NULL,
  STU_SCHOOL VARCHAR(50) NOT NULL,
  STU_CAMPUS VARCHAR(50) NOT NULL,
  STU_PROGRAMME VARCHAR (50) NOT NULL,
  PRIMARY KEY(MATRIC_NUMBER)
  );
  
  CREATE TABLE LECTURER(
   STAFF_ID CHAR(6) NOT NULL,
   LECT_NAME VARCHAR(30) NOT NULL,
   LECT_IC_NUMBER CHAR(5) NOT NULL,
   LECT_STATUS VARCHAR(8) NOT NULL,
   LECT_SCHOOL VARCHAR(50) NOT NULL,
   LECT_POSITION VARCHAR(50) NOT NULL,
   PRIMARY KEY(STAFF_ID)
   );
 

   
CREATE TABLE STUDENT_ACCOUNT(
 STU_EMAIL VARCHAR(319) NOT NULL,
 STU_PASSWORD VARCHAR(100) NOT NULL,
 MATRIC_NUMBER CHAR(6) NOT NULL,
 PRIMARY KEY (STU_EMAIL),
 FOREIGN KEY(MATRIC_NUMBER) 
	REFERENCES STUDENT (MATRIC_NUMBER) ON DELETE CASCADE
 );
 
 CREATE TABLE COURSE_STUDENT_LECT(
  COURSE_ID CHAR(6) NOT NULL,
  MATRIC_NUMBER CHAR(6) NOT NULL,
  STAFF_ID CHAR(6) NOT NULL,
  STUDENT_COURSE_STATUS CHAR(1) NOT NULL,
  PRIMARY KEY(COURSE_ID),
  FOREIGN KEY (STAFF_ID) 
	REFERENCES LECTURER (STAFF_ID) ON DELETE CASCADE
  );

 CREATE TABLE LECTURER_ACCOUNT(
	LECT_EMAIL VARCHAR(319) NOT NULL,
    LECT_PASSWORD VARCHAR(100) NOT NULL,
    STAFF_ID CHAR(6) NOT NULL,
    PRIMARY KEY(LECT_EMAIL),
    FOREIGN KEY (STAFF_ID)
     REFERENCES LECTURER (STAFF_ID) ON DELETE CASCADE
    );


INSERT INTO STUDENT VALUES ( '123456', 'Heng Heng', '52312', 'ACTIVE', '201', 3.77, '1', 'Computer Science', 'Main Campus', 'Computer Science');
INSERT INTO STUDENT VALUES ('654321','Liu Yang', '48792', 'ACTIVE', '202', 3.65, '2', 'Management', 'Main Campus', 'Management');
INSERT INTO STUDENT VALUES ('548921','San Yang', '63145', 'INACTIVE', '201', 3.80, '3', 'Mathematics', 'Main Campus', 'Mathematics');

INSERT INTO COURSE VALUES ('CPT113', 'Programming Methodology and Data Structures');
INSERT INTO COURSE VALUES ('AKW103', 'Introduction to Management');
INSERT INTO COURSE VALUES ('MAT111', 'Lineaer Algebra');

INSERT INTO STUDENT_ACCOUNT VALUES ('heng@gmail.com', 'HAHALOL', '123456');
INSERT INTO STUDENT_ACCOUNT VALUES ('liu@gmail.com', 'Ladf', '654321');
INSERT INTO STUDENT_ACCOUNT VALUES ('san@gmail.com', 'gbsfd', '548921');

INSERT INTO LECTURER VALUES ( 'L1234' , 'Hassan' , '23416', 'ACTIVE', 'Computer Science', 'Senior Lecturer');
INSERT INTO LECTURER VALUES ( 'L5314' , 'Alex' , '28713', 'INACTIVE', 'Management', 'Deputy Dean');
INSERT INTO LECTURER VALUES ( 'L8934' , 'Azam' , '32516', 'ACTIVE', 'Mathematics', 'Assistant Manager');

INSERT INTO LECTURER_ACCOUNT VALUES( 'Hassan@gmail.com', '4573', 'L1234');
INSERT INTO LECTURER_ACCOUNT VALUES ( 'alex@gmail.com', '5631', 'L5314');
INSERT INTO LECTURER_ACCOUNT VALUES ( 'azam@gmail.com' , '8012', 'L8934');

INSERT INTO COURSE_STUDENT_LECT VALUES ( 'CPT113','123456', 'L1234', 'Y');
INSERT INTO COURSE_STUDENT_LECT VALUES ( 'AKW103','654321', 'L5314', 'N');
INSERT INTO COURSE_STUDENT_LECT VALUES ( 'MAT111','548921' ,'L8934', 'N');