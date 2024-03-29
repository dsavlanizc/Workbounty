USE [master]
GO
/****** Object:  Database [WorkBountyDB]    Script Date: 25-04-2016 09:30:18 ******/
CREATE DATABASE [WorkBountyDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WorkBountyDB', FILENAME = N'C:\Users\jmacwan\WorkBountyDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WorkBountyDB_log', FILENAME = N'C:\Users\jmacwan\WorkBountyDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WorkBountyDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WorkBountyDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WorkBountyDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WorkBountyDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WorkBountyDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WorkBountyDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WorkBountyDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [WorkBountyDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WorkBountyDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [WorkBountyDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WorkBountyDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WorkBountyDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WorkBountyDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WorkBountyDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WorkBountyDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WorkBountyDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WorkBountyDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WorkBountyDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WorkBountyDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WorkBountyDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WorkBountyDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WorkBountyDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WorkBountyDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WorkBountyDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WorkBountyDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WorkBountyDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WorkBountyDB] SET  MULTI_USER 
GO
ALTER DATABASE [WorkBountyDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WorkBountyDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WorkBountyDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WorkBountyDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [WorkBountyDB]
GO
/****** Object:  Table [dbo].[ExceptionLog]    Script Date: 25-04-2016 09:30:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExceptionLog](
	[ExceptionID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[ErrorDetails] [varchar](max) NOT NULL,
	[InnerException] [varchar](5000) NULL,
	[EventDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_ExceptionLog] PRIMARY KEY CLUSTERED 
(
	[ExceptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Team]    Script Date: 25-04-2016 09:30:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team](
	[TeamID] [int] IDENTITY(1,1) NOT NULL,
	[TeamName] [nvarchar](50) NOT NULL,
	[UserID] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[TeamUserInfoID] [int] NULL,
 CONSTRAINT [PK_Team] PRIMARY KEY CLUSTERED 
(
	[TeamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 25-04-2016 09:30:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[PhoneNumber] [nvarchar](25) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[InterestedKeywords] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Workitem]    Script Date: 25-04-2016 09:30:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workitem](
	[WorkitemID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Summary] [nvarchar](200) NOT NULL,
	[StartDate] [date] NOT NULL,
	[DueDate] [date] NOT NULL,
	[PublishedTo] [int] NOT NULL,
	[DocumentFilePath] [nvarchar](250) NOT NULL,
	[ProposedReward] [nvarchar](50) NOT NULL,
	[Amount] [nvarchar](50) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[ModifyBy] [int] NOT NULL,
	[ModifyDateTime] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
	[Remarks] [nvarchar](100) NOT NULL,
	[IsOpenForGroup] [bit] NOT NULL,
 CONSTRAINT [PK_Workitem] PRIMARY KEY CLUSTERED 
(
	[WorkitemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkItemAssignment]    Script Date: 25-04-2016 09:30:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkItemAssignment](
	[WorkItemAssignmentID] [int] IDENTITY(1,1) NOT NULL,
	[WorkItemID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[SubmissionPath] [nvarchar](250) NOT NULL,
	[IsRewarded] [bit] NOT NULL,
	[SubmissionDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_WorkItemAssignment] PRIMARY KEY CLUSTERED 
(
	[WorkItemAssignmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkitemDistribution]    Script Date: 25-04-2016 09:30:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkitemDistribution](
	[WorkitemID] [int] NOT NULL,
	[TeamID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[WorkitemDistributionID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_WorkitemDistribution] PRIMARY KEY CLUSTERED 
(
	[WorkitemDistributionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkitemHistory]    Script Date: 25-04-2016 09:30:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkitemHistory](
	[WorkitemID] [int] NOT NULL,
	[WorkitemStatusID] [int] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedDateTIme] [datetime] NOT NULL,
	[WorkitemHistoryID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_WorkitemHistory] PRIMARY KEY CLUSTERED 
(
	[WorkitemHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkitemRegistration]    Script Date: 25-04-2016 09:30:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkitemRegistration](
	[WorkitemID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[IsExclusive] [bit] NOT NULL,
	[IsFavourite] [bit] NOT NULL,
	[IsRegistered] [bit] NOT NULL,
	[WorkitemRegistrationID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_WorkitemRegistration] PRIMARY KEY CLUSTERED 
(
	[WorkitemRegistrationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkitemStatus]    Script Date: 25-04-2016 09:30:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkitemStatus](
	[WorkitemStatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusDescription] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_WorkitemStatus] PRIMARY KEY CLUSTERED 
(
	[WorkitemStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Team]  WITH CHECK ADD  CONSTRAINT [FK_Team_Team] FOREIGN KEY([TeamID])
REFERENCES [dbo].[Team] ([TeamID])
GO
ALTER TABLE [dbo].[Team] CHECK CONSTRAINT [FK_Team_Team]
GO
ALTER TABLE [dbo].[Team]  WITH CHECK ADD  CONSTRAINT [FK_Team_UserInfo] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserInfo] ([UserID])
GO
ALTER TABLE [dbo].[Team] CHECK CONSTRAINT [FK_Team_UserInfo]
GO
ALTER TABLE [dbo].[UserInfo]  WITH CHECK ADD  CONSTRAINT [FK_UserInfo_UserInfo] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserInfo] ([UserID])
GO
ALTER TABLE [dbo].[UserInfo] CHECK CONSTRAINT [FK_UserInfo_UserInfo]
GO
ALTER TABLE [dbo].[Workitem]  WITH CHECK ADD  CONSTRAINT [FK_Workitem_UserInfo1] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[UserInfo] ([UserID])
GO
ALTER TABLE [dbo].[Workitem] CHECK CONSTRAINT [FK_Workitem_UserInfo1]
GO
ALTER TABLE [dbo].[Workitem]  WITH CHECK ADD  CONSTRAINT [FK_Workitem_UserInfo2] FOREIGN KEY([ModifyBy])
REFERENCES [dbo].[UserInfo] ([UserID])
GO
ALTER TABLE [dbo].[Workitem] CHECK CONSTRAINT [FK_Workitem_UserInfo2]
GO
ALTER TABLE [dbo].[Workitem]  WITH CHECK ADD  CONSTRAINT [FK_Workitem_Workitem] FOREIGN KEY([WorkitemID])
REFERENCES [dbo].[Workitem] ([WorkitemID])
GO
ALTER TABLE [dbo].[Workitem] CHECK CONSTRAINT [FK_Workitem_Workitem]
GO
ALTER TABLE [dbo].[WorkItemAssignment]  WITH CHECK ADD  CONSTRAINT [FK_WorkItemAssignment_UserInfo] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserInfo] ([UserID])
GO
ALTER TABLE [dbo].[WorkItemAssignment] CHECK CONSTRAINT [FK_WorkItemAssignment_UserInfo]
GO
ALTER TABLE [dbo].[WorkItemAssignment]  WITH CHECK ADD  CONSTRAINT [FK_WorkItemAssignment_Workitem] FOREIGN KEY([WorkItemID])
REFERENCES [dbo].[Workitem] ([WorkitemID])
GO
ALTER TABLE [dbo].[WorkItemAssignment] CHECK CONSTRAINT [FK_WorkItemAssignment_Workitem]
GO
ALTER TABLE [dbo].[WorkitemDistribution]  WITH CHECK ADD  CONSTRAINT [FK_WorkitemDistribution_UserInfo] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserInfo] ([UserID])
GO
ALTER TABLE [dbo].[WorkitemDistribution] CHECK CONSTRAINT [FK_WorkitemDistribution_UserInfo]
GO
ALTER TABLE [dbo].[WorkitemDistribution]  WITH CHECK ADD  CONSTRAINT [FK_WorkitemDistribution_Workitem] FOREIGN KEY([WorkitemID])
REFERENCES [dbo].[Workitem] ([WorkitemID])
GO
ALTER TABLE [dbo].[WorkitemDistribution] CHECK CONSTRAINT [FK_WorkitemDistribution_Workitem]
GO
ALTER TABLE [dbo].[WorkitemHistory]  WITH CHECK ADD  CONSTRAINT [FK_WorkitemHistory_UserInfo] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[UserInfo] ([UserID])
GO
ALTER TABLE [dbo].[WorkitemHistory] CHECK CONSTRAINT [FK_WorkitemHistory_UserInfo]
GO
ALTER TABLE [dbo].[WorkitemHistory]  WITH CHECK ADD  CONSTRAINT [FK_WorkitemHistory_Workitem] FOREIGN KEY([WorkitemID])
REFERENCES [dbo].[Workitem] ([WorkitemID])
GO
ALTER TABLE [dbo].[WorkitemHistory] CHECK CONSTRAINT [FK_WorkitemHistory_Workitem]
GO
ALTER TABLE [dbo].[WorkitemHistory]  WITH CHECK ADD  CONSTRAINT [FK_WorkitemHistory_WorkitemStatus] FOREIGN KEY([WorkitemStatusID])
REFERENCES [dbo].[WorkitemStatus] ([WorkitemStatusID])
GO
ALTER TABLE [dbo].[WorkitemHistory] CHECK CONSTRAINT [FK_WorkitemHistory_WorkitemStatus]
GO
ALTER TABLE [dbo].[WorkitemRegistration]  WITH CHECK ADD  CONSTRAINT [FK_WorkitemRegistration_UserInfo] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserInfo] ([UserID])
GO
ALTER TABLE [dbo].[WorkitemRegistration] CHECK CONSTRAINT [FK_WorkitemRegistration_UserInfo]
GO
ALTER TABLE [dbo].[WorkitemRegistration]  WITH CHECK ADD  CONSTRAINT [FK_WorkitemRegistration_Workitem] FOREIGN KEY([WorkitemID])
REFERENCES [dbo].[Workitem] ([WorkitemID])
GO
ALTER TABLE [dbo].[WorkitemRegistration] CHECK CONSTRAINT [FK_WorkitemRegistration_Workitem]
GO
USE [master]
GO
ALTER DATABASE [WorkBountyDB] SET  READ_WRITE 
GO
