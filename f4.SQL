/*
Created: 02.12.2018
Modified: 24.12.2018
Model: Phisycal model
Database: PostgreSQL 10
*/


-- Create tables section -------------------------------------------------

-- Table faculty

CREATE TABLE faculty(
 id Serial NOT NULL,
 title Character varying(60) NOT NULL
)
;

-- Add keys for table faculty

ALTER TABLE faculty ADD CONSTRAINT pk_faculty PRIMARY KEY (id)
;

-- Table department

CREATE TABLE department(
 id Serial NOT NULL,
 title Character varying(60) NOT NULL,
 id_faculty Integer NOT NULL
)
;

-- Create indexes for table department

CREATE INDEX IX_Relationship3 ON department (id_faculty)
;

-- Add keys for table department

ALTER TABLE department ADD CONSTRAINT pk_department PRIMARY KEY (id)
;

-- Table teacher

CREATE TABLE teacher(
 id Serial NOT NULL,
 surname Character varying(30) NOT NULL,
 name Character varying(30) NOT NULL,
 midname Character varying(30),
 id_department Integer NOT NULL,
 login Character varying(16) NOT NULL,
 pass Character varying(16) NOT NULL
)
;

-- Create indexes for table teacher

CREATE INDEX IX_Relationship4 ON teacher (id_department)
;

-- Add keys for table teacher

ALTER TABLE teacher ADD CONSTRAINT pk_teacher PRIMARY KEY (id)
;

-- Table direction

CREATE TABLE direction(
 id Serial NOT NULL,
 title Character varying(60) NOT NULL,
 id_faculty Integer NOT NULL
)
;

-- Create indexes for table direction

CREATE INDEX IX_Relationship5 ON direction (id_faculty)
;

-- Add keys for table direction

ALTER TABLE direction ADD CONSTRAINT pk_direction PRIMARY KEY (id)
;

-- Table groupp

CREATE TABLE groupp(
 id Serial NOT NULL,
 number Integer NOT NULL,
 id_direction Integer NOT NULL
)
;

-- Create indexes for table groupp

CREATE INDEX IX_Relationship6 ON groupp (id_direction)
;

-- Add keys for table groupp

ALTER TABLE groupp ADD CONSTRAINT pk_groupp PRIMARY KEY (id)
;

-- Table student

CREATE TABLE student(
 id Serial NOT NULL,
 surname Character varying(30) NOT NULL,
 name Character varying(30) NOT NULL,
 midname Character varying(30),
 id_group Integer NOT NULL,
 login Character varying(16) NOT NULL,
 pass Character varying(16) NOT NULL
)
;

-- Create indexes for table student

CREATE INDEX IX_Relationship7 ON student (id_group)
;

-- Add keys for table student

ALTER TABLE student ADD CONSTRAINT pk_student PRIMARY KEY (id)
;

-- Table erecord

CREATE TABLE erecord(
 id Serial NOT NULL,
 isCompleted Boolean NOT NULL,
 date Date NOT NULL,
 id_subject Integer NOT NULL,
 id_group Integer NOT NULL,
 id_teacher Integer NOT NULL,
 id_worker Integer NOT NULL
)
;

-- Create indexes for table erecord

CREATE INDEX IX_Relationship8 ON erecord (id_subject)
;

CREATE INDEX IX_Relationship9 ON erecord (id_group)
;

CREATE INDEX IX_Relationship10 ON erecord (id_teacher)
;

CREATE INDEX IX_Relationship11 ON erecord (id_worker)
;

-- Add keys for table erecord

ALTER TABLE erecord ADD CONSTRAINT pk_erecord PRIMARY KEY (id)
;

-- Table subject

CREATE TABLE subject(
 id Serial NOT NULL,
 title Character varying(30),
 id_semestr Integer NOT NULL
)
;

-- Create indexes for table subject

CREATE INDEX IX_Relationship29 ON subject (id_semestr)
;

-- Add keys for table subject

ALTER TABLE subject ADD CONSTRAINT pk_subject PRIMARY KEY (id)
;

-- Table worker

CREATE TABLE worker(
 id Serial NOT NULL,
 surname Character varying(30) NOT NULL,
 name Character varying(30) NOT NULL,
 midname Character varying(30),
 id_faculty Integer NOT NULL,
 id_post Integer NOT NULL,
 login Character varying(16) NOT NULL,
 pass Character varying(16) NOT NULL
)
;

