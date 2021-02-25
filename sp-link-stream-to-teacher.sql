--	This stored proc will link teacher with a stream and a grade
CREATE PROCEDURE spLinkStreamToTeacher
	@teacher_name NVARCHAR(MAX),
	@subject_1 NVARCHAR(MAX),
	@subject_2 NVARCHAR(MAX),
	@subject_3 NVARCHAR(MAX),
	@subject_4 NVARCHAR(MAX),
	@subject_5 NVARCHAAR(MAX),
AS
	-- Variables
	DECLARE @subject_exist INT;
	-- Assign Variables
	SET @subject_exist = 0;
	-- Check if subject_1 has a record
	SET @subject_exist = ();


GO
