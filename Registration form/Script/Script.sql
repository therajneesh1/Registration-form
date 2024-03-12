USE [master]
GO
/****** Object:  Database [ITIExaminationSystem]    Script Date: 2024-01-14 1:26:57 PM ******/
CREATE DATABASE [ITIExaminationSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ITIExaminationSystem_Primary', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ITIExaminationSystem.mdf' , SIZE = 13312KB , MAXSIZE = 20480KB , FILEGROWTH = 5120KB ), 
 FILEGROUP [ITIExaminationSystem_FG] 
( NAME = N'ITIExaminationSystem_FG1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ITIExaminationSystem_FG1.ndf' , SIZE = 1024KB , MAXSIZE = 10240KB , FILEGROWTH = 1024KB ),
( NAME = N'ITIExaminationSystem_FG2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ITIExaminationSystem_FG2.ndf' , SIZE = 1024KB , MAXSIZE = 10240KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ITIExaminationSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ITIExaminationSystem_log.ldf' , SIZE = 4096KB , MAXSIZE = 10240KB , FILEGROWTH = 100%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ITIExaminationSystem] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ITIExaminationSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ITIExaminationSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ITIExaminationSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ITIExaminationSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ITIExaminationSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ITIExaminationSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [ITIExaminationSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ITIExaminationSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ITIExaminationSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ITIExaminationSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ITIExaminationSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ITIExaminationSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ITIExaminationSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ITIExaminationSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ITIExaminationSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ITIExaminationSystem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ITIExaminationSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ITIExaminationSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ITIExaminationSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ITIExaminationSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ITIExaminationSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ITIExaminationSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ITIExaminationSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ITIExaminationSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [ITIExaminationSystem] SET  MULTI_USER 
GO
ALTER DATABASE [ITIExaminationSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ITIExaminationSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ITIExaminationSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ITIExaminationSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ITIExaminationSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ITIExaminationSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ITIExaminationSystem', N'ON'
GO
ALTER DATABASE [ITIExaminationSystem] SET QUERY_STORE = ON
GO
ALTER DATABASE [ITIExaminationSystem] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ITIExaminationSystem]
GO
/****** Object:  User [student]    Script Date: 2024-01-14 1:26:57 PM ******/
CREATE USER [student] FOR LOGIN [student] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [manager]    Script Date: 2024-01-14 1:26:57 PM ******/
CREATE USER [manager] FOR LOGIN [manager] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [itiadmin]    Script Date: 2024-01-14 1:26:57 PM ******/
CREATE USER [itiadmin] FOR LOGIN [itiadmin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [instructor]    Script Date: 2024-01-14 1:26:57 PM ******/
CREATE USER [instructor] FOR LOGIN [instructor] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[ID] [int] NOT NULL,
	[NumberOfQuestions] [int] NOT NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[TotalTime]  AS (datediff(minute,[StartTime],[EndTime])),
	[TotalDegree] [int] NULL,
	[Corrective] [bit] NOT NULL,
	[Normal] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[Questions_ID] [int] NOT NULL,
	[Text_Questions] [nvarchar](max) NULL,
	[Correct_Answer_Text_Questions] [nvarchar](max) NULL,
	[True_or_False_Questions] [nvarchar](max) NULL,
	[Correct_Answer_True_or_False] [bit] NULL,
	[Choose_An_Answer_Question] [nvarchar](max) NULL,
	[Correct_Answer_Choose_Question] [nvarchar](1) NULL,
	[Course_Id] [int] NULL,
 CONSTRAINT [Question_PK] PRIMARY KEY CLUSTERED 
(
	[Questions_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentExamQuestions]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentExamQuestions](
	[Std_ID] [int] NOT NULL,
	[Exam_ID] [int] NOT NULL,
	[Questions_result] [int] NULL,
	[Std_Answer_Text_Question] [nvarchar](max) NOT NULL,
	[Std_Answer_Choose_Question] [nvarchar](1) NOT NULL,
	[Std_Answer_True_or_False] [nvarchar](5) NOT NULL,
	[Questions_Id] [int] NOT NULL,
 CONSTRAINT [StudentExam_PK] PRIMARY KEY CLUSTERED 
(
	[Std_ID] ASC,
	[Exam_ID] ASC,
	[Questions_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamQuestion]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamQuestion](
	[Exam_ID] [int] NOT NULL,
	[Question_ID] [int] NOT NULL,
	[QuestionType] [char](4) NULL,
	[QuestionGrade] [int] NULL,
 CONSTRAINT [ExamQuestion_PK] PRIMARY KEY CLUSTERED 
(
	[Exam_ID] ASC,
	[Question_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ExamResultsView]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------(1) Show Exam Results --------------------------
CREATE   VIEW [dbo].[ExamResultsView]
AS
SELECT 
    se.Std_ID,
    se.Exam_ID,
    se.Questions_result,
    se.Std_Answer_Text_Question,
    se.Std_Answer_Choose_Question,
    se.Std_Answer_True_or_False,
    se.Questions_Id,
    eq.QuestionType,
    eq.QuestionGrade,
    q.Correct_Answer_Text_Questions,
    q.Correct_Answer_Choose_Question,
    q.Correct_Answer_True_or_False,
    e.TotalDegree
FROM StudentExamQuestions se
INNER JOIN ExamQuestion eq ON se.Exam_ID = eq.Exam_ID AND se.Questions_Id = eq.Question_ID
INNER JOIN Question q ON se.Questions_Id = q.Questions_ID
INNER JOIN Exam e ON se.Exam_ID = e.ID;
GO
/****** Object:  Table [dbo].[Student]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[ID] [int] NOT NULL,
	[FName] [nvarchar](15) NOT NULL,
	[LName] [nvarchar](15) NOT NULL,
	[GraduationYear] [char](4) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[MinDegree] [int] NOT NULL,
	[MaxDegree] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Intake]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Intake](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Track]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Track](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentCourse]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentCourse](
	[Std_ID] [int] NOT NULL,
	[Course_ID] [int] NOT NULL,
 CONSTRAINT [StudentCourses_PK] PRIMARY KEY CLUSTERED 
(
	[Std_ID] ASC,
	[Course_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentRegisteration]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentRegisteration](
	[Std_ID] [int] NOT NULL,
	[Intake_ID] [int] NOT NULL,
	[Track_ID] [int] NOT NULL,
	[Branch_ID] [int] NOT NULL,
 CONSTRAINT [Student_registeration_PK] PRIMARY KEY CLUSTERED 
(
	[Std_ID] ASC,
	[Intake_ID] ASC,
	[Track_ID] ASC,
	[Branch_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[GetStudentDetails_fn]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   function [dbo].[GetStudentDetails_fn] ()
returns table
as 
return
(
select S.FName+' '+S.LName as'	FullName',C.Name as'CourseName',T.Name as'TrackName',B.Name as'BranchName',I.Name'IntakeName'



from Student S,StudentRegisteration R,Track T,Branch B,Intake I ,Course C,StudentCourse SC
where S.ID=R.Std_ID AND T.ID=R.Track_ID AND B.ID=R.Branch_ID AND I.ID=R.Intake_ID
AND C.ID=SC.Course_ID
)
GO
/****** Object:  View [dbo].[GetStudentDetails_view]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[GetStudentDetails_view] AS
SELECT S.FName + ' ' + S.LName AS 'Student Name',
       C.Name AS 'Course Name',
       T.Name AS 'Track Name',
       B.Name AS 'Branch Name',
       I.Name AS 'Intake Name'
FROM Student S
INNER JOIN StudentRegisteration R ON S.ID = R.Std_ID
INNER JOIN Track T ON T.ID = R.Track_ID
INNER JOIN Branch B ON B.ID = R.Branch_ID
INNER JOIN Intake I ON I.ID = R.Intake_ID
INNER JOIN Course C ON C.ID = (SELECT Course_ID FROM StudentCourse SC WHERE S.ID = SC.Std_ID)
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FName] [nvarchar](15) NOT NULL,
	[LName] [nvarchar](15) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InstructorCourse]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InstructorCourse](
	[Instructor_ID] [int] NOT NULL,
	[Course_ID] [int] NOT NULL,
 CONSTRAINT [Instructor_Courses_PK] PRIMARY KEY CLUSTERED 
(
	[Instructor_ID] ASC,
	[Course_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InstructorBelong]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InstructorBelong](
	[Ins_ID] [int] NOT NULL,
	[Intake_ID] [int] NOT NULL,
	[Track_ID] [int] NOT NULL,
	[Branch_ID] [int] NOT NULL,
 CONSTRAINT [Instractor_Belong_PK] PRIMARY KEY CLUSTERED 
(
	[Ins_ID] ASC,
	[Intake_ID] ASC,
	[Track_ID] ASC,
	[Branch_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[GetInsractorDetails_view]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[GetInsractorDetails_view] 

as 

(
select INS.FName+' '+INS.LName as'Insructor Name',C.Name as'course Name',T.Name as'Track Name',B.Name as'Branch Name',I.Name AS'Intake Name'
from Instructor INS,Course C ,InstructorCourse IC,InstructorBelong IB,Track T,Branch B,Intake I
WHERE INS.ID=IC.Instructor_ID AND C.ID=IC.Course_ID 
AND IB.Ins_ID=INS.ID
AND IB.Branch_ID=B.ID AND IB.Intake_ID=I.ID AND IB.Track_ID=T.ID

)
GO
/****** Object:  View [dbo].[show_Exam_view]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------(11)Show All Exams---------------------
create   view [dbo].[show_Exam_view]
as
select NumberOfQuestions,StartTime,EndTime,TotalTime,Corrective,Normal
from Exam 


GO
/****** Object:  View [dbo].[show_Question_view]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------(12)Show All Question---------------------
create   view [dbo].[show_Question_view]
as
select Text_Questions,Correct_Answer_Text_Questions,True_or_False_Questions,Correct_Answer_True_or_False,Choose_An_Answer_Question,Correct_Answer_Choose_Question
from Question

GO
/****** Object:  View [dbo].[show_instrucrors_courseS_view]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------(1) show instructors courses --------------------------
create   view [dbo].[show_instrucrors_courseS_view]  
as
(
select I.FName'Instructor Name', C.Name 'Corse Name'  ,C.[description]
from instructor I,instructorcourse IC ,course C
where  I.ID=IC.instructor_ID AND C.ID=IC.Course_ID
)
GO
/****** Object:  Table [dbo].[TrainingManager]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainingManager](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FName] [nvarchar](15) NOT NULL,
	[LName] [nvarchar](15) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrainngManagerManage]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainngManagerManage](
	[Trainng_mannger_ID] [int] NOT NULL,
	[Intake_ID] [int] NOT NULL,
	[Track_ID] [int] NOT NULL,
	[Branch_ID] [int] NOT NULL,
 CONSTRAINT [Trainng_mannger_mange_PK] PRIMARY KEY CLUSTERED 
(
	[Trainng_mannger_ID] ASC,
	[Intake_ID] ASC,
	[Track_ID] ASC,
	[Branch_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[show_TrainingManagerInfo_view]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------(2) show Manager Info --------------------------

create   view [dbo].[show_TrainingManagerInfo_view] 
as 
(
select TR.FName+' '+TR.LName as' Training Manager Name',B.Name as'Branch Name',I.Name AS'Intake Name'
from TrainingManager TR,Branch B,Intake I ,TrainngManagerManage TM
WHERE   TM.Trainng_mannger_ID=TR.ID AND TM.Branch_ID=B.ID AND TM.Intake_ID=I.ID 
)
GO
/****** Object:  View [dbo].[show_Student_view]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------(3) show Student Info --------------------------
create   view [dbo].[show_Student_view]
as
select FName+' '+LName as'	Student Name',GraduationYear,Email
from Student
GO
/****** Object:  View [dbo].[show_Istructor_view]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------(4) show Instructor Info --------------------------
create   view [dbo].[show_Istructor_view]
as
select  FName+' '+LName as'	Instructor Name',Email
from Instructor
GO
/****** Object:  View [dbo].[show_Cources_view]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------(5) show All Courses  --------------------------
create   view [dbo].[show_Cources_view]
as
select Name, MinDegree,MaxDegree,Description
from Course
GO
/****** Object:  View [dbo].[show_TrainingManager_view]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------(6) show All Training Managers with Email  --------------------------
create   view [dbo].[show_TrainingManager_view]
as
select  FName+' '+LName as'	TrainingManager Name',Email
from TrainingManager
GO
/****** Object:  View [dbo].[track_branch_intack_view]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------(2) Show track branch intake  --------------------------
create   view [dbo].[track_branch_intack_view]
as
(
select T.Name as'Track Name',B.Name as'Branch Name',I.Name AS'Intake Name'
from Track T,Branch B,Intake I,StudentRegisteration R
WHERE R.Branch_ID=B.ID AND R.Intake_ID=I.ID AND R.Track_ID=T.ID
)
GO
/****** Object:  View [dbo].[show_Branch_view]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------(3) Show All Branches  --------------------------
create   view [dbo].[show_Branch_view]
as
select Name 
from Branch
GO
/****** Object:  View [dbo].[show_Track_view]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------(4) Show All Trackes  --------------------------
create   view [dbo].[show_Track_view]
as
select  Name
from Track
GO
/****** Object:  View [dbo].[show_Intake_view]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------(5) Show All Intakes  --------------------------
create   view [dbo].[show_Intake_view]
as
select Name
from Intake
GO
/****** Object:  Table [dbo].[CourseExam]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseExam](
	[Course_ID] [int] NOT NULL,
	[Exam_ID] [int] NOT NULL,
 CONSTRAINT [CourseExam_PK] PRIMARY KEY CLUSTERED 
(
	[Course_ID] ASC,
	[Exam_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentExam]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentExam](
	[Student_ID] [int] NOT NULL,
	[Exam_ID] [int] NOT NULL,
 CONSTRAINT [StudentExamT_PK] PRIMARY KEY CLUSTERED 
(
	[Student_ID] ASC,
	[Exam_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Branch] ON 

INSERT [dbo].[Branch] ([ID], [Name]) VALUES (1, N'Minia')
INSERT [dbo].[Branch] ([ID], [Name]) VALUES (2, N'Asyut')
INSERT [dbo].[Branch] ([ID], [Name]) VALUES (3, N'Alexanderia')
INSERT [dbo].[Branch] ([ID], [Name]) VALUES (5, N'Sohag')
INSERT [dbo].[Branch] ([ID], [Name]) VALUES (6, N'BeniSueif')
SET IDENTITY_INSERT [dbo].[Branch] OFF
GO
INSERT [dbo].[Course] ([ID], [Name], [MinDegree], [MaxDegree], [Description]) VALUES (1, N'HTML', 30, 60, N'Learn about web page structure')
INSERT [dbo].[Course] ([ID], [Name], [MinDegree], [MaxDegree], [Description]) VALUES (2, N'HTML', 10, 90, N'THE FIRST COURSE IN FRONT END')
INSERT [dbo].[Course] ([ID], [Name], [MinDegree], [MaxDegree], [Description]) VALUES (3, N'Javascript', 30, 60, N'Learn about web page interactive')
INSERT [dbo].[Course] ([ID], [Name], [MinDegree], [MaxDegree], [Description]) VALUES (4, N'OOP', 30, 60, N'programming paradigm')
INSERT [dbo].[Course] ([ID], [Name], [MinDegree], [MaxDegree], [Description]) VALUES (5, N'js', 25, 70, N'third course in front End')
INSERT [dbo].[Course] ([ID], [Name], [MinDegree], [MaxDegree], [Description]) VALUES (7, N'jj', 25, 70, N'second course in front End')
GO
INSERT [dbo].[CourseExam] ([Course_ID], [Exam_ID]) VALUES (1, 3)
INSERT [dbo].[CourseExam] ([Course_ID], [Exam_ID]) VALUES (1, 4)
INSERT [dbo].[CourseExam] ([Course_ID], [Exam_ID]) VALUES (1, 5)
INSERT [dbo].[CourseExam] ([Course_ID], [Exam_ID]) VALUES (1, 8)
INSERT [dbo].[CourseExam] ([Course_ID], [Exam_ID]) VALUES (1, 9)
INSERT [dbo].[CourseExam] ([Course_ID], [Exam_ID]) VALUES (1, 12)
INSERT [dbo].[CourseExam] ([Course_ID], [Exam_ID]) VALUES (1, 13)
INSERT [dbo].[CourseExam] ([Course_ID], [Exam_ID]) VALUES (2, 6)
INSERT [dbo].[CourseExam] ([Course_ID], [Exam_ID]) VALUES (2, 7)
INSERT [dbo].[CourseExam] ([Course_ID], [Exam_ID]) VALUES (2, 10)
INSERT [dbo].[CourseExam] ([Course_ID], [Exam_ID]) VALUES (2, 11)
GO
INSERT [dbo].[Exam] ([ID], [NumberOfQuestions], [StartTime], [EndTime], [TotalDegree], [Corrective], [Normal]) VALUES (1, 10, CAST(N'2024-01-10T15:30:00.000' AS DateTime), CAST(N'2024-01-10T16:30:00.000' AS DateTime), 60, 0, 1)
INSERT [dbo].[Exam] ([ID], [NumberOfQuestions], [StartTime], [EndTime], [TotalDegree], [Corrective], [Normal]) VALUES (3, 10, CAST(N'2024-01-09T11:30:00.000' AS DateTime), CAST(N'2024-01-09T12:00:00.000' AS DateTime), 60, 0, 1)
INSERT [dbo].[Exam] ([ID], [NumberOfQuestions], [StartTime], [EndTime], [TotalDegree], [Corrective], [Normal]) VALUES (4, 10, CAST(N'2024-01-10T15:30:00.000' AS DateTime), CAST(N'2024-01-10T16:00:00.000' AS DateTime), 60, 0, 1)
INSERT [dbo].[Exam] ([ID], [NumberOfQuestions], [StartTime], [EndTime], [TotalDegree], [Corrective], [Normal]) VALUES (5, 6, CAST(N'2024-01-15T14:30:00.000' AS DateTime), CAST(N'2024-01-15T15:00:00.000' AS DateTime), 20, 0, 1)
INSERT [dbo].[Exam] ([ID], [NumberOfQuestions], [StartTime], [EndTime], [TotalDegree], [Corrective], [Normal]) VALUES (6, 0, CAST(N'2024-01-12T23:00:00.000' AS DateTime), CAST(N'2024-01-14T15:00:00.000' AS DateTime), 0, 0, 1)
INSERT [dbo].[Exam] ([ID], [NumberOfQuestions], [StartTime], [EndTime], [TotalDegree], [Corrective], [Normal]) VALUES (7, 0, CAST(N'2024-01-13T14:30:00.000' AS DateTime), CAST(N'2024-01-14T15:00:00.000' AS DateTime), 0, 0, 1)
INSERT [dbo].[Exam] ([ID], [NumberOfQuestions], [StartTime], [EndTime], [TotalDegree], [Corrective], [Normal]) VALUES (8, 0, CAST(N'2024-01-13T14:30:00.000' AS DateTime), CAST(N'2024-01-14T15:00:00.000' AS DateTime), 0, 0, 1)
INSERT [dbo].[Exam] ([ID], [NumberOfQuestions], [StartTime], [EndTime], [TotalDegree], [Corrective], [Normal]) VALUES (9, 0, CAST(N'2024-01-13T14:30:00.000' AS DateTime), CAST(N'2024-01-14T15:00:00.000' AS DateTime), 0, 0, 1)
INSERT [dbo].[Exam] ([ID], [NumberOfQuestions], [StartTime], [EndTime], [TotalDegree], [Corrective], [Normal]) VALUES (10, 0, CAST(N'2024-01-13T14:30:00.000' AS DateTime), CAST(N'2024-01-14T15:00:00.000' AS DateTime), 0, 0, 1)
INSERT [dbo].[Exam] ([ID], [NumberOfQuestions], [StartTime], [EndTime], [TotalDegree], [Corrective], [Normal]) VALUES (11, 1, CAST(N'2024-01-13T14:30:00.000' AS DateTime), CAST(N'2024-01-14T15:00:00.000' AS DateTime), 10, 0, 1)
INSERT [dbo].[Exam] ([ID], [NumberOfQuestions], [StartTime], [EndTime], [TotalDegree], [Corrective], [Normal]) VALUES (12, 6, CAST(N'2024-01-15T14:30:00.000' AS DateTime), CAST(N'2024-01-15T15:00:00.000' AS DateTime), 0, 0, 1)
INSERT [dbo].[Exam] ([ID], [NumberOfQuestions], [StartTime], [EndTime], [TotalDegree], [Corrective], [Normal]) VALUES (13, 6, CAST(N'2024-01-15T14:30:00.000' AS DateTime), CAST(N'2024-01-15T15:00:00.000' AS DateTime), 0, 0, 1)
GO
INSERT [dbo].[ExamQuestion] ([Exam_ID], [Question_ID], [QuestionType], [QuestionGrade]) VALUES (5, 1, N'Text', 3)
INSERT [dbo].[ExamQuestion] ([Exam_ID], [Question_ID], [QuestionType], [QuestionGrade]) VALUES (5, 4, N'Text', 4)
INSERT [dbo].[ExamQuestion] ([Exam_ID], [Question_ID], [QuestionType], [QuestionGrade]) VALUES (6, 1, N'MCQ ', 5)
INSERT [dbo].[ExamQuestion] ([Exam_ID], [Question_ID], [QuestionType], [QuestionGrade]) VALUES (11, 2, N'TF  ', 10)
INSERT [dbo].[ExamQuestion] ([Exam_ID], [Question_ID], [QuestionType], [QuestionGrade]) VALUES (12, 1, N'Text', NULL)
INSERT [dbo].[ExamQuestion] ([Exam_ID], [Question_ID], [QuestionType], [QuestionGrade]) VALUES (12, 4, N'MCQ ', NULL)
INSERT [dbo].[ExamQuestion] ([Exam_ID], [Question_ID], [QuestionType], [QuestionGrade]) VALUES (12, 6, N'Text', NULL)
INSERT [dbo].[ExamQuestion] ([Exam_ID], [Question_ID], [QuestionType], [QuestionGrade]) VALUES (13, 1, N'Text', NULL)
INSERT [dbo].[ExamQuestion] ([Exam_ID], [Question_ID], [QuestionType], [QuestionGrade]) VALUES (13, 4, N'Text', NULL)
INSERT [dbo].[ExamQuestion] ([Exam_ID], [Question_ID], [QuestionType], [QuestionGrade]) VALUES (13, 6, N'MCQ ', NULL)
GO
SET IDENTITY_INSERT [dbo].[Instructor] ON 

INSERT [dbo].[Instructor] ([ID], [FName], [LName], [Email], [Password]) VALUES (1, N'abounob', N'bebo', N'bebo88@gmail.com', N'Pass1234')
INSERT [dbo].[Instructor] ([ID], [FName], [LName], [Email], [Password]) VALUES (2, N'Mrihan', N'Mohamed', N'mrihan@gmail.com', N'NB9876SS')
INSERT [dbo].[Instructor] ([ID], [FName], [LName], [Email], [Password]) VALUES (3, N'Ahmed', N'mohamed', N'ahmed@yahoo.com', N'FG5325SS')
INSERT [dbo].[Instructor] ([ID], [FName], [LName], [Email], [Password]) VALUES (4, N'ali', N'ali', N'ali@yahoo.com', N'FG5325SS')
INSERT [dbo].[Instructor] ([ID], [FName], [LName], [Email], [Password]) VALUES (5, N'loay', N'hatem', N'loay@yahoo.com', N'FG5325SS')
INSERT [dbo].[Instructor] ([ID], [FName], [LName], [Email], [Password]) VALUES (7, N'mostafa', N'abdella', N'mostafaabdella88@gmail.com', N'Pass123t')
SET IDENTITY_INSERT [dbo].[Instructor] OFF
GO
INSERT [dbo].[InstructorBelong] ([Ins_ID], [Intake_ID], [Track_ID], [Branch_ID]) VALUES (1, 2, 2, 2)
INSERT [dbo].[InstructorBelong] ([Ins_ID], [Intake_ID], [Track_ID], [Branch_ID]) VALUES (2, 3, 3, 1)
INSERT [dbo].[InstructorBelong] ([Ins_ID], [Intake_ID], [Track_ID], [Branch_ID]) VALUES (3, 3, 3, 3)
INSERT [dbo].[InstructorBelong] ([Ins_ID], [Intake_ID], [Track_ID], [Branch_ID]) VALUES (4, 4, 2, 1)
GO
INSERT [dbo].[InstructorCourse] ([Instructor_ID], [Course_ID]) VALUES (1, 2)
INSERT [dbo].[InstructorCourse] ([Instructor_ID], [Course_ID]) VALUES (1, 3)
INSERT [dbo].[InstructorCourse] ([Instructor_ID], [Course_ID]) VALUES (2, 1)
INSERT [dbo].[InstructorCourse] ([Instructor_ID], [Course_ID]) VALUES (3, 5)
INSERT [dbo].[InstructorCourse] ([Instructor_ID], [Course_ID]) VALUES (4, 5)
INSERT [dbo].[InstructorCourse] ([Instructor_ID], [Course_ID]) VALUES (5, 4)
INSERT [dbo].[InstructorCourse] ([Instructor_ID], [Course_ID]) VALUES (7, 7)
GO
SET IDENTITY_INSERT [dbo].[Intake] ON 

INSERT [dbo].[Intake] ([ID], [Name]) VALUES (2, N'intake 42')
INSERT [dbo].[Intake] ([ID], [Name]) VALUES (3, N'intake 43')
INSERT [dbo].[Intake] ([ID], [Name]) VALUES (4, N'intake 44')
INSERT [dbo].[Intake] ([ID], [Name]) VALUES (7, N'66')
INSERT [dbo].[Intake] ([ID], [Name]) VALUES (8, N'77')
INSERT [dbo].[Intake] ([ID], [Name]) VALUES (9, N'77')
SET IDENTITY_INSERT [dbo].[Intake] OFF
GO
INSERT [dbo].[Question] ([Questions_ID], [Text_Questions], [Correct_Answer_Text_Questions], [True_or_False_Questions], [Correct_Answer_True_or_False], [Choose_An_Answer_Question], [Correct_Answer_Choose_Question], [Course_Id]) VALUES (1, N'Describe Database.', N'Collection of tables.', N'Is C# purly OOP?', 0, N'The first true object oriented language is: a) C++. b) SmallTalk. c) C#.', N'b', 1)
INSERT [dbo].[Question] ([Questions_ID], [Text_Questions], [Correct_Answer_Text_Questions], [True_or_False_Questions], [Correct_Answer_True_or_False], [Choose_An_Answer_Question], [Correct_Answer_Choose_Question], [Course_Id]) VALUES (2, N'What is a Primary key?', N'Unique key and not null constraint.', N'A relation might have multiple foreign keys?', 1, N'The first true object oriented language is: a) C++. b) SmallTalk. c) C#.', N'b', 2)
INSERT [dbo].[Question] ([Questions_ID], [Text_Questions], [Correct_Answer_Text_Questions], [True_or_False_Questions], [Correct_Answer_True_or_False], [Choose_An_Answer_Question], [Correct_Answer_Choose_Question], [Course_Id]) VALUES (3, N'What is an aliac command ?', N'It is refered in where clause to identify table or column.', N'A relation might have multiple foreign keys?', 1, N'Which of the following is not an SQL command: a) forget. b) select. c) where', N'a', 3)
INSERT [dbo].[Question] ([Questions_ID], [Text_Questions], [Correct_Answer_Text_Questions], [True_or_False_Questions], [Correct_Answer_True_or_False], [Choose_An_Answer_Question], [Correct_Answer_Choose_Question], [Course_Id]) VALUES (4, N'What is SQL?', N'SQL stands for Structured Query Language.', N'Is alter a DDL command?', 1, N'The primary key can be: a) null. b) not null. c) both null and not null.', N'b', 1)
INSERT [dbo].[Question] ([Questions_ID], [Text_Questions], [Correct_Answer_Text_Questions], [True_or_False_Questions], [Correct_Answer_True_or_False], [Choose_An_Answer_Question], [Correct_Answer_Choose_Question], [Course_Id]) VALUES (5, N'What is a join?', N'It is a keyword to query data from more tables.', N'Each column can have more than one data type?', 0, N'The primary key can be: a) null. b) not null. c) both null and not null.', N'b', 2)
INSERT [dbo].[Question] ([Questions_ID], [Text_Questions], [Correct_Answer_Text_Questions], [True_or_False_Questions], [Correct_Answer_True_or_False], [Choose_An_Answer_Question], [Correct_Answer_Choose_Question], [Course_Id]) VALUES (6, N'what is the first course in Fornt End', N'html', N'js is 3 course', 1, N'a or b', N'a', 1)
INSERT [dbo].[Question] ([Questions_ID], [Text_Questions], [Correct_Answer_Text_Questions], [True_or_False_Questions], [Correct_Answer_True_or_False], [Choose_An_Answer_Question], [Correct_Answer_Choose_Question], [Course_Id]) VALUES (7, N'Describe Database.', N'Collection of tables.', N'Is C# purly OOP?', 0, N'The first true object oriented language is: a) C++. b) SmallTalk. c) C#.', N'b', 1)
INSERT [dbo].[Question] ([Questions_ID], [Text_Questions], [Correct_Answer_Text_Questions], [True_or_False_Questions], [Correct_Answer_True_or_False], [Choose_An_Answer_Question], [Correct_Answer_Choose_Question], [Course_Id]) VALUES (8, N'What is a Primary key?', N'Unique key and not null constraint.', N'A relation might have multiple foreign keys?', 1, N'The first true object oriented language is: a) C++. b) SmallTalk. c) C#.', N'b', 2)
INSERT [dbo].[Question] ([Questions_ID], [Text_Questions], [Correct_Answer_Text_Questions], [True_or_False_Questions], [Correct_Answer_True_or_False], [Choose_An_Answer_Question], [Correct_Answer_Choose_Question], [Course_Id]) VALUES (9, N'What is an aliac command ?', N'It is refered in where clause to identify table or column.', N'A relation might have multiple foreign keys?', 1, N'Which of the following is not an SQL command: a) forget. b) select. c) where', N'a', 3)
INSERT [dbo].[Question] ([Questions_ID], [Text_Questions], [Correct_Answer_Text_Questions], [True_or_False_Questions], [Correct_Answer_True_or_False], [Choose_An_Answer_Question], [Correct_Answer_Choose_Question], [Course_Id]) VALUES (10, N'What is SQL?', N'SQL stands for Structured Query Language.', N'Is alter a DDL command?', 1, N'The primary key can be: a) null. b) not null. c) both null and not null.', N'b', 1)
INSERT [dbo].[Question] ([Questions_ID], [Text_Questions], [Correct_Answer_Text_Questions], [True_or_False_Questions], [Correct_Answer_True_or_False], [Choose_An_Answer_Question], [Correct_Answer_Choose_Question], [Course_Id]) VALUES (11, N'What is a join?', N'It is a keyword to query data from more tables.', N'Each column can have more than one data type?', 0, N'The primary key can be: a) null. b) not null. c) both null and not null.', N'b', 2)
INSERT [dbo].[Question] ([Questions_ID], [Text_Questions], [Correct_Answer_Text_Questions], [True_or_False_Questions], [Correct_Answer_True_or_False], [Choose_An_Answer_Question], [Correct_Answer_Choose_Question], [Course_Id]) VALUES (12, N'What is a DB query?', N'It is a code that is written to get information back from the DB.', N'The condition in a where clause can refer to only one value?', 0, N'What is a table joined with itself called: a) Join. b) Outer Join. c) self-join.', N'c', 4)
INSERT [dbo].[Question] ([Questions_ID], [Text_Questions], [Correct_Answer_Text_Questions], [True_or_False_Questions], [Correct_Answer_True_or_False], [Choose_An_Answer_Question], [Correct_Answer_Choose_Question], [Course_Id]) VALUES (13, N'Describe Database.', N'Collection of tables.', N'Is C# purly OOP?', 0, N'The first true object oriented language is: a) C++. b) SmallTalk. c) C#.', N'b', 1)
INSERT [dbo].[Question] ([Questions_ID], [Text_Questions], [Correct_Answer_Text_Questions], [True_or_False_Questions], [Correct_Answer_True_or_False], [Choose_An_Answer_Question], [Correct_Answer_Choose_Question], [Course_Id]) VALUES (14, N'What is a Primary key?', N'Unique key and not null constraint.', N'A relation might have multiple foreign keys?', 1, N'The first true object oriented language is: a) C++. b) SmallTalk. c) C#.', N'b', 2)
INSERT [dbo].[Question] ([Questions_ID], [Text_Questions], [Correct_Answer_Text_Questions], [True_or_False_Questions], [Correct_Answer_True_or_False], [Choose_An_Answer_Question], [Correct_Answer_Choose_Question], [Course_Id]) VALUES (15, N'What is an aliac command ?', N'It is refered in where clause to identify table or column.', N'A relation might have multiple foreign keys?', 1, N'Which of the following is not an SQL command: a) forget. b) select. c) where', N'a', 3)
INSERT [dbo].[Question] ([Questions_ID], [Text_Questions], [Correct_Answer_Text_Questions], [True_or_False_Questions], [Correct_Answer_True_or_False], [Choose_An_Answer_Question], [Correct_Answer_Choose_Question], [Course_Id]) VALUES (16, N'What is SQL?', N'SQL stands for Structured Query Language.', N'Is alter a DDL command?', 1, N'The primary key can be: a) null. b) not null. c) both null and not null.', N'b', 1)
INSERT [dbo].[Question] ([Questions_ID], [Text_Questions], [Correct_Answer_Text_Questions], [True_or_False_Questions], [Correct_Answer_True_or_False], [Choose_An_Answer_Question], [Correct_Answer_Choose_Question], [Course_Id]) VALUES (17, N'What is a join?', N'It is a keyword to query data from more tables.', N'Each column can have more than one data type?', 0, N'The primary key can be: a) null. b) not null. c) both null and not null.', N'b', 2)
INSERT [dbo].[Question] ([Questions_ID], [Text_Questions], [Correct_Answer_Text_Questions], [True_or_False_Questions], [Correct_Answer_True_or_False], [Choose_An_Answer_Question], [Correct_Answer_Choose_Question], [Course_Id]) VALUES (18, N'What is a DB query?', N'It is a code that is written to get information back from the DB.', N'The condition in a where clause can refer to only one value?', 0, N'What is a table joined with itself called: a) Join. b) Outer Join. c) self-join.', N'c', 4)
INSERT [dbo].[Question] ([Questions_ID], [Text_Questions], [Correct_Answer_Text_Questions], [True_or_False_Questions], [Correct_Answer_True_or_False], [Choose_An_Answer_Question], [Correct_Answer_Choose_Question], [Course_Id]) VALUES (19, N'Describe Database.', N'Collection of tables.', N'Is C# purly OOP?', 0, N'The first true object oriented language is: a) C++. b) SmallTalk. c) C#.', N'b', 1)
INSERT [dbo].[Question] ([Questions_ID], [Text_Questions], [Correct_Answer_Text_Questions], [True_or_False_Questions], [Correct_Answer_True_or_False], [Choose_An_Answer_Question], [Correct_Answer_Choose_Question], [Course_Id]) VALUES (20, N'What is a Primary key?', N'Unique key and not null constraint.', N'A relation might have multiple foreign keys?', 1, N'The first true object oriented language is: a) C++. b) SmallTalk. c) C#.', N'b', 2)
INSERT [dbo].[Question] ([Questions_ID], [Text_Questions], [Correct_Answer_Text_Questions], [True_or_False_Questions], [Correct_Answer_True_or_False], [Choose_An_Answer_Question], [Correct_Answer_Choose_Question], [Course_Id]) VALUES (21, N'What is an aliac command ?', N'It is refered in where clause to identify table or column.', N'A relation might have multiple foreign keys?', 1, N'Which of the following is not an SQL command: a) forget. b) select. c) where', N'a', 3)
INSERT [dbo].[Question] ([Questions_ID], [Text_Questions], [Correct_Answer_Text_Questions], [True_or_False_Questions], [Correct_Answer_True_or_False], [Choose_An_Answer_Question], [Correct_Answer_Choose_Question], [Course_Id]) VALUES (22, N'What is SQL?', N'SQL stands for Structured Query Language.', N'Is alter a DDL command?', 1, N'The primary key can be: a) null. b) not null. c) both null and not null.', N'b', 1)
INSERT [dbo].[Question] ([Questions_ID], [Text_Questions], [Correct_Answer_Text_Questions], [True_or_False_Questions], [Correct_Answer_True_or_False], [Choose_An_Answer_Question], [Correct_Answer_Choose_Question], [Course_Id]) VALUES (23, N'What is a join?', N'It is a keyword to query data from more tables.', N'Each column can have more than one data type?', 0, N'The primary key can be: a) null. b) not null. c) both null and not null.', N'b', 2)
INSERT [dbo].[Question] ([Questions_ID], [Text_Questions], [Correct_Answer_Text_Questions], [True_or_False_Questions], [Correct_Answer_True_or_False], [Choose_An_Answer_Question], [Correct_Answer_Choose_Question], [Course_Id]) VALUES (24, N'What is a DB query?', N'It is a code that is written to get information back from the DB.', N'The condition in a where clause can refer to only one value?', 0, N'What is a table joined with itself called: a) Join. b) Outer Join. c) self-join.', N'c', 4)
INSERT [dbo].[Question] ([Questions_ID], [Text_Questions], [Correct_Answer_Text_Questions], [True_or_False_Questions], [Correct_Answer_True_or_False], [Choose_An_Answer_Question], [Correct_Answer_Choose_Question], [Course_Id]) VALUES (25, N'Describe Database.', N'Collection of tables.', N'Is C# purly OOP?', 0, N'The first true object oriented language is: a) C++. b) SmallTalk. c) C#.', N'b', 1)
INSERT [dbo].[Question] ([Questions_ID], [Text_Questions], [Correct_Answer_Text_Questions], [True_or_False_Questions], [Correct_Answer_True_or_False], [Choose_An_Answer_Question], [Correct_Answer_Choose_Question], [Course_Id]) VALUES (26, N'What is a Primary key?', N'Unique key and not null constraint.', N'A relation might have multiple foreign keys?', 1, N'The first true object oriented language is: a) C++. b) SmallTalk. c) C#.', N'b', 2)
INSERT [dbo].[Question] ([Questions_ID], [Text_Questions], [Correct_Answer_Text_Questions], [True_or_False_Questions], [Correct_Answer_True_or_False], [Choose_An_Answer_Question], [Correct_Answer_Choose_Question], [Course_Id]) VALUES (27, N'What is an aliac command ?', N'It is refered in where clause to identify table or column.', N'A relation might have multiple foreign keys?', 1, N'Which of the following is not an SQL command: a) forget. b) select. c) where', N'a', 3)
INSERT [dbo].[Question] ([Questions_ID], [Text_Questions], [Correct_Answer_Text_Questions], [True_or_False_Questions], [Correct_Answer_True_or_False], [Choose_An_Answer_Question], [Correct_Answer_Choose_Question], [Course_Id]) VALUES (28, N'What is SQL?', N'SQL stands for Structured Query Language.', N'Is alter a DDL command?', 1, N'The primary key can be: a) null. b) not null. c) both null and not null.', N'b', 1)
INSERT [dbo].[Question] ([Questions_ID], [Text_Questions], [Correct_Answer_Text_Questions], [True_or_False_Questions], [Correct_Answer_True_or_False], [Choose_An_Answer_Question], [Correct_Answer_Choose_Question], [Course_Id]) VALUES (29, N'What is a join?', N'It is a keyword to query data from more tables.', N'Each column can have more than one data type?', 0, N'The primary key can be: a) null. b) not null. c) both null and not null.', N'b', 2)
INSERT [dbo].[Question] ([Questions_ID], [Text_Questions], [Correct_Answer_Text_Questions], [True_or_False_Questions], [Correct_Answer_True_or_False], [Choose_An_Answer_Question], [Correct_Answer_Choose_Question], [Course_Id]) VALUES (30, N'What is a DB query?', N'It is a code that is written to get information back from the DB.', N'The condition in a where clause can refer to only one value?', 0, N'What is a table joined with itself called: a) Join. b) Outer Join. c) self-join.', N'c', 4)
GO
INSERT [dbo].[Student] ([ID], [FName], [LName], [GraduationYear], [Email], [Password]) VALUES (1, N'Mostafa', N'Abdullah', N'2020', N'Mostafa@gmail.com', N'AZ3456SS')
INSERT [dbo].[Student] ([ID], [FName], [LName], [GraduationYear], [Email], [Password]) VALUES (2, N'Abanoub', N'Raafat', N'2021', N'Abanoub@gmail.com', N'ZX5744SS')
INSERT [dbo].[Student] ([ID], [FName], [LName], [GraduationYear], [Email], [Password]) VALUES (3, N'Gehad', N'Mohamed', N'2022', N'Gehad@yahoo.com', N'VC6812SS')
INSERT [dbo].[Student] ([ID], [FName], [LName], [GraduationYear], [Email], [Password]) VALUES (4, N'Mai', N'Bahaa', N'2022', N'Mai@yahoo.com', N'VC6812SS')
INSERT [dbo].[Student] ([ID], [FName], [LName], [GraduationYear], [Email], [Password]) VALUES (5, N'ahmed', N'Mohamed', N'2022', N'ahmed@yahoo.com', N'7889asA2SS')
INSERT [dbo].[Student] ([ID], [FName], [LName], [GraduationYear], [Email], [Password]) VALUES (6, N'mostafa', N'ali', N'2022', N'mostafa@yahoo.com', N'VC6812SS')
GO
INSERT [dbo].[StudentCourse] ([Std_ID], [Course_ID]) VALUES (4, 4)
INSERT [dbo].[StudentCourse] ([Std_ID], [Course_ID]) VALUES (4, 1)
INSERT [dbo].[StudentCourse] ([Std_ID], [Course_ID]) VALUES (3, 4)
INSERT [dbo].[StudentCourse] ([Std_ID], [Course_ID]) VALUES (3, 3)
INSERT [dbo].[StudentCourse] ([Std_ID], [Course_ID]) VALUES (2, 3)
INSERT [dbo].[StudentCourse] ([Std_ID], [Course_ID]) VALUES (2, 2)
INSERT [dbo].[StudentCourse] ([Std_ID], [Course_ID]) VALUES (1, 5)
INSERT [dbo].[StudentCourse] ([Std_ID], [Course_ID]) VALUES (1, 3)
INSERT [dbo].[StudentCourse] ([Std_ID], [Course_ID]) VALUES (1, 1)
GO
INSERT [dbo].[StudentExam] ([Student_ID], [Exam_ID]) VALUES (1, 5)
INSERT [dbo].[StudentExam] ([Student_ID], [Exam_ID]) VALUES (1, 6)
INSERT [dbo].[StudentExam] ([Student_ID], [Exam_ID]) VALUES (1, 8)
INSERT [dbo].[StudentExam] ([Student_ID], [Exam_ID]) VALUES (1, 9)
INSERT [dbo].[StudentExam] ([Student_ID], [Exam_ID]) VALUES (1, 12)
INSERT [dbo].[StudentExam] ([Student_ID], [Exam_ID]) VALUES (1, 13)
INSERT [dbo].[StudentExam] ([Student_ID], [Exam_ID]) VALUES (2, 6)
INSERT [dbo].[StudentExam] ([Student_ID], [Exam_ID]) VALUES (2, 7)
INSERT [dbo].[StudentExam] ([Student_ID], [Exam_ID]) VALUES (2, 10)
INSERT [dbo].[StudentExam] ([Student_ID], [Exam_ID]) VALUES (2, 11)
GO
INSERT [dbo].[StudentExamQuestions] ([Std_ID], [Exam_ID], [Questions_result], [Std_Answer_Text_Question], [Std_Answer_Choose_Question], [Std_Answer_True_or_False], [Questions_Id]) VALUES (1, 1, 0, N'collection of table', N' ', N' ', 1)
INSERT [dbo].[StudentExamQuestions] ([Std_ID], [Exam_ID], [Questions_result], [Std_Answer_Text_Question], [Std_Answer_Choose_Question], [Std_Answer_True_or_False], [Questions_Id]) VALUES (1, 1, 0, N' ', N'b', N' ', 2)
INSERT [dbo].[StudentExamQuestions] ([Std_ID], [Exam_ID], [Questions_result], [Std_Answer_Text_Question], [Std_Answer_Choose_Question], [Std_Answer_True_or_False], [Questions_Id]) VALUES (1, 1, 0, N' ', N' ', N'0', 3)
INSERT [dbo].[StudentExamQuestions] ([Std_ID], [Exam_ID], [Questions_result], [Std_Answer_Text_Question], [Std_Answer_Choose_Question], [Std_Answer_True_or_False], [Questions_Id]) VALUES (1, 1, 0, N' ', N' ', N'1', 4)
INSERT [dbo].[StudentExamQuestions] ([Std_ID], [Exam_ID], [Questions_result], [Std_Answer_Text_Question], [Std_Answer_Choose_Question], [Std_Answer_True_or_False], [Questions_Id]) VALUES (1, 5, 6, N' ', N'b', N' ', 1)
INSERT [dbo].[StudentExamQuestions] ([Std_ID], [Exam_ID], [Questions_result], [Std_Answer_Text_Question], [Std_Answer_Choose_Question], [Std_Answer_True_or_False], [Questions_Id]) VALUES (1, 5, 0, N'It is a keyword to query data from more tables.', N' ', N' ', 4)
INSERT [dbo].[StudentExamQuestions] ([Std_ID], [Exam_ID], [Questions_result], [Std_Answer_Text_Question], [Std_Answer_Choose_Question], [Std_Answer_True_or_False], [Questions_Id]) VALUES (2, 1, 0, N' ', N'b', N' ', 5)
INSERT [dbo].[StudentExamQuestions] ([Std_ID], [Exam_ID], [Questions_result], [Std_Answer_Text_Question], [Std_Answer_Choose_Question], [Std_Answer_True_or_False], [Questions_Id]) VALUES (2, 6, 0, N'', N'c', N'', 1)
GO
INSERT [dbo].[StudentRegisteration] ([Std_ID], [Intake_ID], [Track_ID], [Branch_ID]) VALUES (1, 2, 2, 5)
INSERT [dbo].[StudentRegisteration] ([Std_ID], [Intake_ID], [Track_ID], [Branch_ID]) VALUES (2, 2, 2, 2)
INSERT [dbo].[StudentRegisteration] ([Std_ID], [Intake_ID], [Track_ID], [Branch_ID]) VALUES (3, 3, 3, 3)
INSERT [dbo].[StudentRegisteration] ([Std_ID], [Intake_ID], [Track_ID], [Branch_ID]) VALUES (4, 4, 3, 1)
GO
SET IDENTITY_INSERT [dbo].[Track] ON 

INSERT [dbo].[Track] ([ID], [Name]) VALUES (1, N'Full stack web developer using .NET')
INSERT [dbo].[Track] ([ID], [Name]) VALUES (2, N'Full stack web developer using MEARN')
INSERT [dbo].[Track] ([ID], [Name]) VALUES (3, N'Full stack web developer using PHP')
INSERT [dbo].[Track] ([ID], [Name]) VALUES (4, N'Full stack web developer using Python')
INSERT [dbo].[Track] ([ID], [Name]) VALUES (6, N'c++')
SET IDENTITY_INSERT [dbo].[Track] OFF
GO
SET IDENTITY_INSERT [dbo].[TrainingManager] ON 

INSERT [dbo].[TrainingManager] ([ID], [FName], [LName], [Email], [Password]) VALUES (1, N'Ahmed', N'Othman', N'Ahmed@gmail.com', N'abc00SSS')
INSERT [dbo].[TrainingManager] ([ID], [FName], [LName], [Email], [Password]) VALUES (2, N'Mohamed', N'Tony', N'Mohamed@gmail.com', N'456ASSSS')
INSERT [dbo].[TrainingManager] ([ID], [FName], [LName], [Email], [Password]) VALUES (3, N'Mohamed', N'Ahmed', N'Ahmed@yahoo.com', N'ERD123SS')
INSERT [dbo].[TrainingManager] ([ID], [FName], [LName], [Email], [Password]) VALUES (5, N'Ahmed', N'Mohamed', N'Ahmo@gmail.com', N'ASD123DD')
SET IDENTITY_INSERT [dbo].[TrainingManager] OFF
GO
INSERT [dbo].[TrainngManagerManage] ([Trainng_mannger_ID], [Intake_ID], [Track_ID], [Branch_ID]) VALUES (1, 2, 3, 1)
INSERT [dbo].[TrainngManagerManage] ([Trainng_mannger_ID], [Intake_ID], [Track_ID], [Branch_ID]) VALUES (1, 4, 2, 6)
INSERT [dbo].[TrainngManagerManage] ([Trainng_mannger_ID], [Intake_ID], [Track_ID], [Branch_ID]) VALUES (2, 2, 2, 2)
INSERT [dbo].[TrainngManagerManage] ([Trainng_mannger_ID], [Intake_ID], [Track_ID], [Branch_ID]) VALUES (3, 3, 3, 3)
INSERT [dbo].[TrainngManagerManage] ([Trainng_mannger_ID], [Intake_ID], [Track_ID], [Branch_ID]) VALUES (5, 2, 2, 2)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Course_Name]    Script Date: 2024-01-14 1:26:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_Course_Name] ON [dbo].[Course]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_QuestionGrade]    Script Date: 2024-01-14 1:26:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_QuestionGrade] ON [dbo].[ExamQuestion]
(
	[QuestionGrade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Instructor_Email]    Script Date: 2024-01-14 1:26:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_Instructor_Email] ON [dbo].[Instructor]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Instructor_FullName]    Script Date: 2024-01-14 1:26:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_Instructor_FullName] ON [dbo].[Instructor]
(
	[FName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Question_CourseId]    Script Date: 2024-01-14 1:26:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_Question_CourseId] ON [dbo].[Question]
(
	[Course_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Student_Email]    Script Date: 2024-01-14 1:26:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_Student_Email] ON [dbo].[Student]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Student_FullName]    Script Date: 2024-01-14 1:26:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_Student_FullName] ON [dbo].[Student]
(
	[FName] ASC,
	[LName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Student_FullName_Email]    Script Date: 2024-01-14 1:26:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_Student_FullName_Email] ON [dbo].[Student]
(
	[FName] ASC,
	[LName] ASC
)
INCLUDE([Email]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentCourse_Std_ID_Course_ID]    Script Date: 2024-01-14 1:26:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_StudentCourse_Std_ID_Course_ID] ON [dbo].[StudentCourse]
(
	[Std_ID] DESC,
	[Course_ID] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Questions_Result]    Script Date: 2024-01-14 1:26:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_Questions_Result] ON [dbo].[StudentExamQuestions]
(
	[Questions_result] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentExamQuestions_Std_ID_Exam_ID]    Script Date: 2024-01-14 1:26:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_StudentExamQuestions_Std_ID_Exam_ID] ON [dbo].[StudentExamQuestions]
(
	[Std_ID] ASC,
	[Exam_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CourseExam]  WITH CHECK ADD  CONSTRAINT [CourseExam_Course_FK] FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseExam] CHECK CONSTRAINT [CourseExam_Course_FK]
GO
ALTER TABLE [dbo].[CourseExam]  WITH CHECK ADD  CONSTRAINT [CourseExam_Exam_FK] FOREIGN KEY([Exam_ID])
REFERENCES [dbo].[Exam] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseExam] CHECK CONSTRAINT [CourseExam_Exam_FK]
GO
ALTER TABLE [dbo].[ExamQuestion]  WITH CHECK ADD  CONSTRAINT [ExamQuestion_Exam_FK] FOREIGN KEY([Exam_ID])
REFERENCES [dbo].[Exam] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ExamQuestion] CHECK CONSTRAINT [ExamQuestion_Exam_FK]
GO
ALTER TABLE [dbo].[ExamQuestion]  WITH CHECK ADD  CONSTRAINT [ExamQuestion_Question_FK] FOREIGN KEY([Question_ID])
REFERENCES [dbo].[Question] ([Questions_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ExamQuestion] CHECK CONSTRAINT [ExamQuestion_Question_FK]
GO
ALTER TABLE [dbo].[InstructorBelong]  WITH CHECK ADD  CONSTRAINT [Instractor_Belong_Branch_ID_FK] FOREIGN KEY([Branch_ID])
REFERENCES [dbo].[Branch] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InstructorBelong] CHECK CONSTRAINT [Instractor_Belong_Branch_ID_FK]
GO
ALTER TABLE [dbo].[InstructorBelong]  WITH CHECK ADD  CONSTRAINT [Instractor_Belong_Ins_FK] FOREIGN KEY([Ins_ID])
REFERENCES [dbo].[Instructor] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InstructorBelong] CHECK CONSTRAINT [Instractor_Belong_Ins_FK]
GO
ALTER TABLE [dbo].[InstructorBelong]  WITH CHECK ADD  CONSTRAINT [Instractor_Belong_Intake_FK] FOREIGN KEY([Intake_ID])
REFERENCES [dbo].[Intake] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InstructorBelong] CHECK CONSTRAINT [Instractor_Belong_Intake_FK]
GO
ALTER TABLE [dbo].[InstructorBelong]  WITH CHECK ADD  CONSTRAINT [Instractor_Belong_Track_FK] FOREIGN KEY([Track_ID])
REFERENCES [dbo].[Track] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InstructorBelong] CHECK CONSTRAINT [Instractor_Belong_Track_FK]
GO
ALTER TABLE [dbo].[InstructorCourse]  WITH CHECK ADD  CONSTRAINT [Instructor_Courses_Courses_FK] FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InstructorCourse] CHECK CONSTRAINT [Instructor_Courses_Courses_FK]
GO
ALTER TABLE [dbo].[InstructorCourse]  WITH CHECK ADD  CONSTRAINT [Instructor_Courses_Inestractor_FK] FOREIGN KEY([Instructor_ID])
REFERENCES [dbo].[Instructor] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InstructorCourse] CHECK CONSTRAINT [Instructor_Courses_Inestractor_FK]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [fk_Course] FOREIGN KEY([Course_Id])
REFERENCES [dbo].[Course] ([ID])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [fk_Course]
GO
ALTER TABLE [dbo].[StudentCourse]  WITH CHECK ADD  CONSTRAINT [Student_Courses_Courses_FK] FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentCourse] CHECK CONSTRAINT [Student_Courses_Courses_FK]
GO
ALTER TABLE [dbo].[StudentCourse]  WITH CHECK ADD  CONSTRAINT [Student_Courses_Student_FK] FOREIGN KEY([Std_ID])
REFERENCES [dbo].[Student] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentCourse] CHECK CONSTRAINT [Student_Courses_Student_FK]
GO
ALTER TABLE [dbo].[StudentExam]  WITH CHECK ADD  CONSTRAINT [ExamQuestionT_Exam_FK] FOREIGN KEY([Exam_ID])
REFERENCES [dbo].[Exam] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentExam] CHECK CONSTRAINT [ExamQuestionT_Exam_FK]
GO
ALTER TABLE [dbo].[StudentExam]  WITH CHECK ADD  CONSTRAINT [StudentExam_Student_FK] FOREIGN KEY([Student_ID])
REFERENCES [dbo].[Question] ([Questions_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentExam] CHECK CONSTRAINT [StudentExam_Student_FK]
GO
ALTER TABLE [dbo].[StudentExamQuestions]  WITH CHECK ADD  CONSTRAINT [Student_Exam_Exam_FK] FOREIGN KEY([Exam_ID])
REFERENCES [dbo].[Exam] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentExamQuestions] CHECK CONSTRAINT [Student_Exam_Exam_FK]
GO
ALTER TABLE [dbo].[StudentExamQuestions]  WITH CHECK ADD  CONSTRAINT [Student_Exam_question_FK] FOREIGN KEY([Questions_Id])
REFERENCES [dbo].[Question] ([Questions_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentExamQuestions] CHECK CONSTRAINT [Student_Exam_question_FK]
GO
ALTER TABLE [dbo].[StudentExamQuestions]  WITH CHECK ADD  CONSTRAINT [Student_Exam_Student_FK] FOREIGN KEY([Std_ID])
REFERENCES [dbo].[Student] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentExamQuestions] CHECK CONSTRAINT [Student_Exam_Student_FK]
GO
ALTER TABLE [dbo].[StudentRegisteration]  WITH CHECK ADD  CONSTRAINT [Student_registeration_Branch_ID_FK] FOREIGN KEY([Branch_ID])
REFERENCES [dbo].[Branch] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentRegisteration] CHECK CONSTRAINT [Student_registeration_Branch_ID_FK]
GO
ALTER TABLE [dbo].[StudentRegisteration]  WITH CHECK ADD  CONSTRAINT [Student_registeration_Intake_FK] FOREIGN KEY([Intake_ID])
REFERENCES [dbo].[Intake] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentRegisteration] CHECK CONSTRAINT [Student_registeration_Intake_FK]
GO
ALTER TABLE [dbo].[StudentRegisteration]  WITH CHECK ADD  CONSTRAINT [Student_registeration_Std_FK] FOREIGN KEY([Std_ID])
REFERENCES [dbo].[Student] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentRegisteration] CHECK CONSTRAINT [Student_registeration_Std_FK]
GO
ALTER TABLE [dbo].[StudentRegisteration]  WITH CHECK ADD  CONSTRAINT [Student_registeration_Track_FK] FOREIGN KEY([Track_ID])
REFERENCES [dbo].[Track] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentRegisteration] CHECK CONSTRAINT [Student_registeration_Track_FK]
GO
ALTER TABLE [dbo].[TrainngManagerManage]  WITH CHECK ADD  CONSTRAINT [Trainng_mannger_mange_Branch_ID_FK] FOREIGN KEY([Branch_ID])
REFERENCES [dbo].[Branch] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TrainngManagerManage] CHECK CONSTRAINT [Trainng_mannger_mange_Branch_ID_FK]
GO
ALTER TABLE [dbo].[TrainngManagerManage]  WITH CHECK ADD  CONSTRAINT [Trainng_mannger_mange_Intake_FK] FOREIGN KEY([Intake_ID])
REFERENCES [dbo].[Intake] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TrainngManagerManage] CHECK CONSTRAINT [Trainng_mannger_mange_Intake_FK]
GO
ALTER TABLE [dbo].[TrainngManagerManage]  WITH CHECK ADD  CONSTRAINT [Trainng_mannger_mange_Track_FK] FOREIGN KEY([Track_ID])
REFERENCES [dbo].[Track] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TrainngManagerManage] CHECK CONSTRAINT [Trainng_mannger_mange_Track_FK]
GO
ALTER TABLE [dbo].[TrainngManagerManage]  WITH CHECK ADD  CONSTRAINT [Trainng_mannger_mange_traMng_ID_FK] FOREIGN KEY([Trainng_mannger_ID])
REFERENCES [dbo].[TrainingManager] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TrainngManagerManage] CHECK CONSTRAINT [Trainng_mannger_mange_traMng_ID_FK]
GO
ALTER TABLE [dbo].[ExamQuestion]  WITH CHECK ADD CHECK  (([QuestionType]='Text' OR [QuestionType]='MCQ' OR [QuestionType]='TF'))
GO
ALTER TABLE [dbo].[Instructor]  WITH CHECK ADD  CONSTRAINT [Ins_CheckEmailcheck] CHECK  (([Email] like '%@gmail.com' OR [Email] like '%@yahoo.com'))
GO
ALTER TABLE [dbo].[Instructor] CHECK CONSTRAINT [Ins_CheckEmailcheck]
GO
ALTER TABLE [dbo].[Instructor]  WITH CHECK ADD  CONSTRAINT [Ins_CheckPassword] CHECK  (([Password] like '%[A-Z]%' AND [Password] like '%[a-z]%' AND [Password] like '%[0-9]%' AND len([Password])>=(8) AND len([Password])<=(25)))
GO
ALTER TABLE [dbo].[Instructor] CHECK CONSTRAINT [Ins_CheckPassword]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [Stu_CheckEmailcheck] CHECK  (([Email] like '%@gmail.com' OR [Email] like '%@yahoo.com'))
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [Stu_CheckEmailcheck]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [Stu_CheckPassword] CHECK  (([Password] like '%[A-Z]%' AND [Password] like '%[a-z]%' AND [Password] like '%[0-9]%' AND len([Password])>=(8) AND len([Password])<=(25)))
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [Stu_CheckPassword]
GO
ALTER TABLE [dbo].[TrainingManager]  WITH CHECK ADD  CONSTRAINT [trainMag_CheckEmailcheck] CHECK  (([Email] like '%@gmail.com' OR [Email] like '%@yahoo.com'))
GO
ALTER TABLE [dbo].[TrainingManager] CHECK CONSTRAINT [trainMag_CheckEmailcheck]
GO
ALTER TABLE [dbo].[TrainingManager]  WITH CHECK ADD  CONSTRAINT [trainMag_CheckPassword] CHECK  (([Password] like '%[A-Z]%' AND [Password] like '%[a-z]%' AND [Password] like '%[0-9]%' AND len([Password])>=(8) AND len([Password])<=(25)))
GO
ALTER TABLE [dbo].[TrainingManager] CHECK CONSTRAINT [trainMag_CheckPassword]
GO
/****** Object:  StoredProcedure [dbo].[AddCourse]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------------AddCourse -------------------

CREATE   PROCEDURE [dbo].[AddCourse]
	@ID INT,
    @CourseName nvarchar(50),
    @MinDegree int,
    @MaxDegree int,
    @Description nvarchar(max)
AS
BEGIN
	IF NOT EXISTS (SELECT 1 FROM Course WHERE [Name] = @CourseName)
    BEGIN
        INSERT INTO Course (ID,[Name], MinDegree, MaxDegree, [Description])
        VALUES (@ID,  @CourseName, @MinDegree, @MaxDegree, @Description);

        SELECT 'Course added successfully.' AS ResultMessage;
    END
    ELSE
    BEGIN
        SELECT 'The course ' + @CourseName + ' is already exist in the database' AS ResultMessage;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[AddGradeToQuestion_Proc]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--3-Assign grade for each question of the exam
create   proc [dbo].[AddGradeToQuestion_Proc]
				@Instructor_ID int,
				@Exam_ID int,
				@Question_ID int,
				@Question_Grade int
as
begin
	IF @Instructor_ID <= 0 or @Exam_ID <= 0 or @Question_ID <= 0 or @Question_Grade <= 0 or @Instructor_ID is null or @Exam_ID is null or @Question_ID is null or @Question_Grade is null
		BEGIN
			SELECT 'Invalid input.' AS ResultMessage
			RETURN
		END
	else if not exists(select top 1 * from Exam where ID = @Exam_ID)
		begin
			SELECT 'Exam does not exist.' AS ResultMessage
			RETURN
		end
	else if not exists (select 1 from Instructor where ID = @Instructor_ID)
	begin
		SELECT 'Instructor does not exist.' AS ResultMessage
		RETURN
	end
	else if not exists (select 1 from Question where Questions_ID = @Question_ID)
	begin
		SELECT 'Question does not exist.' AS ResultMessage
		RETURN
	end
	else if not exists
		(select 1 from Question q inner join InstructorCourse ic
		on q.Course_Id = ic.Course_ID
		where q.Questions_ID = @Question_ID and ic.Instructor_ID = @Instructor_ID)
	begin
		SELECT 'Question in question pool does not belong to that course.' AS ResultMessage
		RETURN
	end
	else if exists (select 1 from ExamQuestion where Question_ID = @Question_ID and Exam_ID = @Exam_ID and QuestionGrade IS NOT NULL)
	begin
		SELECT 'Question in question pool already has a grade.' AS ResultMessage
		RETURN
	end
	else if not exists
		(select top 1 i.ID
		from Instructor i inner join InstructorCourse ic
		on i.ID = ic.Instructor_ID
		inner join Course c
		on ic.Course_ID = c.ID
		inner join CourseExam ce
		on ce.Course_ID = c.ID
		where ce.Exam_ID = @Exam_ID and i.ID = @Instructor_ID)
	begin
		SELECT 'Exam ID or Instructor ID or both are wrong.' AS ResultMessage
		RETURN
	end
	declare @Course_MaxDegree int
	declare @Exam_TotalDegree int
	select top 1 @Course_MaxDegree= c.MaxDegree from Course c
	inner join CourseExam ce
	on c.ID = ce.Course_ID
	select @Exam_TotalDegree = TotalDegree -- TotalDegree
	from Exam
	where ID = @Exam_ID
	if @Exam_TotalDegree = @Course_MaxDegree
	begin
		select 'Course Max Degree = Exam Total Degrees you cannot add more grades'
		RETURN
	end
	else if @Exam_TotalDegree + @Question_Grade > @Course_MaxDegree
		begin
			select 'Grade not added! Exam total degrees exceeded course max degrees please re-assign the grade'
			RETURN
		end

				update ExamQuestion 
				set QuestionGrade = @Question_Grade
				where Question_ID = @Question_ID and Exam_ID = @Exam_ID
				--setting total degrees in Exam table
				update Exam  
				set TotalDegree = TotalDegree + @Question_Grade
				where ID = @Exam_ID
				select 'Grade Added!' as ResultMessage
end
GO
/****** Object:  StoredProcedure [dbo].[AddInstructor]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------------AddNewInstructor -------------------

CREATE   PROCEDURE [dbo].[AddInstructor]
    @FName nvarchar(15),
    @LName nvarchar(15),
    @Email nvarchar(50),
    @Password nvarchar(50)
AS
BEGIN
	IF NOT EXISTS (SELECT 1 FROM Instructor WHERE Email = @Email)
    BEGIN
        IF (
            @Email LIKE '%@gmail.com' OR 
            @Email LIKE '%@yahoo.com' AND
            @Password LIKE '%[A-Z]%' AND
            @Password LIKE '%[a-z]%' AND
            @Password LIKE '%[0-9]%' AND
			LEN(@Password) >= 8 AND 
            LEN(@Password) <= 25
        )
        BEGIN
            INSERT INTO Instructor (FName, LName, Email, [Password])
            VALUES (@FName, @LName, @Email, @Password);

            SELECT 'Instructor added successfully.' AS ResultMessage;
        END
        ELSE
        BEGIN
            SELECT 'Invalid email or password format.' AS ResultMessage;
        END
    END
    ELSE
    BEGIN
        SELECT 'Instructor with the same email already exists IN DATA BASE' AS ResultMessage;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[AddInstructorBelong]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[AddInstructorBelong]
    @Ins_ID INT,
    @Intake_ID INT,
    @Track_ID INT,
    @Branch_ID INT
AS
BEGIN
    -- Check if Ins_ID exists in Instructor table
    IF NOT EXISTS (SELECT 1 FROM Instructor WHERE ID = @Ins_ID)
    BEGIN
        SELECT 'Instructor not found in DB' AS ResultMessage;
        RETURN;
    END

    -- Check if the combination of Ins_ID, Intake_ID, Track_ID, Branch_ID already exists in InstructorBelong table
    IF EXISTS (SELECT 1 FROM InstructorBelong WHERE Ins_ID = @Ins_ID )
    BEGIN
        SELECT 'Instructor already assigned in this table.' AS ResultMessage;
        RETURN;
    END

    -- Check if Branch_ID exists in Branch table
    IF NOT EXISTS (SELECT 1 FROM Branch WHERE ID = @Branch_ID)
    BEGIN
        SELECT 'Branch not found.' AS ResultMessage;
        RETURN;
    END

    -- Check if Intake_ID exists in Intake table
    IF NOT EXISTS (SELECT 1 FROM Intake WHERE ID = @Intake_ID)
    BEGIN
        SELECT 'Intake not found.' AS ResultMessage;
        RETURN;
    END

    -- Check if Track_ID exists in Track table
    IF NOT EXISTS (SELECT 1 FROM Track WHERE ID = @Track_ID)
    BEGIN
        SELECT 'Track not found.' AS ResultMessage;
        RETURN;
    END

    -- If all checks pass, insert the record into InstructorBelong table
    INSERT INTO InstructorBelong (Ins_ID, Intake_ID, Track_ID, Branch_ID)
    VALUES (@Ins_ID, @Intake_ID, @Track_ID, @Branch_ID);
	BEGIN
    SELECT 'Instructor assignment added successfully.' AS ResultMessage;
	        RETURN;
    END
	END
GO
/****** Object:  StoredProcedure [dbo].[AddInstructorCourse]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------- Add_Instractor_Course ------------------------
CREATE   PROCEDURE [dbo].[AddInstructorCourse]	
    @Instructor_ID INT,
    @Course_ID INT
AS
BEGIN
    -- Check if Instructor_ID exists in Instructor table
    IF NOT EXISTS (SELECT 1 FROM Instructor WHERE ID = @Instructor_ID)
    BEGIN
        SELECT 'Instructor not found In DB' AS ResultMessage;
        RETURN;
    END

    -- Check if Course_ID exists in Course table
    IF NOT EXISTS (SELECT 1 FROM Course WHERE ID = @Course_ID)
    BEGIN
        SELECT 'Course not found In DB' AS ResultMessage;
        RETURN;
    END

    -- Check if the combination of Instructor_ID, Course_ID already exists in InstructorCourse table
    IF EXISTS (SELECT 1 FROM InstructorCourse WHERE Instructor_ID = @Instructor_ID AND Course_ID = @Course_ID)
    BEGIN
        SELECT 'Instructor is already assigned to this course.' AS ResultMessage;
        RETURN;
    END

    -- If all checks pass, insert the record into InstructorCourse table
    INSERT INTO InstructorCourse (Instructor_ID, Course_ID)
    VALUES (@Instructor_ID, @Course_ID);

    SELECT 'Instructor assigned to course successfully.' AS ResultMessage;
END

GO
/****** Object:  StoredProcedure [dbo].[AddIntake]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------------AddOneIntake -------------------

CREATE   PROCEDURE [dbo].[AddIntake]
    @IntakeName nvarchar(50)
AS
BEGIN
	IF NOT EXISTS (SELECT 1 FROM Intake WHERE Name = @IntakeName)
    BEGIN
         INSERT INTO Intake (Name)
        VALUES (@IntakeName);
        SELECT 'Intake added successfully.' AS ResultMessage;
    END
    ELSE
    BEGIN
        SELECT 'Intake name already exists in the database.' AS ResultMessage;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[AddOneOrMoreBranche]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 -------------------------------------AddOneOrMoreBranch---------------------
 
create   proc [dbo].[AddOneOrMoreBranche]
    @BranchNames nvarchar(MAX)
as
begin
    create table #TempBranches
    (
        BranchName nvarchar(50)
    );
    insert into #TempBranches (BranchName)
    select value FROM STRING_SPLIT(@BranchNames, ',');
    if EXISTS (
        select 1
        from #TempBranches t
        where EXISTS (
            select 1
            from Branch B
            where B.Name = t.BranchName
        )
    )
    begin
        select distinct
            'The ' + t.BranchName + ' is already exist in the database' AS ResultMessage
        from #TempBranches t
        where EXISTS (
            select 1
            from Branch B
           where B.Name = t.BranchName
        );
    end
    else
    begin
        insert into Branch (Name)
        select  t.BranchName
        from #TempBranches t
        where NOT EXISTS (
            select 1
            from Branch B
            where B.Name = t.BranchName
        );

        SELECT 'Branches added successfully.' AS ResultMessage;
    END;
    DROP TABLE #TempBranches;
END;
GO
/****** Object:  StoredProcedure [dbo].[AddQuestion]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------------------AddNewquestion--------------------------

CREATE   PROC [dbo].[AddQuestion]
    @Text_Questions NVARCHAR(MAX) = NULL,
    @Correct_Answer_Text_Questions NVARCHAR(MAX) = NULL,
    @True_or_False_Questions NVARCHAR(MAX) = NULL,
    @Correct_Answer_True_or_False BIT = NULL,
    @Choose_An_Answer_Question NVARCHAR(MAX) = NULL,
    @Correct_Answer_Choose_Question NVARCHAR(1) = NULL,
    @Course_Id INT = NULL,
    @Questions_ID INT OUTPUT
AS
BEGIN
    BEGIN TRY
        -- Check if the ID already exists
        IF NOT EXISTS (SELECT 1 FROM Question WHERE Questions_ID = @Questions_ID)
        BEGIN
            INSERT INTO Question (Questions_ID, Text_Questions, Correct_Answer_Text_Questions, 
                                  True_or_False_Questions, Correct_Answer_True_or_False, 
                                  Choose_An_Answer_Question, Correct_Answer_Choose_Question, 
                                  Course_Id)
            VALUES (@Questions_ID, @Text_Questions, @Correct_Answer_Text_Questions, 
                    @True_or_False_Questions, @Correct_Answer_True_or_False, 
                    @Choose_An_Answer_Question, @Correct_Answer_Choose_Question, 
                    @Course_Id);

            SELECT 'Question added successfully.' AS ResultMessage;
        END
        ELSE
        BEGIN
            SELECT 'Error: Question ID already exists in the database.' AS ResultMessage;
        END;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH;
END;

GO
/****** Object:  StoredProcedure [dbo].[AddQuestionToExamManually_Proc]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--3- add questions to the pre created exam in step 1 from pool displayed in step 2 
------------------------------------------
 create   proc [dbo].[AddQuestionToExamManually_Proc]
				@Instructor_ID int,
				@Exam_ID int,
				@Question_ID int,
				@Question_Type char(4),
				@Question_Grade int
as
begin
	IF @Instructor_ID <= 0 or @Exam_ID <= 0 or @Question_ID <= 0 or @Question_Grade <= 0 or @Instructor_ID <= 0 or @Exam_ID is null or @Question_ID is null or @Question_Grade is null or @Question_Type is null
		BEGIN
			SELECT 'Invalid input.' AS ResultMessage
			RETURN
		END
	else if @Question_Type not in ('Text','MCQ','TF')
	begin
			SELECT 'Question Type must be Text, MCQ or TF' AS ResultMessage
			RETURN
	end
	else if not exists(select 1 from Exam where ID = @Exam_ID)
		begin
			SELECT 'Exam does not exist.' AS ResultMessage
			RETURN
		end
	else if not exists(select 1 from Instructor where ID = @Instructor_ID)
	begin
		SELECT 'Instructor does not exist.' AS ResultMessage
		RETURN
	end
	else if not exists(select 1 from Question where Questions_ID = @Question_ID)
	begin
		SELECT 'Question does not exist.' AS ResultMessage
		RETURN
	end
	else if not exists
	(select q.Questions_ID from Question q inner join InstructorCourse ic
	on q.Course_Id = ic.Course_ID
	where q.Questions_ID = @Question_ID and ic.Instructor_ID = @Instructor_ID) 
		--= @Question_ID
	begin
		SELECT 'Question in question pool does not belong to that course.' AS ResultMessage
		RETURN
	end
	else if (select distinct i.ID
	from Instructor i inner join InstructorCourse ic
	on i.ID = ic.Instructor_ID
	inner join Course c
	on ic.Course_ID = c.ID
	inner join CourseExam ce
	on ce.Course_ID = c.ID
	where ce.Exam_ID = @Exam_ID)
	!= @Instructor_ID
	--checking if the course(which the exam belongs to) is teached by that instructor (if exists)
	begin
		SELECT 'exam id or instructor id or both are wrong' AS ResultMessage
		Return
	end
	declare @Course_MaxDegree int
	declare @Exam_TotalDegree int
	select top 1 @Course_MaxDegree= c.MaxDegree from Course c
	inner join CourseExam ce
	on c.ID = ce.Course_ID
	select @Exam_TotalDegree = TotalDegree -- TotalDegree=105
	from Exam
	where ID = @Exam_ID
	if @Exam_TotalDegree = @Course_MaxDegree
	begin
		select 'Course Max Degree = Exam Total Degrees you cannot add more questions'
		RETURN
	end
	else if @Exam_TotalDegree + @Question_Grade > @Course_MaxDegree
		begin
			select 'Question not added! Exam total degrees exceeded course max degrees please re-assign the question with appropriate degree'
			RETURN
		end
	else if exists
		(select 1 from ExamQuestion where Exam_ID = @Exam_ID and Question_ID = @Question_ID)
		 begin
			SELECT 'This Question is already added in the Exam' AS ResultMessage
			RETURN
		 end
	ELSE
	BEGIN
		insert into ExamQuestion
		values (@Exam_ID, @Question_ID, @Question_Type, @Question_Grade)
		--increase number of questions & total degrees in Exam table after inserting new Question
		update Exam  
		set NumberOfQuestions = NumberOfQuestions +1, TotalDegree = TotalDegree + @Question_Grade
		where ID = @Exam_ID
	END		
end
GO
/****** Object:  StoredProcedure [dbo].[AddStudent]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------------------------AddNewStudent------------------------

CREATE   PROCEDURE [dbo].[AddStudent]
	@ID INT,
    @FName nvarchar(15),
    @LName nvarchar(15),
    @GraduationYear char(4),
    @Email nvarchar(50),
    @Password nvarchar(50)
AS
BEGIN
	IF NOT EXISTS (SELECT 1 FROM Student WHERE Email = @Email)
    BEGIN
        IF (
		    
            @Email LIKE '%@gmail.com' OR 
            @Email LIKE '%@yahoo.com' AND
            @Password LIKE '%[A-Z]%' AND
            @Password LIKE '%[a-z]%' AND
            @Password LIKE '%[0-9]%' AND
			LEN(@Password) >= 8 AND 
            LEN(@Password) <= 25
        )
        BEGIN
            INSERT INTO Student (ID,FName, LName, GraduationYear, Email, [Password])
            VALUES (@ID,  @FName, @LName, @GraduationYear, @Email, @Password);

            SELECT 'Student added successfully.' AS ResultMessage;
        END
        ELSE
        BEGIN
            SELECT 'Invalid email or password format.' AS ResultMessage;
        END
    END
    ELSE
    BEGIN
        SELECT 'Student with the same email already exists IN database' AS ResultMessage;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[AddStudentRegistration]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------Add_Student_Branch_Intake_Track--------------
CREATE   PROCEDURE [dbo].[AddStudentRegistration]
    @Std_ID INT,
    @Intake_ID INT,
    @Track_ID INT,
    @Branch_ID INT
AS
BEGIN
    -- Check if Std_ID exists in Student table
    IF NOT EXISTS (SELECT 1 FROM Student WHERE ID = @Std_ID)
    BEGIN
        SELECT 'Student not found.' AS ResultMessage;
        RETURN;
    END

    -- Check if Std_ID exists in StudentRegisteration table
    IF EXISTS (SELECT 1 FROM StudentRegisteration WHERE Std_ID = @Std_ID)
    BEGIN
        SELECT 'Student already registered in this table.' AS ResultMessage;
        RETURN;
    END

    -- Check if Branch_ID exists in Branch table
    IF NOT EXISTS (SELECT 1 FROM Branch WHERE ID = @Branch_ID)
    BEGIN
        SELECT 'Branch not found.' AS ResultMessage;
        RETURN;
    END

    -- Check if Intake_ID exists in Intake table
    IF NOT EXISTS (SELECT 1 FROM Intake WHERE ID = @Intake_ID)
    BEGIN
        SELECT 'Intake not found.' AS ResultMessage;
        RETURN;
    END

    -- Check if Track_ID exists in Track table
    IF NOT EXISTS (SELECT 1 FROM Track WHERE ID = @Track_ID)
    BEGIN
        SELECT 'Track not found.' AS ResultMessage;
        RETURN;
    END
	    -- If all checks pass, insert the record into InstructorBelong table
    INSERT INTO StudentRegisteration(Std_ID, Intake_ID, Track_ID, Branch_ID)
    VALUES (@Std_ID, @Intake_ID, @Track_ID, @Branch_ID);
	BEGIN
    SELECT 'Student added successfully.' AS ResultMessage;
	        RETURN;
    END


END
GO
/****** Object:  StoredProcedure [dbo].[AddTracks]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------------AddOneORMoreTrack---------------
CREATE   PROC [dbo].[AddTracks]	
    @TrackNames NVARCHAR(MAX)
AS
BEGIN
    BEGIN TRY
        CREATE TABLE #TempTracks
        (
            TrackName NVARCHAR(50)
        );

        INSERT INTO #TempTracks (TrackName)
        SELECT value FROM STRING_SPLIT(@TrackNames, ',');

        IF EXISTS (
            SELECT 1
            FROM #TempTracks
            WHERE NOT EXISTS (
                SELECT 1
                FROM Track T
                WHERE T.Name = #TempTracks.TrackName
            )
        )
        BEGIN
            INSERT INTO Track (Name)
            SELECT TrackName
            FROM #TempTracks
            WHERE NOT EXISTS (
                SELECT 1
                FROM Track T
                WHERE T.Name = #TempTracks.TrackName
            );

            SELECT 'Tracks added successfully.' AS ResultMessage;
        END
        ELSE
        BEGIN
            SELECT DISTINCT
                'The following track(s) already exist in the database: ' + 
                STRING_AGG(TrackName, ', ') AS ResultMessage
            FROM #TempTracks
            WHERE EXISTS (
                SELECT 1
                FROM Track T
                WHERE T.Name = #TempTracks.TrackName
            );
        END;

        DROP TABLE #TempTracks;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[AssignExamToStudent]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   proc [dbo].[AssignExamToStudent]	
			@Instructor_ID int,
			@Exam_ID int,
			@Student_ID int
as
begin
	IF @Instructor_ID <= 0 or @Exam_ID <= 0 or @Student_ID <= 0 or @Instructor_ID is null or @Exam_ID is null or @Student_ID is null
		BEGIN
			SELECT 'Invalid input.' AS ResultMessage
			RETURN
		END
	else if not exists(select 1 from Instructor where ID = @Instructor_ID)
	begin
			SELECT 'Instructor does not exist.' AS ResultMessage
			RETURN
	end
	else if not exists(select 1 from Exam where ID = @Exam_ID)
		begin
			SELECT 'Exam does not exist.' AS ResultMessage
			RETURN
	end
	else if not exists(select 1 from Student where ID = @Student_ID)
		begin
			SELECT 'Student does not exist.' AS ResultMessage
			RETURN
		end
		else if not exists
		(select 1 from CourseExam ce inner join InstructorCourse ic
		on ce.Course_ID = ic.Course_ID
		where ce.Exam_ID = @Exam_ID and ic.Instructor_ID = @Instructor_ID) 
		begin
			SELECT 'Exam not found' AS ResultMessage
			RETURN
		end
		else if not exists
		(select 1 from StudentCourse sc
		inner join InstructorCourse ic
		on sc.Course_ID = ic.Course_ID where ic.Instructor_ID = @Instructor_ID and sc.Std_ID = @Student_ID) 
		begin
			SELECT 'Student not found' AS ResultMessage
			RETURN
		end
		else if exists (select 1 from StudentExam where Student_ID = @Student_ID and Exam_ID = @Exam_ID)
		begin
			SELECT 'Student already added in that exam' AS ResultMessage
			RETURN
		end
		insert into StudentExam(Student_ID, Exam_ID)
		values(@Student_ID, @Exam_ID)
		select 'Student Added to Exam Successfully!' as ResultMessage
end
GO
/****** Object:  StoredProcedure [dbo].[CorrectExamForStudent]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[CorrectExamForStudent] 
    @std_id INT, 
    @exam_id INT
AS
BEGIN
    -- Data validation: Check if @std_id and @exam_id are greater than zero
   	IF @std_id <= 0 OR @exam_id <= 0
    BEGIN
        SELECT 'Invalid input. Student ID and Exam ID must be greater than zero.' AS ResultMessage
        RETURN
    END

    -- Data validation: Check if @std_id exists in the Student table
    IF NOT EXISTS (SELECT 1 FROM Student WHERE ID = @std_id)
    BEGIN
        SELECT 'Student ID does not exist in the database.' AS ResultMessage
        RETURN
    END

    -- Data validation: Check if @exam_id exists in the Exam table
    ELSE IF NOT EXISTS (SELECT 1 FROM Exam WHERE ID = @exam_id)
    BEGIN
        SELECT 'Exam ID does not exist in the database.' AS ResultMessage
        RETURN
    END
    ELSE
    BEGIN
        -- Create a temporary table to hold student exam results
        CREATE TABLE #tmpExamResults(
            [Std_ID] [int] NOT NULL,
            [Exam_ID] [int] NOT NULL,
            [Questions_result] [int] NULL,
            [Std_Answer_Text_Question] [nvarchar](max) NULL,
            [Std_Answer_Choose_Question] [nvarchar](1) NULL,
            [Std_Answer_True_or_False] [bit] NULL,
            [Questions_Id] [int] NOT NULL
        )

        -- Insert student exam results into the temporary table
        INSERT INTO #tmpExamResults 
        SELECT * FROM StudentExamQuestions WHERE Std_ID = @std_id AND Exam_ID = @exam_id

        -- Loop over each row in the temporary table
        DECLARE @questionId INT
        DECLARE @textAnswer NVARCHAR(MAX)
        DECLARE @chooseAnswer NVARCHAR(1)
        DECLARE @trueFalseAnswer BIT
        DECLARE @correctTextAnswer NVARCHAR(MAX)
        DECLARE @correctChooseAnswer NVARCHAR(1)
        DECLARE @correctTrueFalseAnswer BIT
        DECLARE @questionsResult INT = 0

        DECLARE examCursor CURSOR FOR 
        SELECT tr.Questions_Id, tr.Std_Answer_Text_Question, tr.Std_Answer_Choose_Question, 
            tr.Std_Answer_True_or_False, q.Correct_Answer_Text_Questions, 
            q.Correct_Answer_Choose_Question, q.Correct_Answer_True_or_False, tr.Questions_result
        FROM #tmpExamResults tr
        INNER JOIN Question q ON tr.Questions_Id = q.Questions_ID

        OPEN examCursor
        FETCH NEXT FROM examCursor INTO @questionId, @textAnswer, @chooseAnswer, @trueFalseAnswer,
            @correctTextAnswer, @correctChooseAnswer, @correctTrueFalseAnswer, @questionsResult

        WHILE @@FETCH_STATUS = 0
        BEGIN
            -- Fetch question grade from ExamQuestion table
            DECLARE @questionGrade INT
            SELECT @questionGrade = QuestionGrade
            FROM ExamQuestion
            WHERE Exam_ID = @exam_id AND Question_ID = @questionId

            -- Your logic for calculating the score goes here
            -- Example: Accumulate scores for each question and add the question grade
            IF @textAnswer IS NOT NULL AND (@textAnswer LIKE '%' + @correctTextAnswer + '%' OR @textAnswer LIKE '%[^a-zA-Z]'+ @correctTextAnswer + '[^a-zA-Z]%')
                SET @questionsResult = @questionsResult + @questionGrade
            ELSE IF @chooseAnswer IS NOT NULL AND @chooseAnswer = @correctChooseAnswer
                SET @questionsResult = @questionsResult +  @questionGrade
            ELSE IF @trueFalseAnswer IS NOT NULL AND @trueFalseAnswer = @correctTrueFalseAnswer
                SET @questionsResult = @questionsResult + @questionGrade
            ELSE
                SET @questionsResult = 0 -- Set the question grade if none of the conditions match

            -- Update the question result
            UPDATE StudentExamQuestions SET Questions_result = @questionsResult 
            WHERE Std_ID = @std_id AND Exam_ID = @exam_id AND Questions_Id = @questionId

            FETCH NEXT FROM examCursor INTO @questionId, @textAnswer, @chooseAnswer, @trueFalseAnswer,
                @correctTextAnswer, @correctChooseAnswer, @correctTrueFalseAnswer, @questionsResult
        END

        CLOSE examCursor
        DEALLOCATE examCursor
        -- Drop the temporary table
        DROP TABLE #tmpExamResults
	END
END

--0
--10
--10
--0
GO
/****** Object:  StoredProcedure [dbo].[CourseTrackBranchIntake_proC]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------(10) CourseTrackBranchIntake By Exam_ID  --------------------------
CREATE   PROCEDURE [dbo].[CourseTrackBranchIntake_proC] (@examID INT)
AS
BEGIN
    IF NOT EXISTS (SELECT ID FROM Exam WHERE ID = @examID)
    BEGIN
        SELECT 'Exam ID you have entered does not exist'
    END
    ELSE
    BEGIN
        SELECT C.Name AS 'Course Name', T.Name AS 'Track Name', B.Name AS 'Branch Name', I.Name AS 'Intake Name'
        FROM Course C
        INNER JOIN CourseExam CE ON C.ID = CE.Course_ID
        INNER JOIN Exam E ON E.ID = CE.Exam_ID
        INNER JOIN InstructorCourse IC ON C.ID = IC.Course_ID
        INNER JOIN Instructor INS ON IC.Instructor_ID = INS.ID
        INNER JOIN InstructorBelong IB ON INS.ID = IB.Ins_ID
        INNER JOIN Track T ON IB.Track_ID = T.ID
        INNER JOIN Intake I ON IB.Intake_ID = I.ID
        INNER JOIN Branch B ON IB.Branch_ID = B.ID
        WHERE E.ID = @examID
    END
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteAssignedStudentExam]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   proc [dbo].[DeleteAssignedStudentExam]	
			@Instructor_ID int,
			@Exam_ID int,
			@Student_ID int
as
begin
	IF @Instructor_ID <= 0 or @Exam_ID <= 0 or @Student_ID <= 0 or  @Instructor_ID is null or @Exam_ID is null or @Student_ID is null
		BEGIN
			SELECT 'Invalid input.' AS ResultMessage
			RETURN
		END
	else if not exists(select * from Instructor where ID = @Instructor_ID)
	begin
			SELECT 'Instructor does not exist.' AS ResultMessage
			RETURN
	end
	else if not exists(select * from Exam where ID = @Exam_ID)
		begin
			SELECT 'Exam does not exist.' AS ResultMessage
			RETURN
	end
	else if not exists(select * from Student where ID = @Student_ID)
		begin
			SELECT 'Student does not exist.' AS ResultMessage
			RETURN
		end
		else if not exists
		(select ce.Exam_ID from CourseExam ce inner join InstructorCourse ic
		on ce.Course_ID = ic.Course_ID
		where ce.Exam_ID = @Exam_ID and ic.Instructor_ID = @Instructor_ID) 
		begin
			SELECT 'Exam not found' AS ResultMessage
			RETURN
		end
		else if not exists
		(select sc.Std_ID from StudentCourse sc
		inner join InstructorCourse ic
		on sc.Course_ID = ic.Course_ID where ic.Instructor_ID = @Instructor_ID and sc.Std_ID = @Student_ID) 
		begin
			SELECT 'Student not found' AS ResultMessage
			RETURN
		end
		else if not exists (select 1 from StudentExam where Student_ID = @Student_ID and Exam_ID = @Exam_ID)
		begin
			SELECT 'Student already not in that exam' AS ResultMessage
			RETURN
		end
		delete from StudentExam
		where Student_ID = @Student_ID and Exam_ID = @Exam_ID
		IF NOT EXISTS (SELECT 1 FROM StudentExam WHERE Student_ID = @Student_ID AND Exam_ID = @Exam_ID)
		BEGIN
			SELECT 'Student Deleted from Exam Successfully!' AS ResultMessage
		END
		ELSE
		BEGIN
			SELECT 'Deletion failed for some reason.' AS ResultMessage
		END
end

GO
/****** Object:  StoredProcedure [dbo].[DeleteBranch]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


	

-----------------------------Delete Branch-------------

CREATE   PROCEDURE [dbo].[DeleteBranch]
    @BranchID INT
AS
BEGIN
	IF EXISTS (SELECT 1 FROM Branch WHERE ID = @BranchID)
    BEGIN
        DELETE FROM Branch
        WHERE ID = @BranchID;

        SELECT 'Branch deleted successfully.' AS ResultMessage;
    END
    ELSE
    BEGIN
        SELECT 'Branch not found In data base' AS ResultMessage;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteCourse]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


----------------------------Delete Course-------------

CREATE   PROCEDURE [dbo].[DeleteCourse]	
    @CourseID nvarchar(50)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM Course WHERE ID= @CourseID)
    BEGIN
        DELETE FROM Course
        WHERE ID = @CourseID;

        SELECT 'Course deleted successfully.' AS ResultMessage;
    END
    ELSE
    BEGIN
        SELECT 'Course not found iN data base' AS ResultMessage;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteCourseExam_Proc]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------------------------------------------------------------------------
--Delete Exam --Alpha
create   proc [dbo].[DeleteCourseExam_Proc] 
	@Instructor_ID int,
	@Course_ID int,
	@Exam_ID int
as
begin
	IF @Instructor_ID <= 0 or @Course_ID <= 0 or @Exam_ID <= 0 or @Instructor_ID is null or @Course_ID is null or @Exam_ID is null 
		BEGIN
			SELECT 'Invalid input.' AS ResultMessage
			RETURN
		END
	else if not exists(select * from Course where ID = @Course_ID)
		begin
			SELECT 'Course does not exist.' AS ResultMessage
			RETURN
		end
		else if not exists(select * from Instructor where ID = @Instructor_ID)
		begin
			SELECT 'Instructor does not exist.' AS ResultMessage
			RETURN
		end
		else if not exists(select * from Exam where ID = @Exam_ID)
		begin
			SELECT 'Exam does not exist.' AS ResultMessage
			RETURN
		end
	else if (select distinct i.ID
		from Instructor i inner join InstructorCourse ic
		on i.ID = ic.Instructor_ID
		inner join Course c
		on ic.Course_ID = c.ID
		where c.ID = @Course_ID)
		!= @Instructor_ID
		begin 
			SELECT 'course id or instructor id or both are wrong' AS ResultMessage
			Return
		end
		else if not exists
		(select ce.Exam_ID from CourseExam ce inner join InstructorCourse ic
		on ce.Course_ID = ic.Course_ID
		where ce.Exam_ID = @Exam_ID and ic.Instructor_ID = @Instructor_ID) 
		begin
			SELECT 'Exam not found' AS ResultMessage
			RETURN
		end
	--else if exists(select top 1 from StudentExam where Exam_ID = @Exam_ID)
	--begin
	--	SELECT 'Exam is already assigned to some students YOU CAN NOT DELETE IT! remove the students first from the exam then delete it' AS ResultMessage
	--	Return
	--end
	delete from Exam where ID = @Exam_ID
end

GO
/****** Object:  StoredProcedure [dbo].[DeleteExam]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Delete Procedure to Remove an Exam:
CREATE   PROCEDURE [dbo].[DeleteExam]
    @ExamID INT
AS
BEGIN
    DELETE FROM Exam
    WHERE ID = @ExamID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteInstructorBelong]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-------------------------------------Delete_Instractor_Branch_Intake_Track------------------------------
CREATE   PROCEDURE [dbo].[DeleteInstructorBelong]
    @Ins_ID INT
AS
BEGIN
    -- Check if Std_ID exists in InstructorBelong table
    IF NOT EXISTS (SELECT 1 FROM InstructorBelong WHERE Ins_ID = @Ins_ID)
    BEGIN
        SELECT 'Instractor not found in InstructorBelong' AS ResultMessage;
        RETURN;
    END

    -- Perform the DELETE operation
    DELETE FROM InstructorBelong
    WHERE Ins_ID = @Ins_ID;

    SELECT 'Instructor Belong deleted successfully.' AS ResultMessage;
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteInstructorByID]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


----------------------------Delete Instructor-------------

CREATE   PROCEDURE [dbo].[DeleteInstructorByID]	
    @InstructorID int
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Instructor WHERE ID = @InstructorID)
    BEGIN
        DELETE FROM Instructor
        WHERE ID = @InstructorID;

        SELECT 'Instructor deleted successfully.' AS ResultMessage;
    END
    ELSE
    BEGIN
        SELECT 'Instructor not found IN data base' AS ResultMessage;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteInstructorCourse]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-------------------------------DELETE_Instractor_Course-----------------------
CREATE   PROCEDURE [dbo].[DeleteInstructorCourse]	
    @Instructor_ID INT,
    @Course_ID INT
AS
BEGIN
    -- Check if Instructor_ID exists in InstructorCourse table
    IF NOT EXISTS (SELECT 1 FROM InstructorCourse WHERE Instructor_ID = @Instructor_ID)
    BEGIN
        SELECT 'Instructor does not teach any course' AS ResultMessage;
        RETURN;
    END

    -- Check if Course_ID exists in Course table
    IF NOT EXISTS (SELECT 1 FROM InstructorCourse WHERE Course_ID = @Course_ID)
    BEGIN
        SELECT 'The specified course is not associated with any instructor.' AS ResultMessage;
        RETURN;
    END

    -- Check if the combination of Instructor_ID, Course_ID exists in InstructorCourse table
    IF NOT EXISTS (SELECT 1 FROM InstructorCourse WHERE Instructor_ID = @Instructor_ID AND Course_ID = @Course_ID)
    BEGIN
        SELECT 'Instructor does not teach this course.' AS ResultMessage;
        RETURN;
    END

    -- If all checks pass, perform the DELETE operation
    DELETE FROM InstructorCourse
    WHERE Instructor_ID = @Instructor_ID AND Course_ID = @Course_ID;

    SELECT 'Instructor course deleted successfully.' AS ResultMessage;
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteIntake]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


----------------------------Delete Intake-------------

CREATE   PROCEDURE [dbo].[DeleteIntake]
    @IntakeID nvarchar(50)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM Intake WHERE ID = @IntakeID)
    BEGIN
        DELETE FROM Intake
        WHERE ID = @IntakeID;

        SELECT 'Intake deleted successfully.' AS ResultMessage;
    END
    ELSE
    BEGIN
        SELECT 'Intake not found In data base' AS ResultMessage;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteQuestion]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


----------------------------Delete Question-------------

CREATE   PROCEDURE [dbo].[DeleteQuestion]
    @QuestionID int
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Question WHERE Questions_ID = @QuestionID)
    BEGIN
        DELETE FROM Question
        WHERE Questions_ID = @QuestionID;

        SELECT 'Question deleted successfully.' AS ResultMessage;
    END
    ELSE
    BEGIN
        SELECT 'Question not found IN data base' AS ResultMessage;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteQuestion_Proc]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------------------------------------------
--delete question

create   proc [dbo].[DeleteQuestion_Proc]
				@Instructor_ID int,
				@Exam_ID int,
				@Question_ID int
as
begin
	IF @Instructor_ID <= 0 or @Exam_ID <= 0 or @Question_ID <= 0 or @Instructor_ID is null or @Exam_ID is null or @Question_ID is null
		BEGIN
			SELECT 'Invalid input.' AS ResultMessage
			RETURN
		END
	else if not exists(select * from Exam where ID = @Exam_ID)
		begin
			SELECT 'Exam does not exist.' AS ResultMessage
			RETURN
		end
		else if not exists(select * from Instructor where ID = @Instructor_ID)
		begin
			SELECT 'Instructor does not exist.' AS ResultMessage
			RETURN
		end
		else if not exists(select * from Question where Questions_ID = @Question_ID)
		begin
			SELECT 'Question does not exist.' AS ResultMessage
			RETURN
		end
		else if not exists
		(select q.Questions_ID from Question q inner join InstructorCourse ic
		on q.Course_Id = ic.Course_ID
		where q.Questions_ID = @Question_ID and ic.Instructor_ID = @Instructor_ID) 
		--= @Question_ID
		begin
			SELECT 'Question in question pool does not belong to that course.' AS ResultMessage
			RETURN
		end
		else if (select distinct i.ID
		from Instructor i inner join InstructorCourse ic
		on i.ID = ic.Instructor_ID
		inner join Course c
		on ic.Course_ID = c.ID
		inner join CourseExam ce
		on ce.Course_ID = c.ID
		where ce.Exam_ID = @Exam_ID)
		!= @Instructor_ID
	--checking if the course(which the exam belongs to) is teached by that instructor (if exists)
		begin
			SELECT 'exam id or instructor id or both are wrong' AS ResultMessage
			Return
		end
		else if not exists(select * from ExamQuestion where Question_ID = @Question_ID and Exam_ID = @Exam_ID)
		begin
			SELECT 'Question does not exist in the exam.' AS ResultMessage
			RETURN
		end
	declare @Exam_TotalDegree int
	select @Exam_TotalDegree = TotalDegree -- TotalDegree
	from Exam
	where ID = @Exam_ID
	declare @Deleted_Question_Grade int
				select @Deleted_Question_Grade = QuestionGrade from ExamQuestion
				where Question_ID = @Question_ID and Exam_ID = @Exam_ID
	if @Deleted_Question_Grade != 0 or @Deleted_Question_Grade is not null
	begin
		update Exam  
		set TotalDegree = @Exam_TotalDegree - @Deleted_Question_Grade
		where ID = @Exam_ID
	end --if grade = 0 or null exam total degrees won't be changed, if grade = 0, null or number the question will be delted from exam question anyway
	delete from ExamQuestion where Exam_ID = @Exam_ID and Question_ID = @Question_ID
	select 'Question deleted Succefully!' as ResultMessage
end

GO
/****** Object:  StoredProcedure [dbo].[DeleteStudent]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


----------------------------Delete student-------------

CREATE   PROCEDURE [dbo].[DeleteStudent]	
    @StudentID int
AS
BEGIN
	IF EXISTS (SELECT 1 FROM Student WHERE ID = @StudentID)
    BEGIN
        DELETE FROM Student
        WHERE ID = @StudentID;

        SELECT 'Student deleted successfully.' AS ResultMessage;
    END
    ELSE
    BEGIN
        SELECT 'Student not found In database' AS ResultMessage;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteStudentRegistration]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--------------------------DeleteStudentRegistration----------------------------------
CREATE   PROCEDURE [dbo].[DeleteStudentRegistration]
    @Std_ID INT
AS
BEGIN
    -- Check if Std_ID exists in StudentRegisteration table
	IF NOT EXISTS (SELECT 1 FROM StudentRegisteration WHERE Std_ID = @Std_ID)
    BEGIN
        SELECT 'Student not found in StudentRegisteration.' AS ResultMessage;
        RETURN;
    END

    -- Perform the DELETE operation
    DELETE FROM StudentRegisteration
    WHERE Std_ID = @Std_ID;

    SELECT 'Student registration deleted successfully.' AS ResultMessage;
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteTrack]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


----------------------------Delete Track---------------

CREATE   PROCEDURE [dbo].[DeleteTrack]
    @TrackID nvarchar(50)
AS
BEGIN
IF EXISTS (SELECT 1 FROM Track WHERE ID = @TrackID)
    BEGIN
        DELETE FROM Track
        WHERE ID = @TrackID;

        SELECT 'Track deleted successfully.' AS ResultMessage;
    END
    ELSE
    BEGIN
        SELECT 'Track not found In data base' AS ResultMessage;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[EditGradeOfQuestion_Proc]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Edit Question Grade
create   proc [dbo].[EditGradeOfQuestion_Proc]
				@Instructor_ID int,
				@Exam_ID int,
				@Question_ID int,
				@Question_Grade int
as
begin
	IF @Instructor_ID <= 0 or @Exam_ID <= 0 or @Question_ID <= 0 or @Question_Grade <= 0 or @Instructor_ID is null or @Exam_ID is null or @Question_ID is null or @Question_Grade is null
		BEGIN
			SELECT 'Invalid input.' AS ResultMessage
			RETURN
		END
	else if not exists(select * from Exam where ID = @Exam_ID)
		begin
			SELECT 'Exam does not exist.' AS ResultMessage
			RETURN
		end
		else if not exists(select * from Instructor where ID = @Instructor_ID)
		begin
			SELECT 'Instructor does not exist.' AS ResultMessage
			RETURN
		end
		else if not exists(select * from Question where Questions_ID = @Question_ID)
		begin
			SELECT 'Question does not exist.' AS ResultMessage
			RETURN
		end
		else if not exists
		(select q.Questions_ID from Question q inner join InstructorCourse ic
		on q.Course_Id = ic.Course_ID
		where q.Questions_ID = @Question_ID and ic.Instructor_ID = @Instructor_ID) 
		--= @Question_ID
		begin
			SELECT 'Question in question pool does not belong to that course.' AS ResultMessage
			RETURN
		end
		else if not exists(select * from ExamQuestion where Question_ID = @Question_ID and Exam_ID = @Exam_ID)
		begin
			SELECT 'Question does not exist in the exam.' AS ResultMessage
			RETURN
		end
		else if (select QuestionGrade from ExamQuestion where Question_ID = @Question_ID and Exam_ID = @Exam_ID) = 0
			or (select QuestionGrade from ExamQuestion where Question_ID = @Question_ID and Exam_ID = @Exam_ID) is Null
		begin
			SELECT 'Question in question pool does not have a grade add a grade first to the question' AS ResultMessage
			RETURN
		end
		else if (select distinct i.ID
		from Instructor i inner join InstructorCourse ic
		on i.ID = ic.Instructor_ID
		inner join Course c
		on ic.Course_ID = c.ID
		inner join CourseExam ce
		on ce.Course_ID = c.ID
		where ce.Exam_ID = @Exam_ID)
		!= @Instructor_ID
	--checking if the course(which the exam belongs to) is teached by that instructor (if exists)
		begin
			SELECT 'exam id or instructor id or both are wrong' AS ResultMessage
			Return
		end
	declare @Course_MaxDegree int
	declare @Exam_OldTotalDegree int
	select top 1 @Course_MaxDegree= c.MaxDegree from Course c
	inner join CourseExam ce
	on c.ID = ce.Course_ID
	select @Exam_OldTotalDegree = TotalDegree -- TotalDegree
	from Exam
	where ID = @Exam_ID
	declare @Question_Old_Grade int
				select @Question_Old_Grade = QuestionGrade from ExamQuestion
				where Question_ID = @Question_ID and Exam_ID = @Exam_ID
	if @Exam_OldTotalDegree - @Question_Old_Grade + @Question_Grade > @Course_MaxDegree
	begin
		select 'Grade not added! Exam total degrees exceeded course max degrees please re-assign the grade'
		RETURN
	end
				update ExamQuestion 
				set QuestionGrade = @Question_Grade
				where Question_ID = @Question_ID and Exam_ID = @Exam_ID
				--setting total degrees in Exam table
				update Exam  
				set TotalDegree = @Exam_OldTotalDegree - @Question_Old_Grade + @Question_Grade
				where ID = @Exam_ID
				select 'Grade Updated Succefully!' as ResultMessage
end
GO
/****** Object:  StoredProcedure [dbo].[GenerateRandomQuestionsCourseExam_Proc]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Instructor creates an exam with random questions auto selected from the question pool (related to his course)
--1-Generating the exam and inserting the questions to it.
create   proc [dbo].[GenerateRandomQuestionsCourseExam_Proc] 
	@Instructor_ID int,
	@Course_ID int,
	@MCQ_No int,
	@TF_No int,
	@TextQ_No int,
    @StartTime DATETIME,      
    @EndTime DATETIME,
    @TotalDegree int,
    @Corrective BIT,
    @Normal BIT
as
begin
	IF @Instructor_ID <= 0 or @Course_ID <= 0 or @MCQ_No <= 0 or @TF_No <= 0 or @TextQ_No <= 0 or @TotalDegree < 0 or @Instructor_ID is null or @Course_ID is null or @MCQ_No is null or @TF_No is null or @TextQ_No is null or @TotalDegree is null or @Normal is null or @Corrective is null
		BEGIN
			SELECT 'Invalid input.' AS ResultMessage
			RETURN
		END
	ELSE IF @StartTime < GETDATE() or @EndTime < GETDATE()
		BEGIN
			SELECT 'Date is not incorrect.' AS ResultMessage
			RETURN
    END
	ELSE IF  @EndTime < @StartTime 
		BEGIN
			SELECT 'Date is not incorrect.' AS ResultMessage
			RETURN
    END
	ELSE IF @Corrective = 1 and @Normal = 1
		BEGIN
			SELECT 'Exam must be corrective or normal not both.' AS ResultMessage
			RETURN
    END
	else if not exists(select * from Course where ID = @Course_ID)
		begin
			SELECT 'Course does not exist.' AS ResultMessage
			RETURN
		end
		else if not exists(select * from Instructor where ID = @Instructor_ID)
		begin
			SELECT 'Instructor does not exist.' AS ResultMessage
			RETURN
		end
	else if (select distinct i.ID
			from Instructor i inner join InstructorCourse ic
			on i.ID = ic.Instructor_ID
			inner join Course c
			on ic.Course_ID = c.ID
			where c.ID = @Course_ID)
			!= @Instructor_ID
		--checking if this course is teached by that instructor (if exists)
		begin
			SELECT 'course id or instructor id or both are wrong' AS ResultMessage
			Return;
		end
			declare @NewExam_ID int 
			SELECT TOP 1 @NewExam_ID = ID + 1 FROM Exam ORDER BY ID DESC --get the last exam id and increments it by 1 as the new exam id
			--select @NewExam_ID
			 INSERT INTO Exam (ID,NumberOfQuestions, StartTime, EndTime, TotalDegree, Corrective, Normal)
				VALUES (@NewExam_ID ,@TextQ_No + @MCQ_No + @TF_No, @StartTime, @EndTime, @TotalDegree, @Corrective, @Normal)
				INSERT INTO CourseExam VALUES(@Course_ID, @NewExam_ID)
			--declare @Count int
			--set @Count = @TextQ_No
			while @TextQ_No > 0
			begin
				set @TextQ_No = @TextQ_No -1
				insert into ExamQuestion (Exam_ID, Question_ID, QuestionType)
				select top 1 @NewExam_ID, Questions_ID, 'Text' from Question t1
				where t1.Course_Id = @Course_ID and
					NOT EXISTS( SELECT 1
								FROM ExamQuestion t2
								WHERE t2.Exam_ID = @NewExam_ID
									  AND t2.Question_ID = t1.Questions_ID) --preventing duplicate exam_question insert
				ORDER BY NEWID();
			end
			while @MCQ_No > 0 
			begin
				set @MCQ_No = @MCQ_No -1
				insert into ExamQuestion (Exam_ID, Question_ID, QuestionType) 
				select top 1 @NewExam_ID, Questions_ID, 'MCQ' from Question t1
				where t1.Course_Id = @Course_ID and
					NOT EXISTS( SELECT 1
								FROM ExamQuestion t2
								WHERE t2.Exam_ID = @NewExam_ID
									  AND t2.Question_ID = t1.Questions_ID)
				ORDER BY NEWID()
			end
			while @TF_No > 0
			begin
				set @TF_No = @TF_No -1
				insert into ExamQuestion (Exam_ID, Question_ID, QuestionType)
				select top 1 @NewExam_ID, Questions_ID, 'TF' from Question t1
				where t1.Course_Id = @Course_ID and
					NOT EXISTS( SELECT 1
								FROM ExamQuestion t2
								WHERE t2.Exam_ID = @NewExam_ID
									  AND t2.Question_ID = t1.Questions_ID)
				ORDER BY NEWID()
			end
			insert into StudentExam(Exam_ID, Student_ID) 
			select ce.Exam_ID ,sc.Std_ID from StudentCourse sc
			inner join CourseExam ce
			on ce.Course_ID = sc.Course_ID
			where sc.Course_ID = @Course_ID and ce.Exam_ID = @NewExam_ID
			SELECT cast(@NewExam_ID as varchar(max)) + ' is the Exam number you can use to specify each Question Grade' AS ResultMessage 
end

GO
/****** Object:  StoredProcedure [dbo].[GetAllExams]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Getting All Exams:
CREATE   PROCEDURE [dbo].[GetAllExams]
AS
BEGIN
    SELECT *
    FROM Exam
END

GO
/****** Object:  StoredProcedure [dbo].[GetExamDetails]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Read Procedure to Get Exam Details:
CREATE   PROCEDURE [dbo].[GetExamDetails]
    @ExamID INT
AS
BEGIN
    SELECT *
    FROM Exam
    WHERE ID = @ExamID
END
GO
/****** Object:  StoredProcedure [dbo].[GetExamDetailsWithCourseInfo]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--Getting Exam Details along with Course Information:
CREATE   PROCEDURE [dbo].[GetExamDetailsWithCourseInfo]
    @ExamID INT
AS
BEGIN
    SELECT E.*, C.[Name] AS Course_Name, C.Description AS Course_Description
    FROM Exam E
    INNER JOIN Course C ON E.ID = C.ID
    WHERE E.ID = @ExamID
END
GO
/****** Object:  StoredProcedure [dbo].[GetExamsByCourse]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--Getting Exams for a Specific Course:
CREATE   PROCEDURE [dbo].[GetExamsByCourse]
    @CourseID INT
AS
BEGIN
    SELECT *
    FROM Exam
    WHERE ID = @CourseID
END

GO
/****** Object:  StoredProcedure [dbo].[GetExamsByDateRange]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--Getting Exams within a Date Range:
CREATE   PROCEDURE [dbo].[GetExamsByDateRange]
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    SELECT *
    FROM Exam
    WHERE StartTime BETWEEN @StartDate AND @EndDate
END
GO
/****** Object:  StoredProcedure [dbo].[GetExamsWithCourseInfo]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--Retrieving Exams with Course Information:
CREATE   PROCEDURE [dbo].[GetExamsWithCourseInfo]
AS
BEGIN
    SELECT E.ID AS ExamID, E.NumberOfQuestions, E.StartTime, E.EndTime, E.TotalDegree,
           E.Corrective, E.Normal,
           C.ID AS CourseID, C.[Name] AS CourseName, C.MinDegree, C.MaxDegree, C.[Description] AS CourseDescription
    FROM Exam E
    INNER JOIN Course C ON E.ID = C.ID
END
GO
/****** Object:  StoredProcedure [dbo].[GetTotalDegreeForStudentExam]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE   PROCEDURE [dbo].[GetTotalDegreeForStudentExam]
    @student_id INT,
    @exam_id INT
AS
BEGIN
    -- Data validation: Check if @student_id and @exam_id are greater than zero
    IF @student_id <= 0 OR @exam_id <= 0
    BEGIN
        -- Return message for invalid input
        SELECT 'Invalid input. Student ID and Exam ID must be greater than zero.' AS ResultMessage
        RETURN
    END

    -- Data validation: Check if the pair (Std_ID, Exam_ID) exists in StudentExamQuestions table
    IF NOT EXISTS (SELECT 1 FROM StudentExamQuestions WHERE Std_ID = @student_id AND Exam_ID = @exam_id)
    BEGIN
        -- Return message that the pair does not exist in the StudentExamQuestions table
        SELECT 'Student ID and Exam ID pair does not exist in StudentExamQuestions table.' AS ResultMessage
        RETURN
    END

    DECLARE @totalDegree INT

    -- Calculate total degree by summing up question results
    SELECT @totalDegree = ISNULL(SUM(Questions_result), 0)
    FROM StudentExamQuestions
    WHERE Std_ID = @student_id AND Exam_ID = @exam_id

    -- Get the total degree required for passing from the Exam table
    DECLARE @totalDegreeRequired INT
    SELECT @totalDegreeRequired = ISNULL(TotalDegree / 2, 0)
    FROM Exam
    WHERE ID = @exam_id

    -- Check if the student passed or failed
    IF @totalDegree >= @totalDegreeRequired
    BEGIN
        -- Return the total degree along with a success message
        SELECT @totalDegree AS TotalDegree, 'Pass' AS ResultMessage
    END
    ELSE
    BEGIN
        -- Return the total degree along with a failure message
        SELECT @totalDegree AS TotalDegree, 'Fail' AS ResultMessage
    END
END


GO
/****** Object:  StoredProcedure [dbo].[instrucrorscourses_PROC]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------(1) Show Course TEACH by Instractor_ID--------------------------
create   PROCEDURE  [dbo].[instrucrorscourses_PROC]( @ins_id INT)
as
BEGIN
IF NOT exists(Select ID From Instructor Where ID=@ins_id)
Select 'Instructor ID You have entered not exists' 
ELSE IF NOT exists(Select Course_ID From InstructorCourse Where Course_ID=@ins_id)
Select ' Course ID not exists'
ELSE
select  I.FName AS'Instructor Name', C.Name AS'Corse Name'  
from instructor I,instructorcourse IC ,course C
where  I.ID=IC.instructor_ID AND C.ID=IC.Course_ID
 AND I.ID= @ins_id                          

END
GO
/****** Object:  StoredProcedure [dbo].[ManagerTrackBranchIntake_proc]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------(1) Show Info by TrainingManger_ID--------------------------
create   PROCEDURE [dbo].[ManagerTrackBranchIntake_proc] (@TM_id INT)
as
BEGIN
 IF NOT exists(Select ID From TrainingManager Where ID=@TM_id)
Select 'Training Manager ID You have entered not exists' 
else
select   FName+' '+LName as'TrainingManager Name' , T.Name as'Track Name',B.Name as'Branch Name',I.Name AS'Intake Name'
from  TrainingManager TM,Track T,Branch B,Intake I,TrainngManagerManage TR
WHERE  TM.ID=TR.Trainng_mannger_ID AND TR.Branch_ID=B.ID AND TR.Intake_ID=I.ID AND TR.Track_ID=T.ID
AND TM.ID=@TM_id
END
GO
/****** Object:  StoredProcedure [dbo].[SetManualQuestionsCourseExam_Proc]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Instructor select questions for the exam manually
--1- give the exam specs
create   proc [dbo].[SetManualQuestionsCourseExam_Proc] 
	@Instructor_ID int,
	@Course_ID int,
    @StartTime DATETIME,
    @EndTime DATETIME,
    @Corrective BIT,
    @Normal BIT
as
begin
	IF @Instructor_ID <= 0 or @Course_ID <= 0 or @Instructor_ID is null or @Course_ID is null or @Corrective is null or @Normal is null
		BEGIN
			SELECT 'Invalid input.' AS ResultMessage
			RETURN
		END
	ELSE IF @StartTime < GETDATE() or @EndTime < GETDATE() or  @EndTime < @StartTime or @StartTime is null or @EndTime is null
		BEGIN
			SELECT 'Date is not incorrect.' AS ResultMessage
			RETURN
    END
	ELSE IF @Corrective = 1 and @Normal = 1
		BEGIN
			SELECT 'Exam must be corrective or normal not both.' AS ResultMessage
			RETURN
    END
	else if not exists(select * from Course where ID = @Course_ID)
		begin
			SELECT 'Course does not exist.' AS ResultMessage
			RETURN
		end
		else if not exists(select * from Instructor where ID = @Instructor_ID)
		begin
			SELECT 'Instructor does not exist.' AS ResultMessage
			RETURN
		end
	else if (select distinct i.ID
		from Instructor i inner join InstructorCourse ic
		on i.ID = ic.Instructor_ID
		inner join Course c
		on ic.Course_ID = c.ID
		where c.ID = @Course_ID)
		!= @Instructor_ID
		begin 
			SELECT 'course id or instructor id or both are wrong' AS ResultMessage
			Return
		end
		--checking if this course is teached by that instructor (if exists)
			declare @NewExam_ID int 
			SELECT TOP 1 @NewExam_ID = ID + 1 FROM Exam ORDER BY ID DESC --get the last exam id and increments it by 1 as the new exam id
			--select @NewExam_ID
			 INSERT INTO Exam (ID,NumberOfQuestions, StartTime, EndTime, TotalDegree, Corrective, Normal)
				VALUES (@NewExam_ID ,0, @StartTime, @EndTime, 0, @Corrective, @Normal)
				
				INSERT INTO CourseExam VALUES(@Course_ID, @NewExam_ID)
			
			insert into StudentExam(Exam_ID, Student_ID) 
			select ce.Exam_ID ,sc.Std_ID from StudentCourse sc
			inner join CourseExam ce
			on ce.Course_ID = sc.Course_ID
			
			where sc.Course_ID = @Course_ID and ce.Exam_ID = @NewExam_ID
			SELECT cast(@NewExam_ID as varchar(max)) + ' is the Exam number you can add questions with.' AS ResultMessage 
end

GO
/****** Object:  StoredProcedure [dbo].[show_BranchIntake_proc]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------(2) Show Intake In this Branch --------------------------
create   PROCEDURE [dbo].[show_BranchIntake_proc] (@branch_name nvarchar(15))
as
BEGIN
IF NOT exists(Select Name From Branch Where Name=@branch_name)
Select ' Branch Name not exists'  
else
select B.Name AS'Branch Name',I.Name AS'Intake Name'
from Branch B,Intake I,StudentRegisteration S
WHERE  S.Branch_ID=B.ID  AND S.Track_ID=I.ID
AND B.Name=@branch_name
END
GO
/****** Object:  StoredProcedure [dbo].[show_BranchTrack_proc]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------(2) Show Tracks in this Branch --------------------------
create   PROCEDURE [dbo].[show_BranchTrack_proc] (@branch_name nvarchar(15))
as
BEGIN
IF NOT exists(Select Name From Branch Where Name=@branch_name)
Select ' Branch Name not exists' 
else
select B.Name AS'Branch Name',T.Name AS'Track Name'
from Branch B,Track T,StudentRegisteration S
WHERE  S.Branch_ID=B.ID  AND S.Track_ID=T.ID
AND B.Name=@branch_name
END
GO
/****** Object:  StoredProcedure [dbo].[show_TrackCourses_proc]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------(3) Show Course in this Track --------------------------
CREATE   PROCEDURE [dbo].[show_TrackCourses_proc] (@track_name nvarchar(50))
AS
BEGIN
    IF NOT EXISTS (SELECT Name FROM Track WHERE Name = @track_name)
    BEGIN
        SELECT 'Track Name does not exist'
    END
    ELSE
    BEGIN
        SELECT T.Name AS 'Track Name', C.Name AS 'Course Name'
        FROM Track T
        INNER JOIN StudentRegisteration S ON S.Track_ID = T.ID
        INNER JOIN Course C ON S.Std_ID = C.ID
        WHERE T.Name = @track_name
    END
END

GO
/****** Object:  StoredProcedure [dbo].[ShowBranch_IntakesAndTracks_Proc]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------(3) Show Intakes, tracks In this Branch --------------------------
create   proc [dbo].[ShowBranch_IntakesAndTracks_Proc] @Branch_Name nvarchar(max)
as
begin
if not exists(select 1 from Branch where [Name] = @Branch_Name)
begin
	Select ' Branch does not exists'  as ResultMessage
	Return
end
	else if not exists(
	select top 1 i.[Name] 'Intakes', t.[Name] 'Tracks' from Branch b
	inner join InstructorBelong ib
	on ib.Branch_ID = b.ID
	inner join Intake i 
	on i.ID = ib.Intake_ID
	inner join Track t
	on ib.Track_ID = t.ID
	where b.[Name] =@Branch_Name)
	begin
		Select ' No Trackes or Intakes Available'  as ResultMessage
		Return
	end
	else
		select distinct i.[Name] 'Intakes', t.[Name] 'Tracks' from Branch b
		inner join InstructorBelong ib
		on ib.Branch_ID = b.ID
		inner join Intake i 
		on i.ID = ib.Intake_ID
		inner join Track t
		on ib.Track_ID = t.ID
		where b.[Name] =@Branch_Name
end
GO
/****** Object:  StoredProcedure [dbo].[ShowBranchInstructors_Proc]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------(5) Show Branch Instructors --------------------------
create   proc [dbo].[ShowBranchInstructors_Proc] @Branch_Name nvarchar(max)
as begin
if not exists(select 1 from Branch where [Name] = @Branch_Name)
begin
	Select ' Branch does not exists'  as ResultMessage
	Return
end	
else if not exists 
(select 1 from Branch b inner join InstructorBelong ib 
 on b.ID = ib.Branch_ID
where b.[Name] = @Branch_Name)
begin
	Select ' No Instructors were found'  as ResultMessage
	Return
end
else
begin
	select distinct i.FName + ' ' + i.LName 'Instructors Names' from Branch b inner join InstructorBelong ib 
	 on b.ID = ib.Branch_ID
	inner join Instructor i
	on ib.Ins_ID = i.ID
	where b.[Name] = @Branch_Name
end
end
GO
/****** Object:  StoredProcedure [dbo].[ShowBranchStudents_Proc]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------(4) Show Branch Students --------------------------
create   proc [dbo].[ShowBranchStudents_Proc] @Branch_Name nvarchar(max)
as begin
if not exists(select 1 from Branch where [Name] = @Branch_Name)
begin
	Select ' Branch does not exists'  as ResultMessage
	Return
end	
else if not exists 
(select 1 from Branch b inner join StudentRegisteration 
sr on b.ID = sr.Branch_ID
where b.[Name] = @Branch_Name)
begin
	Select ' No Students were found'  as ResultMessage
	Return
end
else
begin
	select distinct s.FName + ' ' + s.LName 'Students Names' from Branch b inner join StudentRegisteration 
	sr on b.ID = sr.Branch_ID
	inner join Student s
	on sr.Std_ID = s.ID
	where b.[Name] = @Branch_Name
end
end
GO
/****** Object:  StoredProcedure [dbo].[ShowExamQuestions_Proc]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--2- Displaying the auto generated exam questions to assign a degree to each of them
create   proc [dbo].[ShowExamQuestions_Proc]
		@Instructor_ID int,
		@Exam_ID int
as
begin
IF @Instructor_ID <= 0 or @Exam_ID <= 0 or @Instructor_ID is null or @Exam_ID is null
		BEGIN
			SELECT 'Invalid input.' AS ResultMessage
			RETURN
		END
	else if not exists(select * from Exam where ID = @Exam_ID)
		begin
			SELECT 'Exam does not exist.' AS ResultMessage
			RETURN
		end
		else if not exists(select * from Instructor where ID = @Instructor_ID)
		begin
			SELECT 'Instructor does not exist.' AS ResultMessage
			RETURN
		end
		else if not exists
		(select ce.Exam_ID from CourseExam ce inner join InstructorCourse ic
		on ce.Course_ID = ic.Course_ID
		where ce.Exam_ID = @Exam_ID and ic.Instructor_ID = @Instructor_ID) 
		begin
			SELECT 'Exam not found' AS ResultMessage
			RETURN
		end
		 CREATE TABLE #tmpExamQuestions(
            Question_ID int not null,
			QuestionType char(4) not null,
			QuestionGrade int,
			QuestionBody nvarchar(max),
			CorrectAnswer nvarchar(max)
        )
		declare @Question_Type char(4)
        DECLARE @Question_ID INT
        DECLARE @QuestionGrade INT
        DECLARE @QuestionText NVARCHAR(MAX)
        DECLARE @QuestionChoose NVARCHAR(max)
        DECLARE @QuestionTF NVARCHAR(max)
        DECLARE @correctTextAnswer NVARCHAR(MAX)
        DECLARE @correctChooseAnswer NVARCHAR(max)
        DECLARE @correctTrueFalseAnswer BIT

   DECLARE examCursor CURSOR FOR 
	SELECT
		eq.Question_ID AS 'Question No',
		eq.QuestionType AS 'Question Type',
		eq.QuestionGrade AS 'Question Grade',
		q.Choose_An_Answer_Question AS 'Choose_An_Answer_Question',
		q.Correct_Answer_Choose_Question AS 'Correct_Answer_Choose_Question',
		q.Text_Questions AS 'Text_Questions',
		q.Correct_Answer_Text_Questions AS 'Correct_Answer_Text_Questions',
		q.True_or_False_Questions AS 'True_or_False_Questions',
		q.Correct_Answer_True_or_False AS 'Correct_Answer_True_or_False'
	FROM ExamQuestion eq
	INNER JOIN Question q ON eq.Question_ID = q.Questions_ID
	WHERE eq.Exam_ID = @Exam_ID;


        OPEN examCursor
        FETCH NEXT FROM examCursor INTO @Question_ID, @Question_Type, @QuestionGrade, @QuestionChoose,
            @correctChooseAnswer, @QuestionText, @correctTextAnswer, @QuestionTF, @correctTrueFalseAnswer

        WHILE @@FETCH_STATUS = 0
        BEGIN
			IF @Question_Type = 'Text'
			begin
				INSERT INTO #tmpExamQuestions (Question_ID, QuestionType, QuestionGrade, QuestionBody, CorrectAnswer)
				VALUES (@Question_ID, @Question_Type, @QuestionGrade, @QuestionText, @correctTextAnswer);
			end
			else if @Question_Type = 'TF'
			begin
			insert into #tmpExamQuestions(Question_ID, QuestionType, QuestionGrade, QuestionBody, CorrectAnswer)
			values(@Question_ID, @Question_Type, @QuestionGrade, @QuestionTF, CASE WHEN @correctTrueFalseAnswer = 1 THEN 'True' ELSE 'False' END)
			end
			else
			begin
				insert into #tmpExamQuestions(Question_ID, QuestionType, QuestionGrade, QuestionBody, CorrectAnswer)
				values(@Question_ID, @Question_Type, @QuestionGrade,@QuestionChoose, @correctChooseAnswer)
			end

           FETCH NEXT FROM examCursor INTO @Question_ID, @Question_Type, @QuestionGrade, @QuestionChoose,
            @correctChooseAnswer, @QuestionText, @correctTextAnswer, @QuestionTF, @correctTrueFalseAnswer
	     END

        CLOSE examCursor
        DEALLOCATE examCursor
		select Question_ID 'Question No',
			QuestionType 'Question Type',
			CASE WHEN QuestionGrade is null THEN 0 ELSE QuestionGrade END as 'Question Grade',
			QuestionBody 'Question Body',
			CorrectAnswer 'Correct Answer' from #tmpExamQuestions
end

GO
/****** Object:  StoredProcedure [dbo].[ShowInstructorsInSpecificBranchIntakeTrack_Proc]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------(9)  Show Instructors in specific Branch Intake Track --------------------------
create   proc [dbo].[ShowInstructorsInSpecificBranchIntakeTrack_Proc] @Branch_Name nvarchar(max), @Intake_Name nvarchar(max), @Track_Name nvarchar(max)
as begin
if not exists(select 1 from Branch where [Name] = @Branch_Name)
begin
	Select ' Branch does not exists'  as ResultMessage
	Return
end	
else if not exists(select 1 from Track where [Name] = @Track_Name)
begin
	Select ' Track does not exists'  as ResultMessage
	Return
end	
else if not exists(select 1 from Intake where [Name] = @Intake_Name)
begin
	Select ' Intake does not exists'  as ResultMessage
	Return
end
else if not exists 
(select 1 from Branch b inner join InstructorBelong 
ib on b.ID = ib.Branch_ID
inner join Intake i on ib.Intake_ID = i.ID
inner join Track t on ib.Track_ID = t.ID
where b.[Name] = @Branch_Name and t.[Name] = @Track_Name and i.[Name] = @Intake_Name)
begin
	Select ' No Instructors were found'  as ResultMessage
	Return
end
else
begin
	select inst.FName + ' ' + inst.LName 'Instructors Names' from Branch b inner join InstructorBelong 
	ib on b.ID = ib.Branch_ID
	inner join Intake i on ib.Intake_ID = i.ID
	inner join Track t on ib.Track_ID = t.ID
	inner join Instructor inst on inst.ID = ib.Ins_ID
	where b.[Name] = @Branch_Name and t.[Name] = @Track_Name and i.[Name] = @Intake_Name
end
end
GO
/****** Object:  StoredProcedure [dbo].[ShowQuestionPoolForInstructorCourse]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--2- show questions available for that exam (that belongs to a specific course)
create   proc [dbo].[ShowQuestionPoolForInstructorCourse]
			@Instructor_ID int,
			@Course_ID int
as
begin
	IF @Instructor_ID <= 0 or @Course_ID <= 0 or @Instructor_ID is null or @Course_ID is null
		BEGIN
			SELECT 'Invalid input.' AS ResultMessage
			RETURN
		END
	else if not exists(select * from Course where ID = @Course_ID)
		begin
			SELECT 'Course does not exist.' AS ResultMessage
			RETURN
		end
		else if not exists(select * from Instructor where ID = @Instructor_ID)
		begin
			SELECT 'Instructor does not exist.' AS ResultMessage
			RETURN
		end
	if (select distinct i.ID
		from Instructor i inner join InstructorCourse ic
		on i.ID = ic.Instructor_ID
		inner join Course c
		on ic.Course_ID = c.ID
		where c.ID = @Course_ID)
		!= @Instructor_ID
		begin
			SELECT 'course id or instructor id or both are wrong' AS ResultMessage
			RETURN
		end
			select Questions_ID 'Question No', Text_Questions 'Text Question with that no', Correct_Answer_Text_Questions 'Text Question Answer', True_or_False_Questions 'True or false Question with that no', 
			CASE WHEN Correct_Answer_True_or_False = 1 THEN 'True' ELSE 'False' END as 'True or false answer'
			, Choose_An_Answer_Question 'MCQ Question with that no', Correct_Answer_Choose_Question 'MCQ Answer'
			from Question where Course_Id = @Course_ID
end
GO
/****** Object:  StoredProcedure [dbo].[ShowStudentCourseExams_Proc]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Show Student Course Exams
create   proc [dbo].[ShowStudentCourseExams_Proc]
		@Student_ID int,
		@Course_ID int
as
begin
	IF @Student_ID <= 0 or @Course_ID <= 0 or @Student_ID is null or @Course_ID is null
		BEGIN
			SELECT 'Invalid input.' AS ResultMessage
			RETURN
		END
	else if not exists(select * from Student where ID = @Student_ID)
		begin
			SELECT 'Student does not exist.' AS ResultMessage
			RETURN
		end
		else if not exists(select * from Course where ID = @Course_ID)
		begin
			SELECT 'Course does not exist.' AS ResultMessage
			RETURN
		end
		else if not exists
		(select 1 from Student s inner join StudentCourse sc
		on s.ID = sc.Std_ID 
		inner join Course c
		on c.ID = sc.Course_ID
		where sc.Course_ID = @Course_ID and sc.Std_ID = @Student_ID
		)
		begin
			SELECT 'Course not found' AS ResultMessage
			RETURN
		end
		select e.ID 'Exam No', e.NumberOfQuestions 'Number of Questions' , e.StartTime 'Start Time', e.EndTime 'End Time'
		from CourseExam ce 
		inner join Exam e
		on ce.Exam_ID = e.ID 
		where ce.Course_ID = @Course_ID 
end
GO
/****** Object:  StoredProcedure [dbo].[ShowStudentsInSpecificBranchIntakeTrack_Proc]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------(8) Show Students in specific Branch Intake Track --------------------------
create   proc [dbo].[ShowStudentsInSpecificBranchIntakeTrack_Proc] @Branch_Name nvarchar(max), @Intake_Name nvarchar(max), @Track_Name nvarchar(max)
as begin
if not exists(select 1 from Branch where [Name] = @Branch_Name)
begin
	Select ' Branch does not exists'  as ResultMessage
	Return
end	
else if not exists(select 1 from Track where [Name] = @Track_Name)
begin
	Select ' Track does not exists'  as ResultMessage
	Return
end	
else if not exists(select 1 from Intake where [Name] = @Intake_Name)
begin
	Select ' Intake does not exists'  as ResultMessage
	Return
end
else if not exists 
(select 1 from Branch b inner join StudentRegisteration 
sr on b.ID = sr.Branch_ID
inner join Intake i on sr.Intake_ID = i.ID
inner join Track t on sr.Track_ID = t.ID
where b.[Name] = @Branch_Name and t.[Name] = @Track_Name and i.[Name] = @Intake_Name)
begin
	Select ' No Students were found'  as ResultMessage
	Return
end
else
begin
	select s.FName + ' ' + s.LName 'Students Names' from Branch b inner join StudentRegisteration 
	sr on b.ID = sr.Branch_ID
	inner join Intake i on sr.Intake_ID = i.ID
	inner join Track t on sr.Track_ID = t.ID
	inner join Student s on sr.Std_ID = s.ID
	where b.[Name] = @Branch_Name and t.[Name] = @Track_Name and i.[Name] = @Intake_Name
end
end
GO
/****** Object:  StoredProcedure [dbo].[ShowTrackInstrucors_Proc]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------(7) Show Track Instructors --------------------------
create   proc [dbo].[ShowTrackInstrucors_Proc] @Track_Name nvarchar(max)
as begin
if not exists(select 1 from Track where [Name] = @Track_Name)
begin
	Select ' Track does not exists'  as ResultMessage
	Return
end	
else if not exists 
(select 1 from Track t inner join InstructorBelong ib 
 on t.ID = ib.Track_ID
where t.[Name] = @Track_Name)
begin
	Select ' No Instructors were found'  as ResultMessage
	Return
end
else
begin
	select i.FName + ' ' + i.LName 'Instructors Names' from Track t inner join InstructorBelong ib 
	 on t.ID = ib.Track_ID
	inner join Instructor i
	on ib.Ins_ID = i.ID
	where t.[Name] = @Track_Name
end
end

GO
/****** Object:  StoredProcedure [dbo].[ShowTrackStudents_Proc]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------(6) Show Track Students --------------------------
create   proc [dbo].[ShowTrackStudents_Proc] @Track_Name nvarchar(max)
as begin
if not exists(select 1 from Track where [Name] = @Track_Name)
begin
	Select ' Track does not exists'  as ResultMessage
	Return
end	
else if not exists 
(select 1 from Track t inner join StudentRegisteration 
sr on t.ID = sr.Track_ID
where t.[Name] = @Track_Name)
begin
	Select ' No Students were found'  as ResultMessage
	Return
end
else
begin
	select s.FName + ' ' + s.LName 'Students Names' from Track t inner join StudentRegisteration 
	sr on t.ID = sr.Track_ID
	inner join Student s
	on sr.Std_ID = s.ID
	where t.[Name] = @Track_Name
end
end
GO
/****** Object:  StoredProcedure [dbo].[StudentAnswerExam_Proc]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


---------------------------- Student Answer Exam -----------------------
create   proc [dbo].[StudentAnswerExam_Proc]
			@Student_ID int,
			@Exam_ID int,
			@Question_ID int,
			@Student_Question_Answer nvarchar(max)
as
begin

	 -- Check if the student and exam exist
	  IF NOT EXISTS (SELECT 1 FROM Student WHERE ID = @Student_ID)
    BEGIN
        SELECT 'Student ID does not exist.' AS ResultMessage
        RETURN
    END

    IF NOT EXISTS (SELECT 1 FROM Exam WHERE ID = @exam_id)
    BEGIN
        SELECT 'Exam ID does not exist.' AS ResultMessage
        RETURN
    END
		else if not exists(select * from Question where Questions_ID = @Question_ID)
	begin
		SELECT 'Question does not exist.' AS ResultMessage
		RETURN
	end
	else if not exists (select 1 from ExamQuestion eq where eq.Exam_ID = @Exam_ID and eq.Question_ID = Question_ID )
	begin
		SELECT 'Question does not exist.' AS ResultMessage
		RETURN
	end
	IF NOT EXISTS (SELECT 1 FROM [dbo].[StudentExam] WHERE [Student_ID] = @Student_ID AND [Exam_ID]=@Exam_ID )
    BEGIN
        SELECT 'You are not access in this exam' AS ResultMessage
        RETURN
    END
    ---- Check if the exam is currently available
    --DECLARE @currentDateTime DATETIME = GETDATE()
    --DECLARE @examStartTime DATETIME
    --DECLARE @examEndTime DATETIME

    --SELECT @examStartTime = StartTime, @examEndTime = EndTime
    --FROM Exam
    --WHERE ID = @exam_id

    --IF @currentDateTime < @examStartTime
    --BEGIN
    --    SELECT 'The exam has not started yet. Please wait for the scheduled start time.' AS ResultMessage
    --    RETURN
    --END

    --IF @currentDateTime > @examEndTime
    --BEGIN
    --    SELECT 'The exam has already ended. You cannot take the exam now.' AS ResultMessage
    --    RETURN
    --END
	 IF EXISTS (SELECT 1 FROM StudentExamQuestions WHERE Std_ID = @Student_ID AND Exam_ID = @Exam_ID and Questions_Id = @Question_ID)
    BEGIN
        SELECT 'You have already answered this question' AS ResultMessage
        RETURN
    END
	declare @Question_Type nvarchar(max)
	select @Question_Type = QuestionType from ExamQuestion where Exam_ID = @Exam_ID and Question_ID = @Question_ID
	
	if @Question_Type = 'Text'
	begin
		insert into StudentExamQuestions
		values(@Student_ID, @Exam_ID, 0, @Student_Question_Answer, '','',@Question_ID)
		SELECT 'Answer Submitted!' AS ResultMessage
		RETURN
	end
	else if @Question_Type = 'TF'
	begin
		if @Student_Question_Answer != '0' and @Student_Question_Answer != '1'
		begin
			 SELECT 'Invalid Data in Answer Field' AS ResultMessage
			 RETURN
		end
		else
		begin
			insert into StudentExamQuestions
			values(@Student_ID, @Exam_ID, 0, '', '',@Student_Question_Answer,@Question_ID)
			SELECT 'Answer Submitted!' AS ResultMessage
			RETURN
		end
	end
	else
	begin
	if LEN(@Student_Question_Answer) > 1
		begin
			 SELECT 'Invalid Data in Answer Field' AS ResultMessage
			 RETURN
		end
	else
	begin
		insert into StudentExamQuestions
		values(@Student_ID, @Exam_ID, 0, '', @Student_Question_Answer,'',@Question_ID)
		SELECT 'Answer Submitted!' AS ResultMessage
		RETURN
	end
	end
end
GO
/****** Object:  StoredProcedure [dbo].[studentcourses_proc]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------(1) Show Course by Student_ID--------------------------
CREATE   PROCEDURE [dbo].[studentcourses_proc] ( @std_id int )
AS
BEGIN
 IF NOT exists(Select ID From Student Where ID=@std_id)
Select 'Student ID You have entered not exists' 
ELSE IF NOT exists(Select Std_ID From StudentCourse Where Std_ID=@std_id)
Select 'Courses not exist'
ELSE
select S.FName AS 'Student Name' ,C.Name AS 'Corse Name'
from Student S 
join StudentCourse SC on S.ID=SC.Std_ID
join course C on C.ID=SC.Course_ID
WHERE S.ID=@std_id

END
GO
/****** Object:  StoredProcedure [dbo].[TakeAndShowExamOnSpecificTime]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----------------------------------------------------------------------------------------
CREATE   PROCEDURE [dbo].[TakeAndShowExamOnSpecificTime]
    @std_id INT,
    @exam_id INT
AS
BEGIN
	 -- Check if the student and exam exist
	IF NOT EXISTS (SELECT 1 FROM Student WHERE ID = @std_id)
    BEGIN
        SELECT 'Student ID does not exist.' AS ResultMessage
        RETURN
    END

    IF NOT EXISTS (SELECT 1 FROM Exam WHERE ID = @exam_id)
    BEGIN
        SELECT 'Exam ID does not exist.' AS ResultMessage
        RETURN
    END
	
	IF NOT EXISTS (SELECT 1 FROM [dbo].[StudentExam] WHERE [Student_ID] = @std_id AND [Exam_ID]=@exam_id )
    BEGIN
        SELECT 'You are not access in this exam' AS ResultMessage
        RETURN
    END
    -- Check if the exam is currently available
    DECLARE @currentDateTime DATETIME = GETDATE()
    DECLARE @examStartTime DATETIME
    DECLARE @examEndTime DATETIME

    SELECT @examStartTime = StartTime, @examEndTime = EndTime
    FROM Exam
    WHERE ID = @exam_id

    IF @currentDateTime < @examStartTime
    BEGIN
        SELECT 'The exam has not started yet. Please wait for the scheduled start time.' AS ResultMessage
        RETURN
    END

    IF @currentDateTime > @examEndTime
    BEGIN
        SELECT 'The exam has already ended. You cannot take the exam now.' AS ResultMessage
        RETURN
    END

    -- Check if the student has already taken the exam
    IF EXISTS (SELECT 1 FROM StudentExamQuestions WHERE Std_ID = @std_id AND Exam_ID = @exam_id)
    BEGIN
        SELECT 'You have already taken this exam.' AS ResultMessage
        RETURN
    END
	
 
    SELECT 'You can now take the exam.' AS ResultMessage
 CREATE TABLE #tmpExamQuestions(
            Question_ID int not null,
			QuestionType char(4) not null,
			QuestionGrade int,
			QuestionBody nvarchar(max),
			
        )
		declare @Question_Type char(4)
        DECLARE @Question_ID INT
        DECLARE @QuestionGrade INT
        DECLARE @QuestionText NVARCHAR(MAX)
        DECLARE @QuestionChoose NVARCHAR(max)
        DECLARE @QuestionTF NVARCHAR(max)
       

   DECLARE examCursor CURSOR FOR 
	SELECT
		eq.Question_ID AS 'Question No',
		eq.QuestionType AS 'Question Type',
		eq.QuestionGrade AS 'Question Grade',
		q.Choose_An_Answer_Question AS 'Choose_An_Answer_Question',
		
		q.Text_Questions AS 'Text_Questions',
		
		q.True_or_False_Questions AS 'True_or_False_Questions'
		
	FROM ExamQuestion eq
	INNER JOIN Question q ON eq.Question_ID = q.Questions_ID
	WHERE eq.Exam_ID = @Exam_ID;


        OPEN examCursor
        FETCH NEXT FROM examCursor INTO @Question_ID, @Question_Type, @QuestionGrade, @QuestionChoose,
            @QuestionText, @QuestionTF

        WHILE @@FETCH_STATUS = 0
        BEGIN
			IF @Question_Type = 'Text'
			begin
				INSERT INTO #tmpExamQuestions (Question_ID, QuestionType, QuestionGrade, QuestionBody)
				VALUES (@Question_ID, @Question_Type, @QuestionGrade, @QuestionText);
			end
			else if @Question_Type = 'TF'
			begin
			insert into #tmpExamQuestions(Question_ID, QuestionType, QuestionGrade, QuestionBody)
			values(@Question_ID, @Question_Type, @QuestionGrade, @QuestionTF)
			end
			else
			begin
				insert into #tmpExamQuestions(Question_ID, QuestionType, QuestionGrade, QuestionBody)
				values(@Question_ID, @Question_Type, @QuestionGrade,@QuestionChoose)
			end

           FETCH NEXT FROM examCursor INTO @Question_ID, @Question_Type, @QuestionGrade, @QuestionChoose,
             @QuestionText, @QuestionTF
	     END

        CLOSE examCursor
        DEALLOCATE examCursor
		select Question_ID 'Question No',
			QuestionType 'Question Type',
			CASE WHEN QuestionGrade is null THEN 0 ELSE QuestionGrade END as 'Question Grade',
			QuestionBody 'Question Body'
			from #tmpExamQuestions


END
GO
/****** Object:  StoredProcedure [dbo].[UpdateBranchNames]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--------------------Update the Branch----------------

CREATE   PROCEDURE [dbo].[UpdateBranchNames]
    @OldBranchName nvarchar(50),
    @NewBranchName nvarchar(50)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM Branch WHERE Name = @OldBranchName)
    BEGIN
        UPDATE Branch
        SET Name = @NewBranchName
        WHERE Name = @OldBranchName;

        SELECT 'Branch updated successfully.' AS ResultMessage;
    END
    ELSE
    BEGIN
        SELECT 'Branch not found IN data base' AS ResultMessage;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateCourse]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-------------------------UpdateCourse -------------------

CREATE   PROCEDURE [dbo].[UpdateCourse]	
	@OldID INT,
	@NEWID INT,
    @NewCourseName nvarchar(50),
    @MinDegree int,
    @MaxDegree int,
    @Description nvarchar(max)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Course WHERE [ID] = @OldID)
    BEGIN
        UPDATE Course
        SET  ID=@OldID,
			[Name] = @NewCourseName,
            MinDegree = @MinDegree,
            MaxDegree = @MaxDegree,
            [Description] = @Description
        WHERE [ID] = @OldID;

        SELECT 'Course updated successfully.' AS ResultMessage;
    END
    ELSE
    BEGIN
        SELECT 'Course not found IN DATA BASE' AS ResultMessage;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateExam]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Update Procedure to Modify Exam Details:
CREATE   PROCEDURE [dbo].[UpdateExam]
    @ExamID INT,
    @NumberOfQuestions INT,
    @StartTime DATE,
    @EndTime DATE,
    @TotalDegree INT,
    @Corrective BIT,
    @Normal BIT,
    @Course_ID INT
AS
BEGIN
    UPDATE Exam
    SET NumberOfQuestions = @NumberOfQuestions,
        StartTime = @StartTime,
        EndTime = @EndTime,
        TotalDegree = @TotalDegree,
        Corrective = @Corrective,
        Normal = @Normal
    WHERE ID = @ExamID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateInstractorBelong]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-------------------------------------Update_Instractor_Branch_Intake_Track------------------------------------------
CREATE   PROCEDURE [dbo].[UpdateInstractorBelong]
    @Ins_ID INT,
    @NewIntake_ID INT,
    @NewTrack_ID INT,
    @NewBranch_ID INT
AS
BEGIN	
    -- Check if  Ins_ID  exists in InstructorBelongtable
    IF NOT EXISTS (SELECT 1 FROM InstructorBelong WHERE Ins_ID = @Ins_ID)
    BEGIN
        SELECT 'Instractor not found in DB' AS ResultMessage;
        RETURN;
    END

    -- Perform the UPDATE operation
    UPDATE InstructorBelong
    SET Intake_ID = @NewIntake_ID,
        Track_ID = @NewTrack_ID,
        Branch_ID = @NewBranch_ID
    WHERE Ins_ID = @Ins_ID;

    SELECT 'Instractor Info updated successfully.' AS ResultMessage;
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateInstructor]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-------------------------UpdateInstructor -------------------

CREATE   PROCEDURE [dbo].[UpdateInstructor]
    @InstructorID int,
    @FName nvarchar(15),
    @LName nvarchar(15),
    @Email nvarchar(50),
    @Password nvarchar(25)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM Instructor WHERE ID = @InstructorID)
    BEGIN
        IF (
            @Email LIKE '%@gmail.com' OR 
            @Email LIKE '%@yahoo.com' AND
            @Password LIKE '%[A-Z]%' AND
            @Password LIKE '%[a-z]%' AND
            @Password LIKE '%[0-9]%' AND
			LEN(@Password) >= 8 AND 
            LEN(@Password) <= 25
        )
        BEGIN
            UPDATE Instructor
            SET 
                FName = @FName,
                LName = @LName,
                Email = @Email,
                [Password] = @Password
            WHERE ID = @InstructorID;

            SELECT 'Instructor updated successfully.' AS ResultMessage;
        END
        ELSE
        BEGIN
            SELECT 'Invalid email or password format.' AS ResultMessage;
        END
    END
    ELSE
    BEGIN
        SELECT 'Instructor not found In database' AS ResultMessage;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateInstructorCourse]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----------------------- Update_Instractor_Course ------------------------
CREATE   PROCEDURE [dbo].[UpdateInstructorCourse]	
    @Instructor_ID INT,
    @Old_Course_ID INT,
    @New_Course_ID INT
AS
BEGIN
    -- Check if Instructor_ID exists in InstructorCourse table
    IF NOT EXISTS (SELECT 1 FROM InstructorCourse WHERE Instructor_ID = @Instructor_ID)
    BEGIN
        SELECT 'Instructor does not teach any course' AS ResultMessage;
        RETURN;
    END

    -- Check if Old_Course_ID exists in InstructorCourse table
    IF NOT EXISTS (SELECT 1 FROM InstructorCourse WHERE Course_ID = @Old_Course_ID)
    BEGIN
        SELECT 'The specified course is not associated with any instructor.' AS ResultMessage;
        RETURN;
    END

    -- Check if Instructor_ID and Old_Course_ID exist together
    IF NOT EXISTS (SELECT 1 FROM InstructorCourse WHERE Instructor_ID = @Instructor_ID AND Course_ID = @Old_Course_ID)
    BEGIN
        SELECT 'Instructor does not teach this course.' AS ResultMessage;
        RETURN;
    END

    -- Check if New_Course_ID exists in Course table
    IF NOT EXISTS (SELECT 1 FROM Course WHERE ID = @New_Course_ID)
    BEGIN
        SELECT 'This course is not found in the database.' AS ResultMessage;
        RETURN;
    END

    -- Check if the combination of Instructor_ID, New_Course_ID already exists in InstructorCourse table
    IF EXISTS (SELECT 1 FROM InstructorCourse WHERE Instructor_ID = @Instructor_ID AND Course_ID = @New_Course_ID)
    BEGIN
        SELECT 'Instructor already teaches this course.' AS ResultMessage;
        RETURN;
    END

    -- If all checks pass, update the record if it exists, otherwise insert a new record
    IF EXISTS (SELECT 1 FROM InstructorCourse WHERE Instructor_ID = @Instructor_ID AND Course_ID = @Old_Course_ID)
    BEGIN
        -- Perform the UPDATE operation
        UPDATE InstructorCourse
        SET Course_ID = @New_Course_ID
        WHERE Instructor_ID = @Instructor_ID AND Course_ID = @Old_Course_ID;

        SELECT 'Instructor course updated successfully.' AS ResultMessage;
    END
    ELSE
    BEGIN
        -- If the record does not exist, perform an INSERT operation
        INSERT INTO InstructorCourse (Instructor_ID, Course_ID)
        VALUES (@Instructor_ID, @New_Course_ID);

        SELECT 'Instructor assigned to new course successfully.' AS ResultMessage;
    END
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateIntakeNames]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------update the intake ------------

CREATE   PROCEDURE [dbo].[UpdateIntakeNames]
    @OldIntakeName nvarchar(50),
    @NewIntakeName nvarchar(50)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM Intake WHERE Name = @OldIntakeName)
    BEGIN
        UPDATE Intake
        SET Name = @NewIntakeName
        WHERE Name = @OldIntakeName;

        SELECT 'Intake updated successfully.' AS ResultMessage;
    END
    ELSE
    BEGIN
        SELECT 'Intake not found IN data base' AS ResultMessage;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateQuestion]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-------------------------Update Question -------------------

CREATE   PROC [dbo].[UpdateQuestion]
    @Text_Questions NVARCHAR(MAX) = NULL,
    @Correct_Answer_Text_Questions NVARCHAR(MAX) = NULL,
    @True_or_False_Questions NVARCHAR(MAX) = NULL,
    @Correct_Answer_True_or_False BIT = NULL,
    @Choose_An_Answer_Question NVARCHAR(MAX) = NULL,
    @Correct_Answer_Choose_Question NVARCHAR(1) = NULL,
    @Course_Id INT = NULL,
    @Questions_ID INT 
AS
BEGIN
    BEGIN TRY
        -- Check if the ID already exists
        IF EXISTS (SELECT 1 FROM Question WHERE Questions_ID = @Questions_ID)
        BEGIN
            UPDATE Question 
            SET
                Text_Questions = @Text_Questions,
                Correct_Answer_Text_Questions = @Correct_Answer_Text_Questions,
                True_or_False_Questions = @True_or_False_Questions,
                Correct_Answer_True_or_False = @Correct_Answer_True_or_False,
                Choose_An_Answer_Question = @Choose_An_Answer_Question,
                Correct_Answer_Choose_Question = @Correct_Answer_Choose_Question,
                Course_Id = @Course_Id
            WHERE Questions_ID = @Questions_ID;

            SELECT 'Question updated successfully.' AS ResultMessage;
        END
        ELSE
        BEGIN
            SELECT 'Error: Question ID does not exist in the database. Cannot update.' AS ResultMessage;
        END;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateStudent]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-------------------------Update Student -------------------

CREATE   PROCEDURE [dbo].[UpdateStudent]
    @StudentID int,
    @FName nvarchar(15),
    @LName nvarchar(15),
    @GraduationYear char(4),
    @Email nvarchar(50),
    @Password nvarchar(50)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM Student WHERE ID = @StudentID)
    BEGIN
        IF (
            @Email LIKE '%@gmail.com' OR 
            @Email LIKE '%@yahoo.com' AND
            @Password LIKE '%[A-Z]%' AND
            @Password LIKE '%[a-z]%' AND
            @Password LIKE '%[0-9]%' AND
			LEN(@Password) >= 8 AND 
            LEN(@Password) <= 25
        )
        BEGIN
            UPDATE Student
            SET 
                FName = @FName,
                LName = @LName,
                GraduationYear = @GraduationYear,
                Email = @Email,
                [Password] = @Password
            WHERE ID = @StudentID;

            SELECT 'Student updated successfully.' AS ResultMessage;
        END
        ELSE
        BEGIN
            SELECT 'Invalid email or password format.' AS ResultMessage;
        END
    END
    ELSE
    BEGIN
        SELECT 'Student not found In data base' AS ResultMessage;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateStudentRegistration]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-------------------------------------Update_Student_Branch_Intake_Track------------------------------------------
CREATE   PROCEDURE [dbo].[UpdateStudentRegistration]
    @Std_ID INT,
    @NewIntake_ID INT,
    @NewTrack_ID INT,
    @NewBranch_ID INT
AS
BEGIN
    -- Check if Std_ID exists in StudentRegisteration table
   IF NOT EXISTS (SELECT 1 FROM StudentRegisteration WHERE Std_ID = @Std_ID)
    BEGIN
        SELECT 'Student not found in StudentRegisteration.' AS ResultMessage;
        RETURN;
    END

    -- Perform the UPDATE operation
    UPDATE StudentRegisteration
    SET Intake_ID = @NewIntake_ID,
        Track_ID = @NewTrack_ID,
        Branch_ID = @NewBranch_ID
    WHERE Std_ID = @Std_ID;

    SELECT 'Student Info updated successfully.' AS ResultMessage;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateTrackNames]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



----------------------------Update the Track-----------

CREATE   PROCEDURE [dbo].[UpdateTrackNames]
    @OldTrackName nvarchar(50),
    @NewTrackName nvarchar(50)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM Track WHERE Name = @OldTrackName)
    BEGIN
        UPDATE Track
        SET Name = @NewTrackName
        WHERE Name = @OldTrackName;

        SELECT 'Track updated successfully.' AS ResultMessage;
    END
    ELSE
    BEGIN
        SELECT 'Track not found IN data base' AS ResultMessage;
    END
END;
GO
/****** Object:  DdlTrigger [ddlt_PreventDDLDropTable]    Script Date: 2024-01-14 1:26:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Trigger To prevent drop any table from system
CREATE   Trigger [ddlt_PreventDDLDropTable]
ON DATABASE FOR DROP_TABLE
AS

SELECT
 EventType = EVENTDATA().value('(EVENT_INSTANCE/EventType)[1]', 'sysname'),
 PostTime = EVENTDATA().value('(EVENT_INSTANCE/PostTime)[1]', 'datetime'),
 LoginName = EVENTDATA().value('(EVENT_INSTANCE/LoginName)[1]', 'sysname'),
 UserName = EVENTDATA().value('(EVENT_INSTANCE/UserName)[1]', 'sysname'),
 DatabaseName = EVENTDATA().value('(EVENT_INSTANCE/DatabaseName)[1]', 'sysname'),
 SchemaName = EVENTDATA().value('(EVENT_INSTANCE/SchemaName)[1]', 'sysname'),
 ObjectName = EVENTDATA().value('(EVENT_INSTANCE/ObjectName)[1]', 'sysname'),
 ObjectType = EVENTDATA().value('(EVENT_INSTANCE/ObjectType)[1]', 'sysname'),
 CommandText = EVENTDATA().value('(EVENT_INSTANCE//TSQLCommand[1]/CommandText)[1]', 'nvarchar(max)')

RAISERROR ('You can not drop table in this database', 10, 1);
ROLLBACK;

DROP TABLE [dbo].[TrainngManagerManage]




GO
ENABLE TRIGGER [ddlt_PreventDDLDropTable] ON DATABASE
GO
USE [master]
GO
ALTER DATABASE [ITIExaminationSystem] SET  READ_WRITE 
GO