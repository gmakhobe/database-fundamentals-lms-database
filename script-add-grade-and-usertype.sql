--
--	 The following script is to add record to use_type, grade and subject table
--
USE Master;
GO

BEGIN TRANSACTION;

	-- Add user_type records
	INSERT INTO user_type (user_type_id, user_type_name)
	VALUES 
	(NULL, "Student"),
	(NULL, "Parent"),
	(NULL, "Teacher");

	-- Add subject records
	INSERT INTO grade (grade_id, grade_name)
	VALUES
	(NULL, "Grade 10"),
	(NULL, "Grade 11"),
	(NULL, "Grade 12");
		

ROLLBACK TRANSACTION;
-- COMMIT TRANSACTION
