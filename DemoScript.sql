USE [DemoProb]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 28.02.2025 2:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[IDMaterialType] [int] IDENTITY(1,1) NOT NULL,
	[MaterialTypes] [nvarchar](50) NOT NULL,
	[PercentOfBroken] [float] NOT NULL,
 CONSTRAINT [PK_MaterialType] PRIMARY KEY CLUSTERED 
(
	[IDMaterialType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerProduct]    Script Date: 28.02.2025 2:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerProduct](
	[IDPartnerProduc] [int] IDENTITY(1,1) NOT NULL,
	[IDProduct] [int] NOT NULL,
	[IDPartner] [int] NOT NULL,
	[KolvoProduct] [int] NOT NULL,
	[DateOfSell] [datetime] NOT NULL,
 CONSTRAINT [PK_PartnerProduct] PRIMARY KEY CLUSTERED 
(
	[IDPartnerProduc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partners]    Script Date: 28.02.2025 2:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partners](
	[IDPartners] [int] IDENTITY(1,1) NOT NULL,
	[IDPartnerType] [int] NULL,
	[PartenerName] [nvarchar](50) NOT NULL,
	[DirectorName] [nvarchar](50) NOT NULL,
	[DirectorSecondName] [nvarchar](50) NOT NULL,
	[DirectorLastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[YrAdressPartner] [nvarchar](150) NOT NULL,
	[INN] [nvarchar](50) NULL,
	[Rate] [int] NOT NULL,
 CONSTRAINT [PK_Partners] PRIMARY KEY CLUSTERED 
(
	[IDPartners] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerType]    Script Date: 28.02.2025 2:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerType](
	[IDPartnerType] [int] IDENTITY(1,1) NOT NULL,
	[PartnerTypes] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PartnerType] PRIMARY KEY CLUSTERED 
(
	[IDPartnerType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 28.02.2025 2:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[IDProduct] [int] IDENTITY(1,1) NOT NULL,
	[IDTypeProduct] [int] NOT NULL,
	[IDMaterialType] [int] NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[Article] [int] NOT NULL,
	[MinCostForPartners] [money] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[IDProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeProduct]    Script Date: 28.02.2025 2:06:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeProduct](
	[IDTypeProduct] [int] IDENTITY(1,1) NOT NULL,
	[NameTypeProduct] [nvarchar](50) NOT NULL,
	[KoefTypeProduct] [float] NOT NULL,
 CONSTRAINT [PK_TypeProduct] PRIMARY KEY CLUSTERED 
(
	[IDTypeProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MaterialType] ON 

INSERT [dbo].[MaterialType] ([IDMaterialType], [MaterialTypes], [PercentOfBroken]) VALUES (1, N'Тип материала 1', 0.1)
INSERT [dbo].[MaterialType] ([IDMaterialType], [MaterialTypes], [PercentOfBroken]) VALUES (2, N'Тип материала 2', 0.95)
INSERT [dbo].[MaterialType] ([IDMaterialType], [MaterialTypes], [PercentOfBroken]) VALUES (3, N'Тип материала 3', 0.28)
INSERT [dbo].[MaterialType] ([IDMaterialType], [MaterialTypes], [PercentOfBroken]) VALUES (4, N'Тип материала 4', 0.55)
INSERT [dbo].[MaterialType] ([IDMaterialType], [MaterialTypes], [PercentOfBroken]) VALUES (5, N'Тип материала 5', 0.34)
SET IDENTITY_INSERT [dbo].[MaterialType] OFF
GO
SET IDENTITY_INSERT [dbo].[PartnerProduct] ON 

INSERT [dbo].[PartnerProduct] ([IDPartnerProduc], [IDProduct], [IDPartner], [KolvoProduct], [DateOfSell]) VALUES (1, 1, 1, 15500, CAST(N'2023-03-23T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProduct] ([IDPartnerProduc], [IDProduct], [IDPartner], [KolvoProduct], [DateOfSell]) VALUES (2, 3, 1, 12350, CAST(N'2023-12-18T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProduct] ([IDPartnerProduc], [IDProduct], [IDPartner], [KolvoProduct], [DateOfSell]) VALUES (3, 4, 1, 37400, CAST(N'2024-06-07T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProduct] ([IDPartnerProduc], [IDProduct], [IDPartner], [KolvoProduct], [DateOfSell]) VALUES (4, 2, 2, 35000, CAST(N'2022-12-02T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProduct] ([IDPartnerProduc], [IDProduct], [IDPartner], [KolvoProduct], [DateOfSell]) VALUES (5, 5, 2, 1250, CAST(N'2023-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProduct] ([IDPartnerProduc], [IDProduct], [IDPartner], [KolvoProduct], [DateOfSell]) VALUES (6, 3, 2, 1000, CAST(N'2024-06-07T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProduct] ([IDPartnerProduc], [IDProduct], [IDPartner], [KolvoProduct], [DateOfSell]) VALUES (7, 1, 2, 7550, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProduct] ([IDPartnerProduc], [IDProduct], [IDPartner], [KolvoProduct], [DateOfSell]) VALUES (8, 1, 3, 7250, CAST(N'2023-01-22T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProduct] ([IDPartnerProduc], [IDProduct], [IDPartner], [KolvoProduct], [DateOfSell]) VALUES (9, 2, 3, 2500, CAST(N'2024-07-05T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProduct] ([IDPartnerProduc], [IDProduct], [IDPartner], [KolvoProduct], [DateOfSell]) VALUES (10, 4, 4, 59050, CAST(N'2023-03-20T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProduct] ([IDPartnerProduc], [IDProduct], [IDPartner], [KolvoProduct], [DateOfSell]) VALUES (11, 3, 4, 37200, CAST(N'2024-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProduct] ([IDPartnerProduc], [IDProduct], [IDPartner], [KolvoProduct], [DateOfSell]) VALUES (12, 5, 4, 4500, CAST(N'2024-05-14T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProduct] ([IDPartnerProduc], [IDProduct], [IDPartner], [KolvoProduct], [DateOfSell]) VALUES (13, 3, 5, 50000, CAST(N'2023-09-19T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProduct] ([IDPartnerProduc], [IDProduct], [IDPartner], [KolvoProduct], [DateOfSell]) VALUES (14, 4, 5, 670000, CAST(N'2023-11-10T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProduct] ([IDPartnerProduc], [IDProduct], [IDPartner], [KolvoProduct], [DateOfSell]) VALUES (15, 1, 5, 35000, CAST(N'2024-04-15T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProduct] ([IDPartnerProduc], [IDProduct], [IDPartner], [KolvoProduct], [DateOfSell]) VALUES (16, 2, 5, 25000, CAST(N'2024-06-12T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[PartnerProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[Partners] ON 

INSERT [dbo].[Partners] ([IDPartners], [IDPartnerType], [PartenerName], [DirectorName], [DirectorSecondName], [DirectorLastName], [Email], [Phone], [YrAdressPartner], [INN], [Rate]) VALUES (1, 1, N'База Строитель', N'Александра', N'Иванова', N'Ивановна', N'aleksandraivanova@ml.ru', N'493 123 45 67', N'652050, Кемеровская область, город Юрга, ул. Лесная, 15', N'2222455179
', 7)
INSERT [dbo].[Partners] ([IDPartners], [IDPartnerType], [PartenerName], [DirectorName], [DirectorSecondName], [DirectorLastName], [Email], [Phone], [YrAdressPartner], [INN], [Rate]) VALUES (2, 2, N'Паркет 29', N'Василий', N'Петров', N'Петрович', N'vppetrov@vl.ru', N'987 123 56 78', N'164500, Архангельская область, город Северодвинск, ул. Строителей, 18', N'3333888520
', 7)
INSERT [dbo].[Partners] ([IDPartners], [IDPartnerType], [PartenerName], [DirectorName], [DirectorSecondName], [DirectorLastName], [Email], [Phone], [YrAdressPartner], [INN], [Rate]) VALUES (3, 3, N'Стройсервис', N'Андрей', N'Соловьев', N'Николаевич', N'ansolovev@st.ru', N'812 223 32 00', N'188910, Ленинградская область, город Приморск, ул. Парковая, 21', N'4440391035
', 7)
INSERT [dbo].[Partners] ([IDPartners], [IDPartnerType], [PartenerName], [DirectorName], [DirectorSecondName], [DirectorLastName], [Email], [Phone], [YrAdressPartner], [INN], [Rate]) VALUES (4, 4, N'Ремонт и отделка', N'Екатерина', N'Воробьева', N'Валерьевна', N'ekaterina.vorobeva@ml.ru', N'444 222 33 11', N'143960, Московская область, город Реутов, ул. Свободы, 51', N'1111520857
', 5)
INSERT [dbo].[Partners] ([IDPartners], [IDPartnerType], [PartenerName], [DirectorName], [DirectorSecondName], [DirectorLastName], [Email], [Phone], [YrAdressPartner], [INN], [Rate]) VALUES (5, 1, N'МонтажПро', N'Степан', N'Степанов', N'Сергеевич', N'stepanov@stepan.ru', N'912 888 33 33', N'309500, Белгородская область, город Старый Оскол, ул. Рабочая, 122', N'5552431140
', 10)
SET IDENTITY_INSERT [dbo].[Partners] OFF
GO
SET IDENTITY_INSERT [dbo].[PartnerType] ON 

INSERT [dbo].[PartnerType] ([IDPartnerType], [PartnerTypes]) VALUES (1, N'ЗАО')
INSERT [dbo].[PartnerType] ([IDPartnerType], [PartnerTypes]) VALUES (2, N'ООО')
INSERT [dbo].[PartnerType] ([IDPartnerType], [PartnerTypes]) VALUES (3, N'ПАО')
INSERT [dbo].[PartnerType] ([IDPartnerType], [PartnerTypes]) VALUES (4, N'ОАО')
SET IDENTITY_INSERT [dbo].[PartnerType] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([IDProduct], [IDTypeProduct], [IDMaterialType], [ProductName], [Article], [MinCostForPartners]) VALUES (1, 3, 1, N'Паркетная доска Ясень темный однополосная 14 мм
', 8758385, 4456.9000)
INSERT [dbo].[Product] ([IDProduct], [IDTypeProduct], [IDMaterialType], [ProductName], [Article], [MinCostForPartners]) VALUES (2, 3, 2, N'Инженерная доска Дуб Французская елка однополосная 12 мм', 8858958, 7330.9900)
INSERT [dbo].[Product] ([IDProduct], [IDTypeProduct], [IDMaterialType], [ProductName], [Article], [MinCostForPartners]) VALUES (3, 1, 3, N'Ламинат Дуб дымчато-белый 33 класс 12 мм
', 7750282, 1799.3300)
INSERT [dbo].[Product] ([IDProduct], [IDTypeProduct], [IDMaterialType], [ProductName], [Article], [MinCostForPartners]) VALUES (4, 1, 4, N'Ламинат Дуб серый 32 класс 8 мм с фаской', 7028748, 3890.4100)
INSERT [dbo].[Product] ([IDProduct], [IDTypeProduct], [IDMaterialType], [ProductName], [Article], [MinCostForPartners]) VALUES (5, 4, 5, N'Пробковое напольное клеевое покрытие 32 класс 4 мм', 5012543, 5450.5900)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeProduct] ON 

INSERT [dbo].[TypeProduct] ([IDTypeProduct], [NameTypeProduct], [KoefTypeProduct]) VALUES (1, N'Ламинат', 2.35)
INSERT [dbo].[TypeProduct] ([IDTypeProduct], [NameTypeProduct], [KoefTypeProduct]) VALUES (2, N'Массивная доска', 5.15)
INSERT [dbo].[TypeProduct] ([IDTypeProduct], [NameTypeProduct], [KoefTypeProduct]) VALUES (3, N'Паркетная доска', 4.34)
INSERT [dbo].[TypeProduct] ([IDTypeProduct], [NameTypeProduct], [KoefTypeProduct]) VALUES (4, N'Пробковое покрытие', 1.5)
SET IDENTITY_INSERT [dbo].[TypeProduct] OFF
GO
ALTER TABLE [dbo].[PartnerProduct]  WITH CHECK ADD  CONSTRAINT [FK_PartnerProduct_Partners] FOREIGN KEY([IDPartner])
REFERENCES [dbo].[Partners] ([IDPartners])
GO
ALTER TABLE [dbo].[PartnerProduct] CHECK CONSTRAINT [FK_PartnerProduct_Partners]
GO
ALTER TABLE [dbo].[PartnerProduct]  WITH CHECK ADD  CONSTRAINT [FK_PartnerProduct_Product] FOREIGN KEY([IDProduct])
REFERENCES [dbo].[Product] ([IDProduct])
GO
ALTER TABLE [dbo].[PartnerProduct] CHECK CONSTRAINT [FK_PartnerProduct_Product]
GO
ALTER TABLE [dbo].[Partners]  WITH CHECK ADD  CONSTRAINT [FK_Partners_PartnerType] FOREIGN KEY([IDPartnerType])
REFERENCES [dbo].[PartnerType] ([IDPartnerType])
GO
ALTER TABLE [dbo].[Partners] CHECK CONSTRAINT [FK_Partners_PartnerType]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_MaterialType] FOREIGN KEY([IDMaterialType])
REFERENCES [dbo].[MaterialType] ([IDMaterialType])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_MaterialType]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_TypeProduct] FOREIGN KEY([IDTypeProduct])
REFERENCES [dbo].[TypeProduct] ([IDTypeProduct])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_TypeProduct]
GO
