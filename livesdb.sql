USE [master]
GO
/****** Object:  Database [LiveSDB]    Script Date: 6/24/2022 10:41:06 PM ******/
CREATE DATABASE [LiveSDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LiveSDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\LiveSDB.mdf' , SIZE = 109568KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LiveSDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\LiveSDB.ldf' , SIZE = 427392KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LiveSDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LiveSDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LiveSDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LiveSDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LiveSDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LiveSDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LiveSDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [LiveSDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LiveSDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LiveSDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LiveSDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LiveSDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LiveSDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LiveSDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LiveSDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LiveSDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LiveSDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LiveSDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LiveSDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LiveSDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LiveSDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LiveSDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LiveSDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LiveSDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LiveSDB] SET RECOVERY FULL 
GO
ALTER DATABASE [LiveSDB] SET  MULTI_USER 
GO
ALTER DATABASE [LiveSDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LiveSDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LiveSDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LiveSDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'LiveSDB', N'ON'
GO
USE [LiveSDB]
GO
/****** Object:  User [NT AUTHORITY\SYSTEM]    Script Date: 6/24/2022 10:41:06 PM ******/
CREATE USER [NT AUTHORITY\SYSTEM] FOR LOGIN [NT AUTHORITY\SYSTEM] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [aspnet_WebEvent_FullAccess]    Script Date: 6/24/2022 10:41:06 PM ******/
CREATE ROLE [aspnet_WebEvent_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_ReportingAccess]    Script Date: 6/24/2022 10:41:06 PM ******/
CREATE ROLE [aspnet_Roles_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_FullAccess]    Script Date: 6/24/2022 10:41:06 PM ******/
CREATE ROLE [aspnet_Roles_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_BasicAccess]    Script Date: 6/24/2022 10:41:06 PM ******/
CREATE ROLE [aspnet_Roles_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_ReportingAccess]    Script Date: 6/24/2022 10:41:06 PM ******/
CREATE ROLE [aspnet_Profile_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_FullAccess]    Script Date: 6/24/2022 10:41:06 PM ******/
CREATE ROLE [aspnet_Profile_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_BasicAccess]    Script Date: 6/24/2022 10:41:06 PM ******/
CREATE ROLE [aspnet_Profile_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_ReportingAccess]    Script Date: 6/24/2022 10:41:06 PM ******/
CREATE ROLE [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_FullAccess]    Script Date: 6/24/2022 10:41:06 PM ******/
CREATE ROLE [aspnet_Personalization_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_BasicAccess]    Script Date: 6/24/2022 10:41:06 PM ******/
CREATE ROLE [aspnet_Personalization_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Membership_ReportingAccess]    Script Date: 6/24/2022 10:41:06 PM ******/
CREATE ROLE [aspnet_Membership_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Membership_FullAccess]    Script Date: 6/24/2022 10:41:06 PM ******/
CREATE ROLE [aspnet_Membership_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Membership_BasicAccess]    Script Date: 6/24/2022 10:41:06 PM ******/
CREATE ROLE [aspnet_Membership_BasicAccess]
GO
ALTER ROLE [db_owner] ADD MEMBER [NT AUTHORITY\SYSTEM]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [NT AUTHORITY\SYSTEM]
GO
ALTER ROLE [aspnet_Roles_BasicAccess] ADD MEMBER [aspnet_Roles_FullAccess]
GO
ALTER ROLE [aspnet_Roles_ReportingAccess] ADD MEMBER [aspnet_Roles_FullAccess]
GO
ALTER ROLE [aspnet_Profile_BasicAccess] ADD MEMBER [aspnet_Profile_FullAccess]
GO
ALTER ROLE [aspnet_Profile_ReportingAccess] ADD MEMBER [aspnet_Profile_FullAccess]
GO
ALTER ROLE [aspnet_Personalization_BasicAccess] ADD MEMBER [aspnet_Personalization_FullAccess]
GO
ALTER ROLE [aspnet_Personalization_ReportingAccess] ADD MEMBER [aspnet_Personalization_FullAccess]
GO
ALTER ROLE [aspnet_Membership_BasicAccess] ADD MEMBER [aspnet_Membership_FullAccess]
GO
ALTER ROLE [aspnet_Membership_ReportingAccess] ADD MEMBER [aspnet_Membership_FullAccess]
GO
/****** Object:  Schema [aspnet_Membership_BasicAccess]    Script Date: 6/24/2022 10:41:07 PM ******/
CREATE SCHEMA [aspnet_Membership_BasicAccess]
GO
/****** Object:  Schema [aspnet_Membership_FullAccess]    Script Date: 6/24/2022 10:41:07 PM ******/
CREATE SCHEMA [aspnet_Membership_FullAccess]
GO
/****** Object:  Schema [aspnet_Membership_ReportingAccess]    Script Date: 6/24/2022 10:41:07 PM ******/
CREATE SCHEMA [aspnet_Membership_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Personalization_BasicAccess]    Script Date: 6/24/2022 10:41:07 PM ******/
CREATE SCHEMA [aspnet_Personalization_BasicAccess]
GO
/****** Object:  Schema [aspnet_Personalization_FullAccess]    Script Date: 6/24/2022 10:41:07 PM ******/
CREATE SCHEMA [aspnet_Personalization_FullAccess]
GO
/****** Object:  Schema [aspnet_Personalization_ReportingAccess]    Script Date: 6/24/2022 10:41:07 PM ******/
CREATE SCHEMA [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Profile_BasicAccess]    Script Date: 6/24/2022 10:41:07 PM ******/
CREATE SCHEMA [aspnet_Profile_BasicAccess]
GO
/****** Object:  Schema [aspnet_Profile_FullAccess]    Script Date: 6/24/2022 10:41:07 PM ******/
CREATE SCHEMA [aspnet_Profile_FullAccess]
GO
/****** Object:  Schema [aspnet_Profile_ReportingAccess]    Script Date: 6/24/2022 10:41:07 PM ******/
CREATE SCHEMA [aspnet_Profile_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Roles_BasicAccess]    Script Date: 6/24/2022 10:41:07 PM ******/
CREATE SCHEMA [aspnet_Roles_BasicAccess]
GO
/****** Object:  Schema [aspnet_Roles_FullAccess]    Script Date: 6/24/2022 10:41:07 PM ******/
CREATE SCHEMA [aspnet_Roles_FullAccess]
GO
/****** Object:  Schema [aspnet_Roles_ReportingAccess]    Script Date: 6/24/2022 10:41:07 PM ******/
CREATE SCHEMA [aspnet_Roles_ReportingAccess]
GO
/****** Object:  Schema [aspnet_WebEvent_FullAccess]    Script Date: 6/24/2022 10:41:07 PM ******/
CREATE SCHEMA [aspnet_WebEvent_FullAccess]
GO
/****** Object:  UserDefinedFunction [dbo].[SplitString]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create FUNCTION [dbo].[SplitString]
(	
	@Input NVARCHAR(MAX),
	@Character CHAR(1)
)
RETURNS @Output TABLE (
	Item NVARCHAR(1000)
)
AS
BEGIN
	DECLARE @StartIndex INT, @EndIndex INT

	SET @StartIndex = 1
	IF SUBSTRING(@Input, LEN(@Input) - 1, LEN(@Input)) <> @Character
	BEGIN
		SET @Input = @Input + @Character
	END

	WHILE CHARINDEX(@Character, @Input) > 0
	BEGIN
		SET @EndIndex = CHARINDEX(@Character, @Input)
		
		INSERT INTO @Output(Item)
		SELECT SUBSTRING(@Input, @StartIndex, @EndIndex - 1)
		
		SET @Input = SUBSTRING(@Input, @EndIndex + 1, LEN(@Input))
	END

	RETURN
END
GO
/****** Object:  Table [dbo].[aspnet_Applications]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Applications](
	[ApplicationName] [nvarchar](256) NOT NULL,
	[LoweredApplicationName] [nvarchar](256) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [aspnet_Applications_Index]    Script Date: 6/24/2022 10:41:07 PM ******/
CREATE CLUSTERED INDEX [aspnet_Applications_Index] ON [dbo].[aspnet_Applications]
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Membership]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Membership](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[MobilePIN] [nvarchar](16) NULL,
	[Email] [nvarchar](256) NULL,
	[LoweredEmail] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowStart] [datetime] NOT NULL,
	[Comment] [ntext] NULL,
PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [aspnet_Membership_index]    Script Date: 6/24/2022 10:41:07 PM ******/
CREATE CLUSTERED INDEX [aspnet_Membership_index] ON [dbo].[aspnet_Membership]
(
	[ApplicationId] ASC,
	[LoweredEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Paths]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Paths](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NOT NULL,
	[Path] [nvarchar](256) NOT NULL,
	[LoweredPath] [nvarchar](256) NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [aspnet_Paths_index]    Script Date: 6/24/2022 10:41:07 PM ******/
CREATE UNIQUE CLUSTERED INDEX [aspnet_Paths_index] ON [dbo].[aspnet_Paths]
(
	[ApplicationId] ASC,
	[LoweredPath] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_PersonalizationAllUsers]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationAllUsers](
	[PathId] [uniqueidentifier] NOT NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_PersonalizationPerUser]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationPerUser](
	[Id] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [aspnet_PersonalizationPerUser_index1]    Script Date: 6/24/2022 10:41:07 PM ******/
CREATE UNIQUE CLUSTERED INDEX [aspnet_PersonalizationPerUser_index1] ON [dbo].[aspnet_PersonalizationPerUser]
(
	[PathId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Profile]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Profile](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [ntext] NOT NULL,
	[PropertyValuesString] [ntext] NOT NULL,
	[PropertyValuesBinary] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[LoweredRoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [aspnet_Roles_index1]    Script Date: 6/24/2022 10:41:07 PM ******/
CREATE UNIQUE CLUSTERED INDEX [aspnet_Roles_index1] ON [dbo].[aspnet_Roles]
(
	[ApplicationId] ASC,
	[LoweredRoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_SchemaVersions]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_SchemaVersions](
	[Feature] [nvarchar](128) NOT NULL,
	[CompatibleSchemaVersion] [nvarchar](128) NOT NULL,
	[IsCurrentVersion] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Feature] ASC,
	[CompatibleSchemaVersion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_UserProvince]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_UserProvince](
	[UserID] [nvarchar](200) NOT NULL,
	[ProvinceID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[LoweredUserName] [nvarchar](256) NOT NULL,
	[MobileAlias] [nvarchar](16) NULL,
	[IsAnonymous] [bit] NOT NULL,
	[LastActivityDate] [datetime] NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [aspnet_Users_Index]    Script Date: 6/24/2022 10:41:07 PM ******/
CREATE UNIQUE CLUSTERED INDEX [aspnet_Users_Index] ON [dbo].[aspnet_Users]
(
	[ApplicationId] ASC,
	[LoweredUserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_WebEvent_Events]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_WebEvent_Events](
	[EventId] [char](32) NOT NULL,
	[EventTimeUtc] [datetime] NOT NULL,
	[EventTime] [datetime] NOT NULL,
	[EventType] [nvarchar](256) NOT NULL,
	[EventSequence] [decimal](19, 0) NOT NULL,
	[EventOccurrence] [decimal](19, 0) NOT NULL,
	[EventCode] [int] NOT NULL,
	[EventDetailCode] [int] NOT NULL,
	[Message] [nvarchar](1024) NULL,
	[ApplicationPath] [nvarchar](256) NULL,
	[ApplicationVirtualPath] [nvarchar](256) NULL,
	[MachineName] [nvarchar](256) NOT NULL,
	[RequestUrl] [nvarchar](1024) NULL,
	[ExceptionType] [nvarchar](256) NULL,
	[Details] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LIVE_Activity]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LIVE_Activity](
	[ActivityId] [int] NOT NULL,
	[Activity] [varchar](50) NULL,
 CONSTRAINT [PK_LIVE_Activity] PRIMARY KEY CLUSTERED 
(
	[ActivityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LIVE_Benef]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LIVE_Benef](
	[BenefId] [varchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[FName] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
	[Village] [nvarchar](50) NULL,
	[Gender] [int] NULL,
	[MaritualS] [nvarchar](50) NULL,
	[DistrictId] [int] NULL,
	[UserId] [uniqueidentifier] NULL,
	[Date] [nvarchar](50) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[UpdationDate] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LIVE_BenefActivityD]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LIVE_BenefActivityD](
	[BenefId] [varchar](50) NULL,
	[F_S] [nvarchar](50) NULL,
	[Sec_S] [nvarchar](50) NULL,
	[Inc_Source] [nvarchar](50) NULL,
	[S_ActivityId] [int] NULL,
	[IPId] [int] NULL,
	[NoOfPkg] [float] NULL,
	[Year] [int] NULL,
	[Sub_Sub_Act_Type] [varchar](50) NULL,
	[UserId] [uniqueidentifier] NULL,
	[Date] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LIVE_BenefActivityFCD]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LIVE_BenefActivityFCD](
	[BenefId] [varchar](50) NULL,
	[S_ActivityId] [int] NULL,
	[Year] [int] NULL,
	[FcAmount] [float] NULL,
	[PkgAmount] [float] NULL,
	[Percentage] [float] NULL,
	[OfficerId] [varchar](50) NULL,
	[UserId] [uniqueidentifier] NULL,
	[Date] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LIVE_Bruc_VFUs]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LIVE_Bruc_VFUs](
	[VFUId] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[FName] [nvarchar](50) NULL,
	[Year] [int] NULL,
	[DistrictId] [int] NULL,
	[UserId] [uniqueidentifier] NULL,
	[Date] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LIVE_DeletedBenefActivityD]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LIVE_DeletedBenefActivityD](
	[BenefId] [varchar](50) NULL,
	[F_S] [nvarchar](50) NULL,
	[Sec_S] [nvarchar](50) NULL,
	[Inc_Source] [nvarchar](50) NULL,
	[S_ActivityId] [int] NULL,
	[IPId] [int] NULL,
	[NoOfPkg] [float] NULL,
	[Year] [int] NULL,
	[Sub_Sub_Act_Type] [varchar](50) NULL,
	[UserId] [uniqueidentifier] NULL,
	[Date] [nvarchar](50) NULL,
	[DeletedBy] [uniqueidentifier] NULL,
	[DDate] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LIVE_DeletedBenefActivityFCD]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LIVE_DeletedBenefActivityFCD](
	[BenefId] [varchar](50) NULL,
	[S_ActivityId] [int] NULL,
	[Year] [int] NULL,
	[FcAmount] [float] NULL,
	[PkgAmount] [float] NULL,
	[Percentage] [float] NULL,
	[OfficerId] [varchar](50) NULL,
	[UserId] [uniqueidentifier] NULL,
	[Date] [nvarchar](50) NULL,
	[DeletedBy] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LIVE_InputsPackage]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LIVE_InputsPackage](
	[PackagId] [int] NULL,
	[Package] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LIVE_IP]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LIVE_IP](
	[Id] [int] NOT NULL,
	[IP] [nvarchar](50) NULL,
	[Remarks] [nvarchar](500) NULL,
	[InsertedDate] [nvarchar](50) NULL,
	[UserId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_LIVE_IP] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LIVE_IPProvinceD]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LIVE_IPProvinceD](
	[IPId] [int] NULL,
	[SubActivityId] [int] NULL,
	[ProvinceId] [int] NULL,
	[Year] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LIVE_Members]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LIVE_Members](
	[VfuId] [varchar](50) NULL,
	[BenefId] [varchar](50) NULL,
	[PositionId] [int] NULL,
	[Year] [int] NULL,
	[Remarks] [nvarchar](200) NULL,
	[UserId] [uniqueidentifier] NULL,
	[Date] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LIVE_MembersPosition]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LIVE_MembersPosition](
	[PositionId] [int] NULL,
	[Position] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LIVE_Officer]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LIVE_Officer](
	[OfficerId] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[FName] [nvarchar](50) NULL,
	[Gender] [int] NULL,
	[RegionId] [int] NULL,
	[Email] [nvarchar](50) NULL,
	[ContactNo] [nvarchar](50) NULL,
	[UserId] [uniqueidentifier] NULL,
	[Date] [nvarchar](50) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[UpdationDate] [nvarchar](50) NULL,
	[Enabled] [bit] NULL,
 CONSTRAINT [PK_LIVE_Officer] PRIMARY KEY CLUSTERED 
(
	[OfficerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LIVE_Sub_Activity]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LIVE_Sub_Activity](
	[S_ActivityId] [int] NOT NULL,
	[Sub_Activity] [nvarchar](50) NULL,
	[ActivityId] [int] NULL,
 CONSTRAINT [PK_LIVE_Sub_Activity] PRIMARY KEY CLUSTERED 
(
	[S_ActivityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LIVE_VFUs]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LIVE_VFUs](
	[VfuId] [varchar](50) NOT NULL,
	[BenefId] [varchar](50) NOT NULL,
	[Bank] [nvarchar](50) NULL,
	[ContractStartDate] [nvarchar](50) NULL,
	[ContractEndDate] [nvarchar](50) NULL,
	[VfuType] [varchar](50) NULL,
	[VfuLevel] [int] NULL,
	[Vfu_Head] [varchar](50) NULL,
	[UserId] [uniqueidentifier] NULL,
	[Date] [nvarchar](50) NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[UpdationDate] [nvarchar](50) NULL,
 CONSTRAINT [PK_LIVE_VFUs] PRIMARY KEY CLUSTERED 
(
	[VfuId] ASC,
	[BenefId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LIVE_VFUsContracts]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LIVE_VFUsContracts](
	[VfuId] [varchar](50) NULL,
	[ContractStartDate] [nvarchar](50) NULL,
	[ContractEndDate] [nvarchar](50) NULL,
	[Number] [int] NULL,
	[Date] [nvarchar](50) NULL,
	[UserId] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LVIE_Bru_Vaccination]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LVIE_Bru_Vaccination](
	[VFUId] [varchar](50) NULL,
	[Village] [nvarchar](50) NULL,
	[Kochi] [bit] NULL,
	[OName] [nvarchar](50) NULL,
	[Mob] [nvarchar](50) NULL,
	[Vdate] [nvarchar](50) NULL,
	[Sheep] [float] NULL,
	[Goat] [float] NULL,
	[Cattle] [float] NULL,
	[UserId] [nvarchar](50) NULL,
	[Date] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LVIE_Inputs]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LVIE_Inputs](
	[BenefId] [varchar](50) NULL,
	[Year] [int] NULL,
	[PackagId] [int] NULL,
	[UserId] [uniqueidentifier] NULL,
	[Date] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OCM_District]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OCM_District](
	[DistrictID] [int] NOT NULL,
	[DistrictName] [nvarchar](30) NULL,
	[ProvinceID] [int] NULL,
	[DistrictEngName] [nvarchar](30) NULL,
	[DistrictType] [nvarchar](50) NULL,
	[DistrictTypeID] [int] NULL,
	[UrbanID] [int] NULL,
	[Head] [nvarchar](100) NULL,
	[Mobile] [nvarchar](50) NULL,
	[DistrictIDNew] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OCM_Province]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OCM_Province](
	[ProvinceID] [int] NOT NULL,
	[ProvinceName] [nvarchar](30) NULL,
	[ProvinceEngName] [nvarchar](30) NULL,
	[Head] [nvarchar](100) NULL,
	[HeadMobile] [nvarchar](50) NULL,
	[Plan] [nvarchar](100) NULL,
	[PlanMobile] [nvarchar](50) NULL,
	[provinceIDnew] [int] NULL,
	[Region] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OCM_Region]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OCM_Region](
	[id] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[userID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_aspnet_Applications]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Applications]
  AS SELECT [dbo].[aspnet_Applications].[ApplicationName], [dbo].[aspnet_Applications].[LoweredApplicationName], [dbo].[aspnet_Applications].[ApplicationId], [dbo].[aspnet_Applications].[Description]
  FROM [dbo].[aspnet_Applications]
  
