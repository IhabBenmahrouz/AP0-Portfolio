CREATE TABLE [dbo].[CE](
	[NumCli] [int] NOT NULL,
	[Societe] [char](50) NULL,
	[Banque] [char](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NumCli] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 13/10/2022 14:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[NumCli] [int] IDENTITY(1,1) NOT NULL,
	[GenreCli] [char](10) NULL,
	[NomCli] [char](25) NULL,
	[PrenomCli] [char](25) NULL,
	[RueCli] [char](50) NULL,
	[CPCli] [char](5) NULL,
	[VilleCli] [char](25) NULL,
	[CA] [money] NULL,
 CONSTRAINT [PK__Client__7DF57C535DE01FB9] PRIMARY KEY CLUSTERED 
(
	[NumCli] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoLoc]    Script Date: 13/10/2022 14:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoLoc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DateHisto] [date] NULL,
	[NumSem] [int] NULL,
	[NumStu] [int] NULL,
	[NumCli] [int] NULL,
	[Reglé] [bit] NULL,
	[PrixLoc] [float] NULL,
 CONSTRAINT [PK_HistoLoc] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 13/10/2022 14:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[NumLoc] [int] IDENTITY(1,1) NOT NULL,
	[NumStu] [int] NOT NULL,
	[NumSem] [int] NOT NULL,
	[NumCli] [int] NULL,
	[Regle] [bit] NULL,
	[PrixLoc] [int] NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[NumLoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Particulier]    Script Date: 13/10/2022 14:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Particulier](
	[NumCli] [int] NOT NULL,
	[ChequeVac] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[NumCli] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Studio]    Script Date: 13/10/2022 14:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Studio](
	[NumStudio] [int] NOT NULL,
	[NomBatiment] [char](40) NULL,
	[NbPlaces] [int] NULL,
	[PrixSaison] [int] NULL,
	[PrixHSaison] [int] NULL,
	[numProp] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[NumStudio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CE] ([NumCli], [Societe], [Banque]) VALUES (6, N'BATIMETAL                                         ', N'Société Générale                                  ')
GO
INSERT [dbo].[CE] ([NumCli], [Societe], [Banque]) VALUES (7, N'BOISERIE DU SUD                                   ', N'Credit Lyonnais                                   ')
GO
INSERT [dbo].[CE] ([NumCli], [Societe], [Banque]) VALUES (8, N'CABINET ARCHITECTE                                ', N'Credit du Nord                                    ')
GO
SET IDENTITY_INSERT [dbo].[Client] ON 
GO
INSERT [dbo].[Client] ([NumCli], [GenreCli], [NomCli], [PrenomCli], [RueCli], [CPCli], [VilleCli], [CA]) VALUES (1, N'Madame    ', N'Dupont                   ', N'Annie                    ', N'3 Rue de la République                            ', N'84000', N'Avignon                  ', 0.0000)
GO
INSERT [dbo].[Client] ([NumCli], [GenreCli], [NomCli], [PrenomCli], [RueCli], [CPCli], [VilleCli], [CA]) VALUES (2, N'Monsieur  ', N'Martin                   ', N'Marc                     ', N'8 cours Jean Jaurès                               ', N'30000', N'Nîmes                    ', 0.0000)
GO
INSERT [dbo].[Client] ([NumCli], [GenreCli], [NomCli], [PrenomCli], [RueCli], [CPCli], [VilleCli], [CA]) VALUES (3, N'Monsieur  ', N'Sanchez                  ', N'Alain                    ', N'Allée des pivoines                                ', N'13000', N'Marseille                ', 0.0000)
GO
INSERT [dbo].[Client] ([NumCli], [GenreCli], [NomCli], [PrenomCli], [RueCli], [CPCli], [VilleCli], [CA]) VALUES (4, N'Monsieur  ', N'Lenoir                   ', N'Luc                      ', N'Avenue des aigles                                 ', N'84100', N'Orange                   ', 0.0000)
GO
INSERT [dbo].[Client] ([NumCli], [GenreCli], [NomCli], [PrenomCli], [RueCli], [CPCli], [VilleCli], [CA]) VALUES (5, N'Madame    ', N'Larmagnat                ', N'Sophie                   ', N'5 allé des Capucines                              ', N'34000', N'Montpellier              ', 0.0000)
GO
INSERT [dbo].[Client] ([NumCli], [GenreCli], [NomCli], [PrenomCli], [RueCli], [CPCli], [VilleCli], [CA]) VALUES (6, N'Madame    ', N'Lavoie                   ', N'Martine                  ', N'12 rue des anges                                  ', N'30000', N'Nîmes                    ', 0.0000)
GO
INSERT [dbo].[Client] ([NumCli], [GenreCli], [NomCli], [PrenomCli], [RueCli], [CPCli], [VilleCli], [CA]) VALUES (7, N'Monsieur  ', N'Labrot                   ', N'Jean                     ', N'Lieu dit les adrets                               ', N'84000', N'Avignon                  ', 0.0000)
GO
INSERT [dbo].[Client] ([NumCli], [GenreCli], [NomCli], [PrenomCli], [RueCli], [CPCli], [VilleCli], [CA]) VALUES (8, N'Monsieur  ', N'Parmentier               ', N'Yann                     ', N'12 rue de la foire                                ', N'13100', N'Orange                   ', 0.0000)
GO
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[Location] ON 
GO
INSERT [dbo].[Location] ([NumLoc], [NumStu], [NumSem], [NumCli], [Regle], [PrixLoc]) VALUES (1, 1, 1, 2, 0, 0)
GO
INSERT [dbo].[Location] ([NumLoc], [NumStu], [NumSem], [NumCli], [Regle], [PrixLoc]) VALUES (3, 5, 3, 2, 0, 0)
GO
INSERT [dbo].[Location] ([NumLoc], [NumStu], [NumSem], [NumCli], [Regle], [PrixLoc]) VALUES (1004, 2, 2, 1, 1, 0)
GO
INSERT [dbo].[Location] ([NumLoc], [NumStu], [NumSem], [NumCli], [Regle], [PrixLoc]) VALUES (1005, 4, 2, 3, 1, 0)
GO
INSERT [dbo].[Location] ([NumLoc], [NumStu], [NumSem], [NumCli], [Regle], [PrixLoc]) VALUES (1006, 3, 4, 1, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Location] OFF
GO
INSERT [dbo].[Particulier] ([NumCli], [ChequeVac]) VALUES (1, 1)
GO
INSERT [dbo].[Particulier] ([NumCli], [ChequeVac]) VALUES (2, 0)
GO
INSERT [dbo].[Particulier] ([NumCli], [ChequeVac]) VALUES (3, 0)
GO
INSERT [dbo].[Particulier] ([NumCli], [ChequeVac]) VALUES (4, 1)
GO
INSERT [dbo].[Particulier] ([NumCli], [ChequeVac]) VALUES (5, 1)
GO
INSERT [dbo].[Studio] ([NumStudio], [NomBatiment], [NbPlaces], [PrixSaison], [PrixHSaison], [numProp]) VALUES (1, N'Les Lavandes                            ', 4, 400, 350, NULL)
GO
INSERT [dbo].[Studio] ([NumStudio], [NomBatiment], [NbPlaces], [PrixSaison], [PrixHSaison], [numProp]) VALUES (2, N'Les Pivoines                            ', 6, 500, 400, NULL)
GO
INSERT [dbo].[Studio] ([NumStudio], [NomBatiment], [NbPlaces], [PrixSaison], [PrixHSaison], [numProp]) VALUES (3, N'La Pyramide                             ', 4, 380, 340, NULL)
GO
INSERT [dbo].[Studio] ([NumStudio], [NomBatiment], [NbPlaces], [PrixSaison], [PrixHSaison], [numProp]) VALUES (4, N'Le sphinx                               ', 5, 430, 340, NULL)
GO
INSERT [dbo].[Studio] ([NumStudio], [NomBatiment], [NbPlaces], [PrixSaison], [PrixHSaison], [numProp]) VALUES (5, N'Les roses                               ', 4, 400, 350, NULL)
GO
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [DF__Client__CA__2D27B809]  DEFAULT ((0)) FOR [CA]
GO
ALTER TABLE [dbo].[Location] ADD  CONSTRAINT [DF_Location_PrixLoc]  DEFAULT ((0)) FOR [PrixLoc]
GO
ALTER TABLE [dbo].[CE]  WITH CHECK ADD  CONSTRAINT [FK_NumCli1] FOREIGN KEY([NumCli])
REFERENCES [dbo].[Client] ([NumCli])
GO
ALTER TABLE [dbo].[CE] CHECK CONSTRAINT [FK_NumCli1]
GO
ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [FK_NumCli] FOREIGN KEY([NumCli])
REFERENCES [dbo].[Client] ([NumCli])
GO
ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [FK_NumCli]
GO
ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [FK_NumStu] FOREIGN KEY([NumStu])
REFERENCES [dbo].[Studio] ([NumStudio])
GO
ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [FK_NumStu]
GO
ALTER TABLE [dbo].[Particulier]  WITH CHECK ADD  CONSTRAINT [FK_NumCli2] FOREIGN KEY([NumCli])
REFERENCES [dbo].[Client] ([NumCli])
GO
ALTER TABLE [dbo].[Particulier] CHECK CONSTRAINT [FK_NumCli2]
GO
