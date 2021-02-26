-- This script will create a user_type table & add user_type records to the table

USE Master;
GO

BEGIN TRANSACTION;

	-- Creating user_type table
	CREATE TABLE user_type (
	user_type_id INT IDENTITY(1, 1) PRIMARY KEY,
	user_type_name NVARCHAR(100) NOT NULL UNIQUE );

	-- Adding user_type records user_type table
	INSERT INTO user_type (user_type_id, user_type_name)
	VALUES 
		("Student"),
		("Guardian"),
		("Teacher");
	
ROLLBACK TRANSACTION;

-- COMMIT TRANSACTION