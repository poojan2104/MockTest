USE [master]
GO
/****** Object:  Database [MockTest]    Script Date: 9/25/2019 1:18:16 PM ******/
CREATE DATABASE [MockTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MockTest', FILENAME = N'E:\Poojan Personal\GitHub\MockTest\MockTest\App_Data\MockTest.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MockTest_log', FILENAME = N'E:\Poojan Personal\GitHub\MockTest\MockTest\App_Data\MockTest_log.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MockTest] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MockTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MockTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MockTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MockTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MockTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MockTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [MockTest] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MockTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MockTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MockTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MockTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MockTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MockTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MockTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MockTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MockTest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MockTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MockTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MockTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MockTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MockTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MockTest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MockTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MockTest] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MockTest] SET  MULTI_USER 
GO
ALTER DATABASE [MockTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MockTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MockTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MockTest] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MockTest] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MockTest] SET QUERY_STORE = OFF
GO
USE [MockTest]
GO
/****** Object:  Table [dbo].[Athlete]    Script Date: 9/25/2019 1:18:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Athlete](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_Athlete] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coach]    Script Date: 9/25/2019 1:18:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coach](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_Coach] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SQL_CustomFK]    Script Date: 9/25/2019 1:18:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SQL_CustomFK](
	[IsEnable] [bit] NULL,
	[FKType] [varchar](5) NULL,
	[TableID] [varchar](50) NULL,
	[JoinOrder] [int] NULL,
	[PKTable] [varchar](100) NOT NULL,
	[PKSchema] [varchar](100) NULL,
	[PKColumn] [varchar](100) NOT NULL,
	[FKTable] [varchar](100) NOT NULL,
	[FKSchema] [varchar](100) NULL,
	[FKColumn] [varchar](100) NOT NULL,
	[CustomFKName] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SQL_FixColumn]    Script Date: 9/25/2019 1:18:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SQL_FixColumn](
	[TableName] [varchar](100) NOT NULL,
	[SchemaName] [varchar](100) NULL,
	[ColumnName] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SQL_FKDisplayMember]    Script Date: 9/25/2019 1:18:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SQL_FKDisplayMember](
	[TableName] [varchar](100) NOT NULL,
	[SchemaName] [varchar](100) NULL,
	[ColumnName] [varchar](100) NOT NULL,
	[IsSeparate] [bit] NULL,
	[Sequence] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SQL_Sequence]    Script Date: 9/25/2019 1:18:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SQL_Sequence](
	[TableName] [varchar](100) NOT NULL,
	[SchemaName] [varchar](100) NULL,
	[ColumnName] [varchar](100) NOT NULL,
	[Sequence] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test]    Script Date: 9/25/2019 1:18:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TestType] [varchar](50) NULL,
	[TestDate] [datetime] NULL,
 CONSTRAINT [PK_Test] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestDetails]    Script Date: 9/25/2019 1:18:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TestId] [int] NULL,
	[UserId] [int] NULL,
	[Distance] [decimal](10, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 9/25/2019 1:18:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[UserType] [varchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Athlete]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Coach]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TestDetails]  WITH CHECK ADD  CONSTRAINT [FK__TestDetai__TestI__239E4DCF] FOREIGN KEY([TestId])
REFERENCES [dbo].[Test] ([Id])
GO
ALTER TABLE [dbo].[TestDetails] CHECK CONSTRAINT [FK__TestDetai__TestI__239E4DCF]
GO
ALTER TABLE [dbo].[TestDetails]  WITH CHECK ADD  CONSTRAINT [FK__TestDetai__UserI__24927208] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[TestDetails] CHECK CONSTRAINT [FK__TestDetai__UserI__24927208]
GO
/****** Object:  StoredProcedure [dbo].[PR_Coach_SelectAll]    Script Date: 9/25/2019 1:18:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[PR_Coach_SelectAll]
as
select * from Coach
GO
/****** Object:  StoredProcedure [dbo].[PR_Test_Delete]    Script Date: 9/25/2019 1:18:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Test_Delete]

	@Id int
			
AS 

DELETE FROM [dbo].[TestDetails]

WHERE [dbo].[TestDetails].[TestId] = @Id;

Delete From [dbo].[Test]

Where [dbo].[Test].[Id] = @Id;	
GO
/****** Object:  StoredProcedure [dbo].[PR_Test_Insert]    Script Date: 9/25/2019 1:18:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Test_Insert]

			 @TestType		varchar(50)
			,@TestDate		datetime

AS 

INSERT INTO [dbo].[Test]
			(
			[TestType]
			,[TestDate])
	VALUES
			(
			 @TestType
			,@TestDate)

GO
/****** Object:  StoredProcedure [dbo].[PR_Test_SelectAll]    Script Date: 9/25/2019 1:18:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Test_SelectAll]

AS

SELECT 
	 [dbo].[Test].[Id]
	, [dbo].[Test].[TestType]
	, [dbo].[Test].[TestDate]
 FROM [dbo].[Test]
GO
/****** Object:  StoredProcedure [dbo].[PR_Test_SelectById]    Script Date: 9/25/2019 1:18:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_Test_SelectById]

             @Id    int
AS

SELECT
	[dbo].[Test].[TestType],
	[dbo].[Test].[TestDate],
	[dbo].[User].[Username],
	[dbo].[TestDetails].[Distance],
	[dbo].[TestDetails].[UserId],
	[dbo].[TestDetails].[Id]

FROM [dbo].[Test]
JOIN [dbo].[TestDetails] ON [dbo].[Test].[Id] = [TestDetails].[TestId]
 
JOIN [dbo].[User]  ON [dbo].[TestDetails].[UserId] = [User].[Id]


WHERE	[dbo].[Test].[Id] = @Id
GO
/****** Object:  StoredProcedure [dbo].[PR_Test_SelectByParticipent]    Script Date: 9/25/2019 1:18:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Test_SelectByParticipent]

AS

select Test.Id, Test.TestDate, Test.TestType, Participent From Test 
Left Outer Join (select TestDetails.TestId,Count(*) As Participent From TestDetails Group By TestDetails.TestId) As NewTest
ON NewTest.TestId = Test.Id ORDER BY Test.Id DESC;
GO
/****** Object:  StoredProcedure [dbo].[PR_TestDetails_Delete]    Script Date: 9/25/2019 1:18:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_TestDetails_Delete]

	@Id    int
			
AS 

DELETE FROM [dbo].[TestDetails]

WHERE [dbo].[TestDetails].[Id] = @Id
GO
/****** Object:  StoredProcedure [dbo].[PR_TestDetails_FindDistanceByTestIdAndUserId]    Script Date: 9/25/2019 1:18:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_TestDetails_FindDistanceByTestIdAndUserId]
	 @TestId int, @UserId int
As

select Distance, Id from TestDetails where TestId = @TestId and UserId = @UserId;
GO
/****** Object:  StoredProcedure [dbo].[PR_TestDetails_Insert]    Script Date: 9/25/2019 1:18:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_TestDetails_Insert]

			 @TestId		int
			,@UserId		int
			,@Distance		decimal(10,2)

AS 

INSERT INTO [dbo].[TestDetails]
			(
			 [TestId]
			,[UserId]
			,[Distance])
	VALUES
			(
			 @TestId
			,@UserId
			,@Distance)
GO
/****** Object:  StoredProcedure [dbo].[PR_TestDetails_SelectAll_ById]    Script Date: 9/25/2019 1:18:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[PR_TestDetails_SelectAll_ById]
	@TestId int
As
Begin
select TestDetails.Id, TestDetails.TestId , [Athlete].Name As "Name", TestDetails.Distance 
from TestDetails Left Outer Join [User] On TestDetails.UserId = [User].Id
left outer join [Athlete] on [User].id = [Athlete].UserId where TestDetails.TestId = @TestId;
End
GO
/****** Object:  StoredProcedure [dbo].[PR_TestDetails_SelectById]    Script Date: 9/25/2019 1:18:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_TestDetails_SelectById]

		@Id int	
AS 

SELECT

		[dbo].[TestDetails].[Id]
		,[dbo].[TestDetails].[TestId]
		,[dbo].[TestDetails].[UserId]
		,[dbo].[TestDetails].[Distance]

		From [dbo].[TestDetails]

WHERE	[dbo].[TestDetails].[Id] = @Id;
GO
/****** Object:  StoredProcedure [dbo].[PR_TestDetails_SelectByTestIdUserId]    Script Date: 9/25/2019 1:18:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_TestDetails_SelectByTestIdUserId]

	@test_id int,
	@user_id int
			
AS 

SELECT

		[dbo].[TestDetails].[Id]
		,[dbo].[TestDetails].[TestId]
		,[dbo].[TestDetails].[UserId]
		,[dbo].[TestDetails].[Distance]
		FROM	[dbo].[TestDetails]

WHERE	[dbo].[TestDetails].[TestId] = @test_id AND [dbo].[TestDetails].[UserId] = @user_id;
GO
/****** Object:  StoredProcedure [dbo].[PR_TestDetails_Update]    Script Date: 9/25/2019 1:18:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_TestDetails_Update]

			@Id             int,
			@Distance		decimal(10,2)
AS 

UPDATE [dbo].[TestDetails]

SET		
		[Distance] = @Distance

WHERE	[dbo].[TestDetails].[Id] = @Id;
GO
/****** Object:  StoredProcedure [dbo].[PR_User_Login]    Script Date: 9/25/2019 1:18:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_User_Login]

			@UsersName			varchar(50)
AS 

SELECT 
	 [dbo].[User].[Id]
	, [dbo].[User].[Password]
	, [dbo].[User].[UserType]
 FROM [dbo].[User]

WHERE	[dbo].[User].[Username] = @UsersName
GO
/****** Object:  StoredProcedure [dbo].[PR_User_Usernames]    Script Date: 9/25/2019 1:18:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_User_Usernames]

AS

SELECT

	
	[dbo].[User].[Id],
	[dbo].[User].[Username]

FROM [dbo].[User]

WHERE [dbo].[User].[UserType] = 'Athlete';
GO
USE [master]
GO
ALTER DATABASE [MockTest] SET  READ_WRITE 
GO
