USE [CrystalTettey]
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
SET IDENTITY_INSERT [dbo].[tblContactUs] OFF
SET IDENTITY_INSERT [dbo].[tblPhotoGallery] ON 

INSERT [dbo].[tblPhotoGallery] ([photoId], [photoName], [photoDescription], [photoAltName], [photoLink]) VALUES (CAST(2 AS Decimal(18, 0)), N'MadaGhana ', N'MadaGhana - Your Bus stop in March 2', N'MadaGhana ', N'~/Images/Crystal4.jpg')
INSERT [dbo].[tblPhotoGallery] ([photoId], [photoName], [photoDescription], [photoAltName], [photoLink]) VALUES (CAST(3 AS Decimal(18, 0)), N'MadaGhana 2015', N'MadaGhana - Your Bus stop - Sept 2015', N'MadaGhana 2015', N'~/Images/Crystal2.jpg')
INSERT [dbo].[tblPhotoGallery] ([photoId], [photoName], [photoDescription], [photoAltName], [photoLink]) VALUES (CAST(4 AS Decimal(18, 0)), N'Danish School Tour', N'Danish School Tour', N'Danish School Tour', N'~/Images/Crystal3.jpg')
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
INSERT [dbo].[tblRelatedLinks] ([linkId], [linkName], [linkDescription], [linkAddress]) VALUES (CAST(7 AS Decimal(18, 0)), N'Transformation Through Cultre', N'Peace buildng and the Arts', N'http://www.masterpeace.org/wp-content/uploads/2016/03/Conflict-Transformation-through-Culture-Peace-Building-and-the-Arts.pdf')
INSERT [dbo].[tblRelatedLinks] ([linkId], [linkName], [linkDescription], [linkAddress]) VALUES (CAST(8 AS Decimal(18, 0)), N'My Boyfriends got a Girlfriend', N'Brand new song from her debut album ...', N'https:/m.youtube.com/?client=mv-google')
SET IDENTITY_INSERT [dbo].[tblRelatedLinks] OFF
