DROP VIEW IF EXISTS student_view;
GO

CREATE VIEW student_view  AS
    SELECT [dbo].[Student].StudentID, [dbo].[PersonalInfo].FirstName, 
	[dbo].[PersonalInfo].LastName,[dbo].[Stream].SubjectID, [dbo].[Teacher].TeacherID
	,[dbo].[Grade].GradeName, [dbo].[Status].StatusName
	FROM
	[dbo].[Student], [dbo].[PersonalInfo], [dbo].[Stream], [dbo].[Teacher], [dbo].[Grade], [dbo].[Status]
GO

SELECT * FROM student_view
GO

CREATE VIEW teacher_view  AS
    SELECT [dbo].[Teacher].TeacherID, [dbo].[Subject].SubjectName, 
	[dbo].[Grade].GradeName
	FROM
	[dbo].[Teacher], [dbo].[Subject],[dbo].[Grade]
GO

SELECT * FROM teacher_view
GO
