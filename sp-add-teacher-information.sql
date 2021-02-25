--	This Stored Proc is for adding teacher information into
--	teacher table, user_personal_information table and usertype
CREATE PROCEDURE addTeacherInfomation
	@full_name NVARCHAR(MAX),
	@phone_numbe NVARCHAR(MAX),
	@id_number NVARCHAR(MAX)
AS
	-- Settings
	SET NOCOUNT NO;
	-- Variables
	DECLARE @user_personal_information INT, @user_type INT;
	-- Assign Variables
	SET @user_type = 3;
	-- Add record to user_personal_information_table
	INSERT INTO user_personal_informatio (user_personal_information_id, fullname, phone_number, id_number, user_type)
	VALUES
	(NULL, @full_name, @phone_number, @id_number, @user_type);
	-- Get pk which will be fk in a dif table
	SET @user_personal_inforamtion = (SELECT user_personal_information_id FROM user_personal_information WHERE id_number = @id_number);
	-- Add recod to teache table
	INSERT INTO teacher(teacher_id, teacher_personal_information)
	VALUES
	(NULL, @user_personal_information);
	-- Show a table when responding
	SELECT user_personal_information_id FROM user_personal_information WHERE id_number = @id_number;

GO
