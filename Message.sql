USE [BrothersKeeper]
GO

/****** Object:  Table [dbo].[Message]    Script Date: 12/19/2016 2:38:31 PM ******/
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


