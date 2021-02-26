-- This script will create grades table & add grade records to the table

USE Master;
GO

BEGIN TRANSACTION;
	--Creating grades table
	CREATE TABLE grades (
	grade_id INT IDENTITY(1, 1) PRIMARY KEY,
	grade_name NVARCHAR(10) NOT NULL UNIQUE );

	-- Adding grade records
	INSERT INTO grades (grade_id, grade_name)
	VALUES 
		("Grade 10"),
		("Grade 11"),
		("Grade 12");
	
ROLLBACK TRANSACTION;

-- COMMIT TRANSACTION