GO
/****** Object:  View [dbo].[vw_aspnet_MembershipUsers]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_MembershipUsers]
  AS SELECT [dbo].[aspnet_Membership].[UserId],
            [dbo].[aspnet_Membership].[PasswordFormat],
            [dbo].[aspnet_Membership].[MobilePIN],
            [dbo].[aspnet_Membership].[Email],
            [dbo].[aspnet_Membership].[LoweredEmail],
            [dbo].[aspnet_Membership].[PasswordQuestion],
            [dbo].[aspnet_Membership].[PasswordAnswer],
            [dbo].[aspnet_Membership].[IsApproved],
            [dbo].[aspnet_Membership].[IsLockedOut],
            [dbo].[aspnet_Membership].[CreateDate],
            [dbo].[aspnet_Membership].[LastLoginDate],
            [dbo].[aspnet_Membership].[LastPasswordChangedDate],
            [dbo].[aspnet_Membership].[LastLockoutDate],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptWindowStart],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptWindowStart],
            [dbo].[aspnet_Membership].[Comment],
            [dbo].[aspnet_Users].[ApplicationId],
            [dbo].[aspnet_Users].[UserName],
            [dbo].[aspnet_Users].[MobileAlias],
            [dbo].[aspnet_Users].[IsAnonymous],
            [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Membership] INNER JOIN [dbo].[aspnet_Users]
      ON [dbo].[aspnet_Membership].[UserId] = [dbo].[aspnet_Users].[UserId]
  
GO
/****** Object:  View [dbo].[vw_aspnet_Profiles]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Profiles]
  AS SELECT [dbo].[aspnet_Profile].[UserId], [dbo].[aspnet_Profile].[LastUpdatedDate],
      [DataSize]=  DATALENGTH([dbo].[aspnet_Profile].[PropertyNames])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesString])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesBinary])
  FROM [dbo].[aspnet_Profile]
  
GO
/****** Object:  View [dbo].[vw_aspnet_Roles]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Roles]
  AS SELECT [dbo].[aspnet_Roles].[ApplicationId], [dbo].[aspnet_Roles].[RoleId], [dbo].[aspnet_Roles].[RoleName], [dbo].[aspnet_Roles].[LoweredRoleName], [dbo].[aspnet_Roles].[Description]
  FROM [dbo].[aspnet_Roles]
  
GO
/****** Object:  View [dbo].[vw_aspnet_Users]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Users]
  AS SELECT [dbo].[aspnet_Users].[ApplicationId], [dbo].[aspnet_Users].[UserId], [dbo].[aspnet_Users].[UserName], [dbo].[aspnet_Users].[LoweredUserName], [dbo].[aspnet_Users].[MobileAlias], [dbo].[aspnet_Users].[IsAnonymous], [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Users]
  
GO
/****** Object:  View [dbo].[vw_aspnet_UsersInRoles]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_UsersInRoles]
  AS SELECT [dbo].[aspnet_UsersInRoles].[UserId], [dbo].[aspnet_UsersInRoles].[RoleId]
  FROM [dbo].[aspnet_UsersInRoles]
  
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Paths]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_WebPartState_Paths]
  AS SELECT [dbo].[aspnet_Paths].[ApplicationId], [dbo].[aspnet_Paths].[PathId], [dbo].[aspnet_Paths].[Path], [dbo].[aspnet_Paths].[LoweredPath]
  FROM [dbo].[aspnet_Paths]
  
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Shared]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_WebPartState_Shared]
  AS SELECT [dbo].[aspnet_PersonalizationAllUsers].[PathId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationAllUsers].[PageSettings]), [dbo].[aspnet_PersonalizationAllUsers].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationAllUsers]
  
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_User]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_WebPartState_User]
  AS SELECT [dbo].[aspnet_PersonalizationPerUser].[PathId], [dbo].[aspnet_PersonalizationPerUser].[UserId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationPerUser].[PageSettings]), [dbo].[aspnet_PersonalizationPerUser].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationPerUser]
  
GO
/****** Object:  Index [aspnet_PersonalizationPerUser_ncindex2]    Script Date: 6/24/2022 10:41:07 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [aspnet_PersonalizationPerUser_ncindex2] ON [dbo].[aspnet_PersonalizationPerUser]
(
	[UserId] ASC,
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aspnet_Users_Index2]    Script Date: 6/24/2022 10:41:07 PM ******/
CREATE NONCLUSTERED INDEX [aspnet_Users_Index2] ON [dbo].[aspnet_Users]
(
	[ApplicationId] ASC,
	[LastActivityDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aspnet_UsersInRoles_index]    Script Date: 6/24/2022 10:41:07 PM ******/
CREATE NONCLUSTERED INDEX [aspnet_UsersInRoles_index] ON [dbo].[aspnet_UsersInRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[aspnet_Applications] ADD  DEFAULT (newid()) FOR [ApplicationId]
GO
ALTER TABLE [dbo].[aspnet_Membership] ADD  DEFAULT ((0)) FOR [PasswordFormat]
GO
ALTER TABLE [dbo].[aspnet_Paths] ADD  DEFAULT (newid()) FOR [PathId]
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[aspnet_Roles] ADD  DEFAULT (newid()) FOR [RoleId]
GO
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (newid()) FOR [UserId]
GO
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (NULL) FOR [MobileAlias]
GO
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT ((0)) FOR [IsAnonymous]
GO
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Paths]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Profile]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Roles]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Users]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  StoredProcedure [dbo].[aspnet_AnyDataInTables]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_AnyDataInTables]
    @TablesToCheck int
AS
BEGIN
    -- Check Membership table if (@TablesToCheck & 1) is set
    IF ((@TablesToCheck & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Membership))
        BEGIN
            SELECT N'aspnet_Membership'
            RETURN
        END
    END

    -- Check aspnet_Roles table if (@TablesToCheck & 2) is set
    IF ((@TablesToCheck & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Roles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 RoleId FROM dbo.aspnet_Roles))
        BEGIN
            SELECT N'aspnet_Roles'
            RETURN
        END
    END

    -- Check aspnet_Profile table if (@TablesToCheck & 4) is set
    IF ((@TablesToCheck & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Profile))
        BEGIN
            SELECT N'aspnet_Profile'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 8) is set
    IF ((@TablesToCheck & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_PersonalizationPerUser))
        BEGIN
            SELECT N'aspnet_PersonalizationPerUser'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 16) is set
    IF ((@TablesToCheck & 16) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'aspnet_WebEvent_LogEvent') AND (type = 'P'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 * FROM dbo.aspnet_WebEvent_Events))
        BEGIN
            SELECT N'aspnet_WebEvent_Events'
            RETURN
        END
    END

    -- Check aspnet_Users table if (@TablesToCheck & 1,2,4 & 8) are all set
    IF ((@TablesToCheck & 1) <> 0 AND
        (@TablesToCheck & 2) <> 0 AND
        (@TablesToCheck & 4) <> 0 AND
        (@TablesToCheck & 8) <> 0 AND
        (@TablesToCheck & 32) <> 0 AND
        (@TablesToCheck & 128) <> 0 AND
        (@TablesToCheck & 256) <> 0 AND
        (@TablesToCheck & 512) <> 0 AND
        (@TablesToCheck & 1024) <> 0)
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Users))
        BEGIN
            SELECT N'aspnet_Users'
            RETURN
        END
        IF (EXISTS(SELECT TOP 1 ApplicationId FROM dbo.aspnet_Applications))
        BEGIN
            SELECT N'aspnet_Applications'
            RETURN
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Applications_CreateApplication]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Applications_CreateApplication]
    @ApplicationName      nvarchar(256),
    @ApplicationId        uniqueidentifier OUTPUT
AS
BEGIN
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName

    IF(@ApplicationId IS NULL)
    BEGIN
        DECLARE @TranStarted   bit
        SET @TranStarted = 0

        IF( @@TRANCOUNT = 0 )
        BEGIN
	        BEGIN TRANSACTION
	        SET @TranStarted = 1
        END
        ELSE
    	    SET @TranStarted = 0

        SELECT  @ApplicationId = ApplicationId
        FROM dbo.aspnet_Applications WITH (UPDLOCK, HOLDLOCK)
        WHERE LOWER(@ApplicationName) = LoweredApplicationName

        IF(@ApplicationId IS NULL)
        BEGIN
            SELECT  @ApplicationId = NEWID()
            INSERT  dbo.aspnet_Applications (ApplicationId, ApplicationName, LoweredApplicationName)
            VALUES  (@ApplicationId, @ApplicationName, LOWER(@ApplicationName))
        END


        IF( @TranStarted = 1 )
        BEGIN
            IF(@@ERROR = 0)
            BEGIN
	        SET @TranStarted = 0
	        COMMIT TRANSACTION
            END
            ELSE
            BEGIN
                SET @TranStarted = 0
                ROLLBACK TRANSACTION
            END
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_CheckSchemaVersion]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_CheckSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    IF (EXISTS( SELECT  *
                FROM    dbo.aspnet_SchemaVersions
                WHERE   Feature = LOWER( @Feature ) AND
                        CompatibleSchemaVersion = @CompatibleSchemaVersion ))
        RETURN 0

    RETURN 1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]
    @ApplicationName       nvarchar(256),
    @UserName              nvarchar(256),
    @NewPasswordQuestion   nvarchar(256),
    @NewPasswordAnswer     nvarchar(128)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Membership m, dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId
    IF (@UserId IS NULL)
    BEGIN
        RETURN(1)
    END

    UPDATE dbo.aspnet_Membership
    SET    PasswordQuestion = @NewPasswordQuestion, PasswordAnswer = @NewPasswordAnswer
    WHERE  UserId=@UserId
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_CreateUser]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_CreateUser]
    @ApplicationName                        nvarchar(256),
    @UserName                               nvarchar(256),
    @Password                               nvarchar(128),
    @PasswordSalt                           nvarchar(128),
    @Email                                  nvarchar(256),
    @PasswordQuestion                       nvarchar(256),
    @PasswordAnswer                         nvarchar(128),
    @IsApproved                             bit,
    @CurrentTimeUtc                         datetime,
    @CreateDate                             datetime = NULL,
    @UniqueEmail                            int      = 0,
    @PasswordFormat                         int      = 0,
    @UserId                                 uniqueidentifier OUTPUT
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @NewUserId uniqueidentifier
    SELECT @NewUserId = NULL

    DECLARE @IsLockedOut bit
    SET @IsLockedOut = 0

    DECLARE @LastLockoutDate  datetime
    SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAttemptCount int
    SET @FailedPasswordAttemptCount = 0

    DECLARE @FailedPasswordAttemptWindowStart  datetime
    SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAnswerAttemptCount int
    SET @FailedPasswordAnswerAttemptCount = 0

    DECLARE @FailedPasswordAnswerAttemptWindowStart  datetime
    SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @NewUserCreated bit
    DECLARE @ReturnValue   int
    SET @ReturnValue = 0

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    SET @CreateDate = @CurrentTimeUtc

    SELECT  @NewUserId = UserId FROM dbo.aspnet_Users WHERE LOWER(@UserName) = LoweredUserName AND @ApplicationId = ApplicationId
    IF ( @NewUserId IS NULL )
    BEGIN
        SET @NewUserId = @UserId
        EXEC @ReturnValue = dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CreateDate, @NewUserId OUTPUT
        SET @NewUserCreated = 1
    END
    ELSE
    BEGIN
        SET @NewUserCreated = 0
        IF( @NewUserId <> @UserId AND @UserId IS NOT NULL )
        BEGIN
            SET @ErrorCode = 6
            GOTO Cleanup
        END
    END

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @ReturnValue = -1 )
    BEGIN
        SET @ErrorCode = 10
        GOTO Cleanup
    END

    IF ( EXISTS ( SELECT UserId
                  FROM   dbo.aspnet_Membership
                  WHERE  @NewUserId = UserId ) )
    BEGIN
        SET @ErrorCode = 6
        GOTO Cleanup
    END

    SET @UserId = @NewUserId

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership m WITH ( UPDLOCK, HOLDLOCK )
                    WHERE ApplicationId = @ApplicationId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            SET @ErrorCode = 7
            GOTO Cleanup
        END
    END

    IF (@NewUserCreated = 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate = @CreateDate
        WHERE  @UserId = UserId
        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    INSERT INTO dbo.aspnet_Membership
                ( ApplicationId,
                  UserId,
                  Password,
                  PasswordSalt,
                  Email,
                  LoweredEmail,
                  PasswordQuestion,
                  PasswordAnswer,
                  PasswordFormat,
                  IsApproved,
                  IsLockedOut,
                  CreateDate,
                  LastLoginDate,
                  LastPasswordChangedDate,
                  LastLockoutDate,
                  FailedPasswordAttemptCount,
                  FailedPasswordAttemptWindowStart,
                  FailedPasswordAnswerAttemptCount,
                  FailedPasswordAnswerAttemptWindowStart )
         VALUES ( @ApplicationId,
                  @UserId,
                  @Password,
                  @PasswordSalt,
                  @Email,
                  LOWER(@Email),
                  @PasswordQuestion,
                  @PasswordAnswer,
                  @PasswordFormat,
                  @IsApproved,
                  @IsLockedOut,
                  @CreateDate,
                  @CreateDate,
                  @CreateDate,
                  @LastLockoutDate,
                  @FailedPasswordAttemptCount,
                  @FailedPasswordAttemptWindowStart,
                  @FailedPasswordAnswerAttemptCount,
                  @FailedPasswordAnswerAttemptWindowStart )

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByEmail]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByEmail]
    @ApplicationName       nvarchar(256),
    @EmailToMatch          nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    IF( @EmailToMatch IS NULL )
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.Email IS NULL
            ORDER BY m.LoweredEmail
    ELSE
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.LoweredEmail LIKE LOWER(@EmailToMatch)
            ORDER BY m.LoweredEmail

    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY m.LoweredEmail

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByName]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByName]
    @ApplicationName       nvarchar(256),
    @UserNameToMatch       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT u.UserId
        FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND u.LoweredUserName LIKE LOWER(@UserNameToMatch)
        ORDER BY u.UserName


    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetAllUsers]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetAllUsers]
    @ApplicationName       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0


    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
    SELECT u.UserId
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u
    WHERE  u.ApplicationId = @ApplicationId AND u.UserId = m.UserId
    ORDER BY u.UserName

    SELECT @TotalRecords = @@ROWCOUNT

    SELECT u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetNumberOfUsersOnline]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetNumberOfUsersOnline]
    @ApplicationName            nvarchar(256),
    @MinutesSinceLastInActive   int,
    @CurrentTimeUtc             datetime
