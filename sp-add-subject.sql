-- This stored procedue to add a subject to subject table

CREATE PROCEDURE SP_addSubject
	@subject_name NVARCHAR(MAX)
AS
	-- Set row count to 0 or available riw count
	DECLARE @row_count = (SELECT FROM subject WHERE subject_name = @subject_name);

	IF (@row_count >= 1)
		RETURN 1;
	ELSE
		INSERT INTO subject(subject_id, subject_name)
		VALUES
		(NULL, @subject_name);
		RETURN 0;	
GO
