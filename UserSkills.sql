USE [BrothersKeeper]
GO

/****** Object:  Table [dbo].[UserSkillID]    Script Date: 12/19/2016 2:39:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UserSkillID](
	[UserSkillId] [nchar](10) NOT NULL,
	[UsedId] [text] NOT NULL,
 CONSTRAINT [PK_UserSkillID] PRIMARY KEY CLUSTERED 
(
	[UserSkillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[UserSkillID]  WITH CHECK ADD  CONSTRAINT [FK_UserSkillID_UserSkillID] FOREIGN KEY([UserSkillId])
REFERENCES [dbo].[UserSkillID] ([UserSkillId])
GO

ALTER TABLE [dbo].[UserSkillID] CHECK CONSTRAINT [FK_UserSkillID_UserSkillID]
GO


