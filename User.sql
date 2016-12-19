USE [BrothersKeeper]
GO

/****** Object:  Table [dbo].[User]    Script Date: 12/19/2016 2:38:45 PM ******/
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


