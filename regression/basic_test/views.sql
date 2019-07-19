USE [master]
GO
/****** Object:  Database [TestDB]    Script Date: 7/7/2019 12:53:05 PM ******/
CREATE DATABASE [TestDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestDB_data', FILENAME = N'E:\Microsoft SQL Server\MSSQL11.MSSQLSERVER\TestDB.mdf' , SIZE = 40994816KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TestDB_log', FILENAME = N'E:\Microsoft SQL Server\MSSQL11.MSSQLSERVER\TestDB_log.ldf' , SIZE = 5044352KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TestDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestDB] SET ARITHABORT OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TestDB', N'ON'
GO
USE [TestDB]
GO
/****** Object:  User [TestDBLogin]    Script Date: 7/7/2019 12:53:05 PM ******/
CREATE USER [TestDBLogin] FOR LOGIN [TestDBLogin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [TestDBLogin]
GO
/****** Object:  Table [dbo].[T3309]    Script Date: 7/7/2019 12:53:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T3309](
	[C1] [nvarchar](15) NOT NULL,
	[C2] [nvarchar](254) NULL,
	[C3] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[C1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T3317]    Script Date: 7/7/2019 12:53:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T3317](
	[C1] [nvarchar](15) NOT NULL,
	[C2] [nvarchar](254) NULL,
	[C3] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[C1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[T3330]    Script Date: 7/7/2019 12:53:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V1] (C1, C2, C3, E0, E1)  AS SELECT B1.C1, B1.C2, B1.C3, B1.C1, B2.C1 FROM dbo.T3309 AS B1 INNER JOIN dbo.T3317 AS B2 ON ((B1.C1 = B2.C1) AND (B1.C2 = B2.C2))
GO
CREATE VIEW [dbo].[V2] (C1, C2, C3, E0, E1)  AS SELECT B1.C1 +  '|'  + B2.C1+ '|'  + B2.C2, CONVERT(NVARCHAR(15),B1.C2), B1.C3+ISNULL(B2.C3, 0), CONVERT(DECIMAL(6, 4), B1.C3*1.023156), CONVERT(INT, B2.C3) FROM dbo.T3309 B1 INNER JOIN dbo.T3317 B2 ON ((B1.C1 = B2.C1) AND (B1.C2 = B2.C2))
GO
CREATE VIEW [dbo].[V3] (C1)  AS SELECT 2
GO
CREATE VIEW [dbo].[V4] (C1)  AS SELECT B1.C1 + N'|' + CAST(ISNULL(B2.C1, '') AS VARCHAR(256)) FROM dbo.T3309 B1 INNER JOIN dbo.T3317 B2 ON ((B1.C1 = B2.C1) AND (B1.C2 = B2.C2))
GO
CREATE VIEW [dbo].[V5] (C1)  AS SELECT N'|'+B2.C1,B1.C1+'$ test $'+B2.C2, B1.C1 + 'isnull(' FROM dbo.T3309 B1 INNER JOIN dbo.T3317 B2 ON ((B1.C1 = B2.C1) AND (B1.C2 = B2.C2))
GO
USE [master]
GO
ALTER DATABASE [TestDB] SET  READ_WRITE 
GO
