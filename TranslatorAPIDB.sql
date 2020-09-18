USE [master]
GO
/****** Object:  Database [TranslatorAPIDB]    Script Date: 9/18/2020 7:46:02 AM ******/
CREATE DATABASE [TranslatorAPIDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TranslatorAPIDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TranslatorAPIDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TranslatorAPIDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TranslatorAPIDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TranslatorAPIDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TranslatorAPIDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TranslatorAPIDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TranslatorAPIDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TranslatorAPIDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TranslatorAPIDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TranslatorAPIDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TranslatorAPIDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TranslatorAPIDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TranslatorAPIDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TranslatorAPIDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TranslatorAPIDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TranslatorAPIDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TranslatorAPIDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TranslatorAPIDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TranslatorAPIDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TranslatorAPIDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TranslatorAPIDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TranslatorAPIDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TranslatorAPIDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TranslatorAPIDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TranslatorAPIDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TranslatorAPIDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [TranslatorAPIDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TranslatorAPIDB] SET RECOVERY FULL 
GO
ALTER DATABASE [TranslatorAPIDB] SET  MULTI_USER 
GO
ALTER DATABASE [TranslatorAPIDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TranslatorAPIDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TranslatorAPIDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TranslatorAPIDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TranslatorAPIDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TranslatorAPIDB', N'ON'
GO
ALTER DATABASE [TranslatorAPIDB] SET QUERY_STORE = OFF
GO
USE [TranslatorAPIDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 9/18/2020 7:46:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Translations]    Script Date: 9/18/2020 7:46:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Translations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TranslationDate] [datetime2](7) NOT NULL,
	[InputText] [nvarchar](300) NOT NULL,
	[OutputText] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_Translations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [TranslatorAPIDB] SET  READ_WRITE 
GO
