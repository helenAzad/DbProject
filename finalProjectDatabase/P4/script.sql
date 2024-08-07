USE [master]
GO
/****** Object:  Database [airport managment]    Script Date: 7/3/2022 6:54:59 PM ******/
CREATE DATABASE [airport managment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'airport managment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\airport managment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'airport managment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\airport managment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [airport managment] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [airport managment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [airport managment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [airport managment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [airport managment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [airport managment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [airport managment] SET ARITHABORT OFF 
GO
ALTER DATABASE [airport managment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [airport managment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [airport managment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [airport managment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [airport managment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [airport managment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [airport managment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [airport managment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [airport managment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [airport managment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [airport managment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [airport managment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [airport managment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [airport managment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [airport managment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [airport managment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [airport managment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [airport managment] SET RECOVERY FULL 
GO
ALTER DATABASE [airport managment] SET  MULTI_USER 
GO
ALTER DATABASE [airport managment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [airport managment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [airport managment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [airport managment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [airport managment] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'airport managment', N'ON'
GO
ALTER DATABASE [airport managment] SET QUERY_STORE = OFF
GO
USE [airport managment]
GO
/****** Object:  Table [dbo].[airline_company]    Script Date: 7/3/2022 6:54:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[airline_company](
	[code] [int] NOT NULL,
	[country] [varchar](50) NULL,
	[ac_name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[airplane]    Script Date: 7/3/2022 6:54:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[airplane](
	[capacity_of_passengers] [int] NULL,
	[capacity_of_bar] [float] NOT NULL,
	[code] [int] NOT NULL,
	[airplane_name] [varchar](50) NULL,
	[ac_code] [int] NOT NULL,
	[report_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Airport]    Script Date: 7/3/2022 6:54:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airport](
	[country] [varchar](50) NULL,
	[state_airport] [varchar](50) NULL,
	[city] [varchar](50) NOT NULL,
	[airport_name] [varchar](200) NOT NULL,
	[ID] [int] NOT NULL,
	[flight_id] [int] NOT NULL,
	[flight_crew_ssn] [char](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[airport_name] ASC,
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[flight]    Script Date: 7/3/2022 6:54:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[flight](
	[date_flight] [datetime] NOT NULL,
	[ID] [int] NOT NULL,
	[in_out_flight] [varchar](50) NULL,
	[arrival_city] [varchar](25) NOT NULL,
	[time_flight] [int] NOT NULL,
	[destination] [varchar](25) NOT NULL,
	[flight_crew] [char](10) NOT NULL,
	[Airplane_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FLIGHT_CREW]    Script Date: 7/3/2022 6:54:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FLIGHT_CREW](
	[flight_num_per_day] [int] NULL,
	[Education] [varchar](30) NULL,
	[SSN] [char](10) NOT NULL,
	[stewardess] [bit] NULL,
	[Pilot] [bit] NULL,
	[Airport_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gate]    Script Date: 7/3/2022 6:54:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gate](
	[id] [int] NOT NULL,
	[Airport_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[land_takeoff]    Script Date: 7/3/2022 6:54:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[land_takeoff](
	[Airport_ID] [int] NOT NULL,
	[Flight_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Airport_ID] ASC,
	[Flight_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Passenger]    Script Date: 7/3/2022 6:54:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Passenger](
	[Legal_age] [bit] NOT NULL,
	[Physical_defect] [bit] NULL,
	[SSN] [char](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 7/3/2022 6:54:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[SSN] [char](10) NOT NULL,
	[Phone_num] [char](15) NOT NULL,
	[name] [varchar](30) NOT NULL,
	[family_name] [varchar](50) NOT NULL,
	[email] [varchar](300) NOT NULL,
	[birthdate] [date] NOT NULL,
	[gender] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[SSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reports]    Script Date: 7/3/2022 6:54:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reports](
	[last_repair_date] [date] NOT NULL,
	[ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 7/3/2022 6:54:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[Amout_of_load] [int] NULL,
	[cost] [float] NULL,
	[cabin] [varchar](20) NOT NULL,
	[seri_num] [char](20) NOT NULL,
	[flight_id] [int] NOT NULL,
	[passenger_id] [char](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[seri_num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[airline_company] ([code], [country], [ac_name]) VALUES (720, N'IRAN', N'IranAir')
INSERT [dbo].[airline_company] ([code], [country], [ac_name]) VALUES (721, N'UAE', N'Emirates Airline')
INSERT [dbo].[airline_company] ([code], [country], [ac_name]) VALUES (722, N'Qatar', N'Qatar AirWays')
INSERT [dbo].[airline_company] ([code], [country], [ac_name]) VALUES (723, N'China', N'Air China')
INSERT [dbo].[airline_company] ([code], [country], [ac_name]) VALUES (724, N'Japan', N'Nippon AirWays')
INSERT [dbo].[airline_company] ([code], [country], [ac_name]) VALUES (725, N'Germany', N'Air Berlin Group')
INSERT [dbo].[airline_company] ([code], [country], [ac_name]) VALUES (726, N'Italy', N'Alitalia')
INSERT [dbo].[airline_company] ([code], [country], [ac_name]) VALUES (727, N'Germany', N'Lufthansa')
INSERT [dbo].[airline_company] ([code], [country], [ac_name]) VALUES (728, N'Spain', N'Vueling Airlines')
INSERT [dbo].[airline_company] ([code], [country], [ac_name]) VALUES (729, N'Chile', N'LAN Airllines')
INSERT [dbo].[airplane] ([capacity_of_passengers], [capacity_of_bar], [code], [airplane_name], [ac_code], [report_id]) VALUES (40, 30, 6390, N'Nimblecry', 720, 1501)
INSERT [dbo].[airplane] ([capacity_of_passengers], [capacity_of_bar], [code], [airplane_name], [ac_code], [report_id]) VALUES (36, 35, 6391, N'Dragonforce', 721, 1502)
INSERT [dbo].[airplane] ([capacity_of_passengers], [capacity_of_bar], [code], [airplane_name], [ac_code], [report_id]) VALUES (36, 35, 6392, N'Agile Vulture', 722, 1503)
INSERT [dbo].[airplane] ([capacity_of_passengers], [capacity_of_bar], [code], [airplane_name], [ac_code], [report_id]) VALUES (40, 30, 6393, N'Skyforce', 723, 1504)
INSERT [dbo].[airplane] ([capacity_of_passengers], [capacity_of_bar], [code], [airplane_name], [ac_code], [report_id]) VALUES (40, 40, 6394, N'Primecharge', 724, 1505)
INSERT [dbo].[airplane] ([capacity_of_passengers], [capacity_of_bar], [code], [airplane_name], [ac_code], [report_id]) VALUES (28, 45, 6395, N'Bold Harrier', 725, 1506)
INSERT [dbo].[airplane] ([capacity_of_passengers], [capacity_of_bar], [code], [airplane_name], [ac_code], [report_id]) VALUES (40, 30, 6396, N'Cloudcore', 726, 1507)
INSERT [dbo].[airplane] ([capacity_of_passengers], [capacity_of_bar], [code], [airplane_name], [ac_code], [report_id]) VALUES (40, 30, 6397, N'Swiftroar', 727, 1508)
INSERT [dbo].[airplane] ([capacity_of_passengers], [capacity_of_bar], [code], [airplane_name], [ac_code], [report_id]) VALUES (36, 35, 6398, N'Bad Harrier', 728, 1509)
INSERT [dbo].[airplane] ([capacity_of_passengers], [capacity_of_bar], [code], [airplane_name], [ac_code], [report_id]) VALUES (40, 30, 6399, N'Blue Duke', 729, 1600)
INSERT [dbo].[Airport] ([country], [state_airport], [city], [airport_name], [ID], [flight_id], [flight_crew_ssn]) VALUES (N'IRAN', N'Hormozgan', N'Bandar Abbas', N'Bandar Abbas International Airport', 13121, 8896, N'99521288  ')
INSERT [dbo].[Airport] ([country], [state_airport], [city], [airport_name], [ID], [flight_id], [flight_crew_ssn]) VALUES (N'Italy', N'Roma', N'Roma', N'Ciampino', 451, 8893, N'99521289  ')
INSERT [dbo].[Airport] ([country], [state_airport], [city], [airport_name], [ID], [flight_id], [flight_crew_ssn]) VALUES (N'Germany', N'Berlin', N'Berlin', N'Flughafen Tegel', 780, 8895, N'99521280  ')
INSERT [dbo].[Airport] ([country], [state_airport], [city], [airport_name], [ID], [flight_id], [flight_crew_ssn]) VALUES (N'IRAN', N'Tehran', N'Tehran', N'Imam Khomeini', 121, 8881, N'99521294  ')
INSERT [dbo].[Airport] ([country], [state_airport], [city], [airport_name], [ID], [flight_id], [flight_crew_ssn]) VALUES (N'IRAN', N'Tehran', N'Tehran', N'Mehr abad', 11121, 8885, N'99521283  ')
INSERT [dbo].[Airport] ([country], [state_airport], [city], [airport_name], [ID], [flight_id], [flight_crew_ssn]) VALUES (N'France', N'Paris', N'Paris', N'Paris-Charles-de-Gaulle', 550, 8892, N'99521293  ')
INSERT [dbo].[Airport] ([country], [state_airport], [city], [airport_name], [ID], [flight_id], [flight_crew_ssn]) VALUES (N'IRAN', N'Shiraz', N'Shiraz', N'Shahid Dastgheib', 14121, 8888, N'99521290  ')
INSERT [dbo].[Airport] ([country], [state_airport], [city], [airport_name], [ID], [flight_id], [flight_crew_ssn]) VALUES (N'IRAN', N'Khorasan Razavi', N'Mashhad', N'Shahid Hasheminejad', 15121, 8884, N'99521282  ')
INSERT [dbo].[Airport] ([country], [state_airport], [city], [airport_name], [ID], [flight_id], [flight_crew_ssn]) VALUES (N'IRAN', N'Khuzestan', N'Ahwaz', N'Shahid Soleimani', 16121, 8891, N'99521285  ')
INSERT [dbo].[flight] ([date_flight], [ID], [in_out_flight], [arrival_city], [time_flight], [destination], [flight_crew], [Airplane_ID]) VALUES (CAST(N'2021-10-11T00:00:00.000' AS DateTime), 8881, N'Domestic flight', N'Bandar Abbas', 120, N'Tehran', N'99521280  ', 6390)
INSERT [dbo].[flight] ([date_flight], [ID], [in_out_flight], [arrival_city], [time_flight], [destination], [flight_crew], [Airplane_ID]) VALUES (CAST(N'2021-10-13T00:00:00.000' AS DateTime), 8883, N'Domestic flight', N'Tehran', 45, N'Shiraz', N'99521282  ', 6392)
INSERT [dbo].[flight] ([date_flight], [ID], [in_out_flight], [arrival_city], [time_flight], [destination], [flight_crew], [Airplane_ID]) VALUES (CAST(N'2021-12-10T00:00:00.000' AS DateTime), 8884, N'Domestic flight', N'Mashhad', 95, N'Tehran', N'99521283  ', 6393)
INSERT [dbo].[flight] ([date_flight], [ID], [in_out_flight], [arrival_city], [time_flight], [destination], [flight_crew], [Airplane_ID]) VALUES (CAST(N'2021-04-17T00:00:00.000' AS DateTime), 8885, N'Domestic flight', N'Tehran', 60, N'Mashhad', N'99521284  ', 6394)
INSERT [dbo].[flight] ([date_flight], [ID], [in_out_flight], [arrival_city], [time_flight], [destination], [flight_crew], [Airplane_ID]) VALUES (CAST(N'2021-06-05T00:00:00.000' AS DateTime), 8886, N'Domestic flight', N'Bandar Abbas', 75, N'Tehran', N'99521285  ', 6395)
INSERT [dbo].[flight] ([date_flight], [ID], [in_out_flight], [arrival_city], [time_flight], [destination], [flight_crew], [Airplane_ID]) VALUES (CAST(N'2021-10-18T00:00:00.000' AS DateTime), 8887, N'Domestic flight', N'Ahwaz', 120, N'Tehran', N'99521286  ', 6396)
INSERT [dbo].[flight] ([date_flight], [ID], [in_out_flight], [arrival_city], [time_flight], [destination], [flight_crew], [Airplane_ID]) VALUES (CAST(N'2021-10-13T00:00:00.000' AS DateTime), 8888, N'Domestic flight', N'Shiraz', 135, N'Tehran', N'99521287  ', 6397)
INSERT [dbo].[flight] ([date_flight], [ID], [in_out_flight], [arrival_city], [time_flight], [destination], [flight_crew], [Airplane_ID]) VALUES (CAST(N'2021-10-16T00:00:00.000' AS DateTime), 8889, N'Domestic flight', N'Tehran', 100, N'Bandar Abbas', N'99521288  ', 6398)
INSERT [dbo].[flight] ([date_flight], [ID], [in_out_flight], [arrival_city], [time_flight], [destination], [flight_crew], [Airplane_ID]) VALUES (CAST(N'2021-06-08T00:00:00.000' AS DateTime), 8890, N'Domestic flight', N'Ahwaz', 115, N'Tehran', N'99521289  ', 6399)
INSERT [dbo].[flight] ([date_flight], [ID], [in_out_flight], [arrival_city], [time_flight], [destination], [flight_crew], [Airplane_ID]) VALUES (CAST(N'2021-07-25T00:00:00.000' AS DateTime), 8891, N'Domestic flight', N'Mashhad', 120, N'Ahwaz', N'99521290  ', 6397)
INSERT [dbo].[flight] ([date_flight], [ID], [in_out_flight], [arrival_city], [time_flight], [destination], [flight_crew], [Airplane_ID]) VALUES (CAST(N'2021-11-20T00:00:00.000' AS DateTime), 8892, N'International flights', N'Tehran', 1500, N'London', N'99521291  ', 6392)
INSERT [dbo].[flight] ([date_flight], [ID], [in_out_flight], [arrival_city], [time_flight], [destination], [flight_crew], [Airplane_ID]) VALUES (CAST(N'2021-07-10T00:00:00.000' AS DateTime), 8893, N'International flights', N'Tehran', 1200, N'Paris', N'99521292  ', 6399)
INSERT [dbo].[flight] ([date_flight], [ID], [in_out_flight], [arrival_city], [time_flight], [destination], [flight_crew], [Airplane_ID]) VALUES (CAST(N'2021-05-05T00:00:00.000' AS DateTime), 8894, N'International flights', N'Tehran', 1100, N'Los Angles', N'99521293  ', 6396)
INSERT [dbo].[flight] ([date_flight], [ID], [in_out_flight], [arrival_city], [time_flight], [destination], [flight_crew], [Airplane_ID]) VALUES (CAST(N'2021-06-19T00:00:00.000' AS DateTime), 8895, N'International flights', N'Tehran', 1300, N'Tokyo', N'99521294  ', 6398)
INSERT [dbo].[flight] ([date_flight], [ID], [in_out_flight], [arrival_city], [time_flight], [destination], [flight_crew], [Airplane_ID]) VALUES (CAST(N'2021-08-23T00:00:00.000' AS DateTime), 8896, N'International flights', N'Tehran', 1400, N'Netherlands', N'99521293  ', 6390)
INSERT [dbo].[FLIGHT_CREW] ([flight_num_per_day], [Education], [SSN], [stewardess], [Pilot], [Airport_ID]) VALUES (1, N'Diploma', N'99521280  ', 1, 0, 11213)
INSERT [dbo].[FLIGHT_CREW] ([flight_num_per_day], [Education], [SSN], [stewardess], [Pilot], [Airport_ID]) VALUES (2, N'Bachelor', N'99521281  ', 1, 0, 11313)
INSERT [dbo].[FLIGHT_CREW] ([flight_num_per_day], [Education], [SSN], [stewardess], [Pilot], [Airport_ID]) VALUES (1, N'Bachelor', N'99521282  ', 1, 0, 11413)
INSERT [dbo].[FLIGHT_CREW] ([flight_num_per_day], [Education], [SSN], [stewardess], [Pilot], [Airport_ID]) VALUES (2, N'Bachelor', N'99521283  ', 1, 0, 11513)
INSERT [dbo].[FLIGHT_CREW] ([flight_num_per_day], [Education], [SSN], [stewardess], [Pilot], [Airport_ID]) VALUES (1, N'Diploma', N'99521284  ', 1, 0, 11613)
INSERT [dbo].[FLIGHT_CREW] ([flight_num_per_day], [Education], [SSN], [stewardess], [Pilot], [Airport_ID]) VALUES (1, N'Diploma', N'99521285  ', 1, 0, 11713)
INSERT [dbo].[FLIGHT_CREW] ([flight_num_per_day], [Education], [SSN], [stewardess], [Pilot], [Airport_ID]) VALUES (2, N'Bachelor', N'99521286  ', 1, 0, 11813)
INSERT [dbo].[FLIGHT_CREW] ([flight_num_per_day], [Education], [SSN], [stewardess], [Pilot], [Airport_ID]) VALUES (1, N'Bachelor', N'99521287  ', 1, 0, 11913)
INSERT [dbo].[FLIGHT_CREW] ([flight_num_per_day], [Education], [SSN], [stewardess], [Pilot], [Airport_ID]) VALUES (2, N'Diploma', N'99521288  ', 1, 0, 12013)
INSERT [dbo].[FLIGHT_CREW] ([flight_num_per_day], [Education], [SSN], [stewardess], [Pilot], [Airport_ID]) VALUES (1, N'Bachelor', N'99521289  ', 1, 0, 12113)
INSERT [dbo].[FLIGHT_CREW] ([flight_num_per_day], [Education], [SSN], [stewardess], [Pilot], [Airport_ID]) VALUES (2, N'P.H.D', N'99521290  ', 0, 1, 12201)
INSERT [dbo].[FLIGHT_CREW] ([flight_num_per_day], [Education], [SSN], [stewardess], [Pilot], [Airport_ID]) VALUES (1, N'Master', N'99521291  ', 0, 1, 12302)
INSERT [dbo].[FLIGHT_CREW] ([flight_num_per_day], [Education], [SSN], [stewardess], [Pilot], [Airport_ID]) VALUES (3, N'Bachelor', N'99521292  ', 0, 1, 12403)
INSERT [dbo].[FLIGHT_CREW] ([flight_num_per_day], [Education], [SSN], [stewardess], [Pilot], [Airport_ID]) VALUES (1, N'P.H.D', N'99521293  ', 0, 1, 12504)
INSERT [dbo].[FLIGHT_CREW] ([flight_num_per_day], [Education], [SSN], [stewardess], [Pilot], [Airport_ID]) VALUES (2, N'Master', N'99521294  ', 0, 1, 12605)
INSERT [dbo].[gate] ([id], [Airport_ID]) VALUES (1, 121)
INSERT [dbo].[gate] ([id], [Airport_ID]) VALUES (2, 11121)
INSERT [dbo].[gate] ([id], [Airport_ID]) VALUES (3, 13121)
INSERT [dbo].[gate] ([id], [Airport_ID]) VALUES (4, 14121)
INSERT [dbo].[gate] ([id], [Airport_ID]) VALUES (5, 15121)
INSERT [dbo].[gate] ([id], [Airport_ID]) VALUES (6, 16121)
INSERT [dbo].[gate] ([id], [Airport_ID]) VALUES (7, 550)
INSERT [dbo].[gate] ([id], [Airport_ID]) VALUES (8, 780)
INSERT [dbo].[gate] ([id], [Airport_ID]) VALUES (9, 451)
INSERT [dbo].[gate] ([id], [Airport_ID]) VALUES (10, 550)
INSERT [dbo].[land_takeoff] ([Airport_ID], [Flight_ID]) VALUES (121, 8881)
INSERT [dbo].[land_takeoff] ([Airport_ID], [Flight_ID]) VALUES (451, 8890)
INSERT [dbo].[land_takeoff] ([Airport_ID], [Flight_ID]) VALUES (550, 8888)
INSERT [dbo].[land_takeoff] ([Airport_ID], [Flight_ID]) VALUES (780, 8889)
INSERT [dbo].[land_takeoff] ([Airport_ID], [Flight_ID]) VALUES (11121, 8883)
INSERT [dbo].[land_takeoff] ([Airport_ID], [Flight_ID]) VALUES (13121, 8883)
INSERT [dbo].[land_takeoff] ([Airport_ID], [Flight_ID]) VALUES (13121, 8891)
INSERT [dbo].[land_takeoff] ([Airport_ID], [Flight_ID]) VALUES (14121, 8884)
INSERT [dbo].[land_takeoff] ([Airport_ID], [Flight_ID]) VALUES (15121, 8885)
INSERT [dbo].[land_takeoff] ([Airport_ID], [Flight_ID]) VALUES (15121, 8886)
INSERT [dbo].[land_takeoff] ([Airport_ID], [Flight_ID]) VALUES (16121, 8887)
INSERT [dbo].[Passenger] ([Legal_age], [Physical_defect], [SSN]) VALUES (0, 0, N'99521280  ')
INSERT [dbo].[Passenger] ([Legal_age], [Physical_defect], [SSN]) VALUES (0, 0, N'99521281  ')
INSERT [dbo].[Passenger] ([Legal_age], [Physical_defect], [SSN]) VALUES (0, 0, N'99521282  ')
INSERT [dbo].[Passenger] ([Legal_age], [Physical_defect], [SSN]) VALUES (0, 0, N'99521283  ')
INSERT [dbo].[Passenger] ([Legal_age], [Physical_defect], [SSN]) VALUES (0, 0, N'99521284  ')
INSERT [dbo].[Passenger] ([Legal_age], [Physical_defect], [SSN]) VALUES (0, 0, N'99521285  ')
INSERT [dbo].[Passenger] ([Legal_age], [Physical_defect], [SSN]) VALUES (0, 0, N'99521286  ')
INSERT [dbo].[Passenger] ([Legal_age], [Physical_defect], [SSN]) VALUES (0, 0, N'99521287  ')
INSERT [dbo].[Passenger] ([Legal_age], [Physical_defect], [SSN]) VALUES (0, 0, N'99521288  ')
INSERT [dbo].[Passenger] ([Legal_age], [Physical_defect], [SSN]) VALUES (0, 0, N'99521289  ')
INSERT [dbo].[Passenger] ([Legal_age], [Physical_defect], [SSN]) VALUES (0, 0, N'99521290  ')
INSERT [dbo].[Passenger] ([Legal_age], [Physical_defect], [SSN]) VALUES (0, 0, N'99521291  ')
INSERT [dbo].[Passenger] ([Legal_age], [Physical_defect], [SSN]) VALUES (0, 0, N'99521292  ')
INSERT [dbo].[Passenger] ([Legal_age], [Physical_defect], [SSN]) VALUES (0, 0, N'99521293  ')
INSERT [dbo].[Passenger] ([Legal_age], [Physical_defect], [SSN]) VALUES (0, 0, N'99521294  ')
INSERT [dbo].[Person] ([SSN], [Phone_num], [name], [family_name], [email], [birthdate], [gender]) VALUES (N'99521280  ', N'09177318980    ', N'Ali', N'Mohammadi', N'Ali_Mohammadi@gmail.com', CAST(N'2002-01-01' AS Date), N'Male')
INSERT [dbo].[Person] ([SSN], [Phone_num], [name], [family_name], [email], [birthdate], [gender]) VALUES (N'99521281  ', N'09177318981    ', N'Pooria', N'Hosseini', N'Pooria_Hosseini@gmail.com', CAST(N'2002-02-01' AS Date), N'Male')
INSERT [dbo].[Person] ([SSN], [Phone_num], [name], [family_name], [email], [birthdate], [gender]) VALUES (N'99521282  ', N'09177318982    ', N'Abtin', N'Ahmadi', N'Abtin_Ahmadi@gmail.com', CAST(N'2002-03-01' AS Date), N'Male')
INSERT [dbo].[Person] ([SSN], [Phone_num], [name], [family_name], [email], [birthdate], [gender]) VALUES (N'99521283  ', N'09177318983    ', N'Adel', N'Moradi', N'Adel_Moradi@gmail.com', CAST(N'2002-04-01' AS Date), N'Male')
INSERT [dbo].[Person] ([SSN], [Phone_num], [name], [family_name], [email], [birthdate], [gender]) VALUES (N'99521284  ', N'09177318984    ', N'Afshin', N'Heydari', N'Afshin_Heydari@gmail.com', CAST(N'2002-05-01' AS Date), N'Male')
INSERT [dbo].[Person] ([SSN], [Phone_num], [name], [family_name], [email], [birthdate], [gender]) VALUES (N'99521285  ', N'09177318985    ', N'Amir', N'Karimi', N'Amir_Karimi@gmail.com', CAST(N'2002-06-01' AS Date), N'Male')
INSERT [dbo].[Person] ([SSN], [Phone_num], [name], [family_name], [email], [birthdate], [gender]) VALUES (N'99521286  ', N'09177318986    ', N'Arad', N'Mousavi', N'Arad_Mousavi@gmail.com', CAST(N'2002-07-01' AS Date), N'Male')
INSERT [dbo].[Person] ([SSN], [Phone_num], [name], [family_name], [email], [birthdate], [gender]) VALUES (N'99521287  ', N'09177318987    ', N'Pooria', N'Rahimi', N'Pooria_Rahimi@gmail.com', CAST(N'2002-08-01' AS Date), N'Male')
INSERT [dbo].[Person] ([SSN], [Phone_num], [name], [family_name], [email], [birthdate], [gender]) VALUES (N'99521288  ', N'09177318988    ', N'Marjan', N'Ghasemi', N'Marjan_Ghasemi@gmail.com', CAST(N'2002-08-01' AS Date), N'Female')
INSERT [dbo].[Person] ([SSN], [Phone_num], [name], [family_name], [email], [birthdate], [gender]) VALUES (N'99521289  ', N'09177318989    ', N'Arya', N'Jafari', N'Arya_Jafari@gmail.com', CAST(N'2002-01-02' AS Date), N'Female')
INSERT [dbo].[Person] ([SSN], [Phone_num], [name], [family_name], [email], [birthdate], [gender]) VALUES (N'99521290  ', N'09177318990    ', N'Hoda', N'Ebrahimi', N'Hoda_Ebrahimi@gmail.com', CAST(N'2002-02-01' AS Date), N'Female')
INSERT [dbo].[Person] ([SSN], [Phone_num], [name], [family_name], [email], [birthdate], [gender]) VALUES (N'99521291  ', N'09177318991    ', N'Farnaz', N'Akbari', N'Farnaz_Akbari@gmail.com', CAST(N'2002-02-03' AS Date), N'Female')
INSERT [dbo].[Person] ([SSN], [Phone_num], [name], [family_name], [email], [birthdate], [gender]) VALUES (N'99521292  ', N'09177318992    ', N'Hana', N'Yousefi', N'Hana_Yousefi@gmail.com', CAST(N'2002-02-01' AS Date), N'Female')
INSERT [dbo].[Person] ([SSN], [Phone_num], [name], [family_name], [email], [birthdate], [gender]) VALUES (N'99521293  ', N'09177318993    ', N'Goli', N'Rezaei', N'Goli_Rezaei@gmail.com', CAST(N'2002-02-04' AS Date), N'Female')
INSERT [dbo].[Person] ([SSN], [Phone_num], [name], [family_name], [email], [birthdate], [gender]) VALUES (N'99521294  ', N'09177318994    ', N'Fatemeh', N'Salehi', N'Fatemeh_Salehi@gmail.com', CAST(N'2002-02-02' AS Date), N'Female')
INSERT [dbo].[reports] ([last_repair_date], [ID]) VALUES (CAST(N'2021-11-28' AS Date), 1501)
INSERT [dbo].[reports] ([last_repair_date], [ID]) VALUES (CAST(N'2021-11-29' AS Date), 1502)
INSERT [dbo].[reports] ([last_repair_date], [ID]) VALUES (CAST(N'2021-11-30' AS Date), 1503)
INSERT [dbo].[reports] ([last_repair_date], [ID]) VALUES (CAST(N'2022-01-01' AS Date), 1504)
INSERT [dbo].[reports] ([last_repair_date], [ID]) VALUES (CAST(N'2022-01-01' AS Date), 1505)
INSERT [dbo].[reports] ([last_repair_date], [ID]) VALUES (CAST(N'2022-01-02' AS Date), 1506)
INSERT [dbo].[reports] ([last_repair_date], [ID]) VALUES (CAST(N'2022-01-03' AS Date), 1507)
INSERT [dbo].[reports] ([last_repair_date], [ID]) VALUES (CAST(N'2022-01-01' AS Date), 1508)
INSERT [dbo].[reports] ([last_repair_date], [ID]) VALUES (CAST(N'2022-01-01' AS Date), 1509)
INSERT [dbo].[reports] ([last_repair_date], [ID]) VALUES (CAST(N'2022-02-05' AS Date), 1600)
INSERT [dbo].[Ticket] ([Amout_of_load], [cost], [cabin], [seri_num], [flight_id], [passenger_id]) VALUES (20, 800, N'firstcalss', N'AB0011              ', 8895, N'99521280  ')
INSERT [dbo].[Ticket] ([Amout_of_load], [cost], [cabin], [seri_num], [flight_id], [passenger_id]) VALUES (27, 500, N'economyclass', N'AB0012              ', 8888, N'99521281  ')
INSERT [dbo].[Ticket] ([Amout_of_load], [cost], [cabin], [seri_num], [flight_id], [passenger_id]) VALUES (32, 600, N'buisinessclass', N'AB0013              ', 8890, N'99521282  ')
INSERT [dbo].[Ticket] ([Amout_of_load], [cost], [cabin], [seri_num], [flight_id], [passenger_id]) VALUES (31, 450, N'economyclass', N'AB0014              ', 8888, N'99521283  ')
INSERT [dbo].[Ticket] ([Amout_of_load], [cost], [cabin], [seri_num], [flight_id], [passenger_id]) VALUES (48, 850, N'firstcalss', N'AB0015              ', 8884, N'99521284  ')
INSERT [dbo].[Ticket] ([Amout_of_load], [cost], [cabin], [seri_num], [flight_id], [passenger_id]) VALUES (24, 500, N'economyclass', N'AB0016              ', 8891, N'99521285  ')
INSERT [dbo].[Ticket] ([Amout_of_load], [cost], [cabin], [seri_num], [flight_id], [passenger_id]) VALUES (29, 900, N'firstcalss', N'AB0017              ', 8883, N'99521286  ')
INSERT [dbo].[Ticket] ([Amout_of_load], [cost], [cabin], [seri_num], [flight_id], [passenger_id]) VALUES (27, 400, N'economyclass', N'AB0018              ', 8892, N'99521287  ')
INSERT [dbo].[Ticket] ([Amout_of_load], [cost], [cabin], [seri_num], [flight_id], [passenger_id]) VALUES (29, 750, N'firstcalss', N'AB0019              ', 8890, N'99521288  ')
INSERT [dbo].[Ticket] ([Amout_of_load], [cost], [cabin], [seri_num], [flight_id], [passenger_id]) VALUES (21, 500, N'economyclass', N'AB0020              ', 8881, N'99521289  ')
INSERT [dbo].[Ticket] ([Amout_of_load], [cost], [cabin], [seri_num], [flight_id], [passenger_id]) VALUES (22, 600, N'buisinessclass', N'AB0021              ', 8887, N'99521290  ')
INSERT [dbo].[Ticket] ([Amout_of_load], [cost], [cabin], [seri_num], [flight_id], [passenger_id]) VALUES (15, 500, N'economyclass', N'AB0022              ', 8893, N'99521291  ')
INSERT [dbo].[Ticket] ([Amout_of_load], [cost], [cabin], [seri_num], [flight_id], [passenger_id]) VALUES (10, 400, N'economyclass', N'AB0023              ', 8885, N'99521292  ')
INSERT [dbo].[Ticket] ([Amout_of_load], [cost], [cabin], [seri_num], [flight_id], [passenger_id]) VALUES (11, 650, N'buisinessclass', N'AB0024              ', 8891, N'99521293  ')
INSERT [dbo].[Ticket] ([Amout_of_load], [cost], [cabin], [seri_num], [flight_id], [passenger_id]) VALUES (7, 950, N'firstcalss', N'AB0025              ', 8886, N'99521294  ')
/****** Object:  Index [UQ__airline___357D4CF94C55BD18]    Script Date: 7/3/2022 6:55:00 PM ******/
ALTER TABLE [dbo].[airline_company] ADD UNIQUE NONCLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__airline___474C3BE8D96392C2]    Script Date: 7/3/2022 6:55:00 PM ******/
ALTER TABLE [dbo].[airline_company] ADD UNIQUE NONCLUSTERED 
(
	[ac_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__airplane__5CC2C6059E8694A9]    Script Date: 7/3/2022 6:55:00 PM ******/
ALTER TABLE [dbo].[airplane] ADD UNIQUE NONCLUSTERED 
(
	[ac_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__airplane__779B7C59AB8138F5]    Script Date: 7/3/2022 6:55:00 PM ******/
ALTER TABLE [dbo].[airplane] ADD UNIQUE NONCLUSTERED 
(
	[report_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Airport__2FB4301235CE1888]    Script Date: 7/3/2022 6:55:00 PM ******/
ALTER TABLE [dbo].[Airport] ADD UNIQUE NONCLUSTERED 
(
	[airport_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Airport__3214EC2684267657]    Script Date: 7/3/2022 6:55:00 PM ******/
ALTER TABLE [dbo].[Airport] ADD UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Airport__E37057645B7EAF8E]    Script Date: 7/3/2022 6:55:00 PM ******/
ALTER TABLE [dbo].[Airport] ADD UNIQUE NONCLUSTERED 
(
	[flight_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Airport__E6A67D5600FCC65E]    Script Date: 7/3/2022 6:55:00 PM ******/
ALTER TABLE [dbo].[Airport] ADD UNIQUE NONCLUSTERED 
(
	[flight_crew_ssn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__flight__3214EC26C41F0181]    Script Date: 7/3/2022 6:55:00 PM ******/
ALTER TABLE [dbo].[flight] ADD UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__FLIGHT_C__3DBD861247879FFD]    Script Date: 7/3/2022 6:55:00 PM ******/
ALTER TABLE [dbo].[FLIGHT_CREW] ADD UNIQUE NONCLUSTERED 
(
	[Airport_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__FLIGHT_C__CA1E8E3C930EA0FF]    Script Date: 7/3/2022 6:55:00 PM ******/
ALTER TABLE [dbo].[FLIGHT_CREW] ADD UNIQUE NONCLUSTERED 
(
	[SSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__gate__3213E83E2CA6C859]    Script Date: 7/3/2022 6:55:00 PM ******/
ALTER TABLE [dbo].[gate] ADD UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Passenge__CA1E8E3C9041C81B]    Script Date: 7/3/2022 6:55:00 PM ******/
ALTER TABLE [dbo].[Passenger] ADD UNIQUE NONCLUSTERED 
(
	[SSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Person__7DC10DF0F75C9FB9]    Script Date: 7/3/2022 6:55:00 PM ******/
ALTER TABLE [dbo].[Person] ADD UNIQUE NONCLUSTERED 
(
	[Phone_num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Person__AB6E61648F527945]    Script Date: 7/3/2022 6:55:00 PM ******/
ALTER TABLE [dbo].[Person] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Person__CA1E8E3C6395D602]    Script Date: 7/3/2022 6:55:00 PM ******/
ALTER TABLE [dbo].[Person] ADD UNIQUE NONCLUSTERED 
(
	[SSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__reports__3214EC2684A0ED9A]    Script Date: 7/3/2022 6:55:00 PM ******/
ALTER TABLE [dbo].[reports] ADD UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Ticket__40760474385CEB37]    Script Date: 7/3/2022 6:55:00 PM ******/
ALTER TABLE [dbo].[Ticket] ADD UNIQUE NONCLUSTERED 
(
	[seri_num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[airplane]  WITH CHECK ADD FOREIGN KEY([ac_code])
REFERENCES [dbo].[airline_company] ([code])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[airplane]  WITH CHECK ADD FOREIGN KEY([report_id])
REFERENCES [dbo].[reports] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Airport]  WITH CHECK ADD FOREIGN KEY([flight_crew_ssn])
REFERENCES [dbo].[FLIGHT_CREW] ([SSN])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Airport]  WITH CHECK ADD FOREIGN KEY([flight_id])
REFERENCES [dbo].[flight] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[flight]  WITH CHECK ADD FOREIGN KEY([Airplane_ID])
REFERENCES [dbo].[airplane] ([code])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[flight]  WITH CHECK ADD FOREIGN KEY([flight_crew])
REFERENCES [dbo].[FLIGHT_CREW] ([SSN])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FLIGHT_CREW]  WITH CHECK ADD FOREIGN KEY([SSN])
REFERENCES [dbo].[Person] ([SSN])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[gate]  WITH CHECK ADD FOREIGN KEY([Airport_ID])
REFERENCES [dbo].[Airport] ([ID])
GO
ALTER TABLE [dbo].[land_takeoff]  WITH CHECK ADD FOREIGN KEY([Airport_ID])
REFERENCES [dbo].[Airport] ([ID])
GO
ALTER TABLE [dbo].[land_takeoff]  WITH CHECK ADD FOREIGN KEY([Flight_ID])
REFERENCES [dbo].[flight] ([ID])
GO
ALTER TABLE [dbo].[Passenger]  WITH CHECK ADD FOREIGN KEY([SSN])
REFERENCES [dbo].[Person] ([SSN])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD FOREIGN KEY([flight_id])
REFERENCES [dbo].[flight] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD FOREIGN KEY([passenger_id])
REFERENCES [dbo].[Person] ([SSN])
GO
ALTER TABLE [dbo].[flight]  WITH CHECK ADD  CONSTRAINT [check_in_out] CHECK  (([in_out_flight]='Domestic flight' OR [in_out_flight]='International flights'))
GO
ALTER TABLE [dbo].[flight] CHECK CONSTRAINT [check_in_out]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [check_sex] CHECK  (([gender]='Male' OR [gender]='Female'))
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [check_sex]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [check_cabin] CHECK  (([cabin]='firstcalss' OR [cabin]='buisinessclass' OR [cabin]='economyclass'))
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [check_cabin]
GO
USE [master]
GO
ALTER DATABASE [airport managment] SET  READ_WRITE 
GO
