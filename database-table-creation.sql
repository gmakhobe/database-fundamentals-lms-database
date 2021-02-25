USE Master
GO

-- Create database
CREATE DATABASE learner_management_system;

--- Database and table creation script
BEGIN TRANSACTION
GO

--DROP DATABASE learner_management_system;
-- switch to created database
USE learner_management_system;
GO

-- Table to carry types of users (Student, Teacher and Parent)
CREATE TABLE user_type (
	user_type_id INT IDENTITY(1, 1) PRIMARY KEY,
	user_type_name NVARCHAR(100) NOT NULL UNIQUE
);

-- Table to carry user personalm information
CREATE TABLE personal_information (
	personal_information_id INT IDENTITY(1, 1) PRIMARY KEY,
	firstname NVARCHAR(MAX) NOT NULL,
	lastname NVARCHAR(MAX) NOT NULL,
	phone_number NVARCHAR(MAX) NOT NULL,
	id_number NVARCHAR(MAX) NOT NULL,
	user_type_id INT NOT NULL FOREIGN KEY REFERENCES user_type(user_type_id),
	created_date DATETIME NOT NULL
);

-- Table to carry teachers infomration
CREATE TABLE teachers (
	teacher_id INT IDENTITY(1, 1) PRIMARY KEY,
	personal_information_id INT NOT NULL FOREIGN KEY REFERENCES personal_information(personal_information_id)
);

-- Table to carry guardian information
CREATE TABLE guardians (
	guardian_id INT IDENTITY(1, 1) PRIMARY KEY,
	personal_information INT FOREIGN KEY REFERENCES personal_information(personal_information_id)
);

-- Table to carry grades
CREATE TABLE grades (
	grade_id INT IDENTITY(1, 1) PRIMARY KEY,
	grade NVARCHAR(10) NOT NULL UNIQUE
);

-- Table to carry subjects
CREATE TABLE subjects (
	subject_id INT IDENTITY(1, 1) PRIMARY KEY,
	subject NVARCHAR(60) NOT NULL UNIQUE,
	teacher_id INT FOREIGN KEY REFERENCES teachers(teacher_id)
);

-- Table to carry streams
CREATE TABLE streams (
	stream_id INT IDENTITY(1, 1) PRIMARY KEY,
	subject_id_1 INT NOT NULL FOREIGN KEY REFERENCES subjects(subject_id),
	subject_id_2 INT NOT NULL FOREIGN KEY REFERENCES subjects(subject_id),
	subject_id_3 INT NOT NULL FOREIGN KEY REFERENCES subjects(subject_id),
	subject_id_4 INT NOT NULL FOREIGN KEY REFERENCES subjects(subject_id),
	subject_id_5 INT NOT NULL FOREIGN KEY REFERENCES subjects(subject_id),
	grade_id INT NOT NULL FOREIGN KEY REFERENCES grades(grade_id)
);

-- Table to carry student account status
CREATE TABLE student_status (
	student_status_id INT IDENTITY(1, 1) PRIMARY KEY,
	status NVARCHAR(100) NOT NULL UNIQUE,
	registered_date DATETIME
);

CREATE TABLE students (
	student_id INT IDENTITY(1, 1) PRIMARY KEY,
	personal_information INT NOT NULL FOREIGN KEY REFERENCES personal_information(personal_information_id),
	stream_id INT NOT NULL FOREIGN KEY REFERENCES streams(stream_id),
	student_status_id INT NOT NULL FOREIGN KEY REFERENCES student_status(student_status_id)
);

-- Table to carry relationship between parents and students
CREATE TABLE student_guardian (
	student_guardian_id INT IDENTITY(1, 1) PRIMARY KEY,
	guardian_id INT FOREIGN KEY REFERENCES guardians(guardian_id),
	student_id INT FOREIGN KEY REFERENCES students(student_id)
);

ROLLBACK TRANSACTION;
-- COMMIT TRANSECTION;