AS
BEGIN
    DECLARE @DateActive datetime
    SELECT  @DateActive = DATEADD(minute,  -(@MinutesSinceLastInActive), @CurrentTimeUtc)

    DECLARE @NumOnline int
    SELECT  @NumOnline = COUNT(*)
    FROM    dbo.aspnet_Users u(NOLOCK),
            dbo.aspnet_Applications a(NOLOCK),
            dbo.aspnet_Membership m(NOLOCK)
    WHERE   u.ApplicationId = a.ApplicationId                  AND
            LastActivityDate > @DateActive                     AND
            a.LoweredApplicationName = LOWER(@ApplicationName) AND
            u.UserId = m.UserId
    RETURN(@NumOnline)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPassword]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPassword]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @PasswordAnswer                 nvarchar(128) = NULL
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @PasswordFormat                         int
    DECLARE @Password                               nvarchar(128)
    DECLARE @passAns                                nvarchar(128)
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @Password = m.Password,
            @passAns = m.PasswordAnswer,
            @PasswordFormat = m.PasswordFormat,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    IF ( NOT( @PasswordAnswer IS NULL ) )
    BEGIN
        IF( ( @passAns IS NULL ) OR ( LOWER( @passAns ) <> LOWER( @PasswordAnswer ) ) )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
        ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    IF( @ErrorCode = 0 )
        SELECT @Password, @PasswordFormat

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPasswordWithFormat]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPasswordWithFormat]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @UpdateLastLoginActivityDate    bit,
    @CurrentTimeUtc                 datetime
AS
BEGIN
    DECLARE @IsLockedOut                        bit
    DECLARE @UserId                             uniqueidentifier
    DECLARE @Password                           nvarchar(128)
    DECLARE @PasswordSalt                       nvarchar(128)
    DECLARE @PasswordFormat                     int
    DECLARE @FailedPasswordAttemptCount         int
    DECLARE @FailedPasswordAnswerAttemptCount   int
    DECLARE @IsApproved                         bit
    DECLARE @LastActivityDate                   datetime
    DECLARE @LastLoginDate                      datetime

    SELECT  @UserId          = NULL

    SELECT  @UserId = u.UserId, @IsLockedOut = m.IsLockedOut, @Password=Password, @PasswordFormat=PasswordFormat,
            @PasswordSalt=PasswordSalt, @FailedPasswordAttemptCount=FailedPasswordAttemptCount,
		    @FailedPasswordAnswerAttemptCount=FailedPasswordAnswerAttemptCount, @IsApproved=IsApproved,
            @LastActivityDate = LastActivityDate, @LastLoginDate = LastLoginDate
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF (@UserId IS NULL)
        RETURN 1

    IF (@IsLockedOut = 1)
        RETURN 99

    SELECT   @Password, @PasswordFormat, @PasswordSalt, @FailedPasswordAttemptCount,
             @FailedPasswordAnswerAttemptCount, @IsApproved, @LastLoginDate, @LastActivityDate

    IF (@UpdateLastLoginActivityDate = 1 AND @IsApproved = 1)
    BEGIN
        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @CurrentTimeUtc
        WHERE   UserId = @UserId

        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @CurrentTimeUtc
        WHERE   @UserId = UserId
    END


    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByEmail]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByEmail]
    @ApplicationName  nvarchar(256),
    @Email            nvarchar(256)
AS
BEGIN
    IF( @Email IS NULL )
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                m.ApplicationId = a.ApplicationId AND
                m.LoweredEmail IS NULL
    ELSE
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                m.ApplicationId = a.ApplicationId AND
                LOWER(@Email) = m.LoweredEmail

    IF (@@rowcount = 0)
        RETURN(1)
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByName]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByName]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier

    IF (@UpdateLastActivity = 1)
    BEGIN
        -- select user ID from aspnet_users table
        SELECT TOP 1 @UserId = u.UserId
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1

        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        WHERE    @UserId = UserId

        SELECT m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut, m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  @UserId = u.UserId AND u.UserId = m.UserId 
    END
    ELSE
    BEGIN
        SELECT TOP 1 m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut,m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1
    END

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByUserId]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByUserId]
    @UserId               uniqueidentifier,
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    IF ( @UpdateLastActivity = 1 )
    BEGIN
        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        FROM     dbo.aspnet_Users
        WHERE    @UserId = UserId

        IF ( @@ROWCOUNT = 0 ) -- User ID not found
            RETURN -1
    END

    SELECT  m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate, m.LastLoginDate, u.LastActivityDate,
            m.LastPasswordChangedDate, u.UserName, m.IsLockedOut,
            m.LastLockoutDate
    FROM    dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   @UserId = u.UserId AND u.UserId = m.UserId

    IF ( @@ROWCOUNT = 0 ) -- User ID not found
       RETURN -1

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ResetPassword]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ResetPassword]
    @ApplicationName             nvarchar(256),
    @UserName                    nvarchar(256),
    @NewPassword                 nvarchar(128),
    @MaxInvalidPasswordAttempts  int,
    @PasswordAttemptWindow       int,
    @PasswordSalt                nvarchar(128),
    @CurrentTimeUtc              datetime,
    @PasswordFormat              int = 0,
    @PasswordAnswer              nvarchar(128) = NULL
AS
BEGIN
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @UserId                                 uniqueidentifier
    SET     @UserId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    SELECT @IsLockedOut = IsLockedOut,
           @LastLockoutDate = LastLockoutDate,
           @FailedPasswordAttemptCount = FailedPasswordAttemptCount,
           @FailedPasswordAttemptWindowStart = FailedPasswordAttemptWindowStart,
           @FailedPasswordAnswerAttemptCount = FailedPasswordAnswerAttemptCount,
           @FailedPasswordAnswerAttemptWindowStart = FailedPasswordAnswerAttemptWindowStart
    FROM dbo.aspnet_Membership WITH ( UPDLOCK )
    WHERE @UserId = UserId

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Membership
    SET    Password = @NewPassword,
           LastPasswordChangedDate = @CurrentTimeUtc,
           PasswordFormat = @PasswordFormat,
           PasswordSalt = @PasswordSalt
    WHERE  @UserId = UserId AND
           ( ( @PasswordAnswer IS NULL ) OR ( LOWER( PasswordAnswer ) = LOWER( @PasswordAnswer ) ) )

    IF ( @@ROWCOUNT = 0 )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
    ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

    IF( NOT ( @PasswordAnswer IS NULL ) )
    BEGIN
        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_SetPassword]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_SetPassword]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @NewPassword      nvarchar(128),
    @PasswordSalt     nvarchar(128),
    @CurrentTimeUtc   datetime,
    @PasswordFormat   int = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    UPDATE dbo.aspnet_Membership
    SET Password = @NewPassword, PasswordFormat = @PasswordFormat, PasswordSalt = @PasswordSalt,
        LastPasswordChangedDate = @CurrentTimeUtc
    WHERE @UserId = UserId
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UnlockUser]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UnlockUser]
    @ApplicationName                         nvarchar(256),
    @UserName                                nvarchar(256)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
        RETURN 1

    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = 0,
        FailedPasswordAttemptCount = 0,
        FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        FailedPasswordAnswerAttemptCount = 0,
        FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        LastLockoutDate = CONVERT( datetime, '17540101', 112 )
    WHERE @UserId = UserId

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUser]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUser]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @Email                nvarchar(256),
    @Comment              ntext,
    @IsApproved           bit,
    @LastLoginDate        datetime,
    @LastActivityDate     datetime,
    @UniqueEmail          int,
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId, @ApplicationId = a.ApplicationId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership WITH (UPDLOCK, HOLDLOCK)
                    WHERE ApplicationId = @ApplicationId  AND @UserId <> UserId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            RETURN(7)
        END
    END

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    UPDATE dbo.aspnet_Users WITH (ROWLOCK)
    SET
         LastActivityDate = @LastActivityDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    UPDATE dbo.aspnet_Membership WITH (ROWLOCK)
    SET
         Email            = @Email,
         LoweredEmail     = LOWER(@Email),
         Comment          = @Comment,
         IsApproved       = @IsApproved,
         LastLoginDate    = @LastLoginDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN -1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUserInfo]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUserInfo]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @IsPasswordCorrect              bit,
    @UpdateLastLoginActivityDate    bit,
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @LastLoginDate                  datetime,
    @LastActivityDate               datetime
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @IsApproved                             bit
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @IsApproved = m.IsApproved,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u WITH ( UPDLOCK, ROWLOCK ), dbo.aspnet_Membership m WITH ( UPDLOCK, ROWLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        GOTO Cleanup
    END

    IF( @IsPasswordCorrect = 0 )
    BEGIN
        IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAttemptWindowStart ) )
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = 1
        END
        ELSE
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = @FailedPasswordAttemptCount + 1
        END

        BEGIN
            IF( @FailedPasswordAttemptCount >= @MaxInvalidPasswordAttempts )
            BEGIN
                SET @IsLockedOut = 1
                SET @LastLockoutDate = @CurrentTimeUtc
            END
        END
    END
    ELSE
    BEGIN
        IF( @FailedPasswordAttemptCount > 0 OR @FailedPasswordAnswerAttemptCount > 0 )
        BEGIN
            SET @FailedPasswordAttemptCount = 0
            SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @FailedPasswordAnswerAttemptCount = 0
            SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )
        END
    END

    IF( @UpdateLastLoginActivityDate = 1 )
    BEGIN
        UPDATE  dbo.aspnet_Users WITH (ROWLOCK)
        SET     LastActivityDate = @LastActivityDate
        WHERE   @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END

        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @LastLoginDate
        WHERE   UserId = @UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END


    UPDATE dbo.aspnet_Membership WITH (ROWLOCK)
    SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
        FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
        FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
        FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
        FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
    WHERE @UserId = UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Paths_CreatePath]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Paths_CreatePath]
    @ApplicationId UNIQUEIDENTIFIER,
    @Path           NVARCHAR(256),
    @PathId         UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
    BEGIN TRANSACTION
    IF (NOT EXISTS(SELECT * FROM dbo.aspnet_Paths WHERE LoweredPath = LOWER(@Path) AND ApplicationId = @ApplicationId))
    BEGIN
        INSERT dbo.aspnet_Paths (ApplicationId, Path, LoweredPath) VALUES (@ApplicationId, @Path, LOWER(@Path))
    END
    COMMIT TRANSACTION
    SELECT @PathId = PathId FROM dbo.aspnet_Paths WHERE LOWER(@Path) = LoweredPath AND ApplicationId = @ApplicationId
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Personalization_GetApplicationId]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Personalization_GetApplicationId] (
    @ApplicationName NVARCHAR(256),
    @ApplicationId UNIQUEIDENTIFIER OUT)
AS
BEGIN
    SELECT @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_DeleteAllState]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_DeleteAllState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Count int OUT)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        IF (@AllUsersScope = 1)
            DELETE FROM aspnet_PersonalizationAllUsers
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)
        ELSE
            DELETE FROM aspnet_PersonalizationPerUser
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_FindState]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_FindState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @PageIndex              INT,
    @PageSize               INT,
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound INT
    DECLARE @PageUpperBound INT
    DECLARE @TotalRecords   INT
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table to store the selected results
    CREATE TABLE #PageIndex (
        IndexId int IDENTITY (0, 1) NOT NULL,
        ItemId UNIQUEIDENTIFIER
    )

    IF (@AllUsersScope = 1)
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT Paths.PathId
        FROM dbo.aspnet_Paths Paths,
             ((SELECT Paths.PathId
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND AllUsers.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT DISTINCT Paths.PathId
               FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND PerUser.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path,
               SharedDataPerPath.LastUpdatedDate,
               SharedDataPerPath.SharedDataLength,
               UserDataPerPath.UserDataLength,
               UserDataPerPath.UserCount
        FROM dbo.aspnet_Paths Paths,
             ((SELECT PageIndex.ItemId AS PathId,
                      AllUsers.LastUpdatedDate AS LastUpdatedDate,
                      DATALENGTH(AllUsers.PageSettings) AS SharedDataLength
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, #PageIndex PageIndex
               WHERE AllUsers.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT PageIndex.ItemId AS PathId,
                      SUM(DATALENGTH(PerUser.PageSettings)) AS UserDataLength,
                      COUNT(*) AS UserCount
               FROM aspnet_PersonalizationPerUser PerUser, #PageIndex PageIndex
               WHERE PerUser.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
               GROUP BY PageIndex.ItemId
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC
    END
    ELSE
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT PerUser.Id
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
        WHERE Paths.ApplicationId = @ApplicationId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
              AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
        ORDER BY Paths.Path ASC, Users.UserName ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path, PerUser.LastUpdatedDate, DATALENGTH(PerUser.PageSettings), Users.UserName, Users.LastActivityDate
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths, #PageIndex PageIndex
        WHERE PerUser.Id = PageIndex.ItemId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
        ORDER BY Paths.Path ASC, Users.UserName ASC
    END

    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_GetCountOfState]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_GetCountOfState] (
    @Count int OUT,
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN

    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
        IF (@AllUsersScope = 1)
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND AllUsers.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
        ELSE
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND PerUser.UserId = Users.UserId
                  AND PerUser.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
                  AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
                  AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetSharedState]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetSharedState] (
    @Count int OUT,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationAllUsers
        WHERE PathId IN
            (SELECT AllUsers.PathId
             FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
             WHERE Paths.ApplicationId = @ApplicationId
                   AND AllUsers.PathId = Paths.PathId
                   AND Paths.LoweredPath = LOWER(@Path))

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetUserState]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetUserState] (
    @Count                  int                 OUT,
    @ApplicationName        NVARCHAR(256),
    @InactiveSinceDate      DATETIME            = NULL,
    @UserName               NVARCHAR(256)       = NULL,
    @Path                   NVARCHAR(256)       = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser
        WHERE Id IN (SELECT PerUser.Id
                     FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
                     WHERE Paths.ApplicationId = @ApplicationId
                           AND PerUser.UserId = Users.UserId
                           AND PerUser.PathId = Paths.PathId
                           AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
                           AND (@UserName IS NULL OR Users.LoweredUserName = LOWER(@UserName))
                           AND (@Path IS NULL OR Paths.LoweredPath = LOWER(@Path)))

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationAllUsers p WHERE p.PathId = @PathId
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    DELETE FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationAllUsers SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationAllUsers(PathId, PageSettings, LastUpdatedDate) VALUES (@PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_GetPageSettings]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationPerUser p WHERE p.PathId = @PathId AND p.UserId = @UserId
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE PathId = @PathId AND UserId = @UserId
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_SetPageSettings]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CurrentTimeUtc, @UserId OUTPUT
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationPerUser WHERE UserId = @UserId AND PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationPerUser SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE UserId = @UserId AND PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationPerUser(UserId, PathId, PageSettings, LastUpdatedDate) VALUES (@UserId, @PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteInactiveProfiles]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT  0
        RETURN
    END

    DELETE
    FROM    dbo.aspnet_Profile
    WHERE   UserId IN
            (   SELECT  UserId
                FROM    dbo.aspnet_Users u
                WHERE   ApplicationId = @ApplicationId
                        AND (LastActivityDate <= @InactiveSinceDate)
                        AND (
                                (@ProfileAuthOptions = 2)
                             OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                             OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                            )
            )

    SELECT  @@ROWCOUNT
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteProfiles]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteProfiles]
    @ApplicationName        nvarchar(256),
    @UserNames              nvarchar(4000)
