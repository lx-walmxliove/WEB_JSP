USE [db_news]
GO
/****** Object:  Table [dbo].[message]    Script Date: 12/16/2012 14:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[message](
	[message_id] [int] IDENTITY(1,1) NOT NULL,
	[message_name] [nvarchar](256) NOT NULL,
	[message_content] [nvarchar](500) NOT NULL,
	[message_adddate] [smalldatetime] NULL,
	[message_ip] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comment]    Script Date: 12/16/2012 14:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[comment](
	[comment_id] [int] IDENTITY(1,1) NOT NULL,
	[comment_name] [varchar](256) NOT NULL,
	[comment_content] [nvarchar](500) NOT NULL,
	[comment_adddate] [smalldatetime] NULL,
	[comment_ip] [varchar](50) NULL,
	[article_id] [int] NOT NULL,
 CONSTRAINT [PK_comment] PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[column]    Script Date: 12/16/2012 14:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[column](
	[column_id] [int] IDENTITY(16,1) NOT NULL,
	[column_title] [nvarchar](256) NOT NULL,
	[column_introduce] [nchar](256) NULL,
 CONSTRAINT [PK_column] PRIMARY KEY CLUSTERED 
(
	[column_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[article]    Script Date: 12/16/2012 14:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[article](
	[article_id] [int] IDENTITY(1,1) NOT NULL,
	[article_title] [nvarchar](256) NOT NULL,
	[column_id] [int] NOT NULL,
	[article_author] [nvarchar](256) NULL,
	[article_content] [nvarchar](max) NOT NULL,
	[article_updateTime] [smalldatetime] NOT NULL,
	[article_addTime] [smalldatetime] NOT NULL,
	[article_viewnum] [int] NOT NULL,
	[article_htmlurl] [nvarchar](256) NULL,
	[article_keywords] [nvarchar](500) NULL,
	[article_status] [int] NOT NULL,
	[article_istop] [bit] NOT NULL,
	[article_iscomment] [bit] NOT NULL,
 CONSTRAINT [PK_article] PRIMARY KEY CLUSTERED 
(
	[article_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userinfo]    Script Date: 12/16/2012 14:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[userinfo](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_userinfo] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[updateNews]    Script Date: 12/16/2012 14:59:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updateNews]
@article_title nvarchar(255),
@column_id int,
@author nvarchar(255),
@content nvarchar(Max),
@is_top bit,
@iscomment bit,
@article_id int
as
BEGIN
update article set article_title=@article_title,column_id=@column_id,article_author=@author,article_content=@content,article_updateTime=GETDATE(),article_istop=@is_top,article_iscomment=@iscomment where article_id=@article_id
END
GO
/****** Object:  StoredProcedure [dbo].[addNews]    Script Date: 12/16/2012 14:59:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[addNews]
@article_title nvarchar(255),
@column_id int,
@author nvarchar(255),
@content nvarchar(Max),
@istop bit,
@iscomment bit
as
BEGIN
insert into article values(@article_title,@column_id,@author,@content,GETDATE(),GETDATE(),0,'','',0,@istop,@iscomment)
END
GO
/****** Object:  StoredProcedure [dbo].[addCol]    Script Date: 12/16/2012 14:59:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[addCol] @column_title nvarchar(255),@column_introduce nvarchar(255)
as
 insert into [column](column_title,column_introduce) values(@column_title,@column_introduce)
GO
/****** Object:  Default [DF_article_article_viewnum]    Script Date: 12/16/2012 14:59:35 ******/
ALTER TABLE [dbo].[article] ADD  CONSTRAINT [DF_article_article_viewnum]  DEFAULT ((0)) FOR [article_viewnum]
GO
