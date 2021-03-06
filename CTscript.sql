USE [master]
GO
/****** Object:  Database [CrystalTettey]    Script Date: 25/10/2017 11:39:31 ******/
CREATE DATABASE [CrystalTettey]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CrystalTettey', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQL2012\MSSQL\DATA\CrystalTettey.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CrystalTettey_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQL2012\MSSQL\DATA\CrystalTettey_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CrystalTettey] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CrystalTettey].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CrystalTettey] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CrystalTettey] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CrystalTettey] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CrystalTettey] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CrystalTettey] SET ARITHABORT OFF 
GO
ALTER DATABASE [CrystalTettey] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CrystalTettey] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [CrystalTettey] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CrystalTettey] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CrystalTettey] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CrystalTettey] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CrystalTettey] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CrystalTettey] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CrystalTettey] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CrystalTettey] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CrystalTettey] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CrystalTettey] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CrystalTettey] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CrystalTettey] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CrystalTettey] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CrystalTettey] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CrystalTettey] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CrystalTettey] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CrystalTettey] SET RECOVERY FULL 
GO
ALTER DATABASE [CrystalTettey] SET  MULTI_USER 
GO
ALTER DATABASE [CrystalTettey] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CrystalTettey] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CrystalTettey] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CrystalTettey] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [CrystalTettey]
GO
/****** Object:  User [NT AUTHORITY\SYSTEM]    Script Date: 25/10/2017 11:39:32 ******/
CREATE USER [NT AUTHORITY\SYSTEM] FOR LOGIN [NT AUTHORITY\SYSTEM] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [crystaltettey]    Script Date: 25/10/2017 11:39:32 ******/
CREATE USER [crystaltettey] FOR LOGIN [crystaltettey] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [NT AUTHORITY\SYSTEM]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [NT AUTHORITY\SYSTEM]
GO
ALTER ROLE [db_owner] ADD MEMBER [crystaltettey]
GO
/****** Object:  StoredProcedure [dbo].[spAddEnquiryToDB]    Script Date: 25/10/2017 11:39:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spAddEnquiryToDB]
	@Comment varchar(500),
	@Email varchar(100),
	@FullName varchar(250)
	
	AS
BEGIN
	Insert into tblContactUs(Comment,
	Email,
	FullName,
	 EnquiryDate) values(@Comment,
	@Email,
	@FullName,
	getdate());
END
GO
/****** Object:  StoredProcedure [dbo].[spAddPhotoDetails]    Script Date: 25/10/2017 11:39:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spAddPhotoDetails] 
	@photoDescription varchar(550),
	@photoName varchar(550),
	@photoLink varchar(500),
	@photoAltName varchar(550)
	
	AS
BEGIN
	Insert into tblPhotoGallery(photoDescription,
	photoName,
	photoLink,
	photoAltName) 
	values(@photoDescription,
	@photoName,
	@photoLink,
	@photoAltName);
END
GO
/****** Object:  StoredProcedure [dbo].[spAddRelatedLinksDetails]    Script Date: 25/10/2017 11:39:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAddRelatedLinksDetails] 
	@linkAddress varchar(550),
	@linkName varchar(550),
	@linkDescription varchar(550)
	
	AS
BEGIN
	Insert into tblRelatedLinks(linkAddress,
	linkName,
	linkDescription) 
	values(@linkAddress,
	@linkName,
	@linkDescription);
END
GO
/****** Object:  StoredProcedure [dbo].[spDeletePhotos]    Script Date: 25/10/2017 11:39:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeletePhotos]
	@photoId decimal(18,0)
	AS
BEGIN
	delete from tblPhotoGallery where photoId=@photoId;

END

GO
/****** Object:  StoredProcedure [dbo].[spDeleteRelatedLinks]    Script Date: 25/10/2017 11:39:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeleteRelatedLinks]
	@LinkId decimal(18,0)
	AS
BEGIN
	delete from tblRelatedLinks where LinkId=@LinkId;

END

GO
/****** Object:  StoredProcedure [dbo].[spGetAdminDetails]    Script Date: 25/10/2017 11:39:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGetAdminDetails]
	
AS
BEGIN
	Select * from tblAdminLogon;
END

GO
/****** Object:  StoredProcedure [dbo].[spGetAllPhotoDetails]    Script Date: 25/10/2017 11:39:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGetAllPhotoDetails]
	
AS
BEGIN
	
	SELECT * FROM tblPhotoGallery;
END

GO
/****** Object:  StoredProcedure [dbo].[spGetAllRelatedLinks]    Script Date: 25/10/2017 11:39:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGetAllRelatedLinks]
	
AS
BEGIN
	SELECT * FROM tblRelatedLinks ;
END

GO
/****** Object:  StoredProcedure [dbo].[spSaveChangesPhotoDetails]    Script Date: 25/10/2017 11:39:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSaveChangesPhotoDetails]
	@photoDescription varchar(550),
	@photoName varchar(550),
	@photoId decimal(18,0),
	@photoAltName varchar(550),
	@photoLink varchar(550)
	AS
BEGIN
	update tblPhotoGallery set photoDescription=@photoDescription , photoName=@photoName, photoAltName= @photoAltName, photoLink=@photoLink
	where photoId =@photoId;
END

GO
/****** Object:  StoredProcedure [dbo].[spSaveChangesRelatedLinksDetails]    Script Date: 25/10/2017 11:39:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSaveChangesRelatedLinksDetails]
	@linkAddress varchar(550),
	@linkName varchar(550),
	@linkId decimal(18,0),
	@linkDescription varchar(550)
	AS
BEGIN
	update tblRelatedLinks set linkAddress=@linkAddress , linkName=@linkName, linkDescription= @linkDescription
	where linkId =@linkId;
END

GO
/****** Object:  Table [dbo].[tblAdminLogon]    Script Date: 25/10/2017 11:39:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblAdminLogon](
	[AdminEmail] [varchar](250) NULL,
	[LoginEmail] [varchar](250) NULL,
	[LoginPwd] [varchar](250) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblContactUs]    Script Date: 25/10/2017 11:39:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[tblContactUs](
	[ContactUsId] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[EnquiryDate] [smalldatetime] NULL,
	[FullName] [varchar](250) NULL,
	[Comment] [varchar](550) NULL,
	[Email] [varchar](150) NULL,
 CONSTRAINT [PK_tblContactUs] PRIMARY KEY CLUSTERED 
(
	[ContactUsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPhotoGallery]    Script Date: 25/10/2017 11:39:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPhotoGallery](
	[photoId] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[photoName] [varchar](150) NULL,
	[photoDescription] [varchar](350) NULL,
	[photoAltName] [varchar](50) NULL,
	[photoLink] [varchar](250) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblRelatedLinks]    Script Date: 25/10/2017 11:39:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRelatedLinks](
	[linkId] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[linkName] [varchar](250) NULL,
	[linkDescription] [varchar](250) NULL,
	[linkAddress] [varchar](550) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblAdminLogon] ([AdminEmail], [LoginEmail], [LoginPwd]) VALUES (N'info@crystaltettey.com', N'info@crystaltettey.com', N'Tettey@123')
SET IDENTITY_INSERT [dbo].[tblContactUs] ON 

INSERT [dbo].[tblContactUs] ([ContactUsId], [EnquiryDate], [FullName], [Comment], [Email]) VALUES (CAST(1 AS Decimal(18, 0)), CAST(0xA6B90438 AS SmallDateTime), N'rtretert', N'grgrgrgrg', N'zimpik@yahoo.com')
INSERT [dbo].[tblContactUs] ([ContactUsId], [EnquiryDate], [FullName], [Comment], [Email]) VALUES (CAST(2 AS Decimal(18, 0)), CAST(0xA6B90441 AS SmallDateTime), N'testing me', N'gcgchvmvhbvghv', N'zimpik@yahoo.com')
INSERT [dbo].[tblContactUs] ([ContactUsId], [EnquiryDate], [FullName], [Comment], [Email]) VALUES (CAST(3 AS Decimal(18, 0)), CAST(0xA6B9046D AS SmallDateTime), N'Test Entry', N'Test Coment', N'zimpik@yahoo.com')
INSERT [dbo].[tblContactUs] ([ContactUsId], [EnquiryDate], [FullName], [Comment], [Email]) VALUES (CAST(4 AS Decimal(18, 0)), CAST(0xA6B904F0 AS SmallDateTime), N'Testing Name', N'Testing Comment', N'zimpik@yahoo.com')
INSERT [dbo].[tblContactUs] ([ContactUsId], [EnquiryDate], [FullName], [Comment], [Email]) VALUES (CAST(5 AS Decimal(18, 0)), CAST(0xA6B90503 AS SmallDateTime), N'Testing Name', N'Testing Comment', N'zimpik@yahoo.com')
INSERT [dbo].[tblContactUs] ([ContactUsId], [EnquiryDate], [FullName], [Comment], [Email]) VALUES (CAST(6 AS Decimal(18, 0)), CAST(0xA6B90509 AS SmallDateTime), N'testtest', N'test', N'test@test.com')
INSERT [dbo].[tblContactUs] ([ContactUsId], [EnquiryDate], [FullName], [Comment], [Email]) VALUES (CAST(7 AS Decimal(18, 0)), CAST(0xA6B90513 AS SmallDateTime), N'test', N'test', N'test@test.com')
INSERT [dbo].[tblContactUs] ([ContactUsId], [EnquiryDate], [FullName], [Comment], [Email]) VALUES (CAST(8 AS Decimal(18, 0)), CAST(0xA6BA02C9 AS SmallDateTime), N'testing me', N'testing comment', N'sadasda@hghjghjg.com')
INSERT [dbo].[tblContactUs] ([ContactUsId], [EnquiryDate], [FullName], [Comment], [Email]) VALUES (CAST(9 AS Decimal(18, 0)), CAST(0xA6CA04A4 AS SmallDateTime), N'ghfghfhgf', N'fdkgnmdfkgnd', N'test@testemail.com')
SET IDENTITY_INSERT [dbo].[tblContactUs] OFF
SET IDENTITY_INSERT [dbo].[tblPhotoGallery] ON 

INSERT [dbo].[tblPhotoGallery] ([photoId], [photoName], [photoDescription], [photoAltName], [photoLink]) VALUES (CAST(2 AS Decimal(18, 0)), N'MadaGhana ', N'MadaGhana - Your Bus stop in March 2', N'MadaGhana ', N'~/Images/Crystal4.jpg')
INSERT [dbo].[tblPhotoGallery] ([photoId], [photoName], [photoDescription], [photoAltName], [photoLink]) VALUES (CAST(3 AS Decimal(18, 0)), N'MadaGhana 2015', N'MadaGhana - Your Bus stop - Sept 2015', N'MadaGhana 2015', N'~/Images/Crystal2.jpg')
INSERT [dbo].[tblPhotoGallery] ([photoId], [photoName], [photoDescription], [photoAltName], [photoLink]) VALUES (CAST(4 AS Decimal(18, 0)), N'World Images in Motion Danish School Tour, 2016', N'World Images in Motion Danish School Tour, 2016', N'Danish School Tour', N'~/Images/Crystal3.jpg')
INSERT [dbo].[tblPhotoGallery] ([photoId], [photoName], [photoDescription], [photoAltName], [photoLink]) VALUES (CAST(5 AS Decimal(18, 0)), N'Copenhagen - 2016', N'Copenhagen-September 2016', N'Copenhagen - 2016', N'~/Images/Crystal1.jpg')
INSERT [dbo].[tblPhotoGallery] ([photoId], [photoName], [photoDescription], [photoAltName], [photoLink]) VALUES (CAST(6 AS Decimal(18, 0)), N'World Images In Motion', N'World Images In Motion School Tour', N'World Images In Motion', N'~/Images/Crystal5.jpg')
INSERT [dbo].[tblPhotoGallery] ([photoId], [photoName], [photoDescription], [photoAltName], [photoLink]) VALUES (CAST(7 AS Decimal(18, 0)), N'Facilitators', N'Co-facilitators Sir Black, Sista Zaian, Frank Langmack', N'Facilitators', N'~/Images/Crystal6.jpg')
INSERT [dbo].[tblPhotoGallery] ([photoId], [photoName], [photoDescription], [photoAltName], [photoLink]) VALUES (CAST(8 AS Decimal(18, 0)), N'Kulturmodet festival', N'Kulturmodet festival in August 2016', N'Kulturmodet festival', N'~/Images/Crystal7.jpg')
INSERT [dbo].[tblPhotoGallery] ([photoId], [photoName], [photoDescription], [photoAltName], [photoLink]) VALUES (CAST(9 AS Decimal(18, 0)), N'The e of MadaGhana', N'The e of MadaGhana', N'The e of MadaGhana', N'~/Images/Crystal8.jpg')
INSERT [dbo].[tblPhotoGallery] ([photoId], [photoName], [photoDescription], [photoAltName], [photoLink]) VALUES (CAST(10 AS Decimal(18, 0)), N'MadaGhana - Your Bus stop', N'MadaGhana - Your Bus stop', N'MadaGhana - Your Bus stop', N'~/Images/Crystal9.jpg')
SET IDENTITY_INSERT [dbo].[tblPhotoGallery] OFF
SET IDENTITY_INSERT [dbo].[tblRelatedLinks] ON 

INSERT [dbo].[tblRelatedLinks] ([linkId], [linkName], [linkDescription], [linkAddress]) VALUES (CAST(3 AS Decimal(18, 0)), N'Iamanewmum', N'For first time mums like me', N'https://iamanewmum.wordpress.com')
INSERT [dbo].[tblRelatedLinks] ([linkId], [linkName], [linkDescription], [linkAddress]) VALUES (CAST(4 AS Decimal(18, 0)), N'Gratitude', N'The MadaGhana - Your Bus Stop project...', N'https://madaghanaatyourbusstop.wordpress.com')
INSERT [dbo].[tblRelatedLinks] ([linkId], [linkName], [linkDescription], [linkAddress]) VALUES (CAST(7 AS Decimal(18, 0)), N'Transformation Through Culture', N'Peace buildng and the Arts', N'http://www.masterpeace.org/wp-content/uploads/2016/03/Conflict-Transformation-through-Culture-Peace-Building-and-the-Arts.pdf')
INSERT [dbo].[tblRelatedLinks] ([linkId], [linkName], [linkDescription], [linkAddress]) VALUES (CAST(8 AS Decimal(18, 0)), N'My Boyfriends got a Girlfriend', N'Brand new song from her debut album ...', N'https:/m.youtube.com/?client=mv-google')
SET IDENTITY_INSERT [dbo].[tblRelatedLinks] OFF
USE [master]
GO
ALTER DATABASE [CrystalTettey] SET  READ_WRITE 
GO
