USE [master]
GO
/****** Object:  Database [acm_ScratchDB]    Script Date: 2/2/2022 3:35:33 PM ******/
CREATE DATABASE [acm_ScratchDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'acm_ScratchDB', FILENAME = N'd:\mssql\data\acm_ScratchDB.mdf' , SIZE = 372736KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'acm_ScratchDB_log', FILENAME = N'd:\mssql\logs\acm_ScratchDB_log.ldf' , SIZE = 221184KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [acm_ScratchDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [acm_ScratchDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [acm_ScratchDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [acm_ScratchDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [acm_ScratchDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [acm_ScratchDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [acm_ScratchDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [acm_ScratchDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [acm_ScratchDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [acm_ScratchDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [acm_ScratchDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [acm_ScratchDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [acm_ScratchDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [acm_ScratchDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [acm_ScratchDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [acm_ScratchDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [acm_ScratchDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [acm_ScratchDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [acm_ScratchDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [acm_ScratchDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [acm_ScratchDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [acm_ScratchDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [acm_ScratchDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [acm_ScratchDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [acm_ScratchDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [acm_ScratchDB] SET  MULTI_USER 
GO
ALTER DATABASE [acm_ScratchDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [acm_ScratchDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [acm_ScratchDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [acm_ScratchDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [acm_ScratchDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'acm_ScratchDB', N'ON'
GO
ALTER DATABASE [acm_ScratchDB] SET QUERY_STORE = OFF
GO
USE [acm_ScratchDB]
GO
/****** Object:  User [CORPORATE\srv-SQLMPLowPriv]    Script Date: 2/2/2022 3:35:33 PM ******/
CREATE USER [CORPORATE\srv-SQLMPLowPriv] FOR LOGIN [CORPORATE\srv-SQLMPLowPriv] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CORPORATE\dks0275953]    Script Date: 2/2/2022 3:35:33 PM ******/
CREATE USER [CORPORATE\dks0275953] FOR LOGIN [CORPORATE\DKS0275953] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CORPORATE\DBA_Support-SQL]    Script Date: 2/2/2022 3:35:33 PM ******/
CREATE USER [CORPORATE\DBA_Support-SQL] FOR LOGIN [CORPORATE\DBA_Support-SQL]
GO
/****** Object:  DatabaseRole [db_service]    Script Date: 2/2/2022 3:35:33 PM ******/
CREATE ROLE [db_service]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [CORPORATE\dks0275953]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [CORPORATE\dks0275953]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [CORPORATE\dks0275953]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [CORPORATE\dks0275953]
GO
ALTER ROLE [db_datareader] ADD MEMBER [CORPORATE\dks0275953]
GO
ALTER ROLE [db_datareader] ADD MEMBER [CORPORATE\DBA_Support-SQL]
GO
/****** Object:  PartitionFunction [pf_ACTIVEMQ_MSG_EVENT_Daily]    Script Date: 2/2/2022 3:35:33 PM ******/
CREATE PARTITION FUNCTION [pf_ACTIVEMQ_MSG_EVENT_Daily](datetime) AS RANGE RIGHT FOR VALUES (N'2018-04-02T00:00:00.000', N'2018-04-03T00:00:00.000', N'2018-04-04T00:00:00.000', N'2018-04-05T00:00:00.000', N'2018-04-06T00:00:00.000', N'2018-04-07T00:00:00.000', N'2018-04-08T00:00:00.000', N'2018-04-09T00:00:00.000', N'2018-04-10T00:00:00.000', N'2018-04-11T00:00:00.000', N'2018-04-12T00:00:00.000', N'2018-04-13T00:00:00.000', N'2018-04-14T00:00:00.000', N'2018-04-15T00:00:00.000', N'2018-04-16T00:00:00.000', N'2018-04-17T00:00:00.000', N'2018-04-18T00:00:00.000', N'2018-04-19T00:00:00.000', N'2018-04-20T00:00:00.000', N'2018-04-21T00:00:00.000', N'2018-04-22T00:00:00.000', N'2018-04-23T00:00:00.000', N'2018-04-24T00:00:00.000', N'2018-04-25T00:00:00.000', N'2018-04-26T00:00:00.000', N'2018-04-27T00:00:00.000', N'2018-04-28T00:00:00.000', N'2018-04-29T00:00:00.000', N'2018-04-30T00:00:00.000', N'2018-05-01T00:00:00.000', N'2018-05-02T00:00:00.000', N'2018-05-03T00:00:00.000', N'2018-05-04T00:00:00.000', N'2018-05-05T00:00:00.000', N'2018-05-06T00:00:00.000', N'2018-05-07T00:00:00.000', N'2018-05-08T00:00:00.000', N'2018-05-09T00:00:00.000', N'2018-05-10T00:00:00.000', N'2018-05-11T00:00:00.000', N'2018-05-12T00:00:00.000', N'2018-05-13T00:00:00.000', N'2018-05-14T00:00:00.000', N'2018-05-15T00:00:00.000', N'2018-05-16T00:00:00.000', N'2018-05-17T00:00:00.000', N'2018-05-18T00:00:00.000', N'2018-05-19T00:00:00.000', N'2018-05-20T00:00:00.000', N'2018-05-21T00:00:00.000', N'2018-05-22T00:00:00.000', N'2018-05-23T00:00:00.000', N'2018-05-24T00:00:00.000', N'2018-05-25T00:00:00.000', N'2018-05-26T00:00:00.000', N'2018-05-27T00:00:00.000', N'2018-05-28T00:00:00.000', N'2018-05-29T00:00:00.000', N'2018-05-30T00:00:00.000', N'2018-05-31T00:00:00.000', N'2018-06-01T00:00:00.000', N'2018-06-02T00:00:00.000', N'2018-06-03T00:00:00.000', N'2018-06-04T00:00:00.000', N'2018-06-05T00:00:00.000', N'2018-06-06T00:00:00.000', N'2018-06-07T00:00:00.000', N'2018-06-08T00:00:00.000', N'2018-06-09T00:00:00.000', N'2018-06-10T00:00:00.000', N'2018-06-11T00:00:00.000', N'2018-06-12T00:00:00.000', N'2018-06-13T00:00:00.000', N'2018-06-14T00:00:00.000', N'2018-06-15T00:00:00.000', N'2018-06-16T00:00:00.000', N'2018-06-17T00:00:00.000', N'2018-06-18T00:00:00.000', N'2018-06-19T00:00:00.000', N'2018-06-20T00:00:00.000', N'2018-06-21T00:00:00.000', N'2018-06-22T00:00:00.000', N'2018-06-23T00:00:00.000', N'2018-06-24T00:00:00.000', N'2018-06-25T00:00:00.000', N'2018-06-26T00:00:00.000', N'2018-06-27T00:00:00.000', N'2018-06-28T00:00:00.000', N'2018-06-29T00:00:00.000', N'2018-06-30T00:00:00.000', N'2018-07-01T00:00:00.000', N'2018-07-02T00:00:00.000', N'2018-07-03T00:00:00.000', N'2018-07-04T00:00:00.000', N'2018-07-05T00:00:00.000', N'2018-07-06T00:00:00.000', N'2018-07-07T00:00:00.000', N'2018-07-08T00:00:00.000', N'2018-07-09T00:00:00.000', N'2018-07-10T00:00:00.000', N'2018-07-11T00:00:00.000', N'2018-07-12T00:00:00.000', N'2018-07-13T00:00:00.000', N'2018-07-14T00:00:00.000', N'2018-07-15T00:00:00.000', N'2018-07-16T00:00:00.000', N'2018-07-17T00:00:00.000', N'2018-07-18T00:00:00.000', N'2018-07-19T00:00:00.000', N'2018-07-20T00:00:00.000', N'2018-07-21T00:00:00.000', N'2018-07-22T00:00:00.000', N'2018-07-23T00:00:00.000', N'2018-07-24T00:00:00.000', N'2018-07-25T00:00:00.000', N'2018-07-26T00:00:00.000', N'2018-07-27T00:00:00.000', N'2018-07-28T00:00:00.000', N'2018-07-29T00:00:00.000', N'2018-07-30T00:00:00.000', N'2018-07-31T00:00:00.000', N'2018-08-01T00:00:00.000', N'2018-08-02T00:00:00.000', N'2018-08-03T00:00:00.000', N'2018-08-04T00:00:00.000', N'2018-08-05T00:00:00.000')
GO
/****** Object:  PartitionFunction [pf_PartitionByStoreNumber]    Script Date: 2/2/2022 3:35:33 PM ******/
CREATE PARTITION FUNCTION [pf_PartitionByStoreNumber](int) AS RANGE LEFT FOR VALUES (1, 51, 101, 151, 201, 251, 301, 351, 401, 451, 501, 551, 601, 651, 701, 751, 801, 851, 901, 951, 1001, 1051, 1101, 1151, 1201, 1251, 1301, 1351, 1401, 1451, 1501, 1551, 1601, 1651, 1701, 1751, 1801, 1851, 1901, 1951, 2001, 2051, 2101, 2151, 2201, 2251, 2301, 2351, 2401, 2451, 2501, 2551, 2601, 2651, 2701, 2751, 2801, 2851, 2901, 2951, 3001, 3051, 3101, 3151, 3201, 3251, 3301, 3351, 3401, 3451, 3501, 3551, 3601, 3651, 3701, 3751, 3801, 3851, 3901, 3951, 4001, 4051, 4101, 4151, 4201, 4251, 4301, 4351, 4401, 4451, 4501, 4551, 4601, 4651, 4701, 4751, 4801, 4851, 4901, 4951, 5001, 5051, 5101, 5151, 5201, 5251, 5301, 5351, 5401, 5451, 5501, 5551, 5601, 5651, 5701, 5751, 5801, 5851, 5901, 5951, 6001)
GO
/****** Object:  PartitionFunction [pf_tblEvents_Daily]    Script Date: 2/2/2022 3:35:33 PM ******/
CREATE PARTITION FUNCTION [pf_tblEvents_Daily](datetime) AS RANGE RIGHT FOR VALUES (N'2018-04-02T00:00:00.000', N'2018-04-03T00:00:00.000', N'2018-04-04T00:00:00.000', N'2018-04-05T00:00:00.000', N'2018-04-06T00:00:00.000', N'2018-04-07T00:00:00.000', N'2018-04-08T00:00:00.000', N'2018-04-09T00:00:00.000', N'2018-04-10T00:00:00.000', N'2018-04-11T00:00:00.000', N'2018-04-12T00:00:00.000', N'2018-04-13T00:00:00.000', N'2018-04-14T00:00:00.000', N'2018-04-15T00:00:00.000', N'2018-04-16T00:00:00.000', N'2018-04-17T00:00:00.000', N'2018-04-18T00:00:00.000', N'2018-04-19T00:00:00.000', N'2018-04-20T00:00:00.000', N'2018-04-21T00:00:00.000', N'2018-04-22T00:00:00.000', N'2018-04-23T00:00:00.000', N'2018-04-24T00:00:00.000', N'2018-04-25T00:00:00.000', N'2018-04-26T00:00:00.000', N'2018-04-27T00:00:00.000', N'2018-04-28T00:00:00.000', N'2018-04-29T00:00:00.000', N'2018-04-30T00:00:00.000', N'2018-05-01T00:00:00.000', N'2018-05-02T00:00:00.000', N'2018-05-03T00:00:00.000', N'2018-05-04T00:00:00.000', N'2018-05-05T00:00:00.000', N'2018-05-06T00:00:00.000', N'2018-05-07T00:00:00.000', N'2018-05-08T00:00:00.000', N'2018-05-09T00:00:00.000', N'2018-05-10T00:00:00.000', N'2018-05-11T00:00:00.000', N'2018-05-12T00:00:00.000', N'2018-05-13T00:00:00.000', N'2018-05-14T00:00:00.000', N'2018-05-15T00:00:00.000', N'2018-05-16T00:00:00.000', N'2018-05-17T00:00:00.000', N'2018-05-18T00:00:00.000', N'2018-05-19T00:00:00.000', N'2018-05-20T00:00:00.000', N'2018-05-21T00:00:00.000', N'2018-05-22T00:00:00.000', N'2018-05-23T00:00:00.000', N'2018-05-24T00:00:00.000', N'2018-05-25T00:00:00.000', N'2018-05-26T00:00:00.000', N'2018-05-27T00:00:00.000', N'2018-05-28T00:00:00.000', N'2018-05-29T00:00:00.000', N'2018-05-30T00:00:00.000', N'2018-05-31T00:00:00.000', N'2018-06-01T00:00:00.000')
GO
/****** Object:  PartitionFunction [pf_tblPartTest_Daily]    Script Date: 2/2/2022 3:35:33 PM ******/
CREATE PARTITION FUNCTION [pf_tblPartTest_Daily](datetime) AS RANGE RIGHT FOR VALUES (N'2018-06-06T00:00:00.000')
GO
/****** Object:  PartitionScheme [ps_ACTIVEMQ_MSG_EVENT_Daily]    Script Date: 2/2/2022 3:35:33 PM ******/
CREATE PARTITION SCHEME [ps_ACTIVEMQ_MSG_EVENT_Daily] AS PARTITION [pf_ACTIVEMQ_MSG_EVENT_Daily] TO ([PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY])
GO
/****** Object:  PartitionScheme [ps_StoreSkuHeader]    Script Date: 2/2/2022 3:35:33 PM ******/
CREATE PARTITION SCHEME [ps_StoreSkuHeader] AS PARTITION [pf_PartitionByStoreNumber] TO ([PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY])
GO
/****** Object:  PartitionScheme [ps_tblEvents_Daily]    Script Date: 2/2/2022 3:35:33 PM ******/
CREATE PARTITION SCHEME [ps_tblEvents_Daily] AS PARTITION [pf_tblEvents_Daily] TO ([PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY])
GO
/****** Object:  PartitionScheme [ps_tblPartTest_Daily]    Script Date: 2/2/2022 3:35:33 PM ******/
CREATE PARTITION SCHEME [ps_tblPartTest_Daily] AS PARTITION [pf_tblPartTest_Daily] TO ([PRIMARY], [PRIMARY], [PRIMARY])
GO
/****** Object:  UserDefinedFunction [dbo].[f0_Decrypt]    Script Date: 2/2/2022 3:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[f0_Decrypt] (@Instr VARCHAR(MAX))
RETURNS VARCHAR(MAX)
AS
BEGIN
	--Declare temp variables used throughout the function.
	DECLARE @CleanInStr	VARCHAR(MAX)	= @InStr;
	DECLARE @LenStr		INT				= LEN(@CleanInStr);
	DECLARE @Pair		CHAR(2);
	DECLARE @OutStr		VARCHAR(MAX)	= '';

	--Loop through each pair of characters in the string.
	WHILE @LenStr > 0
	BEGIN
		--Capture the first pair of characters in the string.
		SELECT @Pair = UPPER(LEFT(@CleanInStr,2));

		--Map the pair to the decrypted pair and append to the function output.
		SELECT @OutStr = @OutStr + vcCharSetOrig FROM dbo.tblCharMap WITH (NOLOCK) WHERE vcCharSetTarg = @Pair;

		--Remove the first pair of characters in the string.
		SET @CleanInStr = SUBSTRING(@CleanInStr,3,LEN(@CleanInStr));

		--Capture the new length of the string to decrypt.
		SET @LenStr = LEN(@CleanInStr);
	END

	--Return the decrypted string.
	RETURN @OutStr;
END
GO
/****** Object:  UserDefinedFunction [dbo].[f0_Encrypt]    Script Date: 2/2/2022 3:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[f0_Encrypt] (@Instr VARCHAR(MAX))
RETURNS VARCHAR(MAX)
AS
BEGIN
	--Declare temp variables used throughout the function.
	DECLARE @CleanInStr	VARCHAR(MAX)	= REPLACE(REPLACE(REPLACE(@InStr,' ','_'),CHAR(13),'_'),CHAR(10),'_');
	DECLARE @LenStr		INT				= LEN(@CleanInStr);
	DECLARE @Pair		CHAR(2);
	DECLARE @OutStr		VARCHAR(MAX)	= '';

	--Loop through each pair of characters in the string.
	WHILE @LenStr > 0
	BEGIN
		--Capture the first pair of characters in the string.
		SELECT @Pair = UPPER(LEFT(@CleanInStr,2));

		--Map the pair to the encrypted pair and append to the function output.
		SELECT 	@OutStr = @OutStr + vcCharSetTarg FROM dbo.tblCharMap WITH (NOLOCK) WHERE vcCharSetOrig = @Pair;

		--Remove the first pair of characters in the string.
		SET @CleanInStr = SUBSTRING(@CleanInStr,3,LEN(@CleanInStr));

		--Capture the new length of the string to encrypt.
		SET @LenStr = LEN(@CleanInStr);
	END

	--Return the encrypted string.
	RETURN @OutStr;
END;
GO
/****** Object:  Table [dbo].[tblChars]    Script Date: 2/2/2022 3:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblChars](
	[iCharID] [int] IDENTITY(1,1) NOT NULL,
	[cChar] [char](1) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v0_2CharMap]    Script Date: 2/2/2022 3:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v0_2CharMap]
AS
SELECT DISTINCT
	a.cChar + b.cChar cCharPair
FROM 
	tblChars a, tblChars b;
GO
/****** Object:  Table [dbo].[directory_trace]    Script Date: 2/2/2022 3:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[directory_trace](
	[RowNumber] [int] IDENTITY(0,1) NOT NULL,
	[EventClass] [int] NULL,
	[HostName] [nvarchar](128) NULL,
	[LoginName] [nvarchar](128) NULL,
	[ApplicationName] [nvarchar](128) NULL,
	[SPID] [int] NULL,
	[DatabaseID] [int] NULL,
	[DatabaseName] [nvarchar](128) NULL,
	[TextData] [ntext] NULL,
	[CPU] [int] NULL,
	[Reads] [bigint] NULL,
	[Writes] [bigint] NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[Duration] [bigint] NULL,
	[Error] [int] NULL,
	[BinaryData] [image] NULL,
PRIMARY KEY CLUSTERED 
(
	[RowNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[directory_trace2]    Script Date: 2/2/2022 3:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[directory_trace2](
	[RowNumber] [int] IDENTITY(0,1) NOT NULL,
	[EventClass] [int] NULL,
	[HostName] [nvarchar](128) NULL,
	[LoginName] [nvarchar](128) NULL,
	[ApplicationName] [nvarchar](128) NULL,
	[SPID] [int] NULL,
	[DatabaseID] [int] NULL,
	[DatabaseName] [nvarchar](128) NULL,
	[TextData] [ntext] NULL,
	[CPU] [int] NULL,
	[Reads] [bigint] NULL,
	[Writes] [bigint] NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[Duration] [bigint] NULL,
	[Error] [int] NULL,
	[BinaryData] [image] NULL,
PRIMARY KEY CLUSTERED 
(
	[RowNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[eem1394]    Script Date: 2/2/2022 3:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[eem1394](
	[RowNumber] [int] IDENTITY(0,1) NOT NULL,
	[EventClass] [int] NULL,
	[TextData] [ntext] NULL,
	[ApplicationName] [nvarchar](128) NULL,
	[LoginName] [nvarchar](128) NULL,
	[CPU] [int] NULL,
	[Reads] [bigint] NULL,
	[Writes] [bigint] NULL,
	[Duration] [bigint] NULL,
	[SPID] [int] NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[DatabaseID] [int] NULL,
	[Error] [int] NULL,
	[BinaryData] [image] NULL,
PRIMARY KEY CLUSTERED 
(
	[RowNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Latest]    Script Date: 2/2/2022 3:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Latest](
	[RowNumber] [int] IDENTITY(0,1) NOT NULL,
	[EventClass] [int] NULL,
	[LoginName] [nvarchar](128) NULL,
	[TextData] [ntext] NULL,
	[ApplicationName] [nvarchar](128) NULL,
	[HostName] [nvarchar](128) NULL,
	[SPID] [int] NULL,
	[DatabaseID] [int] NULL,
	[DatabaseName] [nvarchar](128) NULL,
	[CPU] [int] NULL,
	[Reads] [bigint] NULL,
	[Writes] [bigint] NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[Duration] [bigint] NULL,
	[Error] [int] NULL,
	[BinaryData] [image] NULL,
PRIMARY KEY CLUSTERED 
(
	[RowNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MW_010419]    Script Date: 2/2/2022 3:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MW_010419](
	[RowNumber] [int] IDENTITY(0,1) NOT NULL,
	[EventClass] [int] NULL,
	[LoginName] [nvarchar](128) NULL,
	[TextData] [ntext] NULL,
	[ApplicationName] [nvarchar](128) NULL,
	[HostName] [nvarchar](128) NULL,
	[SPID] [int] NULL,
	[DatabaseID] [int] NULL,
	[DatabaseName] [nvarchar](128) NULL,
	[CPU] [int] NULL,
	[Reads] [bigint] NULL,
	[Writes] [bigint] NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[Duration] [bigint] NULL,
	[Error] [int] NULL,
	[BinaryData] [image] NULL,
PRIMARY KEY CLUSTERED 
(
	[RowNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SCORCH_SCOMApprove]    Script Date: 2/2/2022 3:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SCORCH_SCOMApprove](
	[ServerName] [varchar](max) NULL,
	[Description] [varchar](max) NULL,
	[Status] [varchar](max) NULL,
	[jobRunID] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stage_StoreInfo]    Script Date: 2/2/2022 3:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stage_StoreInfo](
	[StoreID] [nvarchar](max) NULL,
	[StoreName] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoreInfo]    Script Date: 2/2/2022 3:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreInfo](
	[StoreID] [nvarchar](max) NULL,
	[StoreName] [nvarchar](max) NULL,
	[HW_Platform] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoreSkuHeader]    Script Date: 2/2/2022 3:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreSkuHeader](
	[StoreSkuID] [bigint] IDENTITY(1,1) NOT NULL,
	[StoreNumber] [int] NOT NULL,
	[SKU] [varchar](15) NOT NULL,
	[DateAdded] [datetime] NOT NULL,
	[AddedBy] [varchar](50) NOT NULL,
 CONSTRAINT [PK_StoreSkuHeader] PRIMARY KEY NONCLUSTERED 
(
	[StoreSkuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Store]    Script Date: 2/2/2022 3:35:33 PM ******/
CREATE CLUSTERED INDEX [IX_Store] ON [dbo].[StoreSkuHeader]
(
	[StoreNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoreSkuHeader_Partitioned]    Script Date: 2/2/2022 3:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreSkuHeader_Partitioned](
	[StoreSkuID] [bigint] IDENTITY(1,1) NOT NULL,
	[StoreNumber] [int] NOT NULL,
	[SKU] [varchar](15) NOT NULL,
	[DateAdded] [datetime] NOT NULL,
	[AddedBy] [varchar](50) NOT NULL,
 CONSTRAINT [PK_StoreSkuHeader_Partitioned] PRIMARY KEY NONCLUSTERED 
(
	[StoreSkuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [ps_StoreSkuHeader]([StoreNumber])
GO
/****** Object:  Index [IX_Store]    Script Date: 2/2/2022 3:35:33 PM ******/
CREATE CLUSTERED INDEX [IX_Store] ON [dbo].[StoreSkuHeader_Partitioned]
(
	[StoreNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [ps_StoreSkuHeader]([StoreNumber])
GO
/****** Object:  Table [dbo].[tblAutoSQL_Audit]    Script Date: 2/2/2022 3:35:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAutoSQL_Audit](
	[iAuditID] [int] IDENTITY(1,1) NOT NULL,
	[vcWorkOrderNbr] [char](10) NULL,
	[vcUserName] [varchar](50) NULL,
	[vcEmailAddr] [varchar](50) NULL,
	[vcScriptName] [varchar](255) NULL,
	[vcScriptText] [varchar](max) NULL,
	[vcSQLInstance] [varchar](50) NULL,
	[vcDatabase] [varchar](255) NULL,
	[vcWorkOrderStatus] [varchar](50) NULL,
	[vcFinalResult] [char](10) NULL,
	[vcFailureStep] [varchar](max) NULL,
	[vcFailureMessage] [varchar](max) NULL,
	[dtAuditDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tblAutoSQL_Audit] PRIMARY KEY CLUSTERED 
(
	[iAuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCharMap]    Script Date: 2/2/2022 3:35:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCharMap](
	[iCharMapID] [bigint] IDENTITY(1,1) NOT NULL,
	[vcCharSetOrig] [varchar](2) NOT NULL,
	[vcCharSetTarg] [varchar](2) NOT NULL,
 CONSTRAINT [PK_tblCharMap] PRIMARY KEY CLUSTERED 
(
	[iCharMapID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPartTest]    Script Date: 2/2/2022 3:35:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPartTest](
	[iID] [int] IDENTITY(1,1) NOT NULL,
	[dtCreateDate] [datetime] NULL,
	[vcNotes] [varchar](max) NULL,
 CONSTRAINT [PK_tblPartTest] PRIMARY KEY NONCLUSTERED 
(
	[iID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [ps_tblPartTest_Daily]([dtCreateDate])
GO
/****** Object:  Table [dbo].[tblStatusInfo]    Script Date: 2/2/2022 3:35:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStatusInfo](
	[iStatusID] [int] NOT NULL,
	[vcStatusDescription] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblStatusInfo] PRIMARY KEY CLUSTERED 
(
	[iStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTest]    Script Date: 2/2/2022 3:35:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTest](
	[testfield1] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblWorkOrder]    Script Date: 2/2/2022 3:35:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblWorkOrder](
	[iID] [int] IDENTITY(1,1) NOT NULL,
	[vcWorkOrder] [char](10) NOT NULL,
	[vcUserName] [varchar](50) NOT NULL,
	[vcEmailAddr] [varchar](50) NOT NULL,
	[vcScriptName] [varchar](255) NOT NULL,
	[vcSQLInstance] [varchar](50) NOT NULL,
	[vcDatabase] [varchar](255) NOT NULL,
	[vcStatus] [varchar](50) NULL,
 CONSTRAINT [PK_tblWorkOrder] PRIMARY KEY CLUSTERED 
(
	[iID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SKU]    Script Date: 2/2/2022 3:35:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_SKU] ON [dbo].[StoreSkuHeader]
(
	[SKU] ASC
)
INCLUDE([StoreSkuID],[StoreNumber]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_StoreNumberSku]    Script Date: 2/2/2022 3:35:34 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_StoreNumberSku] ON [dbo].[StoreSkuHeader]
(
	[StoreNumber] ASC,
	[SKU] ASC
)
INCLUDE([StoreSkuID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SKU]    Script Date: 2/2/2022 3:35:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_SKU] ON [dbo].[StoreSkuHeader_Partitioned]
(
	[SKU] ASC
)
INCLUDE([StoreSkuID],[StoreNumber]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_StoreNumberSku]    Script Date: 2/2/2022 3:35:34 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_StoreNumberSku] ON [dbo].[StoreSkuHeader_Partitioned]
(
	[StoreNumber] ASC,
	[SKU] ASC
)
INCLUDE([StoreSkuID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [ps_StoreSkuHeader]([StoreNumber])
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_OrigTarg]    Script Date: 2/2/2022 3:35:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrigTarg] ON [dbo].[tblCharMap]
(
	[vcCharSetOrig] ASC
)
INCLUDE([vcCharSetTarg]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TargOrig]    Script Date: 2/2/2022 3:35:34 PM ******/
CREATE NONCLUSTERED INDEX [IX_TargOrig] ON [dbo].[tblCharMap]
(
	[vcCharSetTarg] ASC
)
INCLUDE([vcCharSetOrig]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAutoSQL_Audit] ADD  CONSTRAINT [DF_tblAutoSQL_Audit_dtAuditDateTime]  DEFAULT (getdate()) FOR [dtAuditDateTime]
GO
/****** Object:  StoredProcedure [dbo].[s0_CreateGameGrid]    Script Date: 2/2/2022 3:35:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[s0_CreateGameGrid]
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @tbl TABLE (iID INT IDENTITY(1,1),cAlpha CHAR(1));
	INSERT INTO @tbl(cAlpha)
	VALUES ('a'),('b'),('c'),('d'),('e'),('f'),('g'),('h')
	,('i'),('j'),('k'),('l'),('m'),('n'),('o'),('p'),('q')
	,('r'),('s'),('t'),('u'),('v'),('w'),('x'),('y'),('z');

	DECLARE @curr_alphaid	SMALLINT = 1;
	DECLARE @min_alphaid	SMALLINT = 1;
	DECLARE @max_alphaid	SMALLINT = 4;
	DECLARE @curr_alpha		CHAR(1);

	DECLARE @min_num		SMALLINT = 1;
	DECLARE @max_num		SMALLINT = 4;
	DECLARE @curr_num		SMALLINT = 1;

	DECLARE @UP				VARCHAR(20);
	DECLARE @DOWN			VARCHAR(20);
	DECLARE @LEFT			VARCHAR(20);
	DECLARE @RIGHT			VARCHAR(20);

	/*  Sample Map
		 a1  a2  a3  a4
		-----------------
	a1	|	|	|	|	| a4
		-----------------
	b1	|	|	|	|	| b4
		-----------------
	c1	|	|	|	|	| c4
		-----------------
	d1	|	|	|	|	| d4
		-----------------
		 d1  d2  d3  d4
	*/

	WHILE @curr_alphaid <= @max_alphaid
	BEGIN
		WHILE @curr_num <= @max_num
		BEGIN
			SELECT @curr_alpha	= cAlpha FROM @tbl WHERE iID = @curr_alphaid;

			SELECT
				@UP = CASE
						WHEN @curr_alphaid = @min_alphaid THEN ''
						ELSE (SELECT cAlpha FROM @tbl WHERE iID = @curr_alphaid-1) + CAST(@curr_num as VARCHAR)
					END,
				@DOWN = CASE
						WHEN @curr_alphaid = @max_alphaid THEN ''
						ELSE (SELECT cAlpha FROM @tbl WHERE iID = @curr_alphaid+1) + CAST(@curr_num as VARCHAR)
					END,
				@LEFT = CASE
						WHEN @curr_num = @min_num THEN ''
						ELSE (SELECT cAlpha FROM @tbl WHERE iID = @curr_alphaid) + CAST(@curr_num-1 as VARCHAR)
					END,
				@RIGHT = CASE
						WHEN @curr_num = @max_num THEN ''
						ELSE (SELECT cAlpha FROM @tbl WHERE iID = @curr_alphaid) + CAST(@curr_num+1 as VARCHAR)
					END

			PRINT ('	'''+@curr_alpha + cast(@curr_num as VARCHAR)+''': {');
			PRINT ('		ZONENAME:'''',');
			PRINT ('		DESCRIPTION:'''',');
			PRINT ('		EXAMINATION:'''',');
			PRINT ('		SOLVED:False,');
			PRINT ('		UP:''' + @UP + ''',');
			PRINT ('		DOWN:''' +@DOWN + ''',');
			PRINT ('		LEFT:''' + @LEFT + ''',');
			PRINT ('		RIGHT:''' + @RIGHT + ''',');
			PRINT ('	},');

			SET @curr_num	= @curr_num + 1;
		END

		SET @curr_num		= 1;

		SET @curr_alphaid	= @curr_alphaid + 1;
	END


END
GO
/****** Object:  StoredProcedure [dbo].[s0_MontyHall]    Script Date: 2/2/2022 3:35:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[s0_MontyHall]
	@ChangeDoor	CHAR(1) = 'Y'
	,@TestCnt	INT		= 100000
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @ObjectDoor INT;
	DECLARE @OrigContestDoor INT;
	DECLARE @FinalContestantDoor INT;
	DECLARE @TblDoors TABLE (DoorID INT);
	DECLARE @LoopID INT;
	DECLARE @tblResults TABLE (ObjectDoor INT, OriginalContestantDoor INT, FinalContestantDoor INT, FinalResult CHAR(6));
	DECLARE @StartTime DATETIME;
	DECLARE @EndTime DATETIME;

	SET @StartTime = GETDATE();
	SET @LoopID = 1;

	--_Repeat Test n Times.  n = @TestCnt.
	WHILE @LoopID <= @TestCnt
	BEGIN
		--Destroy the doors.
		DELETE @TblDoors;
		
		--Rebuild the doors.
		INSERT INTO @tblDoors (DoorID)
		VALUES(1),(2),(3);

		--Place the Object in a Random Door
		SELECT @ObjectDoor = FLOOR(RAND(CHECKSUM(NEWID()))*(4-1)+1);

		--Contestant Chooses Random Door
		SELECT @OrigContestDoor = FLOOR(RAND(CHECKSUM(NEWID()))*(4-1)+1);

		--Randomly Remove a door (that does not contain the object or that the contestant hasn't chosen).
		IF (SELECT FLOOR(RAND(CHECKSUM(NEWID()))*(3-1)+1)) = 1
			DELETE @tblDoors WHERE DoorID IN (SELECT MIN(DoorID) FROM @tbldoors WHERE doorid NOT IN (@ObjectDoor,@OrigContestDoor));
		ELSE
			DELETE @tblDoors WHERE DoorID IN (SELECT MAX(DoorID) FROM @tbldoors WHERE doorid NOT IN (@ObjectDoor,@OrigContestDoor));
		
		--Set Final Door Selection based on whether contestant changes door or not.
		IF @ChangeDoor = 'Y'
			SELECT @FinalContestantDoor = DoorID FROM @tblDoors WHERE DoorID <> @OrigContestDoor;
		ELSE
			SET @FinalContestantDoor = @OrigContestDoor;

		--Record the Results
		IF @FinalContestantDoor = @ObjectDoor
			INSERT INTO @tblResults
			SELECT
				@ObjectDoor ObjectDoor,
				@OrigContestDoor OriginalContestantDoor,
				@FinalContestantDoor FinalContestantDoor,
				'Winner' FinalResult;
		ELSE
			INSERT INTO @tblResults
			SELECT
				@ObjectDoor ObjectDoor,
				@OrigContestDoor OriginalContestantDoor,
				@FinalContestantDoor FinalContestantDoor,
				'Loser' FinalResult;
		
		--Increment Counter for Next Test
		SET @LoopID = @LoopID + 1;
	END

	SET @EndTime = GETDATE();

	PRINT ('Start Time:				' + CONVERT(CHAR(19),@StartTime,121));
	PRINT ('End Time:				' + CONVERT(CHAR(19),@EndTime,121));
	PRINT ('Total Execution Time:	' + CONVERT(VARCHAR,DATEDIFF(ss,@StartTime,@EndTime)) + ' Second(s)');
	PRINT ('Total Executions:		' + CONVERT(VARCHAR,@TestCnt));
	PRINT ('Avg Executions/Second:	' + CONVERT(VARCHAR,CONVERT(NUMERIC(15,2),(@TestCnt*1.0)/(DATEDIFF(ss,@StartTime,@EndTime)*1.0))) + ' Execs/Sec');


	--Return Summarized Results
	SELECT 
		OriginalContestantDoor
		,FinalResult
		,COUNT(*) 
	FROM 
		@tblResults 
	GROUP BY 
		OriginalContestantDoor,
		FinalResult;

	--Return Raw Results
	SELECT 
		ObjectDoor
		,OriginalContestantDoor
		,FinalContestantDoor
		,FinalResult
	FROM 
		@tblResults;
END
GO
/****** Object:  StoredProcedure [dbo].[s0_Refresh_Enigma]    Script Date: 2/2/2022 3:35:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[s0_Refresh_Enigma]
AS
BEGIN
	SET NOCOUNT ON;

	--Disable indexes for faster loading.
	ALTER INDEX [IX_OrigTarg] ON [dbo].[tblCharMap] DISABLE;
	ALTER INDEX [IX_TargOrig] ON [dbo].[tblCharMap] DISABLE;

	--Declare temp variables used throughout the procedure.
	DECLARE @vcCharSet		VARCHAR(2);
	DECLARE @cchar			CHAR(1);
	DECLARE @tblCharPairs	TABLE (	vccharset varchar(2));
	DECLARE @tblCharSetOrig	TABLE (iCharSetID BIGINT IDENTITY(1,1) NOT NULL, vcCharSet VARCHAR(2) NOT NULL)
	DECLARE @tblCharSetTarg	TABLE (iCharSetID BIGINT IDENTITY(1,1) NOT NULL, vcCharSet VARCHAR(2) NOT NULL)

	--Declare cursur to loop thru each character in tblchars.
	DECLARE kerser CURSOR READ_ONLY FORWARD_ONLY FOR
	SELECT cchar FROM tblchars ORDER BY NEWID();

	--Open the cursor for retrieving values.
	OPEN kerser;

	--Get first char from kerser.
	FETCH NEXT FROM kerser INTO @cchar;

	WHILE @@FETCH_STATUS = 0
	BEGIN
		--Populate list of all char pairs.
		INSERT INTO @tblCharPairs (vcCharSet)
		SELECT @cchar + cchar FROM tblchars ORDER BY NEWID();
	
		--Get next char from kerser.
		FETCH NEXT FROM kerser INTO @cchar;
	END

	--Close the cursor and destroy the cursor from memory.
	CLOSE kerser;
	DEALLOCATE kerser;

	--Create a random ordered list of char pairs.
	INSERT INTO @tblCharSetOrig (vccharset)
	SELECT vccharset FROM @tblCharPairs ORDER BY NEWID();

	--Create another random ordered list of char pairs.
	INSERT INTO @tblCharSetTarg (vccharset)
	SELECT vccharset FROM @tblCharPairs ORDER BY NEWID();

	--Clear out tblCharMap and reseed identity seed.
	TRUNCATE TABLE tblCharMap;

	--Create a list of random paired char pairs.
	INSERT INTO tblCharMap(vcCharSetOrig, vcCharSetTarg)
	SELECT t1.vcCharSet, t2.vcCharSet FROM @tblCharSetOrig t1 INNER JOIN @tblCharSetTarg t2 ON t1.iCharSetID = t2.iCharSetID;

	--Rebuild indexes for quicker lookups.
	ALTER INDEX [IX_OrigTarg] ON [dbo].[tblCharMap] REBUILD PARTITION = ALL WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
	ALTER INDEX [IX_TargOrig] ON [dbo].[tblCharMap] REBUILD PARTITION = ALL WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
END;
GO
/****** Object:  StoredProcedure [dbo].[s0_update_StoreInfo]    Script Date: 2/2/2022 3:35:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[s0_update_StoreInfo]
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @sp_StoreID		NVARCHAR(MAX);
	DECLARE @sp_StoreName	NVARCHAR(MAX);

	WHILE EXISTS (SELECT * FROM dbo.stage_StoreInfo)
	BEGIN
		SELECT TOP 1
			@sp_StoreID = StoreID
			,@sp_StoreName = StoreName
		FROM
			dbo.stage_StoreInfo WITH (NOLOCK);
			
		IF NOT EXISTS (SELECT * FROM dbo.StoreInfo WHERE StoreID = @sp_StoreID)
		BEGIN
			INSERT INTO dbo.StoreInfo (StoreID,StoreName)
			VALUES(@sp_StoreID,@sp_StoreName);
		END
		ELSE
		BEGIN
			UPDATE dbo.StoreInfo SET StoreName = @sp_StoreName
			WHERE StoreID = @sp_StoreID;
		END

		DELETE dbo.stage_StoreInfo WHERE StoreID = @sp_StoreID
	END
END
GO
/****** Object:  StoredProcedure [dbo].[s0_UpdatePatchSchedule]    Script Date: 2/2/2022 3:35:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[s0_UpdatePatchSchedule]
AS
BEGIN
DECLARE @startdate		DATE;
DECLARE @enddate		DATE;
DECLARE @tblDateDim		TABLE(dtDate DATETIME);
DECLARE @tblPatchSched	TABLE(dtDate DATETIME, vcDescription NVARCHAR(MAX));

SET @startdate	= CONVERT(CHAR(10),DATEADD(dd,DATEPART(dd,GETDATE())*-1,GETDATE())+1,121);
SET @enddate	= DATEADD(mm,3,@startdate);

WHILE @startdate < @enddate
BEGIN
	INSERT INTO @tblDateDim(dtDate)
	VALUES(@startdate);

	SET @startdate = DATEADD(dd,1,@startdate);
END

INSERT INTO @tblPatchSched(dtDate,vcDescription)
SELECT
	dtDate,
	'Patch Release Date'
FROM (
	SELECT
		dtdate
		,datepart(dw,dtdate) [dwDate]
		,RANK() OVER (PARTITION BY datepart(yyyy,dtdate),datepart(mm,dtdate),datepart(dw,dtdate)   ORDER BY dtDate) AS Place
	FROM
		@tblDateDim) q1
WHERE
	[dwDate] =3
AND [Place] = 2

INSERT INTO @tblPatchSched(dtDate,vcDescription)
SELECT
	DATEADD(dd,8,dtdate),
	'Patch Group 1'
FROM
	@tblPatchSched
WHERE
	vcDescription = 'Patch Release Date';

INSERT INTO @tblPatchSched(dtDate,vcDescription)
SELECT
	DATEADD(dd,15,dtdate),
	'Patch Group 2'
FROM
	@tblPatchSched
WHERE
	vcDescription = 'Patch Release Date';

INSERT INTO @tblPatchSched(dtDate,vcDescription)
SELECT
	DATEADD(dd,20,dtdate),
	'Patch Group 3'
FROM
	@tblPatchSched
WHERE
	vcDescription = 'Patch Release Date';

INSERT INTO @tblPatchSched(dtDate,vcDescription)
SELECT
	DATEADD(dd,21,dtdate),
	'Patch Group 4'
FROM
	@tblPatchSched
WHERE
	vcDescription = 'Patch Release Date';

INSERT INTO @tblPatchSched(dtDate,vcDescription)
SELECT
	DATEADD(dd,22,dtdate),
	'Patch Group 5'
FROM
	@tblPatchSched
WHERE
	vcDescription = 'Patch Release Date';

INSERT INTO @tblPatchSched(dtDate,vcDescription)
SELECT
	DATEADD(dd,23,dtdate),
	'Patch Group 6'
FROM
	@tblPatchSched
WHERE
	vcDescription = 'Patch Release Date';

SELECT * FROM @tblPatchSched ORDER BY dtdate
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CleanupPartitions]    Script Date: 2/2/2022 3:35:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Step 4. - Cleanup Past Partitions
CREATE PROCEDURE [dbo].[sp_CleanupPartitions]
       @Partitioned_Object               SQL_VARIANT
       ,@Partition_RetentionTarget INT
AS
/*
       EXEC dbo.sp_CleanupPartitions 
              @Partitioned_Object = 'tblPartTest'
              ,@Partition_RetentionTarget = 30;
*/
BEGIN
       SET NOCOUNT ON;

       DECLARE @sp_TargetRetentionDate   DATETIME;
       DECLARE @sp_tblCommands                  TABLE(iCommandID INT IDENTITY(1,1),iPartitionNumber INT,vcSQL VARCHAR(MAX));
       DECLARE @sp_vcSQL                        VARCHAR(MAX);

       SET @sp_TargetRetentionDate = DATEADD(dd,(@Partition_RetentionTarget*-1),CONVERT(CHAR(10),GETDATE(),121));

       INSERT INTO @sp_tblCommands (iPartitionNumber,vcSQL)
       SELECT DISTINCT
              p.partition_number,
              'ALTER TABLE ' + QUOTENAME(OBJECT_NAME(p.object_id)) + ' SWITCH PARTITION ' + CAST(p.partition_number AS VARCHAR) + ' TO [staging_' + OBJECT_NAME(p.object_id) + '] PARTITION ' + CAST(p.partition_number AS VARCHAR) +'; TRUNCATE TABLE staging_' + CAST(@Partitioned_Object AS VARCHAR(MAX)) + ';'
       FROM 
              sys.partitions AS p
              JOIN sys.indexes AS i
                     ON i.object_id = p.object_id
                     AND i.index_id = p.index_id
              JOIN sys.data_spaces AS ds
                     ON ds.data_space_id = i.data_space_id
              JOIN sys.partition_schemes AS ps
                     ON ps.data_space_id = ds.data_space_id
              JOIN sys.partition_functions AS pf
                     ON pf.function_id = ps.function_id
              JOIN sys.destination_data_spaces AS dds2
                     ON dds2.partition_scheme_id = ps.data_space_id 
                     AND dds2.destination_id = p.partition_number
              JOIN sys.filegroups AS fg
                     ON fg.data_space_id = dds2.data_space_id
              LEFT JOIN sys.partition_range_values AS prv_left
                     ON ps.function_id = prv_left.function_id
                     AND prv_left.boundary_id = p.partition_number - 1
              LEFT JOIN sys.partition_range_values AS prv_right
                     ON ps.function_id = prv_right.function_id
                     AND prv_right.boundary_id = p.partition_number 
       WHERE
              OBJECT_NAME(p.object_id) = @Partitioned_Object
       AND    prv_right.value < @sp_TargetRetentionDate
       ORDER BY
              p.partition_number;

       INSERT INTO @sp_tblCommands (vcSQL)
       SELECT DISTINCT
              'ALTER PARTITION FUNCTION ' + CAST(pf.name AS VARCHAR(MAX)) + ' () MERGE RANGE (''' + CONVERT(CHAR(10),prv_right.value,121)+ ''');'
       FROM 
              sys.partitions AS p
              JOIN sys.indexes AS i
                     ON i.object_id = p.object_id
                     AND i.index_id = p.index_id
              JOIN sys.data_spaces AS ds
                     ON ds.data_space_id = i.data_space_id
              JOIN sys.partition_schemes AS ps
                     ON ps.data_space_id = ds.data_space_id
              JOIN sys.partition_functions AS pf
                     ON pf.function_id = ps.function_id
              JOIN sys.destination_data_spaces AS dds2
                     ON dds2.partition_scheme_id = ps.data_space_id 
                     AND dds2.destination_id = p.partition_number
              JOIN sys.filegroups AS fg
                     ON fg.data_space_id = dds2.data_space_id
              LEFT JOIN sys.partition_range_values AS prv_left
                     ON ps.function_id = prv_left.function_id
                     AND prv_left.boundary_id = p.partition_number - 1
              LEFT JOIN sys.partition_range_values AS prv_right
                     ON ps.function_id = prv_right.function_id
                     AND prv_right.boundary_id = p.partition_number 
       WHERE
              OBJECT_NAME(p.object_id) = @Partitioned_Object
       AND    prv_right.value < @sp_TargetRetentionDate;

       WHILE EXISTS (SELECT * FROM @sp_tblCommands)
       BEGIN
              SELECT TOP 1
                     @sp_vcSQL = vcSQL
              FROM
                     @sp_tblCommands;

              PRINT  (@sp_vcSQL);
              EXEC   (@sp_vcSQL);

              DELETE
                     @sp_tblCommands
              WHERE
                     vcSQL = @sp_vcSQL;
       END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_PreparePartitions]    Script Date: 2/2/2022 3:35:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*------------------------Maintenance Scripts----------------------------*/
--Step 3. - Prepare Future Partitions
CREATE PROCEDURE [dbo].[sp_PreparePartitions]
       @Partitioned_Object               SQL_VARIANT
       ,@FuturePartition_Target   INT
AS
/*
       EXEC dbo.sp_PreparePartitions 
              @Partitioned_Object = 'tblPartTest'
              ,@FuturePartition_Target = 75;
*/
BEGIN
       SET NOCOUNT ON;

       DECLARE @sp_TargetPartitionDate   DATETIME;
       DECLARE @sp_LoopDate              DATETIME;
       DECLARE @sp_PartitionFunction     SQL_VARIANT;
       DECLARE @sp_PartitionScheme       SQL_VARIANT;
       DECLARE @sp_PartitionRangeDir     CHAR(5);
       DECLARE @sp_SQL                                 VARCHAR(MAX);

       SET @sp_TargetPartitionDate = DATEADD(dd,@FuturePartition_Target,CONVERT(CHAR(10),GETDATE(),121));

       SELECT
              @sp_PartitionScheme = ds.name
              ,@sp_PartitionFunction = pf.name
              ,@sp_LoopDate = DATEADD(dd,1,MAX(CONVERT(CHAR(10),prv_left.value,121)))
              ,@sp_PartitionRangeDir = CASE pf.boundary_value_on_right
                     WHEN 1 THEN 'RIGHT'
                     ELSE 'LEFT' 
              END
       FROM 
              sys.partitions AS p
              JOIN sys.indexes AS i
                     ON i.object_id = p.object_id
                     AND i.index_id = p.index_id
              JOIN sys.data_spaces AS ds
                     ON ds.data_space_id = i.data_space_id
              JOIN sys.partition_schemes AS ps
                     ON ps.data_space_id = ds.data_space_id
              JOIN sys.partition_functions AS pf
                     ON pf.function_id = ps.function_id
              JOIN sys.destination_data_spaces AS dds2
                     ON dds2.partition_scheme_id = ps.data_space_id 
                     AND dds2.destination_id = p.partition_number
              JOIN sys.filegroups AS fg
                     ON fg.data_space_id = dds2.data_space_id
              LEFT JOIN sys.partition_range_values AS prv_left
                     ON ps.function_id = prv_left.function_id
                     AND prv_left.boundary_id = p.partition_number - 1
              LEFT JOIN sys.partition_range_values AS prv_right
                     ON ps.function_id = prv_right.function_id
                     AND prv_right.boundary_id = p.partition_number 
       WHERE
              OBJECT_NAME(p.object_id) = @Partitioned_Object
       GROUP BY
              ds.name,
              pf.name,
              CASE pf.boundary_value_on_right
                     WHEN 1 THEN 'RIGHT'
                     ELSE 'LEFT' 
              END

       WHILE @sp_LoopDate <= @sp_TargetPartitionDate
       BEGIN
              SET @sp_SQL = 'ALTER PARTITION SCHEME ' + CAST(@sp_PartitionScheme AS VARCHAR(MAX)) + ' 
              NEXT USED [PRIMARY];'
              PRINT (@sp_SQL);
              EXEC (@sp_SQL);

              SET @sp_SQL = 'ALTER PARTITION FUNCTION ' + CAST(@sp_PartitionFunction AS VARCHAR(MAX)) + '() 
              SPLIT RANGE ( ''' + CONVERT(CHAR(10),@sp_LoopDate,121) + ''' );'
              PRINT (@sp_SQL);
              EXEC (@sp_SQL);
       
              SET @sp_LoopDate = DATEADD(dd,1,@sp_LoopDate);
       END
END
GO
/****** Object:  StoredProcedure [dbo].[sproc_Insert_tblQueue]    Script Date: 2/2/2022 3:35:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sproc_Insert_tblQueue]
	@bExecImmediate		BIT
	,@dtSchedStartTime	DATETIME = NULL
	,@vcSQLInstance		VARCHAR(100)
	,@vcSQLDatabase		VARCHAR(MAX)
	,@imgSQLScript		IMAGE
	,@vcRemedyArticle	VARCHAR(20)
AS
BEGIN
	
	SET NOCOUNT ON;

	INSERT INTO dbo.tblQueue(iStatusID,bExecuteImmediate,dtScheduledStartTime,vcSQLInstance,vcSQLDatabase,imgSQLScript,vcRememdyArticle)
	VALUES(0,@bExecImmediate,@dtSchedStartTime,@vcSQLInstance,@vcSQLDatabase,@imgSQLScript,@vcRemedyArticle)

	SELECT @@IDENTITY;
END

GO
USE [master]
GO
ALTER DATABASE [acm_ScratchDB] SET  READ_WRITE 
GO
