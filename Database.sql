USE [master]
GO
/****** Object:  Database [Socialbodhi]    Script Date: 9/22/2017 10:50:32 PM ******/
CREATE DATABASE [Socialbodhi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Socialbodhi', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.ADMIN\MSSQL\DATA\Socialbodhi.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Socialbodhi_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.ADMIN\MSSQL\DATA\Socialbodhi_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Socialbodhi] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Socialbodhi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Socialbodhi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Socialbodhi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Socialbodhi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Socialbodhi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Socialbodhi] SET ARITHABORT OFF 
GO
ALTER DATABASE [Socialbodhi] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Socialbodhi] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Socialbodhi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Socialbodhi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Socialbodhi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Socialbodhi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Socialbodhi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Socialbodhi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Socialbodhi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Socialbodhi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Socialbodhi] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Socialbodhi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Socialbodhi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Socialbodhi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Socialbodhi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Socialbodhi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Socialbodhi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Socialbodhi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Socialbodhi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Socialbodhi] SET  MULTI_USER 
GO
ALTER DATABASE [Socialbodhi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Socialbodhi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Socialbodhi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Socialbodhi] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Socialbodhi]
GO
/****** Object:  Table [dbo].[Choice]    Script Date: 9/22/2017 10:50:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Choice](
	[ChoiceId] [bigint] IDENTITY(1,1) NOT NULL,
	[ChoiceName] [nvarchar](256) NULL,
	[InstanceId] [bigint] NULL,
	[UserId] [bigint] NOT NULL,
	[Status] [bit] NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK_Choice] PRIMARY KEY CLUSTERED 
(
	[ChoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Instance]    Script Date: 9/22/2017 10:50:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instance](
	[InstanceId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NULL,
	[Status] [bit] NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK_Instance] PRIMARY KEY CLUSTERED 
(
	[InstanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Participants]    Script Date: 9/22/2017 10:50:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Participants](
	[ParticipantsId] [bigint] IDENTITY(1,1) NOT NULL,
	[InstanceId] [bigint] NULL,
	[ParticipantsName] [nvarchar](500) NULL,
	[Participantsemail] [nvarchar](500) NULL,
	[Rating] [int] NULL,
	[ChoiceId] [bigint] NULL,
	[Status] [bit] NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK_Participants] PRIMARY KEY CLUSTERED 
(
	[ParticipantsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 9/22/2017 10:50:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[Password] [nvarchar](256) NULL,
	[FirstName] [nvarchar](256) NULL,
	[LastName] [nvarchar](256) NULL,
	[EmailId] [nvarchar](256) NULL,
	[Status] [bit] NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Choice]  WITH NOCHECK ADD  CONSTRAINT [FK_Choice_Instance] FOREIGN KEY([InstanceId])
REFERENCES [dbo].[Instance] ([InstanceId])
GO
ALTER TABLE [dbo].[Choice] CHECK CONSTRAINT [FK_Choice_Instance]
GO
ALTER TABLE [dbo].[Choice]  WITH NOCHECK ADD  CONSTRAINT [FK_Choice_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Choice] CHECK CONSTRAINT [FK_Choice_User]
GO
ALTER TABLE [dbo].[Instance]  WITH NOCHECK ADD  CONSTRAINT [FK_Instance_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Instance] CHECK CONSTRAINT [FK_Instance_User]
GO
ALTER TABLE [dbo].[Participants]  WITH NOCHECK ADD  CONSTRAINT [FK_Participants_Choice] FOREIGN KEY([ChoiceId])
REFERENCES [dbo].[Choice] ([ChoiceId])
GO
ALTER TABLE [dbo].[Participants] CHECK CONSTRAINT [FK_Participants_Choice]
GO
ALTER TABLE [dbo].[Participants]  WITH NOCHECK ADD  CONSTRAINT [FK_Participants_Instance] FOREIGN KEY([InstanceId])
REFERENCES [dbo].[Instance] ([InstanceId])
GO
ALTER TABLE [dbo].[Participants] CHECK CONSTRAINT [FK_Participants_Instance]
GO
USE [master]
GO
ALTER DATABASE [Socialbodhi] SET  READ_WRITE 
GO
