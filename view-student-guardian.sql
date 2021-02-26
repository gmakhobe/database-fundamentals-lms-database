-- This view will show select information about students & their guardian/s

CREATE VIEW vStudentGuardian
AS
	SELECT student_id, student_first_name, student_last_name, guardian_id, guardian_first_name, guardian_last_name, guardian_cellphone FROM student_guardian	--selecting from student_guardian table
	JOIN students USING (student_id) 		--joining the student table
	JOIN guardians USING (guardian_id) 	--joining the student table
	JOIN personal_information USING (user_information_id)
	JOIN user_type USING (user_type_id)
	WHERE user_type = "Student" AND user_type = "Guardian"
GO

SELECT * FROM vStudentGuardian