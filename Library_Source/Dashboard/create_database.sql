USE [master]
GO
/****** Object:  Database [Library]    Script Date: 28/3/2020 5:46:47 PM ******/
CREATE DATABASE [Library]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Library', FILENAME = N'C:\Users\ELSAYED\Documents\LocalDataBases\Library.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Library_log', FILENAME = N'C:\Users\ELSAYED\Documents\LocalDataBases\Library_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Library] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Library].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Library] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Library] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Library] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Library] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Library] SET ARITHABORT OFF 
GO
ALTER DATABASE [Library] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Library] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Library] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Library] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Library] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Library] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Library] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Library] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Library] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Library] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Library] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Library] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Library] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Library] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Library] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Library] SET RECOVERY FULL 
GO
ALTER DATABASE [Library] SET  MULTI_USER 
GO
ALTER DATABASE [Library] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Library] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Library] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Library] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Library] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Library] SET QUERY_STORE = OFF
GO
USE [Library]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Library]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Publisher] [nvarchar](50) NULL,
	[ChapterCount] [int] NULL,
	[PageCount] [int] NULL,
	[Location] [varchar](1000) NULL,
	[Date] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BooksAuthors]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BooksAuthors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NOT NULL,
	[Author] [nvarchar](50) NULL,
 CONSTRAINT [PK_BooksAuthors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Day] [varchar](10) NOT NULL,
	[Period] [varchar](10) NOT NULL,
	[Price] [int] NOT NULL,
	[Place] [nvarchar](100) NOT NULL,
	[Time] [varchar](12) NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CoursesInstructors]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CoursesInstructors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NOT NULL,
	[InstructorId] [int] NOT NULL,
 CONSTRAINT [PK_CoursesInstructors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CoursesMaterials]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CoursesMaterials](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NOT NULL,
	[MaterialId] [int] NOT NULL,
 CONSTRAINT [PK_CoursesMaterials] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructors]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Type] [varchar](5) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Phone] [varchar](12) NOT NULL,
 CONSTRAINT [PK_Instructors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lectures]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lectures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[PageCount] [int] NULL,
	[Location] [varchar](1000) NULL,
	[Date] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Lectures] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materials]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materials](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[NumberOfBooks] [int] NOT NULL,
	[NumberOfSections] [int] NOT NULL,
	[NumberOfLectures] [int] NOT NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialsBooks]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialsBooks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NOT NULL,
	[MaterialId] [int] NOT NULL,
 CONSTRAINT [PK_MaterialsBooks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialsLectures]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialsLectures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LectureId] [int] NOT NULL,
	[MaterialId] [int] NOT NULL,
 CONSTRAINT [PK_MaterialsLectures] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialsSections]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialsSections](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SectionId] [int] NOT NULL,
	[MaterialId] [int] NOT NULL,
 CONSTRAINT [PK_MaterialsSection] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sections]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sections](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[PageCount] [int] NULL,
	[Location] [varchar](1000) NULL,
	[Date] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Sections] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spAuthors_Get]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spAuthors_Get]
@BookId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select BooksAuthors.Author from BooksAuthors Inner Join   Books on BooksAuthors.BookId = Books.Id where BooksAuthors.BookId = @BookId

