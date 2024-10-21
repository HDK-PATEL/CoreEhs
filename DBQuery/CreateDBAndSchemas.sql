USE [master]
GO
/****** Object:  Database [CoreEhs]    Script Date: 21-10-2024 10:27:30 ******/
CREATE DATABASE [CoreEhs]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CoreEhs', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CoreEhs.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CoreEhs_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CoreEhs_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CoreEhs] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CoreEhs].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CoreEhs] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CoreEhs] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CoreEhs] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CoreEhs] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CoreEhs] SET ARITHABORT OFF 
GO
ALTER DATABASE [CoreEhs] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CoreEhs] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CoreEhs] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CoreEhs] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CoreEhs] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CoreEhs] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CoreEhs] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CoreEhs] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CoreEhs] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CoreEhs] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CoreEhs] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CoreEhs] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CoreEhs] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CoreEhs] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CoreEhs] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CoreEhs] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CoreEhs] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CoreEhs] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CoreEhs] SET  MULTI_USER 
GO
ALTER DATABASE [CoreEhs] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CoreEhs] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CoreEhs] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CoreEhs] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CoreEhs] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CoreEhs] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CoreEhs', N'ON'
GO
ALTER DATABASE [CoreEhs] SET QUERY_STORE = OFF
GO
USE [CoreEhs]
GO
/****** Object:  Table [dbo].[Attachment]    Script Date: 21-10-2024 10:27:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attachment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AttachmentTypeId] [int] NOT NULL,
	[ReferenceId] [int] NOT NULL,
	[FileName] [nvarchar](max) NOT NULL,
	[Path] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Attachment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 21-10-2024 10:27:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](300) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BrandCommission]    Script Date: 21-10-2024 10:27:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BrandCommission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BrandId] [int] NOT NULL,
	[Price] [money] NULL,
	[FixedCommission] [numeric](18, 2) NOT NULL,
	[ClassA] [numeric](5, 2) NOT NULL,
	[ClassB] [numeric](5, 2) NOT NULL,
	[ClassC] [numeric](5, 2) NOT NULL,
 CONSTRAINT [PK_BrandCommission] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Car]    Script Date: 21-10-2024 10:27:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BrandId] [int] NOT NULL,
	[ClassId] [int] NOT NULL,
	[ModelName] [varchar](100) NOT NULL,
	[ModelCode] [varchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Features] [nvarchar](max) NOT NULL,
	[Price] [money] NOT NULL,
	[DateOfManufacturing] [datetime] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Car] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarClass]    Script Date: 21-10-2024 10:27:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarClass](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_CarClass] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 21-10-2024 10:27:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NULL,
	[MenuName] [nvarchar](300) NOT NULL,
	[Icon] [varbinary](150) NULL,
	[Link] [varchar](200) NOT NULL,
	[OrderById] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 21-10-2024 10:27:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Role] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 21-10-2024 10:27:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Salesman] [varchar](50) NOT NULL,
	[ClassId] [int] NOT NULL,
	[NoOfAudi] [int] NOT NULL,
	[NoOfJaguar] [int] NOT NULL,
	[NoOfLandRover] [int] NOT NULL,
	[NoOfRenault] [int] NOT NULL,
 CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAccess]    Script Date: 21-10-2024 10:27:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAccess](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[MenuId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_UserAccess] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 21-10-2024 10:27:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 21-10-2024 10:27:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](300) NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 
GO
INSERT [dbo].[Brand] ([Id], [BrandName], [IsActive], [IsDeleted]) VALUES (1, N'Audi', 1, 0)
GO
INSERT [dbo].[Brand] ([Id], [BrandName], [IsActive], [IsDeleted]) VALUES (2, N'Jaguar', 1, 0)
GO
INSERT [dbo].[Brand] ([Id], [BrandName], [IsActive], [IsDeleted]) VALUES (3, N'Land Rover', 1, 0)
GO
INSERT [dbo].[Brand] ([Id], [BrandName], [IsActive], [IsDeleted]) VALUES (4, N'Renault', 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[BrandCommission] ON 
GO
INSERT [dbo].[BrandCommission] ([Id], [BrandId], [Price], [FixedCommission], [ClassA], [ClassB], [ClassC]) VALUES (1, 1, 25000.0000, CAST(800.00 AS Numeric(18, 2)), CAST(8.00 AS Numeric(5, 2)), CAST(6.00 AS Numeric(5, 2)), CAST(4.00 AS Numeric(5, 2)))
GO
INSERT [dbo].[BrandCommission] ([Id], [BrandId], [Price], [FixedCommission], [ClassA], [ClassB], [ClassC]) VALUES (2, 2, 35000.0000, CAST(750.00 AS Numeric(18, 2)), CAST(6.00 AS Numeric(5, 2)), CAST(5.00 AS Numeric(5, 2)), CAST(3.00 AS Numeric(5, 2)))
GO
INSERT [dbo].[BrandCommission] ([Id], [BrandId], [Price], [FixedCommission], [ClassA], [ClassB], [ClassC]) VALUES (3, 3, 30000.0000, CAST(850.00 AS Numeric(18, 2)), CAST(7.00 AS Numeric(5, 2)), CAST(5.00 AS Numeric(5, 2)), CAST(4.00 AS Numeric(5, 2)))
GO
INSERT [dbo].[BrandCommission] ([Id], [BrandId], [Price], [FixedCommission], [ClassA], [ClassB], [ClassC]) VALUES (4, 4, 20000.0000, CAST(400.00 AS Numeric(18, 2)), CAST(5.00 AS Numeric(5, 2)), CAST(3.00 AS Numeric(5, 2)), CAST(2.00 AS Numeric(5, 2)))
GO
SET IDENTITY_INSERT [dbo].[BrandCommission] OFF
GO
SET IDENTITY_INSERT [dbo].[Car] ON 
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1, 1, 1, N'AQ7', N'AQ7001', N'XYZ', N'Power Full engine', 500000.0000, CAST(N'2024-10-20T09:33:29.647' AS DateTime), 1, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (2, 1, 1, N'AQ7', N'AQ7001', N'XYZ', N'Power Full engine', 500000.0000, CAST(N'2024-10-20T09:33:29.647' AS DateTime), 1, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1002, 1, 1, N'Audi A3', N'A3', N'Compact luxury sedan', N'Leather seats, Panoramic sunroof, LED headlights', 2542500.0000, CAST(N'2023-07-15T00:00:00.000' AS DateTime), 1, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1003, 1, 1, N'Audi A4', N'A4', N'Entry-level luxury sedan', N'Virtual cockpit, MMI touch display, Quattro all-wheel drive', 2932500.0000, CAST(N'2023-08-22T00:00:00.000' AS DateTime), 2, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1004, 1, 1, N'Audi A5', N'A5', N'Luxury coupe and sportback', N'S line exterior, Audi pre sense basic, Audi smartphone interface', 3300000.0000, CAST(N'2023-09-05T00:00:00.000' AS DateTime), 3, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1005, 1, 1, N'Audi A6', N'A6', N'Midsize luxury sedan', N'Adaptive cruise control, Bang & Olufsen sound system, Heads-up display', 4192500.0000, CAST(N'2023-06-30T00:00:00.000' AS DateTime), 4, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1006, 1, 1, N'Audi A7', N'A7', N'Luxury sportback', N'Matrix-design LED headlights, Valcona leather, Ambient LED interior lighting', 5190000.0000, CAST(N'2023-07-12T00:00:00.000' AS DateTime), 5, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1007, 1, 1, N'Audi A8', N'A8', N'Full-size luxury sedan', N'Executive rear seat package, Predictive active suspension, Audi AI traffic jam pilot', 6487500.0000, CAST(N'2023-08-03T00:00:00.000' AS DateTime), 6, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1008, 1, 2, N'Audi Q3', N'Q3', N'Subcompact luxury crossover SUV', N'Power tailgate, Audi side assist, Parking system plus', 2730000.0000, CAST(N'2023-09-18T00:00:00.000' AS DateTime), 7, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1009, 1, 2, N'Audi Q5', N'Q5', N'Compact luxury crossover SUV', N'Audi virtual cockpit plus, Adaptive cruise control with traffic jam assist', 3247500.0000, CAST(N'2023-08-28T00:00:00.000' AS DateTime), 8, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1010, 1, 2, N'Audi Q7', N'Q7', N'Midsize luxury crossover SUV', N'MMI Navigation plus, Audi phone box, Adaptive air suspension', 4185000.0000, CAST(N'2023-07-20T00:00:00.000' AS DateTime), 9, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1011, 1, 2, N'Audi Q8', N'Q8', N'Full-size luxury crossover SUV', N'Bang & Olufsen 3D Premium Sound System, Audi adaptive cruise assist', 5272500.0000, CAST(N'2023-09-02T00:00:00.000' AS DateTime), 10, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1012, 1, 3, N'Audi e-tron', N'ETRON', N'All-electric SUV', N'Dual asynchronous motors, 95 kWh battery, Boost mode', 4942500.0000, CAST(N'2023-08-15T00:00:00.000' AS DateTime), 11, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1013, 1, 3, N'Audi e-tron GT', N'ETRONGT', N'All-electric grand tourer', N'Dual-motor all-wheel drive, 800-volt electrical system', 7492500.0000, CAST(N'2023-09-10T00:00:00.000' AS DateTime), 12, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1014, 1, 3, N'Audi TT', N'TT', N'Compact sports car', N'Audi magnetic ride, S line sport package, Virtual cockpit', 3735000.0000, CAST(N'2023-07-05T00:00:00.000' AS DateTime), 13, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1015, 1, 3, N'Audi R8', N'R8', N'Mid-engine supercar', N'V10 engine, Audi Space Frame, Performance mode', 10702500.0000, CAST(N'2023-08-20T00:00:00.000' AS DateTime), 14, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1016, 1, 3, N'Audi S3', N'S3', N'High-performance compact sedan', N'Sport suspension, S sport seats, Quad exhaust outlets', 3442500.0000, CAST(N'2023-09-25T00:00:00.000' AS DateTime), 15, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1017, 1, 3, N'Audi S4', N'S4', N'High-performance luxury sedan', N'Sport adaptive suspension, S sport seats with diamond stitching', 3817500.0000, CAST(N'2023-08-08T00:00:00.000' AS DateTime), 16, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1018, 1, 3, N'Audi RS5', N'RS5', N'High-performance luxury coupe', N'RS sport suspension, RS sport exhaust system, Audi drive select', 5565000.0000, CAST(N'2023-07-18T00:00:00.000' AS DateTime), 17, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1019, 1, 3, N'Audi RS6 Avant', N'RS6', N'High-performance luxury wagon', N'RS ceramic brakes, RS sport suspension plus with Dynamic Ride Control', 8175000.0000, CAST(N'2023-09-15T00:00:00.000' AS DateTime), 18, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1020, 1, 3, N'Audi SQ5', N'SQ5', N'High-performance luxury compact SUV', N'S sport seats, Adaptive air suspension, Sport rear differential', 3967500.0000, CAST(N'2023-08-30T00:00:00.000' AS DateTime), 19, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1021, 1, 3, N'Audi RS Q8', N'RSQ8', N'High-performance luxury full-size SUV', N'RS ceramic brakes, All-wheel steering, Active roll stabilization', 8587500.0000, CAST(N'2023-09-05T00:00:00.000' AS DateTime), 20, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1022, 2, 1, N'Jaguar XE', N'XE', N'Compact executive car', N'InControl Touch Pro, All Surface Progress Control, Torque Vectoring', 4425000.0000, CAST(N'2023-07-10T00:00:00.000' AS DateTime), 21, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1023, 2, 1, N'Jaguar XF', N'XF', N'Executive car', N'Interactive Driver Display, Adaptive Dynamics, Configurable Dynamics', 5550000.0000, CAST(N'2023-08-15T00:00:00.000' AS DateTime), 22, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1024, 2, 1, N'Jaguar XJ', N'XJ', N'Full-size luxury car', N'Adaptive Cruise Control, Meridian Surround Sound System, Massage seats', 9375000.0000, CAST(N'2023-09-20T00:00:00.000' AS DateTime), 23, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1025, 2, 2, N'Jaguar F-TYPE Coupe', N'F-TYPE-C', N'Sports car', N'Active Sports Exhaust, Switchable Active Exhaust, Dynamic Mode', 9750000.0000, CAST(N'2023-10-05T00:00:00.000' AS DateTime), 24, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1026, 2, 2, N'Jaguar F-TYPE Convertible', N'F-TYPE-CV', N'Convertible sports car', N'Electric Power-Assisted Steering, Sport Suspension, LED headlights', 10500000.0000, CAST(N'2023-10-25T00:00:00.000' AS DateTime), 25, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1027, 2, 3, N'Jaguar E-PACE', N'E-PACE', N'Compact SUV', N'InControl Touch Pro, All Wheel Drive, Smart Settings', 4875000.0000, CAST(N'2023-07-30T00:00:00.000' AS DateTime), 26, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1028, 2, 3, N'Jaguar F-PACE', N'F-PACE', N'Mid-size SUV', N'Adaptive Surface Response, Configurable Dynamics, Activity Key', 6375000.0000, CAST(N'2023-08-25T00:00:00.000' AS DateTime), 27, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1029, 2, 3, N'Jaguar I-PACE', N'I-PACE', N'All-electric SUV', N'EV Navigation, Wade Sensing, Active Air Suspension', 7125000.0000, CAST(N'2023-09-15T00:00:00.000' AS DateTime), 28, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1030, 2, 1, N'Jaguar XE R-Dynamic', N'XE-R', N'Sport-tuned compact executive car', N'R-Dynamic body kit, Sport suspension, Contrast stitching', 4875000.0000, CAST(N'2023-11-10T00:00:00.000' AS DateTime), 29, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1031, 2, 1, N'Jaguar XF R-Dynamic', N'XF-R', N'Sport-tuned executive car', N'R-Dynamic exterior styling, Sport seats, Dark hex aluminum trim', 6000000.0000, CAST(N'2023-11-30T00:00:00.000' AS DateTime), 30, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1032, 2, 3, N'Jaguar F-PACE SVR', N'F-PACE-SVR', N'High-performance SUV', N'SVR body kit, Performance seats, Quad tailpipes', 11250000.0000, CAST(N'2023-12-15T00:00:00.000' AS DateTime), 31, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1033, 2, 2, N'Jaguar F-TYPE R', N'F-TYPE-R', N'High-performance sports car', N'R body styling, Performance brakes, Switchable Active Exhaust', 15000000.0000, CAST(N'2024-01-05T00:00:00.000' AS DateTime), 32, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1034, 2, 1, N'Jaguar XF Sportbrake', N'XF-SB', N'Executive estate car', N'Self-leveling air suspension, Gesture-controlled tailgate, Panoramic roof', 6750000.0000, CAST(N'2023-10-20T00:00:00.000' AS DateTime), 33, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1035, 2, 3, N'Jaguar E-PACE R-Dynamic', N'E-PACE-R', N'Sport-tuned compact SUV', N'R-Dynamic styling, Configurable Dynamics, Metal treadplates', 5250000.0000, CAST(N'2023-12-05T00:00:00.000' AS DateTime), 34, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1036, 2, 3, N'Jaguar I-PACE HSE', N'I-PACE-HSE', N'High-spec electric SUV', N'Adaptive Cruise Control, Windsor leather seats, 20" wheels', 8250000.0000, CAST(N'2024-01-20T00:00:00.000' AS DateTime), 35, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1037, 2, 1, N'Jaguar XJ50', N'XJ50', N'Special edition full-size luxury car', N'Unique XJ50 styling, Soft-close doors, Illuminated treadplates', 10500000.0000, CAST(N'2023-11-15T00:00:00.000' AS DateTime), 36, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1038, 2, 2, N'Jaguar F-TYPE Checkered Flag', N'F-TYPE-CF', N'Special edition sports car', N'Checkered Flag badging, Windsor leather interior, 20" wheels', 11250000.0000, CAST(N'2023-12-30T00:00:00.000' AS DateTime), 37, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1039, 2, 1, N'Jaguar XE Reims Edition', N'XE-RE', N'Limited edition compact executive car', N'French Racing Blue paint, Black Exterior Pack, 19" wheels', 5025000.0000, CAST(N'2024-02-10T00:00:00.000' AS DateTime), 38, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1040, 2, 3, N'Jaguar F-PACE Chequered Flag', N'F-PACE-CF', N'Special edition mid-size SUV', N'Chequered Flag badging, 10" Touch Pro, Meridian Sound System', 7125000.0000, CAST(N'2024-01-25T00:00:00.000' AS DateTime), 39, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1041, 2, 1, N'Jaguar XF Chequered Flag', N'XF-CF', N'Special edition executive car', N'Chequered Flag exterior details, 18" wheels, R-Sport seats', 6375000.0000, CAST(N'2024-02-20T00:00:00.000' AS DateTime), 40, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1042, 3, 3, N'Land Rover Defender 90', N'DEF90', N'Compact SUV', N'Terrain Response 2, ClearSight Ground View, Wade Sensing', 7650000.0000, CAST(N'2023-07-15T00:00:00.000' AS DateTime), 41, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1043, 3, 3, N'Land Rover Defender 110', N'DEF110', N'Mid-size SUV', N'Configurable Terrain Response, Electronic Air Suspension, 3D Surround Camera', 8250000.0000, CAST(N'2023-08-01T00:00:00.000' AS DateTime), 42, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1044, 3, 1, N'Range Rover Evoque', N'EVOQUE', N'Compact luxury crossover SUV', N'ClearSight Rear View, TouchPro Duo, Adaptive Dynamics', 6375000.0000, CAST(N'2023-07-25T00:00:00.000' AS DateTime), 43, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1045, 3, 1, N'Range Rover Velar', N'VELAR', N'Mid-size luxury crossover SUV', N'Touch Pro Duo, Matrix LED headlights, Intelligent Driveline Dynamics', 7875000.0000, CAST(N'2023-08-10T00:00:00.000' AS DateTime), 44, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1046, 3, 1, N'Range Rover Sport', N'RR-SPORT', N'Full-size luxury SUV', N'Dynamic Response, All-Terrain Progress Control, Meridian Surround Sound System', 11250000.0000, CAST(N'2023-08-25T00:00:00.000' AS DateTime), 45, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1047, 3, 1, N'Range Rover', N'RR', N'Flagship luxury SUV', N'Executive Class Comfort-Plus rear seats, Pixel-laser LED headlights, Activity Key', 21750000.0000, CAST(N'2023-09-05T00:00:00.000' AS DateTime), 46, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1048, 3, 2, N'Discovery Sport', N'DISC-SPORT', N'Compact luxury crossover SUV', N'InControl Touch Pro, Terrain Response 2, ClearSight Ground View', 6000000.0000, CAST(N'2023-07-20T00:00:00.000' AS DateTime), 47, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1049, 3, 2, N'Discovery', N'DISCOVERY', N'Full-size luxury SUV', N'Intelligent Seat Fold, Advanced Tow Assist, Powered Inner Tailgate', 9375000.0000, CAST(N'2023-09-15T00:00:00.000' AS DateTime), 48, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1050, 3, 1, N'Range Rover Evoque Convertible', N'EVOQUE-CONV', N'Luxury compact convertible SUV', N'Gesture Sunblind, Perforated Windsor leather seats, Terrain Response', 7500000.0000, CAST(N'2023-10-01T00:00:00.000' AS DateTime), 49, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1051, 3, 3, N'Defender V8', N'DEF-V8', N'High-performance SUV', N'V8 engine, Electronic Active Differential, Terrain Response 2 with Dynamic Program', 15000000.0000, CAST(N'2023-10-15T00:00:00.000' AS DateTime), 50, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1052, 3, 1, N'Range Rover Sport SVR', N'RR-SPORT-SVR', N'High-performance luxury SUV', N'SVR Performance seats, Quad tailpipes, SVR-tuned Terrain Response 2', 22500000.0000, CAST(N'2023-11-01T00:00:00.000' AS DateTime), 51, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1053, 3, 1, N'Range Rover SV Autobiography', N'RR-SVA', N'Ultra-luxury SUV', N'Executive Class Comfort-Plus rear seats, Power close rear doors, Mohair mats', 37500000.0000, CAST(N'2023-11-15T00:00:00.000' AS DateTime), 52, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1054, 3, 3, N'Defender 130', N'DEF130', N'Extended wheelbase SUV', N'8-seat configuration, Advanced Air Purification, Electronic Air Suspension', 9750000.0000, CAST(N'2023-12-01T00:00:00.000' AS DateTime), 53, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1055, 3, 1, N'Range Rover Velar SVAutobiography', N'VELAR-SVA', N'High-performance luxury crossover', N'SVAutobiography exterior styling, Quilted Windsor leather seats, 21" wheels', 15750000.0000, CAST(N'2023-12-15T00:00:00.000' AS DateTime), 54, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1056, 3, 2, N'Discovery Metropolitan Edition', N'DISC-METRO', N'Special edition luxury SUV', N'Bright Atlas detailing, Titanium Mesh trim finisher, 22" Gloss Grey wheels', 10500000.0000, CAST(N'2024-01-05T00:00:00.000' AS DateTime), 55, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1057, 3, 3, N'Defender X', N'DEF-X', N'Top-spec rugged SUV', N'Orange brake calipers, Starlight Satin Black exterior accents, X badge', 12750000.0000, CAST(N'2024-01-20T00:00:00.000' AS DateTime), 56, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1058, 3, 1, N'Range Rover Fifty', N'RR-FIFTY', N'Limited edition luxury SUV', N'Auric Atlas detailing, 22" wheels, Fifty script badging', 24000000.0000, CAST(N'2024-02-01T00:00:00.000' AS DateTime), 57, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1059, 3, 3, N'Defender Hard Top', N'DEF-HT', N'Commercial SUV', N'Fixed partition, Lockable underfloor storage, Heavy-duty rubber mats', 6750000.0000, CAST(N'2023-09-25T00:00:00.000' AS DateTime), 58, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1060, 3, 1, N'Range Rover Sport HST', N'RR-SPORT-HST', N'Special edition performance SUV', N'Carbon Fiber exterior pack, Suedecloth steering wheel, Red brake calipers', 13500000.0000, CAST(N'2024-02-15T00:00:00.000' AS DateTime), 59, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1061, 3, 2, N'Discovery Commercial', N'DISC-COM', N'Commercial SUV', N'Powered tailgate, Air suspension, InControl Touch Pro', 7875000.0000, CAST(N'2023-10-10T00:00:00.000' AS DateTime), 60, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1062, 4, 1, N'Renault KWID', N'KWID', N'Entry-level hatchback', N'8-inch touchscreen, Reverse parking camera, LED DRLs', 450000.0000, CAST(N'2023-07-10T00:00:00.000' AS DateTime), 61, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1063, 4, 1, N'Renault Triber', N'TRIBER', N'Compact 7-seater MPV', N'Modular seating, 8-inch touchscreen, Dual-tone dashboard', 620000.0000, CAST(N'2023-07-25T00:00:00.000' AS DateTime), 62, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1064, 4, 1, N'Renault Kiger', N'KIGER', N'Compact SUV', N'Multi-sense driving modes, 8-inch floating touchscreen, Wireless smartphone replication', 620000.0000, CAST(N'2023-08-05T00:00:00.000' AS DateTime), 63, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1065, 4, 2, N'Renault Duster', N'DUSTER', N'Mid-size SUV', N'All-wheel Drive, 7-inch touchscreen, Multi-view camera', 1050000.0000, CAST(N'2023-08-20T00:00:00.000' AS DateTime), 64, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1066, 4, 2, N'Renault Captur', N'CAPTUR', N'Compact crossover SUV', N'LED Pure Vision headlamps, 7-inch touchscreen, Intelligent ULC 3.0', 1170000.0000, CAST(N'2023-09-01T00:00:00.000' AS DateTime), 65, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1067, 4, 2, N'Renault Clio', N'CLIO', N'Supermini hatchback', N'9.3-inch vertical touchscreen, LED headlights, Multi-Sense system', 1350000.0000, CAST(N'2023-09-15T00:00:00.000' AS DateTime), 66, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1068, 4, 2, N'Renault Megane', N'MEGANE', N'Compact car', N'10-inch digital driver display, Highway & Traffic Jam Companion, 4Control chassis', 1800000.0000, CAST(N'2023-09-30T00:00:00.000' AS DateTime), 67, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1069, 4, 2, N'Renault Arkana', N'ARKANA', N'Compact crossover SUV', N'Coupe-like design, 9.3-inch portrait touchscreen, Multi-Sense ambient lighting', 1980000.0000, CAST(N'2023-10-10T00:00:00.000' AS DateTime), 68, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1070, 4, 3, N'Renault Talisman', N'TALISMAN', N'Large family car', N'4Control four-wheel steering, Massaging front seats, Head-up display', 2250000.0000, CAST(N'2023-10-25T00:00:00.000' AS DateTime), 69, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1071, 4, 3, N'Renault Espace', N'ESPACE', N'Large MPV', N'7-seats, 9.3-inch touchscreen, 4Control four-wheel steering', 2700000.0000, CAST(N'2023-11-05T00:00:00.000' AS DateTime), 70, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1072, 4, 3, N'Renault Koleos', N'KOLEOS', N'Mid-size SUV', N'All-Mode 4x4-i technology, R-LINK 2 multimedia system, Hands-free power tailgate', 2520000.0000, CAST(N'2023-11-20T00:00:00.000' AS DateTime), 71, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1073, 4, 2, N'Renault Scenic', N'SCENIC', N'Compact MPV', N'One-touch folding rear seats, 8.7-inch portrait touchscreen, Colour head-up display', 1890000.0000, CAST(N'2023-12-01T00:00:00.000' AS DateTime), 72, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1074, 4, 2, N'Renault Zoe', N'ZOE', N'All-electric supermini', N'52 kWh battery, 10-inch digital instrument cluster, Winter Pack', 2340000.0000, CAST(N'2023-12-15T00:00:00.000' AS DateTime), 73, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1075, 4, 1, N'Renault Twingo', N'TWINGO', N'City car', N'Rear-engine layout, 7-inch touchscreen, Hands-free card access', 990000.0000, CAST(N'2024-01-05T00:00:00.000' AS DateTime), 74, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1076, 4, 2, N'Renault Kangoo', N'KANGOO', N'Leisure activity vehicle', N'Open Sesame by Renault side door, Easy Inside Rack, Wireless smartphone charger', 1620000.0000, CAST(N'2024-01-20T00:00:00.000' AS DateTime), 75, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1077, 4, 3, N'Renault Megane E-TECH Electric', N'MEGANE-E', N'All-electric compact car', N'60 kWh battery, OpenR Link multimedia system, 26 ADAS features', 3150000.0000, CAST(N'2024-02-01T00:00:00.000' AS DateTime), 76, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1078, 4, 3, N'Renault Austral', N'AUSTRAL', N'Compact crossover SUV', N'E-TECH Hybrid powertrain, OpenR display, 4Control Advanced', 2430000.0000, CAST(N'2024-02-15T00:00:00.000' AS DateTime), 77, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1079, 4, 2, N'Renault Clio E-TECH Hybrid', N'CLIO-E', N'Hybrid supermini', N'E-TECH hybrid powertrain, 9.3-inch vertical touchscreen, Multi-Sense system', 1620000.0000, CAST(N'2023-12-30T00:00:00.000' AS DateTime), 78, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1080, 4, 2, N'Renault Captur E-TECH Plug-in Hybrid', N'CAPTUR-E', N'Plug-in hybrid compact SUV', N'E-TECH plug-in hybrid powertrain, 9.3-inch touchscreen, Pure Vision LED headlamps', 2340000.0000, CAST(N'2024-01-10T00:00:00.000' AS DateTime), 79, 1, 0)
GO
INSERT [dbo].[Car] ([Id], [BrandId], [ClassId], [ModelName], [ModelCode], [Description], [Features], [Price], [DateOfManufacturing], [SortOrder], [IsActive], [IsDeleted]) VALUES (1081, 4, 2, N'Renault Trafic', N'TRAFIC', N'Light commercial van', N'Mobile Office Pack, Hands-free keycard, Rear View Assist', 2160000.0000, CAST(N'2023-11-30T00:00:00.000' AS DateTime), 80, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Car] OFF
GO
SET IDENTITY_INSERT [dbo].[CarClass] ON 
GO
INSERT [dbo].[CarClass] ([Id], [ClassName], [IsActive], [IsDeleted]) VALUES (1, N'Class A', 1, 0)
GO
INSERT [dbo].[CarClass] ([Id], [ClassName], [IsActive], [IsDeleted]) VALUES (2, N'Class B', 1, 0)
GO
INSERT [dbo].[CarClass] ([Id], [ClassName], [IsActive], [IsDeleted]) VALUES (3, N'Class C', 1, 0)
GO
SET IDENTITY_INSERT [dbo].[CarClass] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 
GO
INSERT [dbo].[Menu] ([Id], [ParentId], [MenuName], [Icon], [Link], [OrderById], [IsActive], [IsDeleted]) VALUES (1, NULL, N'Home', NULL, N'home', 1, 1, 0)
GO
INSERT [dbo].[Menu] ([Id], [ParentId], [MenuName], [Icon], [Link], [OrderById], [IsActive], [IsDeleted]) VALUES (2, NULL, N'Add Car', NULL, N'add-car', 2, 1, 0)
GO
INSERT [dbo].[Menu] ([Id], [ParentId], [MenuName], [Icon], [Link], [OrderById], [IsActive], [IsDeleted]) VALUES (3, NULL, N'Car List', NULL, N'car-list', 3, 1, 0)
GO
INSERT [dbo].[Menu] ([Id], [ParentId], [MenuName], [Icon], [Link], [OrderById], [IsActive], [IsDeleted]) VALUES (4, NULL, N'Reports', NULL, N'', 4, 1, 0)
GO
INSERT [dbo].[Menu] ([Id], [ParentId], [MenuName], [Icon], [Link], [OrderById], [IsActive], [IsDeleted]) VALUES (5, 4, N'Salesman Wise Sales', NULL, N'report/salesman-wise-sales', 5, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 
GO
INSERT [dbo].[Role] ([Id], [Role]) VALUES (1, N'Admin')
GO
INSERT [dbo].[Role] ([Id], [Role]) VALUES (2, N'User')
GO
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Sales] ON 
GO
INSERT [dbo].[Sales] ([Id], [Salesman], [ClassId], [NoOfAudi], [NoOfJaguar], [NoOfLandRover], [NoOfRenault]) VALUES (1, N'John Smith', 1, 1, 3, 0, 6)
GO
INSERT [dbo].[Sales] ([Id], [Salesman], [ClassId], [NoOfAudi], [NoOfJaguar], [NoOfLandRover], [NoOfRenault]) VALUES (2, N'John Smith', 2, 2, 4, 2, 2)
GO
INSERT [dbo].[Sales] ([Id], [Salesman], [ClassId], [NoOfAudi], [NoOfJaguar], [NoOfLandRover], [NoOfRenault]) VALUES (3, N'John Smith', 3, 3, 6, 1, 1)
GO
INSERT [dbo].[Sales] ([Id], [Salesman], [ClassId], [NoOfAudi], [NoOfJaguar], [NoOfLandRover], [NoOfRenault]) VALUES (4, N'Richard Porter', 1, 0, 5, 5, 3)
GO
INSERT [dbo].[Sales] ([Id], [Salesman], [ClassId], [NoOfAudi], [NoOfJaguar], [NoOfLandRover], [NoOfRenault]) VALUES (5, N'Richard Porter', 2, 0, 4, 2, 2)
GO
INSERT [dbo].[Sales] ([Id], [Salesman], [ClassId], [NoOfAudi], [NoOfJaguar], [NoOfLandRover], [NoOfRenault]) VALUES (6, N'Richard Porter', 3, 0, 2, 1, 1)
GO
INSERT [dbo].[Sales] ([Id], [Salesman], [ClassId], [NoOfAudi], [NoOfJaguar], [NoOfLandRover], [NoOfRenault]) VALUES (7, N'Tony Grid', 1, 4, 2, 1, 6)
GO
INSERT [dbo].[Sales] ([Id], [Salesman], [ClassId], [NoOfAudi], [NoOfJaguar], [NoOfLandRover], [NoOfRenault]) VALUES (8, N'Tony Grid', 2, 2, 7, 2, 3)
GO
INSERT [dbo].[Sales] ([Id], [Salesman], [ClassId], [NoOfAudi], [NoOfJaguar], [NoOfLandRover], [NoOfRenault]) VALUES (9, N'Tony Grid', 3, 0, 1, 3, 1)
GO
SET IDENTITY_INSERT [dbo].[Sales] OFF
GO
SET IDENTITY_INSERT [dbo].[UserAccess] ON 
GO
INSERT [dbo].[UserAccess] ([Id], [UserId], [MenuId], [IsDeleted]) VALUES (1, 1, 1, 0)
GO
INSERT [dbo].[UserAccess] ([Id], [UserId], [MenuId], [IsDeleted]) VALUES (2, 1, 2, 0)
GO
INSERT [dbo].[UserAccess] ([Id], [UserId], [MenuId], [IsDeleted]) VALUES (3, 1, 3, 0)
GO
INSERT [dbo].[UserAccess] ([Id], [UserId], [MenuId], [IsDeleted]) VALUES (4, 1, 4, 0)
GO
INSERT [dbo].[UserAccess] ([Id], [UserId], [MenuId], [IsDeleted]) VALUES (5, 1, 5, 0)
GO
INSERT [dbo].[UserAccess] ([Id], [UserId], [MenuId], [IsDeleted]) VALUES (6, 2, 1, 0)
GO
INSERT [dbo].[UserAccess] ([Id], [UserId], [MenuId], [IsDeleted]) VALUES (7, 2, 4, 0)
GO
INSERT [dbo].[UserAccess] ([Id], [UserId], [MenuId], [IsDeleted]) VALUES (8, 2, 5, 0)
GO
SET IDENTITY_INSERT [dbo].[UserAccess] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRole] ON 
GO
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [IsDeleted]) VALUES (1, 1, 1, 0)
GO
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [IsDeleted]) VALUES (2, 1, 2, 0)
GO
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [IsDeleted]) VALUES (3, 2, 2, 0)
GO
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [IsDeleted]) VALUES (4, 3, 2, 0)
GO
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [IsDeleted]) VALUES (5, 4, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[UserRole] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([Id], [Name], [Username], [Password]) VALUES (1, N'Hardik Patel', N'hsp', N'123')
GO
INSERT [dbo].[Users] ([Id], [Name], [Username], [Password]) VALUES (2, N'Vishal Patel', N'vsp', N'123')
GO
INSERT [dbo].[Users] ([Id], [Name], [Username], [Password]) VALUES (3, N'Ajay Patel', N'amp', N'123')
GO
INSERT [dbo].[Users] ([Id], [Name], [Username], [Password]) VALUES (4, N'Vijay Patel', N'vsp', N'123')
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Attachment] ADD  CONSTRAINT [DF_Attachment_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Brand] ADD  CONSTRAINT [DF_Brand_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Brand] ADD  CONSTRAINT [DF_Brand_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Car] ADD  CONSTRAINT [DF_Car_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Car] ADD  CONSTRAINT [DF_Car_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[CarClass] ADD  CONSTRAINT [DF_CarClass_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[CarClass] ADD  CONSTRAINT [DF_CarClass_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[UserAccess] ADD  CONSTRAINT [DF_UserAccess_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[UserRole] ADD  CONSTRAINT [DF_UserRole_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD  CONSTRAINT [FK_Car_Brand] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brand] ([Id])
GO
ALTER TABLE [dbo].[Car] CHECK CONSTRAINT [FK_Car_Brand]
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD  CONSTRAINT [FK_Car_CarClass] FOREIGN KEY([ClassId])
REFERENCES [dbo].[CarClass] ([Id])
GO
ALTER TABLE [dbo].[Car] CHECK CONSTRAINT [FK_Car_CarClass]
GO
ALTER TABLE [dbo].[UserAccess]  WITH CHECK ADD  CONSTRAINT [FK_UserAccess_Menu] FOREIGN KEY([MenuId])
REFERENCES [dbo].[Menu] ([Id])
GO
ALTER TABLE [dbo].[UserAccess] CHECK CONSTRAINT [FK_UserAccess_Menu]
GO
ALTER TABLE [dbo].[UserAccess]  WITH CHECK ADD  CONSTRAINT [FK_UserAccess_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserAccess] CHECK CONSTRAINT [FK_UserAccess_Users]
GO
/****** Object:  StoredProcedure [dbo].[USP_GetBrand]    Script Date: 21-10-2024 10:27:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GetBrand]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
	B.Id
	,B.BrandName
	FROM Brand AS B WITH(NOLOCK)
	WHERE B.IsDeleted = 0

END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetCars]    Script Date: 21-10-2024 10:27:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GetCars]
(
	@Id INT
	,@PageNumber INT = 1  
	,@PageSize INT = 50
	,@ModelName VARCHAR(100)
	,@ModelCode VARCHAR(100)
)
AS
BEGIN
	SET NOCOUNt ON;

	DECLARE @SkipRecords INT = CASE WHEN @PageNumber > 0 AND @PageSize > 0 THEN (@PageNumber - 1) * @PageSize ELSE 0 END  
    DECLARE @FetchRecords INT = CASE WHEN @PageSize > 0 THEN @PageSize ELSE 100000 END

	SELECT
	 C.Id
	,C.BrandId
	,B.BrandName
	,C.ClassId
	,CC.ClassName
	,C.ModelName
	,C.ModelCode
	,C.Description
	,C.Features
	,C.Price
	,C.DateOfManufacturing
	,C.SortOrder
	,C.IsActive
	FROM Car AS C WITH(NOLOCK)
	LEFT JOIN CarClass AS CC WITH(NOLOCK) ON CC.Id = C.ClassId
	LEFT JOIN Brand AS B WITH(NOLOCK) ON B.Id = C.BrandId
	WHERE C.IsDeleted = 0
	AND ((ISNULL(@Id, 0) = 0) OR (C.Id = @Id))
	AND ((ISNULL(@ModelName, '') = '') OR (C.ModelName LIKE '%' + @ModelName + '%'))
	AND ((ISNULL(@ModelCode, '') = '') OR (C.ModelCode LIKE '%' + @ModelCode + '%'))
	ORDER BY C.SortOrder DESC OFFSET @SkipRecords ROWS FETCH NEXT @PageSize ROWS ONLY;  
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetClass]    Script Date: 21-10-2024 10:27:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GetClass]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
	CC.Id
	,CC.ClassName
	FROM CarClass AS CC WITH(NOLOCK)
	WHERE CC.IsDeleted = 0

END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetMenus]    Script Date: 21-10-2024 10:27:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GetMenus]
(
	@UserId INT
)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
	M.Id
	,ISNULL(M.ParentId, 0) AS ParentId
	,M.MenuName
	,M.Icon
	,M.Link
	,M.OrderById
	FROM UserAccess AS US WITH(NOLOCK)
	LEFT JOIN Menu AS M WITH(NOLOCK) ON M.Id = US.MenuId
	WHERE US.UserId = @UserId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_RPT_SalesmanCommissionFigure]    Script Date: 21-10-2024 10:27:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_RPT_SalesmanCommissionFigure]
AS
BEGIN
	SET NOCOUNT ON;
	SET ARITHABORT ON;

	DECLARE @SalesFigure TABLE
	(
		Salesman VARCHAR(50)
		,ClassId INT
		,ClassName VARCHAR(50)
		,NoOfAudi MONEY
		,NoOfJaguar MONEY
		,NoOfLandRover MONEY
		,NoOfRenault MONEY
	)

	INSERT INTO @SalesFigure
	SELECT
	S.Salesman
	,S.ClassId
	,CC.ClassName
	,S.NoOfAudi * (SELECT Price FROM BrandCommission WITH(NOLOCK) WHERE BrandId = 1)
	,S.NoOfJaguar * (SELECT Price FROM BrandCommission WITH(NOLOCK) WHERE BrandId = 2)
	,S.NoOfLandRover * (SELECT Price FROM BrandCommission WITH(NOLOCK) WHERE BrandId = 3)
	,S.NoOfRenault * (SELECT Price FROM BrandCommission WITH(NOLOCK) WHERE BrandId = 4)
	FROM Sales AS S WITH(NOLOCK)
	LEFT JOIN CarClass AS CC WITH(NOLOCK) ON CC.Id = S.ClassId

	DECLARE @BrandCommssion TABLE
	(
		ClassName VARCHAR(50),
		Audi NUMERIC(5, 2),
		Jaguar NUMERIC(5, 2),
		LandRover NUMERIC(5, 2),
		Renualt NUMERIC(5, 2)
	)

	;WITH UnpivotedData AS (
		SELECT 
			BrandName,
			'Class A' AS ClassType, 
			ClassA AS CommissionValue
		FROM BrandCommission AS BC WITH(NOLOCK)
		LEFT JOIN Brand AS B WITH(NOLOCK) ON B.Id = BC.BrandId
		UNION ALL
		SELECT 
			BrandName,
			'Class B' AS ClassType, 
			ClassB AS CommissionValue
		FROM BrandCommission AS BC WITH(NOLOCK)
		LEFT JOIN Brand AS B WITH(NOLOCK) ON B.Id = BC.BrandId
		UNION ALL
		SELECT 
			BrandName,
			'Class C' AS ClassType, 
			ClassC AS CommissionValue
		FROM BrandCommission AS BC WITH(NOLOCK)
		LEFT JOIN Brand AS B WITH(NOLOCK) ON B.Id = BC.BrandId
	)
	INSERT INTO @BrandCommssion
	SELECT 
		ClassType,
		[Audi],
		[Jaguar],
		[Land Rover],
		[Renault]
	FROM 
		UnpivotedData
	PIVOT
	(
		MAX(CommissionValue)
		FOR BrandName IN ([Audi], [Jaguar], [Land Rover], [Renault])
	) AS PivotedTable

	SELECT
	S.Salesman
	,Audi = SUM(CAST(S.NoOfAudi / 100 * C.Audi AS NUMERIC(18,2)))
	,Jaguar = SUM(CAST(S.NoOfJaguar / 100 * C.Jaguar  AS NUMERIC(18,2)))
	,LandRover = SUM(CAST(S.NoOfLandRover / 100 * C.LandRover  AS NUMERIC(18,2)))
	,Renault = SUM(CAST(S.NoOfRenault / 100 * C.Renualt  AS NUMERIC(18,2)))
	FROM @SalesFigure AS S
	LEFT JOIN @BrandCommssion AS C ON C.ClassName = S.ClassName
	GROUP BY S.Salesman

END
GO
/****** Object:  StoredProcedure [dbo].[USP_SaveCars]    Script Date: 21-10-2024 10:27:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_SaveCars]
(
	 @Id INT
	,@BrandId INT
	,@ClassId INT
	,@ModelName NVARCHAR(100)
	,@ModelCode VARCHAR(50)
	,@Description NVARCHAR(MAX)
	,@Features NVARCHAR(MAX)
	,@Price MONEY
	,@DateOfManufacturing DATETIME
	,@SortOrder INT
)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @StatusId INT = 0
	DECLARE @CarId_TBL TABLE (Id INT)

	IF(@Id > 0 AND EXISTS(SELECT 1 FROM Car WHERE Id = @Id))
	BEGIN
		UPDATE Car SET
		BrandId = @BrandId
		,ClassId = @ClassId
		,ModelName = @ModelName
		,ModelCode = @ModelCode
		,Description = @Description
		,Features = @Features
		,Price = @Price
		,DateOfManufacturing = @DateOfManufacturing
		,SortOrder = @SortOrder
		WHERE Id = @Id

		SET @StatusId = 2 -- Update

	END
	ELSE
	BEGIN

		INSERT INTO Car
		OUTPUT inserted.Id INTO @CarId_TBL
		VALUES (@BrandId, @ClassId, @ModelName, @ModelCode, @Description, @Features, @Price, @DateOfManufacturing, @SortOrder, 1, 0)

		SET @StatusId = 1 -- Insert
		SELECT @Id = Id FROM @CarId_TBL
	END

	SELECT
	@StatusId AS StatusId
	,@Id AS CarId

END
GO
/****** Object:  StoredProcedure [dbo].[USP_UserCheck]    Script Date: 21-10-2024 10:27:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_UserCheck]
(
	@Username VARCHAR(50)
	,@Password VARCHAR(50)
)
AS
BEGIN
	SET NOCOUNT ON;
	SET ARITHABORT ON;

	SELECT
	U.Id
	,U.Name
	,AssignedRole = STRING_AGG(R.Role, ',')
	FROM Users AS U WITH(NOLOCK)
	LEFT JOIN UserRole AS UR WITH(NOLOCK) ON UR.UserId = U.Id
	LEFT JOIN Role AS R WITH(NOLOCK) ON R.Id = UR.RoleId
	WHERE U.Username = @Username
	AND U.Password = @Password
	GROUP BY U.Id, U.Name 

END
GO
USE [master]
GO
ALTER DATABASE [CoreEhs] SET  READ_WRITE 
GO