-- Create indexes for table worker

CREATE INDEX IX_Relationship12 ON worker (id_faculty)
;

CREATE INDEX IX_Relationship13 ON worker (id_post)
;

-- Add keys for table worker

ALTER TABLE worker ADD CONSTRAINT pk_worker PRIMARY KEY (id)
;

-- Table post

CREATE TABLE post(
 id Serial NOT NULL,
 title Character varying(30)
)
;

-- Add keys for table post

ALTER TABLE post ADD CONSTRAINT pk_post PRIMARY KEY (id)
;

-- Table ierecord

CREATE TABLE ierecord(
 id Serial NOT NULL,
 srating Integer,
 erating Integer,
 trating Integer,
 id_erecord Integer NOT NULL,
 id_student Integer NOT NULL
)
;

-- Create indexes for table ierecord

CREATE INDEX IX_Relationship15 ON ierecord (id_student)
;

-- Add keys for table ierecord

ALTER TABLE ierecord ADD CONSTRAINT pk_ierecord PRIMARY KEY (id,id_erecord)
;

-- Table crecord

CREATE TABLE crecord(
 id Serial NOT NULL,
 date Date,
 id_group Integer NOT NULL,
 id_worker Integer NOT NULL,
 id_semestr Integer
)
;

-- Create indexes for table crecord

CREATE INDEX IX_Relationship16 ON crecord (id_group)
;

CREATE INDEX IX_Relationship17 ON crecord (id_worker)
;

CREATE INDEX IX_Relationship30 ON crecord (id_semestr)
;

-- Add keys for table crecord

ALTER TABLE crecord ADD CONSTRAINT pk_crecord PRIMARY KEY (id)
;

-- Table icrecord

CREATE TABLE icrecord(
 id Serial NOT NULL,
 id_crecord Integer NOT NULL,
 id_student Integer NOT NULL
)
;

-- Create indexes for table icrecord

CREATE INDEX IX_Relationship19 ON icrecord (id_student)
;

-- Add keys for table icrecord

ALTER TABLE icrecord ADD CONSTRAINT pk_icrecord PRIMARY KEY (id,id_crecord)
;

-- Table srating

CREATE TABLE srating(
 id Serial NOT NULL,
 rating Integer,
 id_subject Integer NOT NULL,
 id_icrecord Integer NOT NULL,
 id_crecord Integer NOT NULL
)
;

-- Create indexes for table srating

CREATE INDEX IX_Relationship20 ON srating (id_subject)
;

CREATE INDEX IX_Relationship21 ON srating (id_icrecord,id_crecord)
;

-- Add keys for table srating

ALTER TABLE srating ADD CONSTRAINT pk_srating PRIMARY KEY (id)
;

-- Table tolerance

CREATE TABLE tolerance(
 id Serial NOT NULL,
 date Date,
 erating Integer,
 id_teacher Integer NOT NULL,
 id_student Integer NOT NULL,
 id_subject Integer NOT NULL
)
;

-- Create indexes for table tolerance

CREATE INDEX IX_Relationship22 ON tolerance (id_teacher)
;

CREATE INDEX IX_Relationship23 ON tolerance (id_student)
;

CREATE INDEX IX_Relationship24 ON tolerance (id_subject)
;

-- Add keys for table tolerance

ALTER TABLE tolerance ADD CONSTRAINT pk_tolerance PRIMARY KEY (id)
;

-- Table schedule

CREATE TABLE schedule(
 id Serial NOT NULL,
 id_group Integer NOT NULL
)
;

-- Create indexes for table schedule

CREATE INDEX IX_Relationship25 ON schedule (id_group)
;

-- Add keys for table schedule

ALTER TABLE schedule ADD CONSTRAINT pk_schedule PRIMARY KEY (id)
;

-- Table ischedule

CREATE TABLE ischedule(
 id Serial NOT NULL,
 room Integer,
 date Date,
 id_schedule Integer NOT NULL,
 id_subject Integer NOT NULL,
 id_teacher Integer NOT NULL
)
;

-- Create indexes for table ischedule

CREATE INDEX IX_Relationship27 ON ischedule (id_subject)
;

