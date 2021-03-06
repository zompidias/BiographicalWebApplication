USE [CrystalTettey]
GO
/****** Object:  StoredProcedure [dbo].[spAddEnquiryToDB]    Script Date: 10/11/2016 17:33:44 ******/
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
/****** Object:  StoredProcedure [dbo].[spAddPhotoDetails]    Script Date: 10/11/2016 17:33:44 ******/
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
/****** Object:  StoredProcedure [dbo].[spAddRelatedLinksDetails]    Script Date: 10/11/2016 17:33:44 ******/
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
/****** Object:  StoredProcedure [dbo].[spDeletePhotos]    Script Date: 10/11/2016 17:33:44 ******/
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
/****** Object:  StoredProcedure [dbo].[spDeleteRelatedLinks]    Script Date: 10/11/2016 17:33:44 ******/
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
/****** Object:  StoredProcedure [dbo].[spGetAdminDetails]    Script Date: 10/11/2016 17:33:44 ******/
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
/****** Object:  StoredProcedure [dbo].[spGetAllPhotoDetails]    Script Date: 10/11/2016 17:33:44 ******/
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
/****** Object:  StoredProcedure [dbo].[spGetAllRelatedLinks]    Script Date: 10/11/2016 17:33:44 ******/
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
/****** Object:  StoredProcedure [dbo].[spSaveChangesPhotoDetails]    Script Date: 10/11/2016 17:33:44 ******/
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
/****** Object:  StoredProcedure [dbo].[spSaveChangesRelatedLinksDetails]    Script Date: 10/11/2016 17:33:44 ******/
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
/****** Object:  Table [dbo].[tblAdminLogon]    Script Date: 10/11/2016 17:33:44 ******/
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
/****** Object:  Table [dbo].[tblContactUs]    Script Date: 10/11/2016 17:33:44 ******/
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
/****** Object:  Table [dbo].[tblPhotoGallery]    Script Date: 10/11/2016 17:33:44 ******/
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
/****** Object:  Table [dbo].[tblRelatedLinks]    Script Date: 10/11/2016 17:33:44 ******/
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
