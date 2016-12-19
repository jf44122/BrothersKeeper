USE [BrothersKeeper]
GO

/****** Object:  Table [dbo].[SkillId]    Script Date: 12/19/2016 1:36:36 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SkillId](
	[SkillId] [uniqueidentifier] NOT NULL,
	[SkillName] [text] NOT NULL,
	[SkillDescription] [text] NULL,
	[CategoryId] [int] FOREIGN KEY REFERENCES Categories (CategoryId) NOT NULL,
 CONSTRAINT [PK_SkillId] PRIMARY KEY CLUSTERED 
(
	[SkillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