AS
BEGIN
    DECLARE @UserName     nvarchar(256)
    DECLARE @CurrentPos   int
    DECLARE @NextPos      int
    DECLARE @NumDeleted   int
    DECLARE @DeletedUser  int
    DECLARE @TranStarted  bit
    DECLARE @ErrorCode    int

    SET @ErrorCode = 0
    SET @CurrentPos = 1
    SET @NumDeleted = 0
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    WHILE (@CurrentPos <= LEN(@UserNames))
    BEGIN
        SELECT @NextPos = CHARINDEX(N',', @UserNames,  @CurrentPos)
        IF (@NextPos = 0 OR @NextPos IS NULL)
            SELECT @NextPos = LEN(@UserNames) + 1

        SELECT @UserName = SUBSTRING(@UserNames, @CurrentPos, @NextPos - @CurrentPos)
        SELECT @CurrentPos = @NextPos+1

        IF (LEN(@UserName) > 0)
        BEGIN
            SELECT @DeletedUser = 0
            EXEC dbo.aspnet_Users_DeleteUser @ApplicationName, @UserName, 4, @DeletedUser OUTPUT
            IF( @@ERROR <> 0 )
            BEGIN
                SET @ErrorCode = -1
                GOTO Cleanup
            END
            IF (@DeletedUser <> 0)
                SELECT @NumDeleted = @NumDeleted + 1
        END
    END
    SELECT @NumDeleted
    IF (@TranStarted = 1)
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END
    SET @TranStarted = 0

    RETURN 0

Cleanup:
    IF (@TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END
    RETURN @ErrorCode
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT 0
        RETURN
    END

    SELECT  COUNT(*)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
    WHERE   ApplicationId = @ApplicationId
        AND u.UserId = p.UserId
        AND (LastActivityDate <= @InactiveSinceDate)
        AND (
                (@ProfileAuthOptions = 2)
                OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
            )
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProfiles]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_GetProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @PageIndex              int,
    @PageSize               int,
    @UserNameToMatch        nvarchar(256) = NULL,
    @InactiveSinceDate      datetime      = NULL
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT  u.UserId
        FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
        WHERE   ApplicationId = @ApplicationId
            AND u.UserId = p.UserId
            AND (@InactiveSinceDate IS NULL OR LastActivityDate <= @InactiveSinceDate)
            AND (     (@ProfileAuthOptions = 2)
                   OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                   OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                 )
            AND (@UserNameToMatch IS NULL OR LoweredUserName LIKE LOWER(@UserNameToMatch))
        ORDER BY UserName

    SELECT  u.UserName, u.IsAnonymous, u.LastActivityDate, p.LastUpdatedDate,
            DATALENGTH(p.PropertyNames) + DATALENGTH(p.PropertyValuesString) + DATALENGTH(p.PropertyValuesBinary)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p, #PageIndexForUsers i
    WHERE   u.UserId = p.UserId AND p.UserId = i.UserId AND i.IndexId >= @PageLowerBound AND i.IndexId <= @PageUpperBound

    SELECT COUNT(*)
    FROM   #PageIndexForUsers

    DROP TABLE #PageIndexForUsers
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProperties]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_GetProperties]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)

    IF (@UserId IS NULL)
        RETURN
    SELECT TOP 1 PropertyNames, PropertyValuesString, PropertyValuesBinary
    FROM         dbo.aspnet_Profile
    WHERE        UserId = @UserId

    IF (@@ROWCOUNT > 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_SetProperties]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_SetProperties]
    @ApplicationName        nvarchar(256),
    @PropertyNames          ntext,
    @PropertyValuesString   ntext,
    @PropertyValuesBinary   image,
    @UserName               nvarchar(256),
    @IsUserAnonymous        bit,
    @CurrentTimeUtc         datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
       BEGIN TRANSACTION
       SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DECLARE @UserId uniqueidentifier
    DECLARE @LastActivityDate datetime
    SELECT  @UserId = NULL
    SELECT  @LastActivityDate = @CurrentTimeUtc

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, @IsUserAnonymous, @LastActivityDate, @UserId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Users
    SET    LastActivityDate=@CurrentTimeUtc
    WHERE  UserId = @UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS( SELECT *
               FROM   dbo.aspnet_Profile
               WHERE  UserId = @UserId))
        UPDATE dbo.aspnet_Profile
        SET    PropertyNames=@PropertyNames, PropertyValuesString = @PropertyValuesString,
               PropertyValuesBinary = @PropertyValuesBinary, LastUpdatedDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    ELSE
        INSERT INTO dbo.aspnet_Profile(UserId, PropertyNames, PropertyValuesString, PropertyValuesBinary, LastUpdatedDate)
             VALUES (@UserId, @PropertyNames, @PropertyValuesString, @PropertyValuesBinary, @CurrentTimeUtc)

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_RegisterSchemaVersion]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_RegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128),
    @IsCurrentVersion          bit,
    @RemoveIncompatibleSchema  bit
AS
BEGIN
    IF( @RemoveIncompatibleSchema = 1 )
    BEGIN
        DELETE FROM dbo.aspnet_SchemaVersions WHERE Feature = LOWER( @Feature )
    END
    ELSE
    BEGIN
        IF( @IsCurrentVersion = 1 )
        BEGIN
            UPDATE dbo.aspnet_SchemaVersions
            SET IsCurrentVersion = 0
            WHERE Feature = LOWER( @Feature )
        END
    END

    INSERT  dbo.aspnet_SchemaVersions( Feature, CompatibleSchemaVersion, IsCurrentVersion )
    VALUES( LOWER( @Feature ), @CompatibleSchemaVersion, @IsCurrentVersion )
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_CreateRole]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_CreateRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS(SELECT RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId))
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    INSERT INTO dbo.aspnet_Roles
                (ApplicationId, RoleName, LoweredRoleName)
         VALUES (@ApplicationId, @RoleName, LOWER(@RoleName))

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_DeleteRole]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Roles_DeleteRole]
    @ApplicationName            nvarchar(256),
    @RoleName                   nvarchar(256),
    @DeleteOnlyIfRoleIsEmpty    bit
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    DECLARE @RoleId   uniqueidentifier
    SELECT  @RoleId = NULL
    SELECT  @RoleId = RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
    BEGIN
        SELECT @ErrorCode = 1
        GOTO Cleanup
    END
    IF (@DeleteOnlyIfRoleIsEmpty <> 0)
    BEGIN
        IF (EXISTS (SELECT RoleId FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId))
        BEGIN
            SELECT @ErrorCode = 2
            GOTO Cleanup
        END
    END


    DELETE FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DELETE FROM dbo.aspnet_Roles WHERE @RoleId = RoleId  AND ApplicationId = @ApplicationId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_GetAllRoles]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Roles_GetAllRoles] (
    @ApplicationName           nvarchar(256))
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN
    SELECT RoleName
    FROM   dbo.aspnet_Roles WHERE ApplicationId = @ApplicationId
    ORDER BY RoleName
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_RoleExists]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Roles_RoleExists]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(0)
    IF (EXISTS (SELECT RoleName FROM dbo.aspnet_Roles WHERE LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId ))
        RETURN(1)
    ELSE
        RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RemoveAllRoleMembers]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Setup_RemoveAllRoleMembers]
    @name   sysname
AS
BEGIN
    CREATE TABLE #aspnet_RoleMembers
    (
        Group_name      sysname,
        Group_id        smallint,
        Users_in_group  sysname,
        User_id         smallint
    )

    INSERT INTO #aspnet_RoleMembers
    EXEC sp_helpuser @name

    DECLARE @user_id smallint
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT User_id FROM #aspnet_RoleMembers

    OPEN c1

    FETCH c1 INTO @user_id
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = 'EXEC sp_droprolemember ' + '''' + @name + ''', ''' + USER_NAME(@user_id) + ''''
        EXEC (@cmd)
        FETCH c1 INTO @user_id
    END

    CLOSE c1
    DEALLOCATE c1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RestorePermissions]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Setup_RestorePermissions]
    @name   sysname
AS
BEGIN
    DECLARE @object sysname
    DECLARE @protectType char(10)
    DECLARE @action varchar(60)
    DECLARE @grantee sysname
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT Object, ProtectType, [Action], Grantee FROM #aspnet_Permissions where Object = @name

    OPEN c1

    FETCH c1 INTO @object, @protectType, @action, @grantee
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = @protectType + ' ' + @action + ' on ' + @object + ' TO [' + @grantee + ']'
        EXEC (@cmd)
        FETCH c1 INTO @object, @protectType, @action, @grantee
    END

    CLOSE c1
    DEALLOCATE c1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UnRegisterSchemaVersion]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UnRegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    DELETE FROM dbo.aspnet_SchemaVersions
        WHERE   Feature = LOWER(@Feature) AND @CompatibleSchemaVersion = CompatibleSchemaVersion
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_CreateUser]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Users_CreateUser]
    @ApplicationId    uniqueidentifier,
    @UserName         nvarchar(256),
    @IsUserAnonymous  bit,
    @LastActivityDate DATETIME,
    @UserId           uniqueidentifier OUTPUT
AS
BEGIN
    IF( @UserId IS NULL )
        SELECT @UserId = NEWID()
    ELSE
    BEGIN
        IF( EXISTS( SELECT UserId FROM dbo.aspnet_Users
                    WHERE @UserId = UserId ) )
            RETURN -1
    END

    INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
    VALUES (@ApplicationId, @UserId, @UserName, LOWER(@UserName), @IsUserAnonymous, @LastActivityDate)

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_DeleteUser]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Users_DeleteUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @TablesToDeleteFrom int,
    @NumTablesDeletedFrom int OUTPUT
