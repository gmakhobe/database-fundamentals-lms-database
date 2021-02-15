--- Database and table creation script
BEGIN TRANSECTION;
-- Create database
CRREATE DATABASE learner_management_system;
-- switch to created database
USE learner_management_system;

-- Table to carry types of users (Student, Teacher and Parent)
CREATE TABLE user_type (
	user_type_id INT NULL IDENTITY(1, 1) PRIMARY KEY,
	user_type_name NVARCHAR(100) NOT NULL UNIQUE
);

-- Table to carry user personalm information
CREATE TABLE user_personal_information (
	user_personal_information_id INT NULL IDENTITY(1, 1) PRIMARY KEY,
	fullname NVARCHAR(MAX) NOT NULL,
	phone_number NVARCHA(20) NOT NULL,
	id_number NVARCHAR(13) NOT NULL UNIQUE,
	user_type INT NOT NULL FOREIGN KEY REFERENCES user_type(user_type_id)
);

-- Table to carry teachers infomration
CREATE TABLE teacher (
	teacher_id INT NULL IDENTITY(1, 1) PRIMARY KEY,
	teacher_personal_information_id INT NOT NULL FOREIGN KEY REFERENCES user_personal_information(user_personal_information_id)
);

-- Table to carry grades
CREATE TABLE grade (
	grade_id INT NULL IDENTITY(1, 1) PRIMAY KEY,
	grade_name NVARCHAR(10) NOT NULL UNIQUE
);

-- Table to carry subjects
CREATE TABLE subject (
	subject_id INT NULL IDENTITY(1, 1) PRIMARY KEY,
	subject_name NVARCHAR(60) NOT NULL UNIQUE
);

-- Table to carry streams
CREATE TABLE stream (
	stream_id INT NULL IDENTITY(1, 1) PRIMAY KEY,
	subject_id_1 INT NOT NULL FOREIGN KEY REFERENCES subject(subject_id),
	subject_id_2 INT NOT NULL FOREIGN KEY REFERENCES subject(subject_id),
	subject_id_3 INT NOT NULL FOREIGN KEY REFERENCES subject(subject_id),
	subject_id_4 INT NOT NULL FOREIGN KEY REFERENCES subject(subject_id),
	subject_id_5 INT NOT NULL FOREIGN KEY REFERENCES subject(subject_id),
	teacher_id INT NOT NULL FOREIGN KEY REFERENCES teacher(teacher_id),
	grade_id INT NOT NULL FOREIGN KEY REFERENCES grade(grade_id)
);

-- Table to carry student account status
CREATE TABLE account_status (
	account_status_id INT NULL INDENTITY(1, 1) PRIMARY KEY,
	status_type NVARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE student (
	student_id INT NULL IDENTITY(1, 1) PRIMARY KEY,
	student_informatio_id INT NOT NULL FOREIGN KEY REFERENCES user_personal_information(user_personal_id),
	stream_id INT NOT NULL FOREIGN KEY REFERENCES stream(stream_id),
	status_id INT NOT NULL FOREIGN KEY REFERENCES account_status(account_status_id)
);

-- Tables to carry Guardian information |Not Done|
CREATE TABLE guardian (
        guardian_id INT NULL IDENTITY(1, 1) PRIMARY KEY,
        guardian_personal_information_id INT NOT NULL FOREIGN KEY REFERENCES user_personal_information(user_personal_id)
);

ROLLBACK TRANSECTION;
-- COMMIT TRANSECTION;
