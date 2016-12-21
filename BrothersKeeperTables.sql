USE [master]
GO

/****** Object:  Database [BrothersKeepers]    Script Date: 12/21/2016 2:38:43 PM ******/
CREATE DATABASE [BrothersKeepers]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BrothersKeepers', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BrothersKeepers.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BrothersKeepers_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BrothersKeepers_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [BrothersKeepers] SET COMPATIBILITY_LEVEL = 120
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BrothersKeepers].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [BrothersKeepers] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [BrothersKeepers] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [BrothersKeepers] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [BrothersKeepers] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [BrothersKeepers] SET ARITHABORT OFF 
GO

ALTER DATABASE [BrothersKeepers] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [BrothersKeepers] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [BrothersKeepers] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [BrothersKeepers] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [BrothersKeepers] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [BrothersKeepers] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [BrothersKeepers] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [BrothersKeepers] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [BrothersKeepers] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [BrothersKeepers] SET  DISABLE_BROKER 
GO

ALTER DATABASE [BrothersKeepers] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [BrothersKeepers] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [BrothersKeepers] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [BrothersKeepers] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [BrothersKeepers] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [BrothersKeepers] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [BrothersKeepers] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [BrothersKeepers] SET RECOVERY FULL 
GO

ALTER DATABASE [BrothersKeepers] SET  MULTI_USER 
GO

ALTER DATABASE [BrothersKeepers] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [BrothersKeepers] SET DB_CHAINING OFF 
GO

ALTER DATABASE [BrothersKeepers] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [BrothersKeepers] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [BrothersKeepers] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [BrothersKeepers] SET  READ_WRITE 
GO






**************************

CREATE TABLE [dbo].[Users] (
    [UserId]     INT          NOT NULL,
    [UserName]   VARCHAR (50) NULL,
    [Password]   VARCHAR (50) NULL,
    [Name]       VARCHAR (30) NULL,
    [Address]    VARCHAR (50) NULL,
    [AddressURL] VARCHAR (50) NULL,
    [Experience] VARCHAR (50) NULL, 
    CONSTRAINT [PK_Users] PRIMARY KEY ([UserId])
);

***************************

CREATE TABLE [dbo].[Survey] (
    [SurveyId]        INT NULL,
    [SkillIdKnown]    INT NULL,
    [SkillIdLearning] INT NULL,
    [UserId]          INT NULL,
    CONSTRAINT [FK_Survey_ToTable] FOREIGN KEY ([SkillIdKnown]) REFERENCES [dbo].[Skills] ([SkillId]),
    CONSTRAINT [FK_Survey_ToTable_1] FOREIGN KEY ([SkillIdLearning]) REFERENCES [dbo].[Skills] ([SkillId]),
    CONSTRAINT [FK_Survey_ToTable_2] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([UserId])
);

*******************************

CREATE TABLE [dbo].[Skills] (
    [SkillId]          INT           NOT NULL,
    [SkillName]        VARCHAR (50)  NULL,
    [SkillDescription] VARCHAR (250) NULL,
    CONSTRAINT [PK_Skills] PRIMARY KEY CLUSTERED ([SkillId] ASC)
);

********************************

CREATE TABLE [dbo].[Message] (
    [MessageID]   INT  NOT NULL,
    [FromUserId]  INT  NOT NULL,
    [ToUserId]    INT  NULL,
    [MessageText] TEXT NULL,
    CONSTRAINT [FK_Message_ToTable] FOREIGN KEY ([FromUserId]) REFERENCES [dbo].[Users] ([UserId]),
    CONSTRAINT [FK_Message_ToTable_1] FOREIGN KEY ([ToUserId]) REFERENCES [dbo].[Users] ([UserId])
);

****************************

CREATE TABLE [dbo].[Mentor] (
    [MentorId] INT NOT NULL,
    [SkillId]  INT NOT NULL,
    CONSTRAINT [FK_Mentor_ToTable] FOREIGN KEY ([MentorId]) REFERENCES [dbo].[Users] ([UserId]),
    CONSTRAINT [FK_Mentor_ToTable_1] FOREIGN KEY ([SkillId]) REFERENCES [dbo].[Skills] ([SkillId])
);

***************************

CREATE TABLE [dbo].[Mentee] (
    [MenteeId] INT NULL,
    [SkillId]  INT NULL,
    [MentorId] INT NULL,
    CONSTRAINT [FK_Mentee_ToTable] FOREIGN KEY ([MenteeId]) REFERENCES [dbo].[Users] ([UserId]),
    CONSTRAINT [FK_Mentee_ToTable_1] FOREIGN KEY ([SkillId]) REFERENCES [dbo].[Skills] ([SkillId]),
    CONSTRAINT [FK_Mentee_ToTable_2] FOREIGN KEY ([MentorId]) REFERENCES [dbo].[Users] ([UserId])
);

