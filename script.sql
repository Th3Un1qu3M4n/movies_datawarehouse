USE [master]
GO
/****** Object:  Database [movies_dw]    Script Date: 6/22/2022 9:10:26 PM ******/
CREATE DATABASE [movies_dw]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'movies_dw', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\movies_dw.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'movies_dw_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\movies_dw_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[budget_dim]    Script Date: 6/22/2022 9:10:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[budget_dim](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[movie_id] [int] NOT NULL,
	[budget] [bigint] NULL,
 CONSTRAINT [PK_budget_dim] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[countries_helper_table]    Script Date: 6/22/2022 9:10:26 PM ******/
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
/****** Object:  Table [dbo].[country_dim]    Script Date: 6/22/2022 9:10:26 PM ******/
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
/****** Object:  Table [dbo].[DimDate]    Script Date: 6/22/2022 9:10:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDate](
	[DateSK] [int] NOT NULL,
	[FullDate] [datetime] NOT NULL,
	[Day] [tinyint] NOT NULL,
	[DaySuffix] [varchar](4) NOT NULL,
	[DayOfWeek] [varchar](9) NOT NULL,
	[DayOfWeekNumber] [int] NOT NULL,
	[DayOfWeekInMonth] [tinyint] NOT NULL,
	[DayOfYearNumber] [int] NOT NULL,
	[RelativeDays] [int] NOT NULL,
	[WeekOfYearNumber] [tinyint] NOT NULL,
	[WeekOfMonthNumber] [tinyint] NOT NULL,
	[RelativeWeeks] [int] NOT NULL,
	[CalendarMonthNumber] [tinyint] NOT NULL,
	[CalendarMonthName] [varchar](9) NOT NULL,
	[RelativeMonths] [int] NOT NULL,
	[CalendarQuarterNumber] [tinyint] NOT NULL,
	[CalendarQuarterName] [varchar](6) NOT NULL,
	[RelativeQuarters] [int] NOT NULL,
	[CalendarYearNumber] [int] NOT NULL,
	[RelativeYears] [int] NOT NULL,
	[StandardDate] [varchar](10) NULL,
	[WeekDayFlag] [bit] NOT NULL,
	[HolidayFlag] [bit] NOT NULL,
	[OpenFlag] [bit] NOT NULL,
	[FirstDayOfCalendarMonthFlag] [bit] NOT NULL,
	[LastDayOfCalendarMonthFlag] [bit] NOT NULL,
	[HolidayText] [varchar](50) NULL,
 CONSTRAINT [PK_DimDate] PRIMARY KEY CLUSTERED 
(
	[DateSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genre_dim]    Script Date: 6/22/2022 9:10:26 PM ******/
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
/****** Object:  Table [dbo].[genre_helper_table]    Script Date: 6/22/2022 9:10:26 PM ******/
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
/****** Object:  Table [dbo].[movie_data_fact]    Script Date: 6/22/2022 9:10:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movie_data_fact](
	[fact_id] [int] IDENTITY(1,1) NOT NULL,
	[movie_id] [varchar](50) NOT NULL,
	[budget_id] [int] NOT NULL,
	[release_date_id] [int] NOT NULL,
 CONSTRAINT [PK_movie_data_fact] PRIMARY KEY CLUSTERED 
(
	[fact_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movie_dim]    Script Date: 6/22/2022 9:10:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movie_dim](
	[id] [varchar](50) NOT NULL,
	[movie_name] [nvarchar](1000) NULL,
	[imdb_rating] [bigint] NULL,
	[release_date] [datetime] NULL,
 CONSTRAINT [PK_movie_dim] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[person_dim]    Script Date: 6/22/2022 9:10:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[person_dim](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[person_name] [varchar](100) NOT NULL,
	[movie_count] [int] NOT NULL,
 CONSTRAINT [PK_actor_dim] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[person_helper_table]    Script Date: 6/22/2022 9:10:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[person_helper_table](
	[person_id] [int] NOT NULL,
	[person_fact_id] [int] NOT NULL,
 CONSTRAINT [PK_actors_helper_table] PRIMARY KEY CLUSTERED 
(
	[person_id] ASC,
	[person_fact_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_dim_Time_HolidayText]    Script Date: 6/22/2022 9:10:26 PM ******/
CREATE NONCLUSTERED INDEX [IDX_dim_Time_HolidayText] ON [dbo].[DimDate]
(
	[HolidayText] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_DimDate_Date]    Script Date: 6/22/2022 9:10:26 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_DimDate_Date] ON [dbo].[DimDate]