CREATE INDEX IX_Relationship28 ON ischedule (id_teacher)
;

-- Add keys for table ischedule

ALTER TABLE ischedule ADD CONSTRAINT pk_ischedule PRIMARY KEY (id,id_schedule)
;

-- Table semestr

CREATE TABLE semestr(
 id Serial NOT NULL,
 number Integer NOT NULL
)
;

-- Add keys for table semestr

ALTER TABLE semestr ADD CONSTRAINT Key1 PRIMARY KEY (id)
;
-- Create foreign keys (relationships) section ------------------------------------------------- 

ALTER TABLE department ADD CONSTRAINT Relationship3 FOREIGN KEY (id_faculty) REFERENCES faculty (id) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE teacher ADD CONSTRAINT Relationship4 FOREIGN KEY (id_department) REFERENCES department (id) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE direction ADD CONSTRAINT Relationship5 FOREIGN KEY (id_faculty) REFERENCES faculty (id) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE groupp ADD CONSTRAINT Relationship6 FOREIGN KEY (id_direction) REFERENCES direction (id) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE student ADD CONSTRAINT Relationship7 FOREIGN KEY (id_group) REFERENCES groupp (id) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE erecord ADD CONSTRAINT Relationship8 FOREIGN KEY (id_subject) REFERENCES subject (id) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE erecord ADD CONSTRAINT Relationship9 FOREIGN KEY (id_group) REFERENCES groupp (id) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE erecord ADD CONSTRAINT Relationship10 FOREIGN KEY (id_teacher) REFERENCES teacher (id) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE erecord ADD CONSTRAINT Relationship11 FOREIGN KEY (id_worker) REFERENCES worker (id) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE worker ADD CONSTRAINT Relationship12 FOREIGN KEY (id_faculty) REFERENCES faculty (id) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE worker ADD CONSTRAINT Relationship13 FOREIGN KEY (id_post) REFERENCES post (id) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE ierecord ADD CONSTRAINT Relationship14 FOREIGN KEY (id_erecord) REFERENCES erecord (id) ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE ierecord ADD CONSTRAINT Relationship15 FOREIGN KEY (id_student) REFERENCES student (id) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE crecord ADD CONSTRAINT Relationship16 FOREIGN KEY (id_group) REFERENCES groupp (id) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE crecord ADD CONSTRAINT Relationship17 FOREIGN KEY (id_worker) REFERENCES worker (id) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE icrecord ADD CONSTRAINT Relationship18 FOREIGN KEY (id_crecord) REFERENCES crecord (id) ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE icrecord ADD CONSTRAINT Relationship19 FOREIGN KEY (id_student) REFERENCES student (id) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE srating ADD CONSTRAINT Relationship20 FOREIGN KEY (id_subject) REFERENCES subject (id) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE srating ADD CONSTRAINT Relationship21 FOREIGN KEY (id_icrecord, id_crecord) REFERENCES icrecord (id, id_crecord) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE tolerance ADD CONSTRAINT Relationship22 FOREIGN KEY (id_teacher) REFERENCES teacher (id) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE tolerance ADD CONSTRAINT Relationship23 FOREIGN KEY (id_student) REFERENCES student (id) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE tolerance ADD CONSTRAINT Relationship24 FOREIGN KEY (id_subject) REFERENCES subject (id) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE schedule ADD CONSTRAINT Relationship25 FOREIGN KEY (id_group) REFERENCES groupp (id) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE ischedule ADD CONSTRAINT Relationship26 FOREIGN KEY (id_schedule) REFERENCES schedule (id) ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE ischedule ADD CONSTRAINT Relationship27 FOREIGN KEY (id_subject) REFERENCES subject (id) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE ischedule ADD CONSTRAINT Relationship28 FOREIGN KEY (id_teacher) REFERENCES teacher (id) ON DELETE RESTRICT ON UPDATE CASCADE
;

ALTER TABLE subject ADD CONSTRAINT Relationship29 FOREIGN KEY (id_semestr) REFERENCES semestr (id)  ON DELETE RESTRICT ON UPDATE CASCADE
;
                                                                                                    
ALTER TABLE crecord ADD CONSTRAINT Relationship30 FOREIGN KEY (id_semestr) REFERENCES semestr (id)  ON DELETE RESTRICT ON UPDATE CASCADE
;




