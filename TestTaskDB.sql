USE [master]
GO
/****** Object:  Database [TestTaskDB]    Script Date: 10.10.2021 23:46:29 ******/
CREATE DATABASE [TestTaskDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestTaskDB', FILENAME = N'C:\Program Files (x86)\MSSQL15.SQLEXPRESS\MSSQL\DATA\TestTaskDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TestTaskDB_log', FILENAME = N'C:\Program Files (x86)\MSSQL15.SQLEXPRESS\MSSQL\DATA\TestTaskDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TestTaskDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestTaskDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestTaskDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestTaskDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestTaskDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestTaskDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestTaskDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestTaskDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestTaskDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestTaskDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestTaskDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestTaskDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestTaskDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestTaskDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestTaskDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestTaskDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestTaskDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TestTaskDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestTaskDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestTaskDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestTaskDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestTaskDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestTaskDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestTaskDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestTaskDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TestTaskDB] SET  MULTI_USER 
GO
ALTER DATABASE [TestTaskDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestTaskDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestTaskDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestTaskDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TestTaskDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TestTaskDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TestTaskDB] SET QUERY_STORE = OFF
GO
USE [TestTaskDB]
GO
/****** Object:  Table [dbo].[Shipment]    Script Date: 10.10.2021 23:46:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipment](
	[Data] [date] NULL,
	[Organization] [varchar](50) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[Manager] [varchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Sum] [float] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Shipment] ([Data], [Organization], [City], [Country], [Manager], [Quantity], [Sum]) VALUES (CAST(N'2020-10-01' AS Date), N'Microsoft', N'Kyiv', N'Ukraine', N'Alex', 1, 100)
INSERT [dbo].[Shipment] ([Data], [Organization], [City], [Country], [Manager], [Quantity], [Sum]) VALUES (CAST(N'2020-10-01' AS Date), N'Samsung', N'Lviv', N'Ukraine', N'Ann', 2, 250)
INSERT [dbo].[Shipment] ([Data], [Organization], [City], [Country], [Manager], [Quantity], [Sum]) VALUES (CAST(N'2020-10-02' AS Date), N'Apple', N'Moscow', N'Russia', N'Andrei', 5, 450)
INSERT [dbo].[Shipment] ([Data], [Organization], [City], [Country], [Manager], [Quantity], [Sum]) VALUES (CAST(N'2020-10-02' AS Date), N'Huawei', N'Minsk', N'Belarus', N'Konsantin', 7, 750)
INSERT [dbo].[Shipment] ([Data], [Organization], [City], [Country], [Manager], [Quantity], [Sum]) VALUES (CAST(N'2020-10-03' AS Date), N'Microsoft', N'Warsaw', N'Poland', N'Andrei', 10, 1050)
INSERT [dbo].[Shipment] ([Data], [Organization], [City], [Country], [Manager], [Quantity], [Sum]) VALUES (CAST(N'2020-10-01' AS Date), N'Samsung', N'Kyiv', N'Ukraine', N'Lev', 4, 300)
INSERT [dbo].[Shipment] ([Data], [Organization], [City], [Country], [Manager], [Quantity], [Sum]) VALUES (CAST(N'2020-10-02' AS Date), N'Apple', N'Moscow', N'Russia', N'Viktor', 6, 600)
GO
USE [master]
GO
ALTER DATABASE [TestTaskDB] SET  READ_WRITE 
GO
