USE [master]
GO
/****** Object:  Database [movies_dw]    Script Date: 21/06/2022 2:18:48 pm ******/
CREATE DATABASE [movies_dw]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'movies_dw', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\movies_dw.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'movies_dw_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\movies_dw_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [movies_dw] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [movies_dw].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [movies_dw] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [movies_dw] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [movies_dw] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [movies_dw] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [movies_dw] SET ARITHABORT OFF 
GO
ALTER DATABASE [movies_dw] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [movies_dw] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [movies_dw] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [movies_dw] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [movies_dw] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [movies_dw] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [movies_dw] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [movies_dw] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [movies_dw] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [movies_dw] SET  DISABLE_BROKER 
GO
ALTER DATABASE [movies_dw] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [movies_dw] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [movies_dw] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [movies_dw] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [movies_dw] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [movies_dw] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [movies_dw] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [movies_dw] SET RECOVERY FULL 
GO
ALTER DATABASE [movies_dw] SET  MULTI_USER 
GO
ALTER DATABASE [movies_dw] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [movies_dw] SET DB_CHAINING OFF 
GO
ALTER DATABASE [movies_dw] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [movies_dw] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [movies_dw] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [movies_dw] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'movies_dw', N'ON'
GO
ALTER DATABASE [movies_dw] SET QUERY_STORE = OFF
GO
USE [movies_dw]
GO
/****** Object:  Table [dbo].[actor_dim]    Script Date: 21/06/2022 2:18:48 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[actor_dim](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[actor_name] [varchar](100) NOT NULL,
	[movie_count] [int] NOT NULL,
 CONSTRAINT [PK_actor_dim] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[actors_helper_table]    Script Date: 21/06/2022 2:18:48 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[actors_helper_table](
	[actor_id] [int] NOT NULL,
	[actor_fact_id] [int] NOT NULL,
 CONSTRAINT [PK_actors_helper_table] PRIMARY KEY CLUSTERED 
(
	[actor_id] ASC,
	[actor_fact_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[awards_dim]    Script Date: 21/06/2022 2:18:48 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[awards_dim](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nominations] [int] NOT NULL,
	[wins] [int] NOT NULL,
 CONSTRAINT [PK_awards_dim] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[countries_helper_table]    Script Date: 21/06/2022 2:18:48 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[countries_helper_table](
	[country_id] [int] NOT NULL,
	[country_fact_id] [int] NOT NULL,
 CONSTRAINT [PK_countries_helper_table] PRIMARY KEY CLUSTERED 
(
	[country_id] ASC,
	[country_fact_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[country_dim]    Script Date: 21/06/2022 2:18:48 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[country_dim](
	[id] [int] NOT NULL,
	[country_name] [varchar](100) NOT NULL,
	[movie_count] [int] NOT NULL,
 CONSTRAINT [PK_country_dim] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[date_dim]    Script Date: 21/06/2022 2:18:48 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[date_dim](
	[DateKey] [int] NOT NULL,
	[Date] [datetime] NULL,
	[FullDateUK] [char](10) NULL,
	[FullDateUSA] [char](10) NULL,
	[DayOfMonth] [varchar](2) NULL,
	[DaySuffix] [varchar](4) NULL,
	[DayName] [varchar](9) NULL,
	[DayOfWeekUSA] [char](1) NULL,
	[DayOfWeekUK] [char](1) NULL,
	[DayOfWeekInMonth] [varchar](2) NULL,
	[DayOfWeekInYear] [varchar](2) NULL,
	[DayOfQuarter] [varchar](3) NULL,
	[DayOfYear] [varchar](3) NULL,
	[WeekOfMonth] [varchar](1) NULL,
	[WeekOfQuarter] [varchar](2) NULL,
	[WeekOfYear] [varchar](2) NULL,
	[Month] [varchar](2) NULL,
	[MonthName] [varchar](9) NULL,
	[MonthOfQuarter] [varchar](2) NULL,
	[Quarter] [char](1) NULL,
	[QuarterName] [varchar](9) NULL,
	[Year] [char](4) NULL,
	[YearName] [char](7) NULL,
	[MonthYear] [char](10) NULL,
	[MMYYYY] [char](6) NULL,
	[FirstDayOfMonth] [date] NULL,
	[LastDayOfMonth] [date] NULL,
	[FirstDayOfQuarter] [date] NULL,
	[LastDayOfQuarter] [date] NULL,
	[FirstDayOfYear] [date] NULL,
	[LastDayOfYear] [date] NULL,
	[IsHolidayUSA] [bit] NULL,
	[IsWeekday] [bit] NULL,
	[HolidayUSA] [varchar](50) NULL,
	[IsHolidayUK] [bit] NULL,
	[HolidayUK] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genre_dim]    Script Date: 21/06/2022 2:18:48 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genre_dim](
	[id] [int] NOT NULL,
	[genre_category] [varchar](100) NOT NULL,
	[movie_count] [int] NOT NULL,
 CONSTRAINT [PK_genre_dim] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genre_helper_table]    Script Date: 21/06/2022 2:18:48 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genre_helper_table](
	[genre_id] [int] NOT NULL,
	[genre_fact_id] [int] NOT NULL,
 CONSTRAINT [PK_genre_helper_table] PRIMARY KEY CLUSTERED 
(
	[genre_id] ASC,
	[genre_fact_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movie_data_fact]    Script Date: 21/06/2022 2:18:48 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movie_data_fact](
	[fact_id] [int] IDENTITY(1,1) NOT NULL,
	[movie_id] [varchar](50) NOT NULL,
	[awards_id] [int] NOT NULL,
	[release_date_id] [int] NOT NULL,
 CONSTRAINT [PK_movie_data_fact] PRIMARY KEY CLUSTERED 
(
	[fact_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movie_dim]    Script Date: 21/06/2022 2:18:48 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movie_dim](
	[id] [varchar](50) NOT NULL,
	[movie_name] [varchar](100) NOT NULL,
	[imdb_rating] [float] NULL,
 CONSTRAINT [PK_movie_dim] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[actor_dim] ADD  CONSTRAINT [DF_actor_dim_movie_count]  DEFAULT ((0)) FOR [movie_count]
GO
ALTER TABLE [dbo].[awards_dim] ADD  CONSTRAINT [DF_awards_dim_nominations]  DEFAULT ((0)) FOR [nominations]
GO
ALTER TABLE [dbo].[awards_dim] ADD  CONSTRAINT [DF_awards_dim_wins]  DEFAULT ((0)) FOR [wins]
GO
ALTER TABLE [dbo].[country_dim] ADD  CONSTRAINT [DF_country_dim_movie_count]  DEFAULT ((0)) FOR [movie_count]
GO
ALTER TABLE [dbo].[genre_dim] ADD  CONSTRAINT [DF_genre_dim_movie_count]  DEFAULT ((0)) FOR [movie_count]
GO
ALTER TABLE [dbo].[actors_helper_table]  WITH CHECK ADD  CONSTRAINT [FK_actors_helper_table_actor_dim] FOREIGN KEY([actor_id])
REFERENCES [dbo].[actor_dim] ([id])
GO
ALTER TABLE [dbo].[actors_helper_table] CHECK CONSTRAINT [FK_actors_helper_table_actor_dim]
GO
ALTER TABLE [dbo].[actors_helper_table]  WITH CHECK ADD  CONSTRAINT [FK_actors_helper_table_movie_data_fact] FOREIGN KEY([actor_fact_id])
REFERENCES [dbo].[movie_data_fact] ([fact_id])
GO
ALTER TABLE [dbo].[actors_helper_table] CHECK CONSTRAINT [FK_actors_helper_table_movie_data_fact]
GO
ALTER TABLE [dbo].[countries_helper_table]  WITH CHECK ADD  CONSTRAINT [FK_countries_helper_table_country_dim] FOREIGN KEY([country_id])
REFERENCES [dbo].[country_dim] ([id])
GO
ALTER TABLE [dbo].[countries_helper_table] CHECK CONSTRAINT [FK_countries_helper_table_country_dim]
GO
ALTER TABLE [dbo].[countries_helper_table]  WITH CHECK ADD  CONSTRAINT [FK_countries_helper_table_movie_data_fact] FOREIGN KEY([country_fact_id])
REFERENCES [dbo].[movie_data_fact] ([fact_id])
GO
ALTER TABLE [dbo].[countries_helper_table] CHECK CONSTRAINT [FK_countries_helper_table_movie_data_fact]
GO
ALTER TABLE [dbo].[genre_helper_table]  WITH CHECK ADD  CONSTRAINT [FK_genre_helper_table_genre_dim] FOREIGN KEY([genre_id])
REFERENCES [dbo].[genre_dim] ([id])
GO
ALTER TABLE [dbo].[genre_helper_table] CHECK CONSTRAINT [FK_genre_helper_table_genre_dim]
GO
ALTER TABLE [dbo].[genre_helper_table]  WITH CHECK ADD  CONSTRAINT [FK_genre_helper_table_movie_data_fact] FOREIGN KEY([genre_fact_id])
REFERENCES [dbo].[movie_data_fact] ([fact_id])
GO
ALTER TABLE [dbo].[genre_helper_table] CHECK CONSTRAINT [FK_genre_helper_table_movie_data_fact]
GO
ALTER TABLE [dbo].[movie_data_fact]  WITH CHECK ADD  CONSTRAINT [FK_movie_data_fact_awards_dim] FOREIGN KEY([awards_id])
REFERENCES [dbo].[awards_dim] ([id])
GO
ALTER TABLE [dbo].[movie_data_fact] CHECK CONSTRAINT [FK_movie_data_fact_awards_dim]
GO
ALTER TABLE [dbo].[movie_data_fact]  WITH CHECK ADD  CONSTRAINT [FK_movie_data_fact_date_dim] FOREIGN KEY([release_date_id])
REFERENCES [dbo].[date_dim] ([DateKey])
GO
ALTER TABLE [dbo].[movie_data_fact] CHECK CONSTRAINT [FK_movie_data_fact_date_dim]
GO
ALTER TABLE [dbo].[movie_data_fact]  WITH CHECK ADD  CONSTRAINT [FK_movie_data_fact_movie_dim] FOREIGN KEY([movie_id])
REFERENCES [dbo].[movie_dim] ([id])
GO
ALTER TABLE [dbo].[movie_data_fact] CHECK CONSTRAINT [FK_movie_data_fact_movie_dim]
GO
USE [master]
GO
ALTER DATABASE [movies_dw] SET  READ_WRITE 
GO
