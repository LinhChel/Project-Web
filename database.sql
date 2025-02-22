USE [master]
GO
/****** Object:  Database [FinalProjectXuongDB]    Script Date: 8/7/2024 10:18:06 PM ******/
CREATE DATABASE [FinalProjectXuongDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FinalProjectXuongDB', FILENAME = N'/var/opt/mssql/data/FinalProjectXuongDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FinalProjectXuongDB_log', FILENAME = N'/var/opt/mssql/data/FinalProjectXuongDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FinalProjectXuongDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FinalProjectXuongDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FinalProjectXuongDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FinalProjectXuongDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FinalProjectXuongDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FinalProjectXuongDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FinalProjectXuongDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [FinalProjectXuongDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FinalProjectXuongDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FinalProjectXuongDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FinalProjectXuongDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FinalProjectXuongDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FinalProjectXuongDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FinalProjectXuongDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FinalProjectXuongDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FinalProjectXuongDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FinalProjectXuongDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FinalProjectXuongDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FinalProjectXuongDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FinalProjectXuongDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FinalProjectXuongDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FinalProjectXuongDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FinalProjectXuongDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [FinalProjectXuongDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FinalProjectXuongDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FinalProjectXuongDB] SET  MULTI_USER 
GO
ALTER DATABASE [FinalProjectXuongDB] SET PAGE_VERIFY NONE  
GO
ALTER DATABASE [FinalProjectXuongDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FinalProjectXuongDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FinalProjectXuongDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FinalProjectXuongDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FinalProjectXuongDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FinalProjectXuongDB', N'ON'
GO
ALTER DATABASE [FinalProjectXuongDB] SET QUERY_STORE = OFF
GO
USE [FinalProjectXuongDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 8/7/2024 10:18:06 PM ******/
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
/****** Object:  Table [dbo].[Books]    Script Date: 8/7/2024 10:18:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Author] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[PublishedDate] [datetime2](7) NOT NULL,
	[ImagePath] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItems]    Script Date: 8/7/2024 10:18:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItems](
	[Id] [uniqueidentifier] NOT NULL,
	[BookId] [uniqueidentifier] NOT NULL,
	[CartId] [uniqueidentifier] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_CartItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 8/7/2024 10:18:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/7/2024 10:18:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [uniqueidentifier] NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240805135925_InitDB', N'6.0.32')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240807144443_UpdateAutoInclude', N'6.0.32')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240807145031_UpdateAutoInclude2', N'6.0.32')
GO
INSERT [dbo].[Books] ([Id], [Title], [Author], [Description], [Price], [Quantity], [PublishedDate], [ImagePath]) VALUES (N'f227686e-1319-4d77-b9a3-5c2b306a4868', N'Moby Dick', N'Herman Melville', N'A whaling voyage narrative that explores complex themes like obsession and revenge.', CAST(14.99 AS Decimal(18, 2)), 80, CAST(N'1851-10-18T00:00:00.0000000' AS DateTime2), N'/images/moby_dick.jpg')
INSERT [dbo].[Books] ([Id], [Title], [Author], [Description], [Price], [Quantity], [PublishedDate], [ImagePath]) VALUES (N'1089609f-1755-4f9c-a2a1-8443880f08f7', N'To Kill a Mockingbird', N'Harper Lee', N'A novel of warmth and humor, despite dealing with serious issues of rape and racial inequality.', CAST(18.99 AS Decimal(18, 2)), 200, CAST(N'1960-07-11T00:00:00.0000000' AS DateTime2), N'/images/to_kill_a_mockingbird.jpg')
INSERT [dbo].[Books] ([Id], [Title], [Author], [Description], [Price], [Quantity], [PublishedDate], [ImagePath]) VALUES (N'98aedc35-1739-404d-8ad2-9729207abee3', N'1984', N'George Orwell', N'A dystopian social science fiction novel and cautionary tale about the dangers of totalitarianism.', CAST(12.99 AS Decimal(18, 2)), 150, CAST(N'1949-06-08T00:00:00.0000000' AS DateTime2), N'/images/1984.jpg')
INSERT [dbo].[Books] ([Id], [Title], [Author], [Description], [Price], [Quantity], [PublishedDate], [ImagePath]) VALUES (N'f8ea6217-0218-4375-8ee9-a6d5a4c81fea', N'The Catcher in the Rye', N'J.D. Salinger', N'A story about adolescent angst and alienation.', CAST(15.99 AS Decimal(18, 2)), 100, CAST(N'1951-07-16T00:00:00.0000000' AS DateTime2), N'/images/catcher_in_the_rye.jpg')
INSERT [dbo].[Books] ([Id], [Title], [Author], [Description], [Price], [Quantity], [PublishedDate], [ImagePath]) VALUES (N'c845c354-ba08-462e-a8f8-f4bb5d2b1d23', N'The Great Gatsby', N'F. Scott Fitzgerald', N'A critique of the American Dream, set in the Jazz Age of the 1920s.', CAST(10.99 AS Decimal(18, 2)), 120, CAST(N'1925-04-10T00:00:00.0000000' AS DateTime2), N'/images/great_gatsby.jpeg')
GO
INSERT [dbo].[Carts] ([Id], [UserId]) VALUES (N'a35da129-91d8-4a8a-9f55-4a8072b92fe5', N'a28bfd5d-9980-40dd-8be3-9a2282c82f66')
INSERT [dbo].[Carts] ([Id], [UserId]) VALUES (N'8843ec3e-500e-488e-b948-0a3c2a93992f', N'57d1f914-9e97-4716-96ca-b5725d453964')
GO
INSERT [dbo].[Users] ([Id], [Username], [Password]) VALUES (N'a28bfd5d-9980-40dd-8be3-9a2282c82f66', N'user2', N'user2')
INSERT [dbo].[Users] ([Id], [Username], [Password]) VALUES (N'57d1f914-9e97-4716-96ca-b5725d453964', N'user1', N'user1')
GO
/****** Object:  Index [IX_CartItems_BookId]    Script Date: 8/7/2024 10:18:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_CartItems_BookId] ON [dbo].[CartItems]
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CartItems_CartId]    Script Date: 8/7/2024 10:18:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_CartItems_CartId] ON [dbo].[CartItems]
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Carts_UserId]    Script Date: 8/7/2024 10:18:07 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Carts_UserId] ON [dbo].[Carts]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Books_BookId] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Books_BookId]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Carts_CartId] FOREIGN KEY([CartId])
REFERENCES [dbo].[Carts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Carts_CartId]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [FinalProjectXuongDB] SET  READ_WRITE 
GO