(
	[FullDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_DimDate_Day]    Script Date: 6/22/2022 9:10:26 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimDate_Day] ON [dbo].[DimDate]
(
	[Day] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_DimDate_DayOfWeek]    Script Date: 6/22/2022 9:10:26 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimDate_DayOfWeek] ON [dbo].[DimDate]
(
	[DayOfWeek] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_DimDate_DayOfYear]    Script Date: 6/22/2022 9:10:26 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimDate_DayOfYear] ON [dbo].[DimDate]
(
	[DayOfYearNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_DimDate_DOWInMonth]    Script Date: 6/22/2022 9:10:26 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimDate_DOWInMonth] ON [dbo].[DimDate]
(
	[DayOfWeekInMonth] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_DimDate_Month]    Script Date: 6/22/2022 9:10:26 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimDate_Month] ON [dbo].[DimDate]
(
	[CalendarMonthNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_DimDate_MonthName]    Script Date: 6/22/2022 9:10:26 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimDate_MonthName] ON [dbo].[DimDate]
(
	[CalendarMonthName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_DimDate_Quarter]    Script Date: 6/22/2022 9:10:26 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimDate_Quarter] ON [dbo].[DimDate]
(
	[CalendarQuarterNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_DimDate_QuarterName]    Script Date: 6/22/2022 9:10:26 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimDate_QuarterName] ON [dbo].[DimDate]
(
	[CalendarQuarterName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_DimDate_WeekOfMonth]    Script Date: 6/22/2022 9:10:26 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimDate_WeekOfMonth] ON [dbo].[DimDate]
(
	[WeekOfMonthNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_DimDate_WeekOfYear]    Script Date: 6/22/2022 9:10:26 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimDate_WeekOfYear] ON [dbo].[DimDate]
(
	[WeekOfYearNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_DimDate_Year]    Script Date: 6/22/2022 9:10:26 PM ******/
CREATE NONCLUSTERED INDEX [IDX_DimDate_Year] ON [dbo].[DimDate]
(
	[CalendarYearNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[country_dim] ADD  CONSTRAINT [DF_country_dim_movie_count]  DEFAULT ((0)) FOR [movie_count]
GO
ALTER TABLE [dbo].[genre_dim] ADD  CONSTRAINT [DF_genre_dim_movie_count]  DEFAULT ((0)) FOR [movie_count]
GO
ALTER TABLE [dbo].[person_dim] ADD  CONSTRAINT [DF_actor_dim_movie_count]  DEFAULT ((0)) FOR [movie_count]
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
ALTER TABLE [dbo].[movie_data_fact]  WITH CHECK ADD  CONSTRAINT [FK_movie_data_fact_budget_dim] FOREIGN KEY([budget_id])
REFERENCES [dbo].[budget_dim] ([id])
GO
ALTER TABLE [dbo].[movie_data_fact] CHECK CONSTRAINT [FK_movie_data_fact_budget_dim]
GO
ALTER TABLE [dbo].[movie_data_fact]  WITH CHECK ADD  CONSTRAINT [FK_movie_data_fact_DimDate] FOREIGN KEY([release_date_id])
REFERENCES [dbo].[DimDate] ([DateSK])
GO
ALTER TABLE [dbo].[movie_data_fact] CHECK CONSTRAINT [FK_movie_data_fact_DimDate]
GO
ALTER TABLE [dbo].[movie_data_fact]  WITH CHECK ADD  CONSTRAINT [FK_movie_data_fact_movie_dim] FOREIGN KEY([movie_id])
REFERENCES [dbo].[movie_dim] ([id])
GO
ALTER TABLE [dbo].[movie_data_fact] CHECK CONSTRAINT [FK_movie_data_fact_movie_dim]
GO
ALTER TABLE [dbo].[person_helper_table]  WITH CHECK ADD  CONSTRAINT [FK_actors_helper_table_actor_dim] FOREIGN KEY([person_id])
REFERENCES [dbo].[person_dim] ([id])
GO
ALTER TABLE [dbo].[person_helper_table] CHECK CONSTRAINT [FK_actors_helper_table_actor_dim]
GO
ALTER TABLE [dbo].[person_helper_table]  WITH CHECK ADD  CONSTRAINT [FK_actors_helper_table_movie_data_fact] FOREIGN KEY([person_fact_id])
REFERENCES [dbo].[movie_data_fact] ([fact_id])
GO
ALTER TABLE [dbo].[person_helper_table] CHECK CONSTRAINT [FK_actors_helper_table_movie_data_fact]
GO
USE [master]
GO
ALTER DATABASE [movies_dw] SET  READ_WRITE 
GO
