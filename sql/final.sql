USE [master]
GO
/****** Object:  Database [TGDD]    Script Date: 7/4/2022 8:26:51 PM ******/
CREATE DATABASE [TGDD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TGDD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TGDD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TGDD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TGDD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TGDD] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TGDD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TGDD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TGDD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TGDD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TGDD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TGDD] SET ARITHABORT OFF 
GO
ALTER DATABASE [TGDD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TGDD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TGDD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TGDD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TGDD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TGDD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TGDD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TGDD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TGDD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TGDD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TGDD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TGDD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TGDD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TGDD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TGDD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TGDD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TGDD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TGDD] SET RECOVERY FULL 
GO
ALTER DATABASE [TGDD] SET  MULTI_USER 
GO
ALTER DATABASE [TGDD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TGDD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TGDD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TGDD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TGDD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TGDD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TGDD', N'ON'
GO
ALTER DATABASE [TGDD] SET QUERY_STORE = OFF
GO
USE [TGDD]
GO
/****** Object:  Table [dbo].[tbl_categories]    Script Date: 7/4/2022 8:26:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_categories](
	[catagory_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](max) NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_categories] PRIMARY KEY CLUSTERED 
(
	[catagory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_location]    Script Date: 7/4/2022 8:26:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_location](
	[location_id] [int] IDENTITY(1,1) NOT NULL,
	[locaition_name] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_location] PRIMARY KEY CLUSTERED 
(
	[location_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_manufacturer]    Script Date: 7/4/2022 8:26:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_manufacturer](
	[manafacturer_id] [int] IDENTITY(1,1) NOT NULL,
	[manafacturer_name] [nvarchar](100) NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_manufacturer] PRIMARY KEY CLUSTERED 
(
	[manafacturer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_order]    Script Date: 7/4/2022 8:26:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_name] [nvarchar](max) NOT NULL,
	[address] [nvarchar](max) NOT NULL,
	[phone_number] [varchar](20) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[shipping_type] [nvarchar](50) NOT NULL,
	[total_price] [float] NOT NULL,
	[order_date] [date] NOT NULL,
	[shipping_status] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_order] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_order_details]    Script Date: 7/4/2022 8:26:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_order_details](
	[product_id] [int] NOT NULL,
	[order_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_product]    Script Date: 7/4/2022 8:26:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](max) NULL,
	[quantity] [int] NOT NULL,
	[unit_price] [float] NOT NULL,
	[sale_price] [float] NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[rate] [nvarchar](50) NOT NULL,
	[status] [bit] NOT NULL,
	[image] [varchar](max) NULL,
	[manufacturer_id] [int] NOT NULL,
	[store_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
 CONSTRAINT [PK_tbl_product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_store]    Script Date: 7/4/2022 8:26:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_store](
	[store_id] [int] IDENTITY(1,1) NOT NULL,
	[store_name] [nvarchar](max) NULL,
	[location_id] [int] NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_store] PRIMARY KEY CLUSTERED 
(
	[store_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_order_details]  WITH CHECK ADD  CONSTRAINT [FK_tbl_order_details_tbl_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[tbl_order] ([order_id])
GO
ALTER TABLE [dbo].[tbl_order_details] CHECK CONSTRAINT [FK_tbl_order_details_tbl_order]
GO
ALTER TABLE [dbo].[tbl_order_details]  WITH CHECK ADD  CONSTRAINT [FK_tbl_order_details_tbl_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[tbl_product] ([product_id])
GO
ALTER TABLE [dbo].[tbl_order_details] CHECK CONSTRAINT [FK_tbl_order_details_tbl_product]
GO
ALTER TABLE [dbo].[tbl_product]  WITH CHECK ADD  CONSTRAINT [FK_tbl_product_tbl_categories] FOREIGN KEY([category_id])
REFERENCES [dbo].[tbl_categories] ([catagory_id])
GO
ALTER TABLE [dbo].[tbl_product] CHECK CONSTRAINT [FK_tbl_product_tbl_categories]
GO
ALTER TABLE [dbo].[tbl_product]  WITH CHECK ADD  CONSTRAINT [FK_tbl_product_tbl_manufacturer] FOREIGN KEY([manufacturer_id])
REFERENCES [dbo].[tbl_manufacturer] ([manafacturer_id])
GO
ALTER TABLE [dbo].[tbl_product] CHECK CONSTRAINT [FK_tbl_product_tbl_manufacturer]
GO
ALTER TABLE [dbo].[tbl_product]  WITH CHECK ADD  CONSTRAINT [FK_tbl_product_tbl_store] FOREIGN KEY([store_id])
REFERENCES [dbo].[tbl_store] ([store_id])
GO
ALTER TABLE [dbo].[tbl_product] CHECK CONSTRAINT [FK_tbl_product_tbl_store]
GO
ALTER TABLE [dbo].[tbl_store]  WITH CHECK ADD  CONSTRAINT [FK_tbl_store_tbl_location] FOREIGN KEY([location_id])
REFERENCES [dbo].[tbl_location] ([location_id])
GO
ALTER TABLE [dbo].[tbl_store] CHECK CONSTRAINT [FK_tbl_store_tbl_location]
GO
USE [master]
GO
ALTER DATABASE [TGDD] SET  READ_WRITE 
GO
