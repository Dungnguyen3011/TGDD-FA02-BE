USE [master]
GO
/****** Object:  Database [DB_TGDD]    Script Date: 6/26/2022 9:29:08 PM ******/
CREATE DATABASE [DB_TGDD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_TGDD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DB_TGDD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_TGDD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DB_TGDD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DB_TGDD] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_TGDD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_TGDD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_TGDD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_TGDD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_TGDD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_TGDD] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_TGDD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_TGDD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_TGDD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_TGDD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_TGDD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_TGDD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_TGDD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_TGDD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_TGDD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_TGDD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_TGDD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_TGDD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_TGDD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_TGDD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_TGDD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_TGDD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_TGDD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_TGDD] SET RECOVERY FULL 
GO
ALTER DATABASE [DB_TGDD] SET  MULTI_USER 
GO
ALTER DATABASE [DB_TGDD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_TGDD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_TGDD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_TGDD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_TGDD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_TGDD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB_TGDD', N'ON'
GO
ALTER DATABASE [DB_TGDD] SET QUERY_STORE = OFF
GO
USE [DB_TGDD]
GO
/****** Object:  Table [dbo].[tbl_categories]    Script Date: 6/26/2022 9:29:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_categories](
	[category_id] [int] NOT NULL,
	[category_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_location]    Script Date: 6/26/2022 9:29:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_location](
	[location_id] [int] NOT NULL,
	[location_name] [nvarchar](100) NULL,
	[store_id] [int] NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[location_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_order]    Script Date: 6/26/2022 9:29:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_order](
	[order_id] [int] NOT NULL,
	[customer_name] [nvarchar](100) NULL,
	[order_date] [date] NULL,
	[address] [nvarchar](200) NULL,
	[phone_number] [char](50) NULL,
	[email] [varchar](100) NULL,
	[shipping_type] [nvarchar](50) NULL,
	[total_price] [float] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Orderr] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_order_detail]    Script Date: 6/26/2022 9:29:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_order_detail](
	[product_id] [int] NULL,
	[order_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_product]    Script Date: 6/26/2022 9:29:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_product](
	[product_id] [int] NOT NULL,
	[product_name] [nvarchar](50) NULL,
	[quantity] [int] NULL,
	[mannufacturer] [varchar](100) NULL,
	[unitPrice] [float] NULL,
	[description] [nvarchar](200) NULL,
	[rate] [int] NULL,
	[status] [nchar](10) NULL,
	[image] [nchar](10) NULL,
	[category_id] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_product_store]    Script Date: 6/26/2022 9:29:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_product_store](
	[product_id] [int] NULL,
	[store_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_store]    Script Date: 6/26/2022 9:29:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_store](
	[store_id] [int] NOT NULL,
	[store_name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Store] PRIMARY KEY CLUSTERED 
(
	[store_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_location]  WITH CHECK ADD  CONSTRAINT [FK_Location_Store] FOREIGN KEY([store_id])
REFERENCES [dbo].[tbl_store] ([store_id])
GO
ALTER TABLE [dbo].[tbl_location] CHECK CONSTRAINT [FK_Location_Store]
GO
ALTER TABLE [dbo].[tbl_order_detail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([order_id])
REFERENCES [dbo].[tbl_order] ([order_id])
GO
ALTER TABLE [dbo].[tbl_order_detail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[tbl_order_detail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[tbl_product] ([product_id])
GO
ALTER TABLE [dbo].[tbl_order_detail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[tbl_product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Categories] FOREIGN KEY([product_id])
REFERENCES [dbo].[tbl_categories] ([category_id])
GO
ALTER TABLE [dbo].[tbl_product] CHECK CONSTRAINT [FK_Product_Categories]
GO
ALTER TABLE [dbo].[tbl_product_store]  WITH CHECK ADD  CONSTRAINT [FK_productStore_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[tbl_product] ([product_id])
GO
ALTER TABLE [dbo].[tbl_product_store] CHECK CONSTRAINT [FK_productStore_Product]
GO
ALTER TABLE [dbo].[tbl_product_store]  WITH CHECK ADD  CONSTRAINT [FK_productStore_Store] FOREIGN KEY([store_id])
REFERENCES [dbo].[tbl_store] ([store_id])
GO
ALTER TABLE [dbo].[tbl_product_store] CHECK CONSTRAINT [FK_productStore_Store]
GO
USE [master]
GO
ALTER DATABASE [DB_TGDD] SET  READ_WRITE 
GO
