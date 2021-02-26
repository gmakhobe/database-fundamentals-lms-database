DROP VIEW IF EXISTS student_view;
GO

CREATE VIEW student_view  AS
    SELECT [dbo].[students].student_id, [dbo].[personal_information].firstname, 
	[dbo].[personal_information].lastname,[dbo].[streams].subject_id_1,
	[dbo].[streams].subject_id_2, [dbo].[streams].subject_id_3, [dbo].[streams].subject_id_4,
	[dbo].[streams].subject_id_5, [dbo].[teachers].teacher_id 
	,[dbo].[grades].grade, [dbo].[student_status].student_status_id, [dbo].[student_status].registered_date, [dbo].[student_status].status
	FROM
	[dbo].[students], [dbo].[personal_information], [dbo].[streams], [dbo].[teachers], [dbo].[grades], [dbo].[student_status]
GO

SELECT * FROM student_view
GO


DROP VIEW IF EXISTS teacher_view;
GO

CREATE VIEW teacher_view  AS
    SELECT [dbo].[teachers].teacher_id, [dbo].[subjects].subject , [dbo].[grades].grade
	FROM
	[dbo].[teachers], [dbo].[subjects],[dbo].[grades]
GO

SELECT * FROM teacher_view
GO
