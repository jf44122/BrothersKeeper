//Users Table
USE [BrothersKeeper]
GO

/****** Object:  Table [dbo].[User]    Script Date: 12/20/2016 10:41:35 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[User](
	[UserId] [uniqueidentifier] NOT NULL,
	[User Name] [text] NOT NULL,
	[Password] [text] NOT NULL,
	[Name] [text] NOT NULL,
	[Address] [text] NOT NULL,
	[AddressUrl] [nchar](10) NOT NULL,
	[Experience] [nchar](10) NOT NULL,
	[UserType] [nchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO



//Mentee TABLE
USE [BrothersKeeper]
GO

/****** Object:  Table [dbo].[Mentee]    Script Date: 12/20/2016 10:41:29 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Mentee](
	[MenteeId] [nchar](10) NOT NULL,
	[User] [nchar](10) NOT NULL,
	[Skill] [nchar](10) NOT NULL,
	[Mentor] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Mentee] PRIMARY KEY CLUSTERED 
(
	[MenteeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

//Mentors TABLE
USE [BrothersKeeper]
GO

/****** Object:  Table [dbo].[Mentors]    Script Date: 12/20/2016 10:43:04 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Mentors](
	[MentorId] [uniqueidentifier] NOT NULL,
	[MentorName] [nchar](10) NOT NULL,
	[Skill] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Mentors] PRIMARY KEY CLUSTERED 
(
	[MentorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


//Message
USE [BrothersKeeper]
GO

/****** Object:  Table [dbo].[Message]    Script Date: 12/20/2016 10:43:33 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Message](
	[MessageID] [uniqueidentifier] NOT NULL,
	[Text] [text] NOT NULL,
	[FromUserId] [int] NULL,
	[ToUserId] [int] NULL,
	[CategoryId] [int] NOT NULL,
	[SkillId] [int] NOT NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_Message] FOREIGN KEY([MessageID])
REFERENCES [dbo].[Message] ([MessageID])
GO

ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_Message]
GO

//Skills
USE [BrothersKeeper]
GO

/****** Object:  Table [dbo].[Skills]    Script Date: 12/20/2016 10:44:08 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Skills](
	[SkillId] [uniqueidentifier] NOT NULL,
	[SkillName] [text] NOT NULL,
	[SkillDescription] [text] NULL,
 CONSTRAINT [PK_SkillId] PRIMARY KEY CLUSTERED 
(
	[SkillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


//Survey
USE [BrothersKeeper]
GO

/****** Object:  Table [dbo].[Survey]    Script Date: 12/20/2016 10:44:57 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Survey](
	[SurveyId] [nchar](10) NOT NULL,
	[Goal] //[drop down options]
	
	[SkillsKnown] [nchar](10) NULL,
	[SkillsLearning] [nchar](10) NULL,
	[UserId] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Survey] PRIMARY KEY CLUSTERED 
(
	[SurveyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO





