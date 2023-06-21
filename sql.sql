USE [master]
GO
/****** Object:  Database [product]    Script Date: 6/21/2023 11:25:00 PM ******/
CREATE DATABASE [product]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'product', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\product.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'product_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\product_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 COLLATE THAI_CI_AS 
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [product] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [product].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [product] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [product] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [product] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [product] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [product] SET ARITHABORT OFF 
GO
ALTER DATABASE [product] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [product] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [product] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [product] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [product] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [product] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [product] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [product] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [product] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [product] SET  DISABLE_BROKER 
GO
ALTER DATABASE [product] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [product] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [product] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [product] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [product] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [product] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [product] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [product] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [product] SET  MULTI_USER 
GO
ALTER DATABASE [product] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [product] SET DB_CHAINING OFF 
GO
ALTER DATABASE [product] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [product] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [product] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [product] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [product] SET QUERY_STORE = ON
GO
ALTER DATABASE [product] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [product]
GO
/****** Object:  Table [dbo].[tbcategory]    Script Date: 6/21/2023 11:25:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbcategory](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) COLLATE THAI_CI_AS  NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbproduct]    Script Date: 6/21/2023 11:25:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbproduct](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](70) COLLATE THAI_CI_AS  NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_tbproduct] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbcategory] ON 

INSERT [dbo].[tbcategory] ([CategoryId], [CategoryName]) VALUES (1, N'Footwear')
INSERT [dbo].[tbcategory] ([CategoryId], [CategoryName]) VALUES (2, N'Electronics')
INSERT [dbo].[tbcategory] ([CategoryId], [CategoryName]) VALUES (3, N'Clothing')
SET IDENTITY_INSERT [dbo].[tbcategory] OFF
GO
SET IDENTITY_INSERT [dbo].[tbproduct] ON 

INSERT [dbo].[tbproduct] ([ProductId], [ProductName], [CategoryId]) VALUES (1, N'Canon EOS R5', 2)
INSERT [dbo].[tbproduct] ([ProductId], [ProductName], [CategoryId]) VALUES (2, N'A', 2)
INSERT [dbo].[tbproduct] ([ProductId], [ProductName], [CategoryId]) VALUES (3, N'A', 2)
INSERT [dbo].[tbproduct] ([ProductId], [ProductName], [CategoryId]) VALUES (4, N'aa', 1)
INSERT [dbo].[tbproduct] ([ProductId], [ProductName], [CategoryId]) VALUES (5, N'aa', 2)
INSERT [dbo].[tbproduct] ([ProductId], [ProductName], [CategoryId]) VALUES (6, N'ASDAS', 1)
INSERT [dbo].[tbproduct] ([ProductId], [ProductName], [CategoryId]) VALUES (7, N'zaza', 1)
INSERT [dbo].[tbproduct] ([ProductId], [ProductName], [CategoryId]) VALUES (8, N'asdas', 1)
INSERT [dbo].[tbproduct] ([ProductId], [ProductName], [CategoryId]) VALUES (9, N'asdaswq', 1)
INSERT [dbo].[tbproduct] ([ProductId], [ProductName], [CategoryId]) VALUES (10, N'????', 3)
INSERT [dbo].[tbproduct] ([ProductId], [ProductName], [CategoryId]) VALUES (11, N'????', 3)
INSERT [dbo].[tbproduct] ([ProductId], [ProductName], [CategoryId]) VALUES (12, N'??????', 1)
INSERT [dbo].[tbproduct] ([ProductId], [ProductName], [CategoryId]) VALUES (13, N'??????', 1)
INSERT [dbo].[tbproduct] ([ProductId], [ProductName], [CategoryId]) VALUES (14, N'erer', 1)
INSERT [dbo].[tbproduct] ([ProductId], [ProductName], [CategoryId]) VALUES (15, N'ererqwe', 1)
INSERT [dbo].[tbproduct] ([ProductId], [ProductName], [CategoryId]) VALUES (16, N'zazaza', 1)
INSERT [dbo].[tbproduct] ([ProductId], [ProductName], [CategoryId]) VALUES (17, N'zaza', 1)
INSERT [dbo].[tbproduct] ([ProductId], [ProductName], [CategoryId]) VALUES (18, N'qwdasd', 1)
INSERT [dbo].[tbproduct] ([ProductId], [ProductName], [CategoryId]) VALUES (19, N'?????', 3)
INSERT [dbo].[tbproduct] ([ProductId], [ProductName], [CategoryId]) VALUES (20, N'zaza', 1)
SET IDENTITY_INSERT [dbo].[tbproduct] OFF
GO
ALTER TABLE [dbo].[tbproduct]  WITH CHECK ADD  CONSTRAINT [FK_tbproduct_tbcategory] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[tbcategory] ([CategoryId])
GO
ALTER TABLE [dbo].[tbproduct] CHECK CONSTRAINT [FK_tbproduct_tbcategory]
GO
USE [master]
GO
ALTER DATABASE [product] SET  READ_WRITE 
GO