AS
BEGIN
    DECLARE @UserId               uniqueidentifier
    SELECT  @UserId               = NULL
    SELECT  @NumTablesDeletedFrom = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    DECLARE @ErrorCode   int
    DECLARE @RowCount    int

    SET @ErrorCode = 0
    SET @RowCount  = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   u.LoweredUserName       = LOWER(@UserName)
        AND u.ApplicationId         = a.ApplicationId
        AND LOWER(@ApplicationName) = a.LoweredApplicationName

    IF (@UserId IS NULL)
    BEGIN
        GOTO Cleanup
    END

    -- Delete from Membership table if (@TablesToDeleteFrom & 1) is set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        DELETE FROM dbo.aspnet_Membership WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
               @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_UsersInRoles table if (@TablesToDeleteFrom & 2) is set
    IF ((@TablesToDeleteFrom & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_UsersInRoles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_UsersInRoles WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Profile table if (@TablesToDeleteFrom & 4) is set
    IF ((@TablesToDeleteFrom & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_Profile WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_PersonalizationPerUser table if (@TablesToDeleteFrom & 8) is set
    IF ((@TablesToDeleteFrom & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Users table if (@TablesToDeleteFrom & 1,2,4 & 8) are all set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (@TablesToDeleteFrom & 2) <> 0 AND
        (@TablesToDeleteFrom & 4) <> 0 AND
        (@TablesToDeleteFrom & 8) <> 0 AND
        (EXISTS (SELECT UserId FROM dbo.aspnet_Users WHERE @UserId = UserId)))
    BEGIN
        DELETE FROM dbo.aspnet_Users WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:
    SET @NumTablesDeletedFrom = 0

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
	    ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_AddUsersToRoles]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_AddUsersToRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000),
	@CurrentTimeUtc   datetime
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)
	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames	table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles	table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers	table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num		int
	DECLARE @Pos		int
	DECLARE @NextPos	int
	DECLARE @Name		nvarchar(256)

	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		SELECT TOP 1 Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END

	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1

	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		DELETE FROM @tbNames
		WHERE LOWER(Name) IN (SELECT LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE au.UserId = u.UserId)

		INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
		  SELECT @AppId, NEWID(), Name, LOWER(Name), 0, @CurrentTimeUtc
		  FROM   @tbNames

		INSERT INTO @tbUsers
		  SELECT  UserId
		  FROM	dbo.aspnet_Users au, @tbNames t
		  WHERE   LOWER(t.Name) = au.LoweredUserName AND au.ApplicationId = @AppId
	END

	IF (EXISTS (SELECT * FROM dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr WHERE tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId))
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr, aspnet_Users u, aspnet_Roles r
		WHERE		u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	INSERT INTO dbo.aspnet_UsersInRoles (UserId, RoleId)
	SELECT UserId, RoleId
	FROM @tbUsers, @tbRoles

	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_FindUsersInRole]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_FindUsersInRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256),
    @UserNameToMatch  nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId AND LoweredUserName LIKE LOWER(@UserNameToMatch)
    ORDER BY u.UserName
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetRolesForUser]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetRolesForUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(1)

    SELECT r.RoleName
    FROM   dbo.aspnet_Roles r, dbo.aspnet_UsersInRoles ur
    WHERE  r.RoleId = ur.RoleId AND r.ApplicationId = @ApplicationId AND ur.UserId = @UserId
    ORDER BY r.RoleName
    RETURN (0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetUsersInRoles]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetUsersInRoles]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId
    ORDER BY u.UserName
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_IsUserInRole]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_IsUserInRole]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(2)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    DECLARE @RoleId uniqueidentifier
    SELECT  @RoleId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(2)

    SELECT  @RoleId = RoleId
    FROM    dbo.aspnet_Roles
    WHERE   LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
        RETURN(3)

    IF (EXISTS( SELECT * FROM dbo.aspnet_UsersInRoles WHERE  UserId = @UserId AND RoleId = @RoleId))
        RETURN(1)
    ELSE
        RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000)
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)


	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames  table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles  table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers  table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num	  int
	DECLARE @Pos	  int
	DECLARE @NextPos  int
	DECLARE @Name	  nvarchar(256)
	DECLARE @CountAll int
	DECLARE @CountU	  int
	DECLARE @CountR	  int


	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId
	SELECT @CountR = @@ROWCOUNT

	IF (@CountR <> @Num)
	BEGIN
		SELECT TOP 1 N'', Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END


	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1


	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	SELECT @CountU = @@ROWCOUNT
	IF (@CountU <> @Num)
	BEGIN
		SELECT TOP 1 Name, N''
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT au.LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE u.UserId = au.UserId)

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(1)
	END

	SELECT  @CountAll = COUNT(*)
	FROM	dbo.aspnet_UsersInRoles ur, @tbUsers u, @tbRoles r
	WHERE   ur.UserId = u.UserId AND ur.RoleId = r.RoleId

	IF (@CountAll <> @CountU * @CountR)
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 @tbUsers tu, @tbRoles tr, dbo.aspnet_Users u, dbo.aspnet_Roles r
		WHERE		 u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND
					 tu.UserId NOT IN (SELECT ur.UserId FROM dbo.aspnet_UsersInRoles ur WHERE ur.RoleId = tr.RoleId) AND
					 tr.RoleId NOT IN (SELECT ur.RoleId FROM dbo.aspnet_UsersInRoles ur WHERE ur.UserId = tu.UserId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	DELETE FROM dbo.aspnet_UsersInRoles
	WHERE UserId IN (SELECT UserId FROM @tbUsers)
	  AND RoleId IN (SELECT RoleId FROM @tbRoles)
	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
GO
/****** Object:  StoredProcedure [dbo].[aspnet_WebEvent_LogEvent]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_WebEvent_LogEvent]
        @EventId         char(32),
        @EventTimeUtc    datetime,
        @EventTime       datetime,
        @EventType       nvarchar(256),
        @EventSequence   decimal(19,0),
        @EventOccurrence decimal(19,0),
        @EventCode       int,
        @EventDetailCode int,
        @Message         nvarchar(1024),
        @ApplicationPath nvarchar(256),
        @ApplicationVirtualPath nvarchar(256),
        @MachineName    nvarchar(256),
        @RequestUrl      nvarchar(1024),
        @ExceptionType   nvarchar(256),
        @Details         ntext
AS
BEGIN
    INSERT
        dbo.aspnet_WebEvent_Events
        (
            EventId,
            EventTimeUtc,
            EventTime,
            EventType,
            EventSequence,
            EventOccurrence,
            EventCode,
            EventDetailCode,
            Message,
            ApplicationPath,
            ApplicationVirtualPath,
            MachineName,
            RequestUrl,
            ExceptionType,
            Details
        )
    VALUES
    (
        @EventId,
        @EventTimeUtc,
        @EventTime,
        @EventType,
        @EventSequence,
        @EventOccurrence,
        @EventCode,
        @EventDetailCode,
        @Message,
        @ApplicationPath,
        @ApplicationVirtualPath,
        @MachineName,
        @RequestUrl,
        @ExceptionType,
        @Details
    )
END
GO
/****** Object:  StoredProcedure [dbo].[sharedGetAllVFUByDistrictId]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sharedGetAllVFUByDistrictId]
@DistrictId int,
@Year int

as
SELECT      distinct  LIVE_Benef.Name + ' / ' + LIVE_Benef.FName AS MVFU, LIVE_VFUs.VfuId
FROM            LIVE_VFUs INNER JOIN
                         LIVE_Benef ON LIVE_VFUs.BenefId = LIVE_Benef.BenefId INNER JOIN
                         OCM_District ON LIVE_Benef.DistrictId = OCM_District.DistrictID Inner JOIN
                         LIVE_VFUsContracts ON LIVE_VFUs.VfuId = LIVE_VFUsContracts.VfuId
						 where LIVE_VFUs.VfuLevel=1 and OCM_District.DistrictID=@DistrictId  and @Year between  year (cast (LIVE_VFUsContracts.ContractStartDate as date)) and year(cast(LIVE_VFUsContracts.ContractEndDate as date))


UNION ALL

SELECT      distinct  LIVE_Benef.Name + ' / ' + LIVE_Benef.FName AS MVFU, LIVE_VFUs.VfuId
FROM            LIVE_VFUs INNER JOIN
                         LIVE_Benef ON LIVE_VFUs.BenefId = LIVE_Benef.BenefId INNER JOIN
                         OCM_District ON LIVE_Benef.DistrictId = OCM_District.DistrictID 
						 where LIVE_VFUs.VfuLevel=2 and OCM_District.DistrictID=@DistrictId  and @Year between  year (cast (LIVE_VFUs.ContractStartDate as date)) and year(cast(LIVE_VFUs.ContractEndDate as date))
GO
/****** Object:  StoredProcedure [dbo].[SharedGetDistrict]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[SharedGetDistrict]
@ProvinceId	int

as
select * from OCM_District where ProvinceID=@ProvinceId order by DistrictID
GO
/****** Object:  StoredProcedure [dbo].[sharedGetIP]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sharedGetIP]

as

select * from LIVE_IP

order by Id
GO
/****** Object:  StoredProcedure [dbo].[sharedGetIPByProvince]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sharedGetIPByProvince]
@Year int,
@ProvinceId int,
@SubActivityId int
as
SELECT     distinct   LIVE_IP.Id, LIVE_IP.IP
FROM            LIVE_IPProvinceD INNER JOIN
                         LIVE_IP ON LIVE_IPProvinceD.IPId = LIVE_IP.Id
		where Year=@Year and ProvinceId=@ProvinceId and SubActivityId=@SubActivityId
GO
/****** Object:  StoredProcedure [dbo].[sharedGetIPDetailByProvince]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sharedGetIPDetailByProvince]
@IPId int,
@Year int
as



SELECT      ROW_NUMBER() over(partition by OCM_Province.provinceid order by OCM_Province.provinceid) as rwNumbr,LIVE_IPProvinceD.SubActivityId, OCM_Province.ProvinceEngName, OCM_Province.ProvinceID ,case when LIVE_IPProvinceD.SubActivityId is not null then 'True' else 'False' end as chk
FROM            OCM_Province LEFT OUTER JOIN
                         LIVE_IPProvinceD ON OCM_Province.ProvinceID = LIVE_IPProvinceD.ProvinceId AND LIVE_IPProvinceD.IPId = @IPId AND LIVE_IPProvinceD.Year = @Year

			
GO
/****** Object:  StoredProcedure [dbo].[sharedGetLiveOfficerByProvinceId]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sharedGetLiveOfficerByProvinceId]
@ProvinceId int
as

select * from LIVE_Officer where RegionId in (SELECT        id
FROM            OCM_Province INNER JOIN
                         OCM_Region ON OCM_Province.Region = OCM_Region.id
			where ProvinceID=@ProvinceId) and LIVE_Officer.Enabled=1


GO
/****** Object:  StoredProcedure [dbo].[sharedGetMaleFVU]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sharedGetMaleFVU]
@provinceId int,
@Year int

as

SELECT     distinct   LIVE_Benef.Name + ' / ' + LIVE_Benef.FName AS MVFU, LIVE_VFUs.VfuId
FROM            LIVE_VFUs INNER JOIN
                         LIVE_Benef ON LIVE_VFUs.BenefId = LIVE_Benef.BenefId INNER JOIN
                         OCM_District ON LIVE_Benef.DistrictId = OCM_District.DistrictID INNER JOIN
                         LIVE_VFUsContracts ON LIVE_VFUs.VfuId = LIVE_VFUsContracts.VfuId
						 where OCM_District.ProvinceID=@provinceId and VfuLevel=1 and @Year between  year (cast (LIVE_VFUsContracts.ContractStartDate as date)) and year(cast(LIVE_VFUsContracts.ContractEndDate as date))
GO
/****** Object:  StoredProcedure [dbo].[sharedGetSubActivity]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sharedGetSubActivity]

as

SELECT        LIVE_Sub_Activity.Sub_Activity, LIVE_Sub_Activity.S_ActivityId
FROM            LIVE_Activity INNER JOIN
                         LIVE_Sub_Activity ON LIVE_Activity.ActivityId = LIVE_Sub_Activity.ActivityId
GO
/****** Object:  StoredProcedure [dbo].[SharedGetUserProvinces]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[SharedGetUserProvinces] 
@UserId	uniqueidentifier

as

SELECT     aspnet_UserProvince.ProvinceID, OCM_Province.ProvinceEngName
FROM         aspnet_UserProvince INNER JOIN
                      OCM_Province ON aspnet_UserProvince.ProvinceID = OCM_Province.ProvinceID
where  aspnet_UserProvince.UserID=@UserId order by aspnet_UserProvince.ProvinceID 
GO
/****** Object:  StoredProcedure [dbo].[SharedGetVFUVillageByDistrict]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SharedGetVFUVillageByDistrict]
@DistrictId int
as
SELECT    distinct  village from LIVE_Benef where DistrictId=@DistrictId and LIVE_Benef.Village in ( SELECT        LIVE_Benef.Village
FROM            LIVE_VFUs INNER JOIN
                         LIVE_Benef ON LIVE_VFUs.BenefId = LIVE_Benef.BenefId)
GO
/****** Object:  StoredProcedure [dbo].[SharedGetVillageByDistrict]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[SharedGetVillageByDistrict]
@DistrictId int
as
SELECT    distinct  village from LIVE_Benef where DistrictId=@DistrictId 
GO
/****** Object:  StoredProcedure [dbo].[spPageActivityInfo_DeleteAll]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spPageActivityInfo_DeleteAll]
@S_ActivityId int,
@IPId int,
@Year int,
@UserId uniqueidentifier,
@Date nvarchar(50),
@Village nvarchar(50),
@DistrictId int

as

DECLARE @context_info varbinary(100);
SET @context_info = cast(@UserId as varbinary(100));
SET CONTEXT_INFO @context_info;

	delete LIVE_BenefActivityD FROM  LIVE_BenefActivityD  INNER JOIN LIVE_Benef
                          ON LIVE_Benef.BenefId = LIVE_BenefActivityD.BenefId
						where LIVE_Benef.Village=@Village and LIVE_Benef.DistrictId=@DistrictId and LIVE_BenefActivityD.IPId=@IPId and LIVE_BenefActivityD.S_ActivityId=@S_ActivityId and LIVE_BenefActivityD.Year=@Year
	if  (@S_ActivityId=6 or @S_ActivityId=7 or @S_ActivityId=8)
	begin
		delete LIVE_BenefActivityFCD FROM  LIVE_BenefActivityFCD  INNER JOIN LIVE_Benef
                          ON LIVE_Benef.BenefId = LIVE_BenefActivityFCD.BenefId
						where LIVE_Benef.Village=@Village and LIVE_Benef.DistrictId=@DistrictId  and LIVE_BenefActivityFCD.S_ActivityId=@S_ActivityId and LIVE_BenefActivityFCD.Year=@Year
	end


GO
/****** Object:  StoredProcedure [dbo].[spPageActivityInfo_getBenfActivityDetail]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spPageActivityInfo_getBenfActivityDetail]
@DistrictId int,
@Village nvarchar(50),
@IPId int,
@S_ActivityId int,
@Year int

as


SELECT        LIVE_Benef.BenefId,LIVE_Benef.Name, LIVE_Benef.FName,LIVE_Benef.Mobile, LIVE_BenefActivityD.F_S, LIVE_BenefActivityD.Sec_S, LIVE_BenefActivityD.Inc_Source, case when LIVE_BenefActivityD.BenefId  is not null then 'True' else 'False' end as IsExist  
FROM            LIVE_Benef LEFT OUTER JOIN
                         LIVE_BenefActivityD ON LIVE_Benef.BenefId = LIVE_BenefActivityD.BenefId
						 and LIVE_BenefActivityD.IPId=@IPId and LIVE_BenefActivityD.S_ActivityId=@S_ActivityId and LIVE_BenefActivityD.Year=@Year
			where LIVE_Benef.DistrictId=@DistrictId and LIVE_Benef.Village=@Village
GO
/****** Object:  StoredProcedure [dbo].[spPageActivityInfo_SaveForm]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spPageActivityInfo_SaveForm]
@BenefId varchar(50),
@F_S varchar(50),
@Sec_S varchar(50),
@Inc_Source varchar(50),
@S_ActivityId int,
@IPId int,
@NoOfPackg float,
@Year int,
@SubSubActType varchar(50)=null,
@UserId uniqueidentifier,
@Date nvarchar(50),
@Village nvarchar(50),
@FcAmount float=null,
@PkgAmount float=null,
@Percentage float=null,
@OfficerId varchar(50)=null,
@Loop int

as

if @Loop=1
begin

	delete LIVE_BenefActivityD FROM  LIVE_BenefActivityD  INNER JOIN LIVE_Benef
                          ON LIVE_Benef.BenefId = LIVE_BenefActivityD.BenefId
						where LIVE_Benef.Village=@Village and LIVE_BenefActivityD.IPId=@IPId and LIVE_BenefActivityD.S_ActivityId=@S_ActivityId and LIVE_BenefActivityD.Year=@Year
	if  (@S_ActivityId=6 or @S_ActivityId=7 or @S_ActivityId=8)
	begin
		delete LIVE_BenefActivityFCD FROM  LIVE_BenefActivityFCD  INNER JOIN LIVE_Benef
                          ON LIVE_Benef.BenefId = LIVE_BenefActivityFCD.BenefId
						where LIVE_Benef.Village=@Village  and LIVE_BenefActivityFCD.S_ActivityId=@S_ActivityId and LIVE_BenefActivityFCD.Year=@Year
	end
end

--Actv
INSERT INTO [dbo].[LIVE_BenefActivityD]
           ([BenefId]
           ,[F_S]
           ,[Sec_S]
           ,[Inc_Source]
           ,[S_ActivityId]
           ,[IPId]
           ,[NoOfPkg]
           ,[Year]
           ,[Sub_Sub_Act_Type],UserId,Date)
     VALUES
           (@BenefId
           ,@F_S
           ,@Sec_S
           ,@Inc_Source
           ,@S_ActivityId
           ,@IPId
           ,@NoOfPackg
           ,@Year
           ,@SubSubActType,@UserId,@Date)
--FC Act
if  (@S_ActivityId=6 or @S_ActivityId=7 or @S_ActivityId=8)
begin
INSERT INTO [dbo].[LIVE_BenefActivityFCD]
           ([BenefId]
           ,[S_ActivityId]
		   ,[Year]
           ,[FcAmount]
           ,[PkgAmount]
           ,[Percentage]
           ,[OfficerId]
           ,[UserId]
           ,[Date])
     VALUES
           (@BenefId
           ,@S_ActivityId
		   ,@Year
           ,@FcAmount
           ,@PkgAmount
           ,@Percentage
           ,@OfficerId
           ,@UserId
           ,@Date)
end

GO
/****** Object:  StoredProcedure [dbo].[spPageBenefeciaryGetBenefList]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spPageBenefeciaryGetBenefList]
@DistrictId int,
@Village nvarchar(50)
as
SELECT        LIVE_Benef.Name, LIVE_Benef.FName, LIVE_Benef.Mobile, LIVE_Benef.BenefId, LIVE_Benef.Village, LIVE_Benef.Gender, LIVE_Benef.DistrictId, OCM_District.DistrictEngName
FROM            LIVE_Benef INNER JOIN
                         OCM_District ON LIVE_Benef.DistrictId = OCM_District.DistrictID
						 where LIVE_Benef.DistrictId=@DistrictId and LIVE_Benef.Village=@Village
GO
/****** Object:  StoredProcedure [dbo].[spPageBenefeciaryGetDetailById]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spPageBenefeciaryGetDetailById]

@Id varchar(50)

as

select * from LIVE_Benef where BenefId=@Id
GO
/****** Object:  StoredProcedure [dbo].[spPageBenefeciarySave]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[spPageBenefeciarySave]
@Name nvarchar(50),
@FName nvarchar(50),
@Gender int,
@ContactNo nvarchar(50)=null,
@UserId uniqueidentifier,
@Date nvarchar(50),
@DistrictId varchar(50),
@Village nvarchar(50),
@exist bit output
as

if exists(select lower(Name) from  LIVE_Benef where lower(Name) = lower(@Name) and lower(FName)=lower(@FName) and lower(Village)=lower(@Village) and DistrictId=@DistrictId)
	Begin
	
		set @exist=1
	END

Else
	Begin
		declare @benfId varchar(50)
		set @benfId=(select count(Name)+1 from LIVE_Benef where DistrictId=@DistrictId )
		set @benfId=@DistrictId+'BEN'+@benfId
		
		if(exists(select BenefId from LIVE_Benef where BenefId=@benfId ))
		   begin
				declare @newId varchar(50)
				while(1=1)
					begin
						set @newId=LTRIM(RTRIM((select substring(BenefId,CHARINDEX('N',BenefId,1)+1,LEN(BenefId)) from LIVE_Benef where BenefId=@benfId)))
						set @newId=cast((cast(@newId as int)+1) as nvarchar)
						set @benfId=@DistrictId+'BEN'+@newId
						if(not exists(select BenefId from LIVE_Benef where BenefId=@benfId and DistrictId=@DistrictId))
							begin
								break;
							end
							
					end
				
		   end	
INSERT INTO [dbo].[LIVE_Benef]
           ([BenefId]
           ,[Name]
           ,[FName]
           ,[Mobile]
           ,[Village]
           ,[Gender]
          
           ,[DistrictId]
           ,[UserId]
           ,[Date])
     VALUES
           (@benfId
           ,@Name
           ,@FName
           ,@ContactNo
           ,@Village
           ,@Gender
           ,@DistrictId
		   ,@UserId
           ,@Date)
		   set @exist=0
	END
select @exist
GO
/****** Object:  StoredProcedure [dbo].[spPageBenefeciaryUpdate]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spPageBenefeciaryUpdate]
@Name nvarchar(50),
@FName nvarchar(50),
@ContactNo nvarchar(50),
@Id varchar(50),
@Gender int,
@DistrictId int,
@Village nvarchar(50),
@UserId uniqueidentifier,
@Date nvarchar(50)
as

UPDATE [dbo].[LIVE_Benef]
   SET [FName] = @FName
      ,[Mobile] = @ContactNo
      ,[Gender] = @Gender
	  ,[UpdatedBy] =@UserId
      ,[UpdationDate] = @Date
 WHERE [BenefId] = @Id and DistrictId=@DistrictId and Village=@Village
      
GO
/****** Object:  StoredProcedure [dbo].[spPageDashboard]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spPageDashboard]
@Year int,
@ProvinceId int
as
select ProvinceEngName,isnull([Fish Hatchry],0) as Hry, isnull([Backyard Poultry Production (30 )],0) as P30,isnull([Small Scale Commercial Production (100)],0) as P100,isnull([Semi Commecial Poultry Production (500)],0) as P500,isnull([Commercial Poultry Production (5000)],0) as P5000,isnull([Fish Ponds],0) as Ponds from (
SELECT        OCM_Province.ProvinceEngName, LIVE_Sub_Activity.Sub_Activity, COUNT(LIVE_BenefActivityD.BenefId) AS cnt
FROM            OCM_Province INNER JOIN
                         OCM_District ON OCM_Province.ProvinceID = OCM_District.ProvinceID INNER JOIN
                         LIVE_Benef INNER JOIN
                         LIVE_BenefActivityD ON LIVE_Benef.BenefId = LIVE_BenefActivityD.BenefId INNER JOIN
                         LIVE_Sub_Activity ON LIVE_BenefActivityD.S_ActivityId = LIVE_Sub_Activity.S_ActivityId ON OCM_District.DistrictID = LIVE_Benef.DistrictId
where LIVE_BenefActivityD.Year=@Year and OCM_Province.ProvinceID=@ProvinceId
GROUP BY OCM_Province.ProvinceEngName, LIVE_Sub_Activity.Sub_Activity ) s

pivot(max(cnt)  for Sub_Activity in  ([Fish Hatchry],[Backyard Poultry Production (30 )],[Small Scale Commercial Production (100)],[Semi Commecial Poultry Production (500)],[Commercial Poultry Production (5000)],[Fish Ponds]) ) pvt


--Extension

SELECT        sum(case when LIVE_VFUs.VfuLevel=1 then 1 else 0 end) AS Male,sum(case when LIVE_VFUs.VfuLevel=2 then 1 else 0 end) AS Female, P.ProvinceEngName,
(
SELECT        COUNT(LIVE_Members.BenefId) 
FROM            LIVE_Members INNER JOIN
                         LIVE_VFUs ON LIVE_Members.VfuId = LIVE_VFUs.VfuId INNER JOIN
                         LIVE_Benef ON LIVE_Members.BenefId = LIVE_Benef.BenefId INNER JOIN
                         OCM_District ON LIVE_Benef.DistrictId = OCM_District.DistrictID
						 where OCM_District.ProvinceID=p.ProvinceID
						
						
) mem
FROM            LIVE_VFUs INNER JOIN
                         LIVE_Benef ON LIVE_VFUs.BenefId = LIVE_Benef.BenefId INNER JOIN
                         OCM_District ON LIVE_Benef.DistrictId = OCM_District.DistrictID INNER JOIN
                         OCM_Province P ON OCM_District.ProvinceID = P.ProvinceID
	where p.ProvinceID=@ProvinceId and @Year between  year (cast (LIVE_VFUs.ContractStartDate as date)) and year(cast(LIVE_VFUs.ContractEndDate as date))
GROUP BY P.ProvinceEngName ,P.ProvinceID

--Vaccination

SELECT        OCM_Province.ProvinceEngName,sum(LVIE_Bru_Vaccination.Cattle) S19,sum(LVIE_Bru_Vaccination.Goat)+sum(LVIE_Bru_Vaccination.Sheep) REV1
FROM            LVIE_Bru_Vaccination INNER JOIN
                         LIVE_Bruc_VFUs ON LVIE_Bru_Vaccination.VFUId = LIVE_Bruc_VFUs.VFUId INNER JOIN
                         OCM_District ON LIVE_Bruc_VFUs.DistrictId = OCM_District.DistrictID INNER JOIN
                         OCM_Province ON OCM_District.ProvinceID = OCM_Province.ProvinceID
where OCM_Province.ProvinceID=@ProvinceId and LIVE_Bruc_VFUs.Year=@Year
GROUP BY OCM_Province.ProvinceEngName
GO
/****** Object:  StoredProcedure [dbo].[spPageDashboard_GetActivityNumbers]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spPageDashboard_GetActivityNumbers]
@year int
as


SELECT        LIVE_Sub_Activity.S_ActivityId,LIVE_Sub_Activity.Sub_Activity, COUNT(LIVE_BenefActivityD.BenefId) AS cnt
FROM            LIVE_Benef INNER JOIN
                         LIVE_BenefActivityD ON LIVE_Benef.BenefId = LIVE_BenefActivityD.BenefId RIGHT OUTER JOIN
                         LIVE_Sub_Activity ON LIVE_BenefActivityD.S_ActivityId = LIVE_Sub_Activity.S_ActivityId
and        (LIVE_BenefActivityD.Year = @year)


GROUP BY LIVE_Sub_Activity.Sub_Activity,LIVE_Sub_Activity.S_ActivityId


union all

select 100 as S_ActivityId,vaccine as Sub_Activity,quantity as cnt from (

SELECT        SUM(LVIE_Bru_Vaccination.Cattle) AS S19, SUM(LVIE_Bru_Vaccination.Goat) + SUM(LVIE_Bru_Vaccination.Sheep) AS REV1
FROM            LVIE_Bru_Vaccination INNER JOIN
                         LIVE_Bruc_VFUs ON LVIE_Bru_Vaccination.VFUId = LIVE_Bruc_VFUs.VFUId
WHERE        (LIVE_Bruc_VFUs.Year = @year)  ) u
unpivot (quantity for vaccine in (S19,REV1) ) as qu



union all 


select  200 as S_ActivityId, Extension as Sub_Activity, Number as cnt from (
SELECT        sum(case when LIVE_VFUs.VfuLevel=1 then 1 else 0 end) AS Male,sum(case when LIVE_VFUs.VfuLevel=2 then 1 else 0 end) AS Female,
(
SELECT        COUNT(LIVE_Members.BenefId) 
FROM            LIVE_Members INNER JOIN
                         LIVE_VFUs ON LIVE_Members.VfuId = LIVE_VFUs.VfuId INNER JOIN
                         LIVE_Benef ON LIVE_Members.BenefId = LIVE_Benef.BenefId INNER JOIN
                         OCM_District ON LIVE_Benef.DistrictId = OCM_District.DistrictID
						 where @year between  year (cast (LIVE_VFUs.ContractStartDate as date)) and year(cast(LIVE_VFUs.ContractEndDate as date))
						
						
) mem
FROM            LIVE_VFUs INNER JOIN
                         LIVE_Benef ON LIVE_VFUs.BenefId = LIVE_Benef.BenefId INNER JOIN
                         OCM_District ON LIVE_Benef.DistrictId = OCM_District.DistrictID INNER JOIN
                         OCM_Province P ON OCM_District.ProvinceID = P.ProvinceID
	where @year between  year (cast (LIVE_VFUs.ContractStartDate as date)) and year(cast(LIVE_VFUs.ContractEndDate as date))

	) EN

unpivot (Number for Extension in (Male,Female,mem ) ) asd


union all 

SELECT      300 as  S_ActivityId,  LIVE_InputsPackage.Package as Sub_Activity, COUNT(LVIE_Inputs.PackagId) AS cnt
FROM            LIVE_Benef INNER JOIN
                         LVIE_Inputs ON LIVE_Benef.BenefId = LVIE_Inputs.BenefId RIGHT OUTER JOIN
                         LIVE_InputsPackage ON LVIE_Inputs.PackagId = LIVE_InputsPackage.PackagId
WHERE        (LVIE_Inputs.Year = @year)
GROUP BY LIVE_InputsPackage.Package



order by S_ActivityId
GO
/****** Object:  StoredProcedure [dbo].[spPageInputs_Delete]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[spPageInputs_Delete]

@Year int,
@PackId int,
@VFUId varchar(50),
@Village nvarchar(50)
as

	
		delete LVIE_Inputs FROM  LVIE_Inputs INNER JOIN
                         LIVE_Members ON LVIE_Inputs.BenefId = LIVE_Members.BenefId INNER JOIN
                         LIVE_Benef ON LIVE_Members.BenefId = LIVE_Benef.BenefId
						 where LIVE_Members.VfuId=@VFUId and LIVE_Benef.Village=@Village and LVIE_Inputs.Year=@Year and LVIE_Inputs.PackagId=@PackId
		
GO
/****** Object:  StoredProcedure [dbo].[spPageInputs_GetMembers]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spPageInputs_GetMembers]
@Year int,
@PackageId int,
@DistrictId int,
@VFUId varchar(50),
@Village nvarchar(50)
as

SELECT        LIVE_Benef.Name, LIVE_Benef.FName, LIVE_Benef.Village, LIVE_MembersPosition.Position, LIVE_Benef.BenefId, LIVE_Members.VfuId,
case when LVIE_Inputs.BenefId is null then 'False' else 'True' end as Exist
FROM            LIVE_Members INNER JOIN
                         LIVE_Benef ON LIVE_Members.BenefId = LIVE_Benef.BenefId INNER JOIN
                         LIVE_MembersPosition ON LIVE_Members.PositionId = LIVE_MembersPosition.PositionId LEFT OUTER JOIN
                         LVIE_Inputs ON LIVE_Members.BenefId = LVIE_Inputs.BenefId AND LIVE_Members.Year = LVIE_Inputs.Year
						 and LVIE_Inputs.PackagId = @PackageId
WHERE          (LIVE_Benef.DistrictId = @DistrictId) AND (LIVE_Members.VfuId = @VFUId) AND (LIVE_Benef.Village = @Village)
ORDER BY LIVE_MembersPosition.PositionId
GO
/****** Object:  StoredProcedure [dbo].[spPageInputs_GetVFUVillage]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spPageInputs_GetVFUVillage]
@DistrictId int,
@Year int,
@VFUId varchar(50)
as



SELECT    distinct    LIVE_Benef.Village
FROM            LIVE_Members INNER JOIN
                         LIVE_Benef ON LIVE_Members.BenefId = LIVE_Benef.BenefId INNER JOIN
                         LIVE_VFUs ON LIVE_Members.VfuId = LIVE_VFUs.VfuId
WHERE        (LIVE_Benef.DistrictId = @DistrictId) AND (LIVE_Members.VfuId = @VFUId) and @Year between  year (cast (LIVE_VFUs.ContractStartDate as date)) and year(cast(LIVE_VFUs.ContractEndDate as date))
GO
/****** Object:  StoredProcedure [dbo].[spPageInputs_SavePackages]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spPageInputs_SavePackages]
@BenefId varchar(50),
@Year int,
@PackId int,
@UserId uniqueidentifier,
@Date nvarchar(50),
@VFUId varchar(50),
@Village nvarchar(50)
as

	
--delete LVIE_Inputs FROM  LVIE_Inputs INNER JOIN
--LIVE_Members ON LVIE_Inputs.BenefId = LIVE_Members.BenefId INNER JOIN
--LIVE_Benef ON LIVE_Members.BenefId = LIVE_Benef.BenefId
--where LIVE_Members.VfuId=@VFUId and LIVE_Benef.Village=@Village and LVIE_Inputs.Year=@Year and LVIE_Inputs.PackagId=@PackId
		
INSERT INTO [dbo].[LVIE_Inputs]
           ([BenefId]
           ,[Year]
           ,[PackagId]
           ,[UserId]
           ,[Date])
     VALUES
           (@BenefId
           ,@Year
           ,@PackId
           ,@UserId
           ,@Date)



GO
/****** Object:  StoredProcedure [dbo].[spPageIPManagement_saveIP]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spPageIPManagement_saveIP]
@Name nvarchar(50),
@Remarks nvarchar(500),
@UserId uniqueidentifier,
@InsertedDate nvarchar(50),
@Id int output
as

if not exists( select * from LIVE_IP where IP=@Name)
begin

INSERT INTO [dbo].[LIVE_IP]
           (
           [IP]
           ,[Remarks]
           ,[InsertedDate]
           ,[UserId])
     VALUES
           (@Name,@Remarks,@InsertedDate,@UserId)
set @Id=(select IDENT_CURRENT('LIVE_IP') )
end

else 

begin
	set @Id =(select id from LIVE_IP where IP=@Name)
end
GO
/****** Object:  StoredProcedure [dbo].[spPageIPManagement_saveIPProvDetail]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spPageIPManagement_saveIPProvDetail]
@IPId int,
@SubActivityId int,
@ProvinceId int,
@Year int,
@LoopId int
as

if @LoopId=1
begin
delete from [dbo].[LIVE_IPProvinceD] where IPId=@IPId and Year=@Year
end

insert into [dbo].[LIVE_IPProvinceD]
values (@IPId,@SubActivityId,@ProvinceId,@Year)
GO
/****** Object:  StoredProcedure [dbo].[spPageMembers_Save]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spPageMembers_Save]
@Name nvarchar(50),
@FName nvarchar(50),
@Gender int,
@ContactNo nvarchar(50)=null,
@UserId uniqueidentifier,
@Date nvarchar(50),
@DistrictId varchar(50),
@Village nvarchar(50),
@VFUId varchar(50),
@PositionId int,
@Year int,
@Remarks nvarchar(50),
@exist bit output
as

declare @benfId varchar(50)
if exists(select lower(Name) from  LIVE_Benef where lower(Name) = lower(@Name) and lower(FName)=lower(@FName) and lower(Village)=lower(@Village) and DistrictId=@DistrictId)
	Begin		
		set @benfId=(select BenefId from LIVE_Benef where lower(Name) = lower(@Name) and lower(FName)=lower(@FName) and lower(Village)=lower(@Village) and DistrictId=@DistrictId)
		if  @benfId is not null and exists( select BenefId from LIVE_Members where BenefId=@benfId and VfuId=@VFUId)
			begin
				 set @exist=1

			end
		else 
			begin
					INSERT INTO [dbo].[LIVE_Members]
					   ([VfuId]
					   ,[BenefId]
					   ,[PositionId]
					   ,[Year]
					   ,[Remarks]
					   ,[UserId]
					   ,[Date])
				 VALUES
					   (@VFUId
					   ,@benfId
					   ,@PositionId
					   ,@Year
					   ,@Remarks
					   ,@UserId
					   ,@Date)

				set @exist=0
			end
	END

Else
	Begin
		
		set @benfId=(select count(Name)+1 from LIVE_Benef where DistrictId=@DistrictId )
		set @benfId=@DistrictId+'BEN'+@benfId
		
		if(exists(select BenefId from LIVE_Benef where BenefId=@benfId ))
		   begin
				declare @newId varchar(50)
				while(1=1)
					begin
						set @newId=LTRIM(RTRIM((select substring(BenefId,CHARINDEX('N',BenefId,1)+1,LEN(BenefId)) from LIVE_Benef where BenefId=@benfId)))
						set @newId=cast((cast(@newId as int)+1) as nvarchar)
						set @benfId=@DistrictId+'BEN'+@newId
						if(not exists(select BenefId from LIVE_Benef where BenefId=@benfId and DistrictId=@DistrictId))
							begin
								break;
							end
							
					end
				
		   end
	INSERT INTO [dbo].[LIVE_Benef]
           ([BenefId]
           ,[Name]
           ,[FName]
           ,[Mobile]
           ,[Village]
           ,[Gender]
          
           ,[DistrictId]
           ,[UserId]
           ,[Date])
     VALUES
           (@benfId
           ,@Name
           ,@FName
           ,@ContactNo
           ,@Village
           ,@Gender
           ,@DistrictId
		   ,@UserId
           ,@Date)
		INSERT INTO [dbo].[LIVE_Members]
			   ([VfuId]
			   ,[BenefId]
			   ,[PositionId]
			   ,[Year]
			   ,[Remarks]
			   ,[UserId]
			   ,[Date])
		 VALUES
			   (@VFUId
			   ,@benfId
			   ,@PositionId
			   ,@Year
			   ,@Remarks
			   ,@UserId
			   ,@Date)

		set @exist=0
	END
select @exist
GO
/****** Object:  StoredProcedure [dbo].[spPageOfficerGetDetailById]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[spPageOfficerGetDetailById]

@Id varchar(50)

as

select * from LIVE_Officer where OfficerId=@Id
GO
/****** Object:  StoredProcedure [dbo].[spPageOfficerGetList]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spPageOfficerGetList]
@RegionId int
as
SELECT        LIVE_Officer.Name, LIVE_Officer.FName, LIVE_Officer.OfficerId, LIVE_Officer.Gender, LIVE_Officer.Email, LIVE_Officer.ContactNo, LIVE_Officer.Date
FROM            LIVE_Officer INNER JOIN
                         OCM_Region ON LIVE_Officer.RegionId = OCM_Region.id
						 where LIVE_Officer.RegionId=@RegionId and Enabled=1
GO
/****** Object:  StoredProcedure [dbo].[spPageOfficerSave]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[spPageOfficerSave]
@Name nvarchar(50),
@FName nvarchar(50),
@Gender int,
@ContactNo nvarchar(50)=null,
@UserId uniqueidentifier,
@Date nvarchar(50),
@RegionId int,
@exist bit output
as

if exists(select lower(Name) from  LIVE_Officer where lower(Name) = lower(@Name) and lower(FName)=lower(@FName) and regionId=@RegionId)
	Begin
	
		set @exist=1
	END

Else
	Begin
	declare @OfficerId varchar(50)
		set @OfficerId=(select count(RegionId)+1 from LIVE_Officer where RegionId=@RegionId )
		set @OfficerId='OF'+cast(@RegionId as nvarchar)+'R'+@OfficerId

INSERT INTO [dbo].[LIVE_Officer]
           ([OfficerId]
           ,[Name]
           ,[FName]
           ,[Gender]
           ,RegionId
           ,[ContactNo]
           ,[UserId]
           ,[Date]
           ,[Enabled])
     VALUES
           (@OfficerId
           ,@Name
           ,@FName
           ,@Gender
           ,@RegionId
           ,@ContactNo
           ,@UserId
           ,@Date
           ,1)
		   set @exist=0
	END
select @exist
GO
/****** Object:  StoredProcedure [dbo].[spPageOfficerUpdate]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[spPageOfficerUpdate]
@OfficerId varchar(50),
@Name nvarchar(50),
@FName nvarchar(50),
@Gender int,
@RegionId int,
@ContactNo nvarchar(50),
@UserId uniqueidentifier,
@Date nvarchar(50),
@exist bit output
as

if exists(select * from LIVE_Officer where OfficerId=@OfficerId)
begin
	if (select Name from LIVE_Officer where OfficerId=@OfficerId)=@Name
	begin
		update LIVE_Officer set FName=@FName,Gender=@Gender,ContactNo=@ContactNO,UpdatedBy=@UserId,UpdationDate=@Date where OfficerId=@OfficerId
		set @exist=0
	end
	else
	begin
			declare @2ndPc nvarchar(50)
			set @2ndPc=(select top 1 OfficerId from LIVE_Officer where OfficerId like @OfficerId+'-%' order by OfficerId desc)
			if isnull(LEN(@2ndPc),0)=0
				begin
					update LIVE_Officer set OfficerId=@OfficerId+'-D1',Enabled=0,UpdatedBy=@UserId,UpdationDate=@Date where OfficerId=@OfficerId
					insert into LIVE_Officer(OfficerId,Name,FName,Gender,RegionId,ContactNo,UserId,[Date],[Enabled]) values (@OfficerId,@Name,@FName,@Gender,@RegionId,@ContactNO,@UserId,@Date,1)
					set @exist=0
				end
			else
				begin
				   
				    if CHARINDEX('-',@2ndPc,1)>0
					begin
						declare @D int
						set @D= (select LTRIM(RTRIM( SUBSTRING(@2ndPc,CHARINDEX('-',@2ndPc,1)+2,LEN(@2ndPc)))))
						set @2ndPc=@OfficerId+'-D'+cast((cast(@D as int)+1) as nvarchar)
						update LIVE_Officer set OfficerId=@2ndPc,Enabled=0,UpdatedBy=@UserId,UpdationDate=@Date where OfficerId=@OfficerId
						insert into LIVE_Officer values (@OfficerId,@Name,@FName,@Gender,@RegionId,NULL,@ContactNO,@UserId,@Date,Null,Null,1)
						set @exist=0
					end

				end
			
	end
end
select @exist=0
GO
/****** Object:  StoredProcedure [dbo].[spPageReport_ReportBenefAnimalHealth]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spPageReport_ReportBenefAnimalHealth]

@year int,
@prov varchar(50)
as
SELECT        OCM_Province.ProvinceEngName, OCM_District.DistrictEngName, LIVE_Sub_Activity.Sub_Activity, LIVE_Benef.Name, LIVE_Benef.FName, LIVE_Benef.Village, LIVE_Benef.Mobile, LIVE_BenefActivityD.Sec_S, 
                         LIVE_BenefActivityD.Inc_Source
FROM            LIVE_BenefActivityD INNER JOIN
                         LIVE_Benef ON LIVE_BenefActivityD.BenefId = LIVE_Benef.BenefId INNER JOIN
                         OCM_District ON LIVE_Benef.DistrictId = OCM_District.DistrictID INNER JOIN
                         OCM_Province ON OCM_District.ProvinceID = OCM_Province.ProvinceID INNER JOIN
                         LIVE_Sub_Activity ON LIVE_BenefActivityD.S_ActivityId = LIVE_Sub_Activity.S_ActivityId LEFT OUTER JOIN
                         LIVE_BenefActivityFCD ON LIVE_BenefActivityD.BenefId = LIVE_BenefActivityFCD.BenefId AND LIVE_BenefActivityD.S_ActivityId = LIVE_BenefActivityFCD.S_ActivityId AND 
                         LIVE_BenefActivityD.Year = LIVE_BenefActivityFCD.Year

			where OCM_Province.ProvinceID in (select item from dbo.SplitString(@prov,',')) and LIVE_BenefActivityD.Year=@year
GO
/****** Object:  StoredProcedure [dbo].[spPageReport_ReportBrucDetail]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spPageReport_ReportBrucDetail]

@year int,
@prov nvarchar(50)

as

SELECT        LVIE_Bru_Vaccination.OName, LVIE_Bru_Vaccination.Sheep, LVIE_Bru_Vaccination.Goat, LVIE_Bru_Vaccination.Cattle, LVIE_Bru_Vaccination.Vdate, LVIE_Bru_Vaccination.Village, LVIE_Bru_Vaccination.Kochi, 
                         LIVE_Bruc_VFUs.Name, OCM_Province.ProvinceEngName, OCM_District.DistrictEngName
FROM            OCM_Province INNER JOIN
                         OCM_District ON OCM_Province.ProvinceID = OCM_District.ProvinceID INNER JOIN
                         LVIE_Bru_Vaccination INNER JOIN
                         LIVE_Bruc_VFUs ON LVIE_Bru_Vaccination.VFUId = LIVE_Bruc_VFUs.VFUId ON OCM_District.DistrictID = LIVE_Bruc_VFUs.DistrictId
where OCM_Province.ProvinceID in (select item from dbo.SplitString(@prov,',')) and LIVE_Bruc_VFUs.Year=@year


order by LIVE_Bruc_VFUs.Name,LVIE_Bru_Vaccination.Vdate,case when LVIE_Bru_Vaccination.Village is not null then 1 else 2 end

GO
/****** Object:  StoredProcedure [dbo].[spPageReport_ReportVFUFemaleDetail]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spPageReport_ReportVFUFemaleDetail] 
@year int,
@prov nvarchar(50)

as
SELECT        OCM_Province.ProvinceEngName, OCM_District.DistrictEngName, LIVE_Benef.Name, LIVE_Benef.FName, LIVE_Benef.Village, LIVE_Benef.Mobile, LIVE_Benef.MaritualS, LIVE_VFUs.ContractStartDate, 
                         LIVE_VFUs.ContractEndDate, LIVE_VFUs.Bank, VFUHeadDetail.Name AS HeadName
FROM            LIVE_VFUs INNER JOIN
                         LIVE_Benef ON LIVE_VFUs.BenefId = LIVE_Benef.BenefId INNER JOIN
                         OCM_District ON LIVE_Benef.DistrictId = OCM_District.DistrictID INNER JOIN
                         OCM_Province ON OCM_District.ProvinceID = OCM_Province.ProvinceID INNER JOIN
                         LIVE_VFUs AS HeadVFU ON LIVE_VFUs.Vfu_Head = HeadVFU.VfuId INNER JOIN
                         LIVE_Benef AS VFUHeadDetail ON HeadVFU.BenefId = VFUHeadDetail.BenefId

where  OCM_Province.ProvinceID in (select item from dbo.SplitString(@prov,',')) and LIVE_VFUs.VfuLevel=2 and @Year between  year (cast (LIVE_VFUs.ContractStartDate as date)) and year(cast(LIVE_VFUs.ContractEndDate as date)) 



GO
/****** Object:  StoredProcedure [dbo].[spPageReport_ReportVFUMaleDetail]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spPageReport_ReportVFUMaleDetail] 
@year int,
@prov nvarchar(50)

as
SELECT    distinct    OCM_Province.ProvinceEngName, OCM_District.DistrictEngName, LIVE_Benef.Name, LIVE_Benef.FName, LIVE_Benef.Village, LIVE_Benef.Mobile, LIVE_Benef.MaritualS, LIVE_VFUs.ContractStartDate, 
                         LIVE_VFUs.ContractEndDate, LIVE_VFUs.Bank
FROM            LIVE_VFUs INNER JOIN
                         LIVE_Benef ON LIVE_VFUs.BenefId = LIVE_Benef.BenefId INNER JOIN
                         OCM_District ON LIVE_Benef.DistrictId = OCM_District.DistrictID INNER JOIN
                         OCM_Province ON OCM_District.ProvinceID = OCM_Province.ProvinceID INNER JOIN
                         LIVE_VFUsContracts ON LIVE_VFUs.VfuId = LIVE_VFUsContracts.VfuId	


where  OCM_Province.ProvinceID in (select item from dbo.SplitString(@prov,',')) and VfuLevel=1 and @Year between  year (cast (LIVE_VFUs.ContractStartDate as date)) and year(cast(LIVE_VFUs.ContractEndDate as date)) 
GO
/****** Object:  StoredProcedure [dbo].[spPageReport_ReportVFUMemberDetail]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spPageReport_ReportVFUMemberDetail]
@year int,
@prov nvarchar(50)
as
SELECT        OCM_Province.ProvinceEngName, OCM_District.DistrictEngName, VFUDetail.Name, LIVE_Benef.Name AS MemName, LIVE_Benef.FName, LIVE_MembersPosition.Position, LIVE_Benef.Village
FROM            LIVE_Members INNER JOIN
                         LIVE_VFUs ON LIVE_Members.VfuId = LIVE_VFUs.VfuId INNER JOIN
                         LIVE_Benef ON LIVE_Members.BenefId = LIVE_Benef.BenefId INNER JOIN
                         LIVE_MembersPosition ON LIVE_Members.PositionId = LIVE_MembersPosition.PositionId INNER JOIN
                         OCM_District ON LIVE_Benef.DistrictId = OCM_District.DistrictID INNER JOIN
                         OCM_Province ON OCM_District.ProvinceID = OCM_Province.ProvinceID INNER JOIN
                         LIVE_Benef AS VFUDetail ON LIVE_VFUs.BenefId = VFUDetail.BenefId

where OCM_Province.ProvinceID in (select item from dbo.SplitString(@prov,',')) and

LIVE_Members.Year=@year 

order by VFUDetail.Name,LIVE_Benef.Village 
GO
/****** Object:  StoredProcedure [dbo].[spPageVaccination_Delete]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spPageVaccination_Delete]
@VFUId varchar(50),
@Village nvarchar(50),
@OName nvarchar(50),
@Date nvarchar(50)
as

if @Village='Kochi'
begin
delete      LVIE_Bru_Vaccination   
FROM            LIVE_Bruc_VFUs INNER JOIN
                         LVIE_Bru_Vaccination ON LIVE_Bruc_VFUs.VFUId = LVIE_Bru_Vaccination.VFUId
					where LVIE_Bru_Vaccination.OName=@OName and  LVIE_Bru_Vaccination.VFUId=@VFUId
					 and LVIE_Bru_Vaccination.Vdate=@Date

					 and LVIE_Bru_Vaccination.Kochi=1

end

else

begin

delete      LVIE_Bru_Vaccination   
FROM            LIVE_Bruc_VFUs INNER JOIN
                         LVIE_Bru_Vaccination ON LIVE_Bruc_VFUs.VFUId = LVIE_Bru_Vaccination.VFUId
					where LVIE_Bru_Vaccination.OName=@OName and  LVIE_Bru_Vaccination.VFUId=@VFUId
					  and LVIE_Bru_Vaccination.Vdate=@Date

					 and LVIE_Bru_Vaccination.Village=@Village

end
GO
/****** Object:  StoredProcedure [dbo].[spPageVaccination_GetRecords]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spPageVaccination_GetRecords]
@Date nvarchar(50),
@DistrictId int,
@VfuId varchar(50)
as

 

SELECT      LVIE_Bru_Vaccination.Mob,  LIVE_Bruc_VFUs.Name, LIVE_Bruc_VFUs.FName, LIVE_Bruc_VFUs.Year, LIVE_Bruc_VFUs.DistrictId, LVIE_Bru_Vaccination.Village, LVIE_Bru_Vaccination.Kochi, LVIE_Bru_Vaccination.OName, 
                         LVIE_Bru_Vaccination.Vdate, SUM(LVIE_Bru_Vaccination.Sheep) AS Sheep, SUM(LVIE_Bru_Vaccination.Goat) AS Goat, SUM(LVIE_Bru_Vaccination.Cattle) AS Cattle, LIVE_Bruc_VFUs.VFUId
FROM            LVIE_Bru_Vaccination INNER JOIN
                         LIVE_Bruc_VFUs ON LVIE_Bru_Vaccination.VFUId = LIVE_Bruc_VFUs.VFUId
GROUP BY LIVE_Bruc_VFUs.Name, LIVE_Bruc_VFUs.FName, LIVE_Bruc_VFUs.Year, LIVE_Bruc_VFUs.DistrictId, LVIE_Bru_Vaccination.Village, LVIE_Bru_Vaccination.OName, LVIE_Bru_Vaccination.Vdate, 
                         LIVE_Bruc_VFUs.VFUId,LVIE_Bru_Vaccination.Kochi,LVIE_Bru_Vaccination.Mob
HAVING        (LIVE_Bruc_VFUs.DistrictId = @DistrictId) AND (LIVE_Bruc_VFUs.VFUId = @VfuId) and month(LVIE_Bru_Vaccination.Vdate)=month(cast( @Date as date))
GO
/****** Object:  StoredProcedure [dbo].[spPageVaccination_SaveVaccinationD]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spPageVaccination_SaveVaccinationD]
@VFUId varchar(50),
@VDate nvarchar(50),
@Village nvarchar(50),
@Owner nvarchar(50),
@Sheep float,
@Goat float,
@Cattle float,
@UserId uniqueidentifier,
@ContactNo nvarchar(50),
@Date nvarchar(50)


as


if not exists( select * from LVIE_Bru_Vaccination where LVIE_Bru_Vaccination.VFUId=@VFUId and LVIE_Bru_Vaccination.OName=@Owner)
begin
	declare @kochi bit=null
	 if @Village='Kochi'
	 begin
		set @kochi=1
		set @Village=null
	 end
	INSERT INTO [dbo].[LVIE_Bru_Vaccination]
           ([VFUId]
           ,[Village]
           ,[Kochi]
           ,[OName]
           ,[Vdate]
           ,[Sheep]
           ,[Goat],[Cattle]
           ,[UserId]
           ,[Date],[Mob])
     VALUES
           (@VFUId
           ,@Village		   
           ,@kochi
           ,@Owner
           ,@VDate
           ,@Sheep
           ,@Goat
		   ,@Cattle
           ,@UserId
           ,@Date,@ContactNo)
end
GO
/****** Object:  StoredProcedure [dbo].[spPageVaccination_SaveVFU]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spPageVaccination_SaveVFU]
@Name nvarchar(50),
@FName nvarchar(50),
@Mob nvarchar(50),
@Year int,
@UserId uniqueidentifier,
@Date nvarchar(50),
@DistrictId int,
@Id varchar(50) output
as

if not exists( select * from LIVE_Bruc_VFUs where Name=@Name and DistrictId=@DistrictId)
begin

	declare @VfuId varchar(50)
	set @VfuId=(select count(LIVE_Bruc_VFUs.VFUId)+1 from LIVE_Bruc_VFUs where LIVE_Bruc_VFUs.DistrictId=@DistrictId)
	set @VfuId=CAST(@DistrictId as varchar)+'VFU' +@VfuId
	INSERT INTO [dbo].[LIVE_Bruc_VFUs]
           ([VFUId]
           ,[Name]
           ,[FName]
           ,[Year]
           ,[DistrictId]
           ,[UserId]
           ,[Date])
     VALUES
           (@VfuId
           ,@Name
           ,@FName
           ,@Year
           ,@DistrictId
           ,@UserId
           ,@Date)


set @Id=@VfuId 
end

else 

begin
	set @Id =(select VFUId from LIVE_Bruc_VFUs where Name=@Name and DistrictId=@DistrictId)
end
GO
/****** Object:  StoredProcedure [dbo].[spPageVaccinationGetVFU]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spPageVaccinationGetVFU]
@District int,
@Year int
as

select * from LIVE_Bruc_VFUs where LIVE_Bruc_VFUs.DistrictId=@District and LIVE_Bruc_VFUs.Year=@Year
GO
/****** Object:  StoredProcedure [dbo].[spPageVfusContractExtension_Remove]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[spPageVfusContractExtension_Remove]
@ContractStartDate nvarchar(50),
@ContractEndDate nvarchar(50),
@DistrictId int,
@Date nvarchar(50),
@UserId uniqueidentifier
as


delete [dbo].[LIVE_VFUsContracts]  from [dbo].[LIVE_VFUsContracts] INNER JOIN
                         LIVE_VFUs ON LIVE_VFUsContracts.VfuId = LIVE_VFUs.VfuId  INNER JOIN
                         LIVE_Benef ON LIVE_VFUs.BenefId = LIVE_Benef.BenefId
where   year(cast(LIVE_VFUsContracts.[ContractStartDate] as date))=year(cast(@ContractStartDate as date))
and  year(cast(LIVE_VFUsContracts.ContractEndDate as date))=year(cast(@ContractEndDate as date)) and LIVE_Benef.DistrictId=@DistrictId

GO
/****** Object:  StoredProcedure [dbo].[spPageVfusContractExtension_Save]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[spPageVfusContractExtension_Save]
@VFUId varchar(50),
@ContractStartDate nvarchar(50),
@ContractEndDate nvarchar(50),
@DistrictId int,
@Date nvarchar(50),
@UserId uniqueidentifier
as



INSERT INTO [dbo].[LIVE_VFUsContracts]
           ([VfuId]
           ,[ContractStartDate]
           ,[ContractEndDate]
           ,[Number]
           ,[Date]
           ,[UserId])
     VALUES
           (@VFUId,@ContractStartDate,@ContractEndDate,(select count(*)+1 from LIVE_VFUsContracts where VfuId=@VFUId ),@Date,@UserId)


		    
GO
/****** Object:  StoredProcedure [dbo].[spPageVfusGetDetailById]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spPageVfusGetDetailById]

@VfuId varchar(50)

as

SELECT        LIVE_Benef.Name, LIVE_Benef.FName, LIVE_Benef.Village, LIVE_Benef.Mobile, LIVE_Benef.Gender, LIVE_Benef.DistrictId, LIVE_VFUs.Bank, LIVE_VFUs.ContractEndDate, LIVE_VFUs.ContractStartDate, 
                         LIVE_VFUs.VfuType,LIVE_VFUs.Vfu_Head
FROM            LIVE_VFUs INNER JOIN
                         LIVE_Benef ON LIVE_VFUs.BenefId = LIVE_Benef.BenefId
						 where LIVE_VFUs.VfuId=@VfuId
GO
/****** Object:  StoredProcedure [dbo].[spPageVfusGetVfuContractList]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spPageVfusGetVfuContractList]
@ContStartDate nvarchar(50),
@ContEndDate nvarchar(50),
@DistrictId int
as
SELECT       LIVE_VFUs.VfuId,LIVE_Benef.Name, LIVE_Benef.FName, LIVE_VFUsContracts.ContractStartDate, LIVE_VFUsContracts.ContractEndDate, LIVE_VFUs.Bank,LIVE_Benef.Mobile,case when LIVE_VFUsContracts.VfuId is not null then 'True' else 'False' end as Exist
FROM            LIVE_VFUs left outer JOIN
                         LIVE_VFUsContracts ON LIVE_VFUs.VfuId = LIVE_VFUsContracts.VfuId and  year(cast(LIVE_VFUsContracts.ContractEndDate as date))= year(cast(@ContEndDate as date)) and year(cast(LIVE_VFUsContracts.ContractStartDate as date))= year(cast(@ContStartDate as date))  INNER JOIN
                         LIVE_Benef ON LIVE_VFUs.BenefId = LIVE_Benef.BenefId	
	where LIVE_Benef.DistrictId=@DistrictId and LIVE_VFUs.VfuLevel=1
GO
/****** Object:  StoredProcedure [dbo].[spPageVfusGetVfuList]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spPageVfusGetVfuList]
@DistrictId int,
@Village nvarchar(50),
@VfuType varchar(50),
@year int
as

if @VfuType='Male'
begin
		SELECT        LIVE_VFUs.VfuId, OCM_District.DistrictEngName, LIVE_Benef.Name, LIVE_Benef.FName, LIVE_VFUs.Bank, LIVE_VFUs.ContractEndDate, LIVE_VFUs.ContractStartDate
FROM            LIVE_Benef INNER JOIN
                         OCM_District ON LIVE_Benef.DistrictId = OCM_District.DistrictID INNER JOIN
                         LIVE_VFUs ON LIVE_Benef.BenefId = LIVE_VFUs.BenefId INNER JOIN
                         LIVE_VFUsContracts ON LIVE_VFUs.VfuId = LIVE_VFUsContracts.VfuId
		WHERE        (LIVE_Benef.DistrictId = @DistrictId) AND (LIVE_Benef.Village = @Village) and LIVE_VFUs.VfuLevel=1 and

		 @year between  year (cast (LIVE_VFUsContracts.ContractStartDate as date)) and year(cast(LIVE_VFUsContracts.ContractEndDate as date))

end

else if @VfuType='Female'
begin
		SELECT        LIVE_VFUs.VfuId,OCM_District.DistrictEngName, LIVE_Benef.Name, LIVE_Benef.FName, LIVE_VFUs.Bank, LIVE_VFUs.ContractEndDate, LIVE_VFUs.ContractStartDate,LIVE_VFUs.Vfu_Head
		FROM            LIVE_Benef INNER JOIN
								 OCM_District ON LIVE_Benef.DistrictId = OCM_District.DistrictID INNER JOIN
								 LIVE_VFUs ON LIVE_Benef.BenefId = LIVE_VFUs.BenefId
		WHERE        (LIVE_Benef.DistrictId = @DistrictId) AND (LIVE_Benef.Village = @Village) and LIVE_VFUs.VfuLevel=2 and

		@year between  year (cast (LIVE_VFUs.ContractStartDate as date)) and year(cast(LIVE_VFUs.ContractEndDate as date))

end
GO
/****** Object:  StoredProcedure [dbo].[spPageVfusSave]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spPageVfusSave]
@Name nvarchar(50),
@FName nvarchar(50),
@Gender int,
@ContactNo nvarchar(50)=null,
@UserId uniqueidentifier,
@Date nvarchar(50),
@DistrictId int,
@Village nvarchar(50),
@ContractSDate nvarchar(50),
@ContractEDate nvarchar(50),
@Bank nvarchar(50),
@VfuType varchar(50)=null,
@VfuLevel int,
@VfuHead varchar(50)=null,
@ExtensionType nvarchar(50),
@Vfuexist bit output
as

declare @exist bit ;
declare @benfId varchar(50)
if exists(select lower(Name) from  LIVE_Benef where lower(Name) = lower(@Name) and lower(FName)=lower(@FName) and lower(Village)=lower(@Village) and DistrictId=@DistrictId)
	Begin
	
		set @benfId=(select BenefId from LIVE_Benef where lower(Name) = lower(@Name) and lower(FName)=lower(@FName) and lower(Village)=lower(@Village) and DistrictId=@DistrictId)
		set @exist=1;
	END

Else
	Begin

		
				set @benfId=(select count(Name)+1 from LIVE_Benef where DistrictId=@DistrictId )
				set @benfId=cast( @DistrictId as varchar) +'BEN'+cast( @benfId as varchar)
		
				if(exists(select BenefId from LIVE_Benef where BenefId=@benfId ))
				   begin
						declare @newId varchar(50)
						while(1=1)
							begin
								set @newId=LTRIM(RTRIM((select substring(BenefId,CHARINDEX('N',BenefId,1)+1,LEN(BenefId)) from LIVE_Benef where BenefId=@benfId)))
								set @newId=cast((cast(@newId as int)+1) as nvarchar)
								set @benfId=cast(@DistrictId  as varchar)+'BEN'+cast(@newId  as varchar)
								if(not exists(select BenefId from LIVE_Benef where BenefId=@benfId and DistrictId=@DistrictId))
									begin
										break;
									end
							
							end
				
				   end
				   
				   set @exist=0	
	end


--benf Save

if @exist=0
begin
		INSERT INTO [dbo].[LIVE_Benef]
				   ([BenefId]
				   ,[Name]
				   ,[FName]
				   ,[Mobile]
				   ,[Village]
				   ,[Gender]          
				   ,[DistrictId]
				   ,[UserId]
				   ,[Date])
			 VALUES
				   (@benfId
				   ,@Name
				   ,@FName
				   ,@ContactNo
				   ,@Village
				   ,@Gender
				   ,@DistrictId
				   ,@UserId
				   ,@Date)
END



if exists(select * from LIVE_VFUs where BenefId=@benfId and  @ExtensionType='Male')
begin
	set @Vfuexist=1;
end

else
begin

						declare @VfuId varchar(50)
						set @VfuId=(select count(LIVE_VFUs.VfuId)+1
										FROM LIVE_VFUs INNER JOIN
										 LIVE_Benef ON LIVE_VFUs.BenefId = LIVE_Benef.BenefId where LIVE_Benef.DistrictId=@DistrictId)
						set @VfuId=cast( @DistrictId  as varchar)+CAST('VFU' as varchar) + cast(@VfuId  as varchar)
		
							if(exists(select VfuId from LIVE_VFUs where  VfuId=@VfuId ))
							   begin
									declare @newVFUId varchar(50)
									while(1=1)
										begin
											set @newVFUId=LTRIM(RTRIM((select substring(VfuId,CHARINDEX('U',VfuId,1)+1,LEN(VfuId)) from LIVE_VFUs where VfuId=@VfuId)))
											set @newVFUId=cast((cast(@newVFUId as int)+1) as nvarchar)
											set @VfuId=cast(@DistrictId  as varchar)+'VFU'+cast(@newVFUId  as varchar)
											if(not exists(select VfuId from LIVE_VFUs where VfuId=@VfuId ))
												begin
													break;
												end
							
										end
				
								end

	--declare @VfuId varchar(50)
	--set @VfuId=(select count(LIVE_VFUs.VfuId)+1
	--									FROM LIVE_VFUs INNER JOIN
	--									 LIVE_Benef ON LIVE_VFUs.BenefId = LIVE_Benef.BenefId where LIVE_Benef.DistrictId=@DistrictId)

	--set @VfuId=cast( @DistrictId  as varchar)+CAST('VFU' as varchar) + cast(@VfuId  as varchar)

	--inserting male vfu
	if @ExtensionType='Male' and @benfId is not null
	begin
		INSERT INTO [dbo].[LIVE_VFUs]
				   ([VfuId]
				   ,[BenefId]
				   ,[Bank]
				   ,[ContractStartDate]
				   ,[ContractEndDate]
				   ,[VfuType]
				   ,[VfuLevel]
				   ,[Vfu_Head]
				   ,[UserId]
				   ,[Date])
			 VALUES
				   (@VfuId
				   ,@benfId
				   ,@Bank
				   ,@ContractSDate
				   ,@ContractEDate
				   ,@VfuType
				   ,@VfuLevel
				   ,@VfuHead
				   ,@UserId
				   ,@Date)

				   INSERT INTO [dbo].[LIVE_VFUsContracts]
				   ([VfuId]
				   ,[ContractStartDate]
				   ,[ContractEndDate]
				   ,[Number]
				   ,[Date]
				   ,[UserId])
			 VALUES
				   (@VfuId
				   ,@ContractSDate
				   ,@ContractEDate
				   ,1
				   ,@Date
				   ,@UserId)
				   
		set @Vfuexist=0
		end
	else if @ExtensionType='Female' and @benfId is not null
	begin
		INSERT INTO [dbo].[LIVE_VFUs]
				   ([VfuId]
				   ,[BenefId]
				   ,[Bank]
				   ,[ContractStartDate]
				   ,[ContractEndDate]
				   ,[VfuLevel]
				   ,[Vfu_Head]
				   ,[UserId]
				   ,[Date])
			 VALUES
				   (@VfuId
				   ,@benfId
				   ,@Bank
				   ,@ContractSDate
				   ,@ContractEDate
				   ,@VfuLevel
				   ,@VfuHead
				   ,@UserId
				   ,@Date)
		set @Vfuexist=0
	end

	
end
GO
/****** Object:  StoredProcedure [dbo].[spPageVfuUpdate]    Script Date: 6/24/2022 10:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spPageVfuUpdate]
@VfuId varchar(50),
@FName nvarchar(50),
@Gender int,
@ContactNo nvarchar(50)=null,
@UserId uniqueidentifier,
@Date nvarchar(50),
@DistrictId varchar(50),
@Village nvarchar(50),
@ContractSDate nvarchar(50),
@ContractEDate nvarchar(50),
@Bank nvarchar(50),
@VfuType varchar(50)= null,
@ExtensionType nvarchar(50),
@VfuHead varchar(50)=null
as


declare @BenefId varchar(50)
set @BenefId=(select [BenefId] from [dbo].[LIVE_VFUs] where [VfuId]=@VfuId)

if @BenefId is not null
begin

		UPDATE [dbo].[LIVE_Benef]
		   SET [FName] = @FName
			  ,[Mobile] = @ContactNo
			  ,[Gender] = @Gender
			  ,[UpdatedBy] =@UserId
			  ,[UpdationDate] = @Date
		 WHERE [BenefId] = @BenefId and DistrictId=@DistrictId and Village=@Village

end
      
if @ExtensionType='Male'
begin
UPDATE [dbo].[LIVE_VFUs]
   SET [Bank] =@Bank
      ,[ContractStartDate] = @ContractSDate
      ,[ContractEndDate] = @ContractEDate
      ,[VfuType] = @VfuType,
	  UpdatedBy=@UserId,
	  UpdationDate=@Date
      
 WHERE [VfuId]=@VfuId

 UPDATE [dbo].[LIVE_VFUsContracts]
   SET
      [ContractStartDate] = @ContractSDate
      ,[ContractEndDate] = @ContractEDate
      
      ,[Date] = @Date
      ,[UserId] = @UserId
 WHERE Number=1 and VfuId=@VfuId

end

else if @ExtensionType='Female'
begin
UPDATE [dbo].[LIVE_VFUs]
   SET [Bank] =@Bank
      ,[ContractStartDate] = @ContractSDate
      ,[ContractEndDate] = @ContractEDate
      ,[Vfu_Head] = @VfuHead,
	  UpdatedBy=@UserId,
	  UpdationDate=@Date
      
 WHERE [VfuId]=@VfuId
end
GO
USE [master]
GO
ALTER DATABASE [LiveSDB] SET  READ_WRITE 
GO