END
GO
/****** Object:  StoredProcedure [dbo].[spAuthors_Insert]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spAuthors_Insert]
@BookId int,
@Author nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	insert into dbo.BooksAuthors(BookId,Author)values(@BookId,@Author)
END
GO
/****** Object:  StoredProcedure [dbo].[spbackup_all_records]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spbackup_all_records]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
	declare @location nvarchar(1000),@file nvarchar(1000);
	set @location = (SELECT physical_name FROM sys.master_files where name = 'Library');
	--set @location = (select REPLACE (@location , 'Library.mdf' , 'Backup\' + (SELECT CAST(CONVERT(DATE, GETDATE(), 120) AS varchar))));
	--set @file = @location + '\' + (SELECT CAST(CONVERT(DATE, GETDATE(), 120) AS varchar)) + '.bak';
	set @location = (select LEFT(@location,LEN(@location)-11) + 'Backup\' + (SELECT CAST(CONVERT(DATE, GETDATE(), 120) AS varchar)));
	set @file = @location + '\' + (SELECT CAST(CONVERT(DATE, GETDATE(), 120) AS varchar)) + '.bak';
	EXEC master.dbo.xp_create_subdir @location;
	backup database "Library" to disk = @file with init;
END
GO
/****** Object:  StoredProcedure [dbo].[spBook_Delete]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spBook_Delete]
	@Id int
AS
BEGIN
	SET NOCOUNT ON;
	Delete Books where Id = @Id
	delete BooksAuthors where BookId = @Id
	delete MaterialsBooks where BookId = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[spBook_Get]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spBook_Get]
	@Id int
AS
BEGIN
	SET NOCOUNT ON;
	select * from Books where Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[spBook_Insert]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBook_Insert]
	@Name nvarchar(50),
	@Publisher nvarchar(50),
	@ChapterCount int,
	@PageCount int,
	@Location text,
	@Date text,
	@MaterialId int,
	@Id int = 0 out
AS
BEGIN
	SET NOCOUNT ON;
	insert into dbo.Books(Name,Publisher,ChapterCount,PageCount,Location,Date)values(@Name,@Publisher,@ChapterCount,@PageCount,@Location,@Date);
	select @Id = SCOPE_IDENTITY();
	insert into MaterialsBooks(BookId,MaterialId)values(@Id,@MaterialId)
END
GO
/****** Object:  StoredProcedure [dbo].[spBook_Update]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBook_Update]
	@Name nvarchar(50),
	@Publisher nvarchar(50),
	@ChapterCount int,
	@PageCount int,
	@Location varchar(1000),
	@Date varchar(10),
	@Id int
AS
BEGIN
	SET NOCOUNT ON;
	Update dbo.Books set Name = @Name,Publisher = @Publisher,ChapterCount = @ChapterCount,PageCount = @PageCount,Location = @Location,Date = @Date where Id = @Id
	delete BooksAuthors where BookId = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[spBooks_Check]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spBooks_Check] 
	@Name nvarchar(50),
	@Publisher nvarchar(50),
	@ChapterCount int,
	@PageCount int,
	@Location varchar(1000),
	@Date varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select * from Books where Name = @Name and Publisher = @Publisher and ChapterCount = @ChapterCount and PageCount = @PageCount and Location = @Location and Date = @Date 
END



GO
/****** Object:  StoredProcedure [dbo].[spBooks_Get]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBooks_Get]
	
AS
BEGIN
	SET NOCOUNT ON;
	select top 250 
	   [Id]
      ,[Name]
      ,[Publisher]
      ,[ChapterCount]
      ,[PageCount]
      ,[Date] 
	  from Books

END
GO
/****** Object:  StoredProcedure [dbo].[spBooks_Search]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spBooks_Search] 
@Name nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select top 250 
	   [Id]
      ,[Name]
      ,[Publisher]
      ,[ChapterCount]
      ,[PageCount]
      ,[Date]  from Books where Name like '%'+ @Name or Name like '%'+ @Name + '%' or Name like @Name + '%' 
END
GO
/****** Object:  StoredProcedure [dbo].[spBooksByCourse_Get]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spBooksByCourse_Get] 
	@courseid int
AS
BEGIN

	SET NOCOUNT ON;
	create table #temp
	(
	materialid int
	)
	 insert into #temp(materialid) select CoursesMaterials.MaterialId from CoursesMaterials inner join Materials on CoursesMaterials.MaterialId = Materials.Id where CoursesMaterials.CourseId = @courseid;
	 select * from Books where Id in (select MaterialsBooks.BookId from Materials  inner join MaterialsBooks on MaterialsBooks.MaterialId = Materials.Id where Materials.Id in (select materialid from #temp));
END
GO
/****** Object:  StoredProcedure [dbo].[spBooksByInstructor_Get]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBooksByInstructor_Get] 
	@instructorid int
AS
BEGIN

	SET NOCOUNT ON;
	create table #temp
	(
	materialid int,
	courseid int
	)
	 insert into #temp(courseid) select CoursesInstructors.CourseId from CoursesInstructors inner join Instructors on CoursesInstructors.InstructorId = Instructors.Id where InstructorId = @instructorid;
	 insert into #temp(materialid) select CoursesMaterials.MaterialId from CoursesMaterials inner join Materials on CoursesMaterials.MaterialId = Materials.Id where CoursesMaterials.CourseId in (select courseid from #temp);
	 select * from Books where Id in (select MaterialsBooks.BookId from Materials  inner join MaterialsBooks on MaterialsBooks.MaterialId = Materials.Id where Materials.Id in (select materialid from #temp));
END
GO
/****** Object:  StoredProcedure [dbo].[spBooksByMaterial_Get]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spBooksByMaterial_Get] 
	@materialid int
AS
BEGIN

	SET NOCOUNT ON;
	 select * from Books where Id in (select MaterialsBooks.BookId from Materials  inner join MaterialsBooks on MaterialsBooks.MaterialId = Materials.Id where Materials.Id = @materialid);
END
GO
/****** Object:  StoredProcedure [dbo].[spCourse_Delete]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spCourse_Delete]
@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	 delete Courses where Id = @Id
	 delete CoursesInstructors where CourseId = @Id
	 delete CoursesMaterials where CourseId = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[spCourse_Get]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[spCourse_Get]
@Id int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	 select * from Courses where Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[spCourse_Update]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spCourse_Update]
@Id int,
@Name nvarchar(50),
@Day varchar(10),
@Period varchar(10),
@Time varchar(12),
@Place nvarchar(100),
@Price int,
@InstructorId int,
@MaterialId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	 update Courses set Name = @Name , Day = @Day ,Period = @Period,Time = @Time,Place = @Place,Price = @Price where Id = @Id
	 update CoursesInstructors set InstructorId = @InstructorId where CoursesInstructors.CourseId = @Id
	 update CoursesMaterials set MaterialId = @MaterialId where CoursesMaterials.CourseId = @Id

END
GO
/****** Object:  StoredProcedure [dbo].[spCourses_Check]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spCourses_Check] 
@Name nvarchar(50),
@Day varchar(10),
@Period varchar(10),
@Time varchar(12),
@Place nvarchar(100),
@Price int,
@InstructorId int,
@MaterialId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select * from Courses,CoursesInstructors,CoursesMaterials where Name = @Name and Day = @Day and Period = @Period and Time = @Time and Place = @Place and Price = @Price and CoursesInstructors.InstructorId = @InstructorId and CoursesMaterials.MaterialId = @MaterialId
		
END
GO
/****** Object:  StoredProcedure [dbo].[spCourses_Get]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCourses_Get] 
	
AS
BEGIN
	
	SET NOCOUNT ON;
	select top 250 [Id]
      ,[Name]
      ,[Day]
      ,[Period]
      ,[Time] from Courses

END
GO
/****** Object:  StoredProcedure [dbo].[spCourses_Insert]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCourses_Insert]
	@Name nvarchar(50),
	@Day varchar(10),
	@Time varchar(12),
	@Period varchar(10),
	@Price int,
	@Place nvarchar(100),
	@InstructorId int,
	@MaterialId int,
	@Id int = 0 out
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	Insert Into dbo.Courses(Name,Day,Time,Period,Price,Place)
	Values(@Name,@Day,@Time,@Period,@Price,@Place)
	select @Id = SCOPE_IDENTITY();
	Insert into dbo.CoursesInstructors(CourseId,InstructorId)values(@Id,@InstructorId);
	Insert into dbo.CoursesMaterials(CourseId,MaterialId)values(@Id,@MaterialId);
END
GO
/****** Object:  StoredProcedure [dbo].[spCourses_Search]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spCourses_Search] 
@Name nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select top 250 [Id]
      ,[Name]
      ,[Day]
      ,[Period]
      ,[Time] from Courses where Name like '%'+ @Name or Name like '%'+ @Name + '%' or Name like @Name + '%'
		
END
GO
/****** Object:  StoredProcedure [dbo].[spCoursesByInstructor_Get]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCoursesByInstructor_Get] 
	@instructorid int
AS
BEGIN

	SET NOCOUNT ON;
	declare @courseid int
	select * from Courses where Id in (select CoursesInstructors.CourseId from CoursesInstructors inner join Instructors on CoursesInstructors.InstructorId = Instructors.Id where InstructorId = @instructorid)
END
GO
/****** Object:  StoredProcedure [dbo].[spCoursesByMaterial_Get]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spCoursesByMaterial_Get] 
	@materialid int
AS
BEGIN

	SET NOCOUNT ON;
	select * from Courses where Id in (select CoursesMaterials.CourseId from CoursesMaterials join Materials on CoursesMaterials.MaterialId = Materials.Id where MaterialId = @materialid)
END
GO
/****** Object:  StoredProcedure [dbo].[spCoursesInstructors_Get]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCoursesInstructors_Get] 
	@CourseId int 
AS
BEGIN
	
	SET NOCOUNT ON;
	select Instructors.* from Instructors Inner join  CoursesInstructors on Instructors.Id = CoursesInstructors.InstructorId where  CoursesInstructors.CourseId = @CourseId 

END
GO
/****** Object:  StoredProcedure [dbo].[spCoursesMaterials_Get]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCoursesMaterials_Get] 
	@CourseId int 
AS
BEGIN
	
	SET NOCOUNT ON;
	select Materials.* from Materials Inner join  CoursesMaterials on Materials.Id = CoursesMaterials.MaterialId where  CoursesMaterials.CourseId = @CourseId 

END
GO
/****** Object:  StoredProcedure [dbo].[spInstructor_Delete]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spInstructor_Delete]
@Id int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	delete Courses where Id in (select CourseId from CoursesInstructors where InstructorId = @Id)
	delete CoursesInstructors where InstructorId = @Id
	delete CoursesMaterials where CourseId in (select CourseId from CoursesInstructors where InstructorId = @Id)
	delete Instructors where Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[spInstructor_Get]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spInstructor_Get]
@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select * from Instructors where ID = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[spInstructor_Update]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spInstructor_Update]
@Id int,
@FirstName nvarchar(50),
@LastName nvarchar(50),
@Email nvarchar(100),
@Phone varchar(12),
@Type varchar(5)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	Update Instructors set FirstName = @FirstName , LastName = @LastName ,Email = @Email ,Phone = @Phone,Type = @Type where Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[spInstructors_Check]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInstructors_Check]
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@EmailAdress nvarchar(100),
	@PhoneNumber varchar(12),
	@Type varchar(5),
	@Id int = 0 out
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	select * from Instructors where FirstName = @FirstName and LastName = @LastName and Email = @EmailAdress and Phone = @PhoneNumber and Type = @Type
END
GO
/****** Object:  StoredProcedure [dbo].[spInstructors_Get]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInstructors_Get] 
	
AS
BEGIN
	
	SET NOCOUNT ON;
	select top 250 * from Instructors

END
GO
/****** Object:  StoredProcedure [dbo].[spInstructors_Insert]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInstructors_Insert]
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@EmailAdress nvarchar(100),
	@PhoneNumber varchar(12),
	@Type varchar(5),
	@Id int = 0 out
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	Insert Into dbo.Instructors(FirstName,LastName,Email,Phone,Type)
	Values(@FirstName,@LastName,@EmailAdress,@PhoneNumber,@Type)
	select @Id = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[spInstructors_Search]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spInstructors_Search] 
@FirstName nvarchar(50),
@LastName nvarchar(50),
@Type varchar(5)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if @Type != '' and @LastName != '' and @FirstName != ''
	begin
	select * from Instructors where (FirstName Like '%' + @FirstName or FirstName Like '%' + @FirstName + '%' or FirstName Like @FirstName + '%') and (LastName like '%' + @LastName or LastName like '%' + @LastName + '%' or LastName like @LastName + '%') and Type like @Type
	end
	else
	begin
	if @Type = ''
	--begining type
	begin
	if @FirstName = ''
	--begining firstname
	begin
	if @LastName = ''
	--begining lastname
	begin
	return
	--ending lastname
	end
	--else lastname
	else 
	--beging else lastname
	begin
	select * from Instructors where LastName like @LastName + '%'
	--ending else lastname
	end
	--ending firstnam
	end
	--else lastname
	else
	--begining else firstname
	begin
	if @LastName = ''
	--begining lastname
	begin
	select * from Instructors where FirstName like @FirstName + '%'
	--ending lastname
	end
	--else lastname
	else
	--begining else lastname
	begin
	select * from Instructors where FirstName like @FirstName + '%' and LastName like @LastName + '%'
	--ending else lastname
	end
	--ending else firstname
	end
	--ending type
	end
	--else type
	else
	--begining else type
	begin
	if @FirstName = ''
	--begining firstname
	begin
	if @LastName = ''
	--begining lastname
	begin
	select * from Instructors where FirstName like @Type + '%'
	--ending lastname
	end
	--else lastname
	else
	--beging else lastname
	begin
	select * from Instructors where LastName like @LastName + '%' and Type like @Type
	--ending else lastname
	end
	--ending firstname
	end
	--else firstname
	else
	--begining else firstname
	begin
	select * from Instructors where FirstName like @FirstName + '%' and Type like @Type
	--ending else firstname
	end
	--ending else type
	end
	end
END
GO
/****** Object:  StoredProcedure [dbo].[spInstructorsByCourse_Get]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInstructorsByCourse_Get] 
	@courseid int
AS
BEGIN

	SET NOCOUNT ON;
	select * from Instructors where Id in (select CoursesInstructors.InstructorId from CoursesInstructors inner join Instructors on CoursesInstructors.InstructorId = Instructors.Id where CourseId = @courseid)
END
GO
/****** Object:  StoredProcedure [dbo].[spInstructorsByMaterial_Get]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spInstructorsByMaterial_Get] 
	@materialid int
AS
BEGIN

	SET NOCOUNT ON;
	create table #temp
	(
	instructorid int,
	courseid int
	)
	insert into #temp(courseid)  select CoursesMaterials.CourseId from CoursesMaterials inner join Materials on CoursesMaterials.MaterialId = Materials.Id where MaterialId = @materialid;
	select * from Instructors where Id in  (select CoursesInstructors.InstructorId from CoursesInstructors inner join Instructors on CoursesInstructors.InstructorId = Instructors.Id where CoursesInstructors.CourseId in (select courseid from #temp));
END
GO
/****** Object:  StoredProcedure [dbo].[spLecture_Delete]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spLecture_Delete]
	@Id int
AS
BEGIN
	SET NOCOUNT ON;
	Delete dbo.Lectures where Id = @Id
	delete MaterialsLectures where LectureId = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[spLecture_Get]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spLecture_Get]
	@Id int
AS
BEGIN
	SET NOCOUNT ON;
	select * from Lectures where Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[spLecture_Insert]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLecture_Insert]
	@Name nvarchar(50),
	@PageCount int,
	@Location varchar(1000),
	@Date varchar(10),
	@MaterialId int,
	@Id int = 0 out
AS
BEGIN
	SET NOCOUNT ON;
	insert into dbo.Lectures(Name,PageCount,Location,Date)values(@Name,@PageCount,@Location,@Date);
	select @Id = SCOPE_IDENTITY();
	insert into MaterialsLectures(LectureId,MaterialId)values(@Id,@MaterialId)
END
GO
/****** Object:  StoredProcedure [dbo].[spLecture_Update]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLecture_Update]
	@Name nvarchar(50),
	@PageCount int,
	@Location varchar(1000),
	@Date varchar(10),
	@Id int
AS
BEGIN
	SET NOCOUNT ON;
	Update dbo.Lectures set Name = @Name,PageCount = @PageCount,Location = @Location,Date = @Date where Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[spLectures_Check]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spLectures_Check] 
	@Name nvarchar(50),
	@PageCount int,
	@Location varchar(1000),
	@Date varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select * from Lectures where Name = @Name and PageCount = @PageCount and Location = @Location and Date = @Date
END
GO
/****** Object:  StoredProcedure [dbo].[spLectures_Get]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLectures_Get]
	
AS
BEGIN
	SET NOCOUNT ON;
	select top 250 [Id]
      ,[Name]
      ,[PageCount]
      ,[Date] from Lectures
END
GO
/****** Object:  StoredProcedure [dbo].[spLectures_Search]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spLectures_Search] 
@Name nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select top 250 [Id]
      ,[Name]
      ,[PageCount]
      ,[Date] from Lectures where Name like '%' + @Name or Name like '%' + @Name + '%' or Name like @Name + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[spLecturesByCourse_Get]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spLecturesByCourse_Get] 
	@courseid int
AS
BEGIN

	SET NOCOUNT ON;
	create table #temp
	(
	materialid int
	)
	insert into #temp(materialid) select CoursesMaterials.MaterialId from CoursesMaterials inner join Materials on CoursesMaterials.MaterialId = Materials.Id where CoursesMaterials.CourseId = @courseid;
	select * from Lectures where Id in (select MaterialsLectures.LectureId from Materials  inner join MaterialsLectures on MaterialsLectures.MaterialId = Materials.Id where MaterialsLectures.MaterialId in (select materialid from #temp));
END
GO
/****** Object:  StoredProcedure [dbo].[spLecturesByInstructor_Get]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLecturesByInstructor_Get] 
	@instructorid int
AS
BEGIN

	SET NOCOUNT ON;
	create table #temp
	(
	materialid int,
	courseid int
	)
	insert into #temp(courseid)  select CoursesInstructors.CourseId from CoursesInstructors inner join Instructors on CoursesInstructors.InstructorId = Instructors.Id where InstructorId = @instructorid;
	insert into #temp(materialid) select CoursesMaterials.MaterialId from CoursesMaterials inner join Materials on CoursesMaterials.MaterialId = Materials.Id where CoursesMaterials.CourseId in (select courseid from #temp);
	select * from Lectures where Id in (select MaterialsLectures.LectureId from Materials  inner join MaterialsLectures on MaterialsLectures.MaterialId = Materials.Id where MaterialsLectures.MaterialId in (select materialid from #temp));
END
GO
/****** Object:  StoredProcedure [dbo].[spLecturesByMaterial_Get]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spLecturesByMaterial_Get] 
	@materialid int
AS
BEGIN

	SET NOCOUNT ON;
	select * from Lectures where Id in (select MaterialsLectures.LectureId from Materials  inner join MaterialsLectures on MaterialsLectures.MaterialId = Materials.Id where MaterialsLectures.MaterialId = @materialid);
END
GO
/****** Object:  StoredProcedure [dbo].[spMaterial_Delete]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spMaterial_Delete]
@Id int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	 delete Courses where Id in (select CourseId from CoursesMaterials where MaterialId = @Id)
	 delete CoursesInstructors where CourseId in (select CourseId from CoursesMaterials where MaterialId = @Id)
	 delete CoursesMaterials where MaterialId = @Id
	 delete Lectures where Id in (select LectureId from MaterialsLectures where MaterialId = @Id)
	 delete Sections where Id in (select SectionId from MaterialsSections where MaterialId = @Id)
	 delete Books where Id in (select BookId from MaterialsBooks where MaterialId = @Id)
	 delete BooksAuthors where BookId in (select BookId from MaterialsBooks where MaterialId = @Id)
	 Delete Materials where Id = @Id
	 delete MaterialsBooks where MaterialId = @Id
	 delete MaterialsLectures where MaterialId = @Id
	 delete MaterialsSections where MaterialId = @Id
	 delete MaterialsBooks where MaterialId = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[spMaterial_Get]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[spMaterial_Get]
@Id int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	 select * from Materials where Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[spMaterial_Update]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spMaterial_Update]
@Id int,
@Name nvarchar(50),
@NumberOfBooks int,
@NumberOfSections int,
@NumberOfLectures int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	 update Materials set Name = @Name,NumberOfBooks = @NumberOfBooks,NumberOfLectures = @NumberOfLectures,NumberOfSections = @NumberOfSections where Id = @Id
	 delete Lectures where Id in (select LectureId from MaterialsLectures where MaterialId = @Id)
	 delete Sections where Id in (select SectionId from MaterialsSections where MaterialId = @Id)
	 delete Books where Id in (select BookId from MaterialsBooks where MaterialId = @Id)
	 delete BooksAuthors where BookId in (select BookId from MaterialsBooks where MaterialId = @Id)
	 delete MaterialsBooks where MaterialId = @Id
	 delete MaterialsLectures where MaterialId = @Id
	 delete MaterialsSections where MaterialId = @Id
	 
END
GO
/****** Object:  StoredProcedure [dbo].[spMaterials_Check]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spMaterials_Check]
@Name nvarchar(50),
@NumberOfBooks int,
@NumberOfSections int,
@NumberOfLectures int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	select * from Materials where Name = @Name and NumberOfBooks = @NumberOfBooks and NumberOfLectures = @NumberOfLectures and NumberOfSections = @NumberOfSections
END
GO
/****** Object:  StoredProcedure [dbo].[spMaterials_Get]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spMaterials_Get] 
	
AS
BEGIN
	
	SET NOCOUNT ON;
	select * from Materials
END
GO
/****** Object:  StoredProcedure [dbo].[spMaterials_Insert]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spMaterials_Insert] 
	@Name nvarchar(50),
	@NumberOfBooks int,
	@NumberOfSections int,
	@NumberOfLectures int,
	@Id int = 0 out
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Insert into Materials(Name,NumberOfBooks,NumberOfLectures,NumberOfSections)values(@Name,@NumberOfBooks,@NumberOfLectures,@NumberOfSections)
    select @Id = Scope_Identity();
END
GO
/****** Object:  StoredProcedure [dbo].[spMaterials_Search]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spMaterials_Search] 
@Name nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select * from Materials where Name like '%' + @Name or Name like '%' + @Name + '%' or Name like @Name + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[spMaterIalsBooks_Get]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spMaterIalsBooks_Get] 
	@MaterialId int 
AS
BEGIN
	
	SET NOCOUNT ON;
	select Books.* from Books Inner join  MaterialsBooks on Books.Id = MaterialsBooks.BookId where  MaterialsBooks.MaterialId = @MaterialId 

END
GO
/****** Object:  StoredProcedure [dbo].[spMaterIalsBooks_Insert]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spMaterIalsBooks_Insert] 
	@Name nvarchar(50),
	@Publisher nvarchar(50),
	@ChapterCount int,
	@PageCount int,
	@Location text,
	@Date text,
	@MaterialId int,
	@Id int = 0 out
AS
BEGIN
	SET NOCOUNT ON;
	if(@Id = 0)
	begin
		insert into dbo.Books(Name,Publisher,ChapterCount,PageCount,Location,Date)values(@Name,@Publisher,@ChapterCount,@PageCount,@Location,@Date);
        select @Id = SCOPE_IDENTITY();
		Insert into MaterialsBooks(BookId,MaterialId)values(@Id,@MaterialId)
	end
	else
	begin
	Insert into MaterialsBooks(BookId,MaterialId)values(@Id,@MaterialId)
	end
END
GO
/****** Object:  StoredProcedure [dbo].[spMaterialsByCourse_Get]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spMaterialsByCourse_Get] 
	@courseid int
AS
BEGIN

	SET NOCOUNT ON;
	select * from Materials where Id in  (select CoursesMaterials.MaterialId from CoursesMaterials inner join Materials on CoursesMaterials.MaterialId = Materials.Id where CoursesMaterials.CourseId = @courseid);
END
GO
/****** Object:  StoredProcedure [dbo].[spMaterialsByInstructor_Get]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spMaterialsByInstructor_Get] 
	@instructorid int
AS
BEGIN

	SET NOCOUNT ON;
	create table #temp
	(
	materialid int,
	courseid int
	)
	insert into #temp(courseid)  select CoursesInstructors.CourseId from CoursesInstructors inner join Instructors on CoursesInstructors.InstructorId = Instructors.Id where InstructorId = @instructorid;
	select * from Materials where Id in  (select CoursesMaterials.MaterialId from CoursesMaterials inner join Materials on CoursesMaterials.MaterialId = Materials.Id where CoursesMaterials.CourseId in (select courseid from #temp));
END
GO
/****** Object:  StoredProcedure [dbo].[spMaterIalsLectures_Get]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spMaterIalsLectures_Get] 
	@MaterialId int 
AS
BEGIN
	
	SET NOCOUNT ON;
	select Lectures.* from Lectures Inner join  MaterialsLectures on Lectures.Id = MaterialsLectures.LectureId where  MaterialsLectures.MaterialId = @MaterialId 

END
GO
/****** Object:  StoredProcedure [dbo].[spMaterIalsLectures_Insert]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spMaterIalsLectures_Insert] 
	@Name nvarchar(50),
	@PageCount int,
	@Location text,
	@Date text,
	@MaterialId int,
	@LectureId int 
AS
BEGIN
	SET NOCOUNT ON;
	if(@LectureId = 0)
	begin
	insert into Lectures(Name,PageCount,Location,Date)values(@Name,@PageCount,@Location,@Date);
	select @LectureId = Scope_Identity();
	Insert into MaterialsLectures(LectureId,MaterialId)values(@LectureId,@MaterialId)
	end
	else
	begin
	Insert into MaterialsLectures(LectureId,MaterialId)values(@LectureId,@MaterialId)
	end
END
GO
/****** Object:  StoredProcedure [dbo].[spMaterIalsSections_Get]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spMaterIalsSections_Get] 
	@MaterialId int 
AS
BEGIN
	
	SET NOCOUNT ON;
	select Sections.* from Sections Inner join  MaterialsSections on Sections.Id = MaterialsSections.SectionId where  MaterialsSections.MaterialId = @MaterialId 

END
GO
/****** Object:  StoredProcedure [dbo].[spMaterIalsSections_Insert]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spMaterIalsSections_Insert] 
	@Name nvarchar(50),
	@PageCount int,
	@Location text,
	@Date text,
	@MaterialId int,
	@SectionId int 
AS
BEGIN
	SET NOCOUNT ON;
	if(@SectionId = 0)
	begin
	insert into Sections(Name,PageCount,Location,Date)values(@Name,@PageCount,@Location,@Date);
	select @SectionId = Scope_Identity();
	Insert into MaterialsSections(SectionId,MaterialId)values(@SectionId,@MaterialId)
	end
	else
	begin
	Insert into MaterialsSections(SectionId,MaterialId)values(@SectionId,@MaterialId)
	end
END
GO
/****** Object:  StoredProcedure [dbo].[spSection_Delete]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spSection_Delete]
	@Id int
AS
BEGIN
	SET NOCOUNT ON;
	Delete dbo.Sections where Id = @Id
	delete MaterialsSections where SectionId = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[spSection_Get]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spSection_Get]
	@Id int
AS
BEGIN
	SET NOCOUNT ON;
	select * from Sections where Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[spSection_Insert]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSection_Insert]
	@Name nvarchar(50),
	@PageCount int,
	@Location varchar(1000),
	@Date varchar(10),
	@MaterialId int,
	@Id int = 0 out
AS
BEGIN
	SET NOCOUNT ON;
	insert into dbo.Sections(Name,PageCount,Location,Date)values(@Name,@PageCount,@Location,@Date);
	select @Id = SCOPE_IDENTITY();
	insert into MaterialsSections(SectionId,MaterialId)values(@Id,@MaterialId)
END
GO
/****** Object:  StoredProcedure [dbo].[spSection_Update]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSection_Update]
	@Name nvarchar(50),
	@PageCount int,
	@Location varchar(1000),
	@Date varchar(10),
	@Id int 
AS
BEGIN
	SET NOCOUNT ON;
	update dbo.Sections set Name = @Name,PageCount = @PageCount,Location = @Location,Date = @Date where Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[spSections_Check]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSections_Check] 
	@Name nvarchar(50),
	@PageCount int,
	@Location varchar(1000),
	@Date varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select * from Sections where Name = @Name and PageCount = @PageCount and Location = @Location and Date = @Date
END
GO
/****** Object:  StoredProcedure [dbo].[spSections_Get]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSections_Get]
	
AS
BEGIN
	SET NOCOUNT ON;
	select top 250 
	   [Id]
      ,[Name]
      ,[PageCount]
      ,[Date] from Sections
	
END
GO
/****** Object:  StoredProcedure [dbo].[spSections_Search]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSections_Search] 
@Name nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select top 250 
	   [Id]
      ,[Name]
      ,[PageCount] 
	   from Sections where Name like '%' + @Name or Name like '%' + @Name + '%' or Name like @Name + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[spSectionsByCourse_Get]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spSectionsByCourse_Get] 
	@courseid int
AS
BEGIN

	SET NOCOUNT ON;
	create table #temp
	(
	materialid int
	)
	insert into #temp(materialid) select CoursesMaterials.MaterialId from CoursesMaterials inner join Materials on CoursesMaterials.MaterialId = Materials.Id where CoursesMaterials.CourseId = @courseid;
	select * from Sections where Id in (select MaterialsSections.SectionId from Materials  inner join MaterialsSections on MaterialsSections.MaterialId = Materials.Id where Materials.Id in (select materialid from #temp));
END
GO
/****** Object:  StoredProcedure [dbo].[spSectionsByInstructor_Get]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSectionsByInstructor_Get] 
	@instructorid int
AS
BEGIN

	SET NOCOUNT ON;
	create table #temp
	(
	materialid int,
	courseid int
	)
	insert into #temp(courseid)   select CoursesInstructors.CourseId from CoursesInstructors inner join Instructors on CoursesInstructors.InstructorId = Instructors.Id where InstructorId = @instructorid;
	insert into #temp(materialid) select CoursesMaterials.MaterialId from CoursesMaterials inner join Materials on CoursesMaterials.MaterialId = Materials.Id where CoursesMaterials.CourseId in (select courseid from #temp);
	select * from Sections where Id in (select MaterialsSections.SectionId from Materials  inner join MaterialsSections on MaterialsSections.MaterialId = Materials.Id where Materials.Id in (select materialid from #temp));
END
GO
/****** Object:  StoredProcedure [dbo].[spSectionsByMaterial_Get]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSectionsByMaterial_Get] 
	@materialid int
AS
BEGIN

	SET NOCOUNT ON;
	select * from Sections where Id in (select MaterialsSections.SectionId from Materials  inner join MaterialsSections on MaterialsSections.MaterialId = Materials.Id where MaterialsSections.Id = @materialid);
END
GO
/****** Object:  StoredProcedure [dbo].[spwipe_all_records]    Script Date: 28/3/2020 5:46:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spwipe_all_records]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;

   delete Books
   delete BooksAuthors
   delete Courses
   delete CoursesInstructors
   delete CoursesMaterials
   delete Instructors
   delete Lectures
   delete Materials
   delete MaterialsBooks
   delete MaterialsLectures
   delete MaterialsSections
   delete Sections

END
GO
USE [master]
GO
ALTER DATABASE [Library] SET  READ_WRITE 
GO
