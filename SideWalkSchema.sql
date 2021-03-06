USE [master]
GO
/****** Object:  Database [SWPostTest]    Script Date: 7/12/2018 8:37:14 PM ******/
CREATE DATABASE [SWPostTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SWPost_Data', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL13.APPS\MSSQL\DATA\SWPostTest_data.mdf' , SIZE = 1149952KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'SWPost_Log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL13.APPS\MSSQL\DATA\SWPostTest_log.ldf' , SIZE = 76736KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
GO
ALTER DATABASE [SWPostTest] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWPostTest].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [SWPostTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWPostTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWPostTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWPostTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWPostTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWPostTest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SWPostTest] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [SWPostTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWPostTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWPostTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWPostTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWPostTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWPostTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWPostTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWPostTest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SWPostTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWPostTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWPostTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWPostTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWPostTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWPostTest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWPostTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWPostTest] SET RECOVERY FULL 
GO
ALTER DATABASE [SWPostTest] SET  MULTI_USER 
GO
ALTER DATABASE [SWPostTest] SET PAGE_VERIFY TORN_PAGE_DETECTION  
GO
ALTER DATABASE [SWPostTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWPostTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWPostTest] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SWPostTest] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SWPostTest] SET QUERY_STORE = OFF
GO
USE [SWPostTest]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [SWPostTest]
GO
/****** Object:  User [SWPostReporter]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [SWPostReporter] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [SQLReporter]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [SQLReporter] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [rose\weells]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [rose\weells] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [rose\ttappert]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [rose\ttappert] WITH DEFAULT_SCHEMA=[rose\ttappert]
GO
/****** Object:  User [rose\tjhight]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [rose\tjhight] FOR LOGIN [ROSE\tjhight] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Rose\timb]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [Rose\timb] FOR LOGIN [ROSE\TIMB] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ROSE\SWEEP]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [ROSE\SWEEP] WITH DEFAULT_SCHEMA=[ROSE\SWEEP]
GO
/****** Object:  User [ROSE\sundee]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [ROSE\sundee] WITH DEFAULT_SCHEMA=[ROSE\sundee]
GO
/****** Object:  User [rose\ssagar]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [rose\ssagar] FOR LOGIN [ROSE\ssagar] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [rose\sqlpdotvm5]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [rose\sqlpdotvm5] FOR LOGIN [ROSE\sqlpdotvm5] WITH DEFAULT_SCHEMA=[rose\sqlpdotvm5]
GO
/****** Object:  User [rose\shawna]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [rose\shawna] FOR LOGIN [ROSE\shawna] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [rose\sallys]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [rose\sallys] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ROSE\rosemary]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [ROSE\rosemary] WITH DEFAULT_SCHEMA=[ROSE\rosemary]
GO
/****** Object:  User [ROSE\rodg]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [ROSE\rodg] FOR LOGIN [ROSE\rodg] WITH DEFAULT_SCHEMA=[ROSE\rodg]
GO
/****** Object:  User [ROSE\rhoyt]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [ROSE\rhoyt] FOR LOGIN [ROSE\rhoyt] WITH DEFAULT_SCHEMA=[ROSE\rhoyt]
GO
/****** Object:  User [rose\redeau]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [rose\redeau] FOR LOGIN [ROSE\redeau] WITH DEFAULT_SCHEMA=[rose\redeau]
GO
/****** Object:  User [rose\RANGER]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [rose\RANGER] WITH DEFAULT_SCHEMA=[rose\RANGER]
GO
/****** Object:  User [ROSE\PDOTWEB1$]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [ROSE\PDOTWEB1$] FOR LOGIN [ROSE\PDOTWEB1$] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [rose\PDOT_WebPrimary_SVC]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [rose\PDOT_WebPrimary_SVC] FOR LOGIN [ROSE\PDOT_WebPrimary_SVC] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ROSE\munson]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [ROSE\munson] FOR LOGIN [ROSE\munson] WITH DEFAULT_SCHEMA=[ROSE\munson]
GO
/****** Object:  User [rose\mpuckett]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [rose\mpuckett] FOR LOGIN [ROSE\mpuckett] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [rose\mmcdonald]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [rose\mmcdonald] FOR LOGIN [ROSE\MMCDONALD] WITH DEFAULT_SCHEMA=[rose\mmcdonald]
GO
/****** Object:  User [ROSE\mikez]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [ROSE\mikez] FOR LOGIN [ROSE\mikez] WITH DEFAULT_SCHEMA=[ROSE\mikez]
GO
/****** Object:  User [ROSE\mcampbell]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [ROSE\mcampbell] FOR LOGIN [ROSE\mcampbell] WITH DEFAULT_SCHEMA=[ROSE\mcampbell]
GO
/****** Object:  User [ROSE\mawram ]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [ROSE\mawram ] FOR LOGIN [ROSE\mawram] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ROSE\LBULL_Z]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [ROSE\LBULL_Z] FOR LOGIN [ROSE\lbull] WITH DEFAULT_SCHEMA=[ROSE\LBULL_Z]
GO
/****** Object:  User [rose\larryb]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [rose\larryb] FOR LOGIN [ROSE\larryb] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ROSE\keri]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [ROSE\keri] FOR LOGIN [ROSE\keri] WITH DEFAULT_SCHEMA=[ROSE\keri]
GO
/****** Object:  User [rose\JFCHIN]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [rose\JFCHIN] FOR LOGIN [ROSE\jfchin] WITH DEFAULT_SCHEMA=[rose\JFCHIN]
GO
/****** Object:  User [rose\fgriffin]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [rose\fgriffin] FOR LOGIN [ROSE\fgriffin] WITH DEFAULT_SCHEMA=[rose\fgriffin]
GO
/****** Object:  User [ROSE\ErnestineS]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [ROSE\ErnestineS] WITH DEFAULT_SCHEMA=[ROSE\ErnestineS]
GO
/****** Object:  User [ROSE\EDIN]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [ROSE\EDIN] FOR LOGIN [ROSE\EDIN] WITH DEFAULT_SCHEMA=[ROSE\EDIN]
GO
/****** Object:  User [rose\eatulutofi]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [rose\eatulutofi] FOR LOGIN [ROSE\eatulutofi] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [rose\donovan]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [rose\donovan] FOR LOGIN [ROSE\donovan] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [rose\DNelson_adm7]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [rose\DNelson_adm7] FOR LOGIN [ROSE\DNelson_adm] WITH DEFAULT_SCHEMA=[rose\DNelson_adm7]
GO
/****** Object:  User [rose\dkonkol]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [rose\dkonkol] FOR LOGIN [ROSE\dkonkol] WITH DEFAULT_SCHEMA=[rose\dkonkol]
GO
/****** Object:  User [ROSE\debbie]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [ROSE\debbie] WITH DEFAULT_SCHEMA=[ROSE\debbie]
GO
/****** Object:  User [rose\darrick]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [rose\darrick] FOR LOGIN [ROSE\darrick] WITH DEFAULT_SCHEMA=[rose\darrick]
GO
/****** Object:  User [Rose\csryanc]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [Rose\csryanc] FOR LOGIN [ROSE\CSRyanC] WITH DEFAULT_SCHEMA=[Rose\csryanc]
GO
/****** Object:  User [rose\cme]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [rose\cme] WITH DEFAULT_SCHEMA=[rose\cme]
GO
/****** Object:  User [rose\chrawlins]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [rose\chrawlins] FOR LOGIN [ROSE\chrawlins] WITH DEFAULT_SCHEMA=[rose\chrawlins]
GO
/****** Object:  User [rose\ccrary]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [rose\ccrary] FOR LOGIN [ROSE\ccrary] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [rose\c1marial]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [rose\c1marial] FOR LOGIN [ROSE\c1marial] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ROSE\BOBJ_SSO_SVC]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [ROSE\BOBJ_SSO_SVC] FOR LOGIN [ROSE\bobj_sso_svc] WITH DEFAULT_SCHEMA=[ROSE\BOBJ_SSO_SVC]
GO
/****** Object:  User [ROSE\BOBJ_DEV_SVC]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [ROSE\BOBJ_DEV_SVC] FOR LOGIN [ROSE\bobj_dev_svc] WITH DEFAULT_SCHEMA=[ROSE\BOBJ_DEV_SVC]
GO
/****** Object:  User [rose\biorn]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [rose\biorn] WITH DEFAULT_SCHEMA=[rose\biorn]
GO
/****** Object:  User [rose\bayley_r]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [rose\bayley_r] FOR LOGIN [ROSE\Bayley_R] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ROSE\adhogan]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [ROSE\adhogan] FOR LOGIN [ROSE\adhogan] WITH DEFAULT_SCHEMA=[ROSE\adhogan]
GO
/****** Object:  User [jcoryell]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [jcoryell] FOR LOGIN [ROSE\jcoryell] WITH DEFAULT_SCHEMA=[jcoryell]
GO
/****** Object:  User [CGISTrackIT_User]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [CGISTrackIT_User] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[CGISTrackIT_User]
GO
/****** Object:  User [ActuateReport]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE USER [ActuateReport] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[ActuateReport]
GO
/****** Object:  DatabaseRole [SWP_Update]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE ROLE [SWP_Update]
GO
/****** Object:  DatabaseRole [SWP_ServiceUser]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE ROLE [SWP_ServiceUser]
GO
ALTER ROLE [db_datareader] ADD MEMBER [SWPostReporter]
GO
ALTER ROLE [db_datareader] ADD MEMBER [SQLReporter]
GO
ALTER ROLE [SWP_ServiceUser] ADD MEMBER [rose\weells]
GO
ALTER ROLE [db_datareader] ADD MEMBER [rose\weells]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [rose\weells]
GO
ALTER ROLE [SWP_Update] ADD MEMBER [rose\weells]
GO
ALTER ROLE [SWP_ServiceUser] ADD MEMBER [rose\ttappert]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [rose\ttappert]
GO
ALTER ROLE [SWP_Update] ADD MEMBER [rose\ttappert]
GO
ALTER ROLE [SWP_ServiceUser] ADD MEMBER [rose\tjhight]
GO
ALTER ROLE [db_datareader] ADD MEMBER [rose\tjhight]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [rose\tjhight]
GO
ALTER ROLE [SWP_Update] ADD MEMBER [rose\tjhight]
GO
ALTER ROLE [db_datareader] ADD MEMBER [Rose\timb]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [Rose\timb]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ROSE\SWEEP]
GO
ALTER ROLE [SWP_ServiceUser] ADD MEMBER [rose\ssagar]
GO
ALTER ROLE [db_owner] ADD MEMBER [rose\ssagar]
GO
ALTER ROLE [db_datareader] ADD MEMBER [rose\ssagar]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [rose\ssagar]
GO
ALTER ROLE [SWP_Update] ADD MEMBER [rose\ssagar]
GO
ALTER ROLE [db_datareader] ADD MEMBER [rose\sqlpdotvm5]
GO
ALTER ROLE [SWP_ServiceUser] ADD MEMBER [rose\shawna]
GO
ALTER ROLE [db_owner] ADD MEMBER [rose\shawna]
GO
ALTER ROLE [SWP_Update] ADD MEMBER [rose\shawna]
GO
ALTER ROLE [SWP_ServiceUser] ADD MEMBER [rose\sallys]
GO
ALTER ROLE [db_datareader] ADD MEMBER [rose\sallys]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [rose\sallys]
GO
ALTER ROLE [SWP_Update] ADD MEMBER [rose\sallys]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ROSE\rosemary]
GO
ALTER ROLE [SWP_ServiceUser] ADD MEMBER [ROSE\rodg]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ROSE\rodg]
GO
ALTER ROLE [SWP_Update] ADD MEMBER [ROSE\rodg]
GO
ALTER ROLE [SWP_ServiceUser] ADD MEMBER [ROSE\rhoyt]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ROSE\rhoyt]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ROSE\rhoyt]
GO
ALTER ROLE [SWP_Update] ADD MEMBER [ROSE\rhoyt]
GO
ALTER ROLE [db_datareader] ADD MEMBER [rose\redeau]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [rose\redeau]
GO
ALTER ROLE [db_owner] ADD MEMBER [rose\RANGER]
GO
ALTER ROLE [SWP_ServiceUser] ADD MEMBER [ROSE\PDOTWEB1$]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ROSE\PDOTWEB1$]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ROSE\PDOTWEB1$]
GO
ALTER ROLE [SWP_Update] ADD MEMBER [ROSE\PDOTWEB1$]
GO
ALTER ROLE [SWP_ServiceUser] ADD MEMBER [rose\PDOT_WebPrimary_SVC]
GO
ALTER ROLE [db_datareader] ADD MEMBER [rose\PDOT_WebPrimary_SVC]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [rose\PDOT_WebPrimary_SVC]
GO
ALTER ROLE [SWP_Update] ADD MEMBER [rose\PDOT_WebPrimary_SVC]
GO
ALTER ROLE [SWP_ServiceUser] ADD MEMBER [ROSE\munson]
GO
ALTER ROLE [SWP_Update] ADD MEMBER [ROSE\munson]
GO
ALTER ROLE [SWP_ServiceUser] ADD MEMBER [rose\mpuckett]
GO
ALTER ROLE [db_datareader] ADD MEMBER [rose\mpuckett]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [rose\mpuckett]
GO
ALTER ROLE [SWP_Update] ADD MEMBER [rose\mpuckett]
GO
ALTER ROLE [db_datareader] ADD MEMBER [rose\mmcdonald]
GO
ALTER ROLE [SWP_ServiceUser] ADD MEMBER [ROSE\mikez]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ROSE\mikez]
GO
ALTER ROLE [SWP_Update] ADD MEMBER [ROSE\mikez]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ROSE\mcampbell]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ROSE\mcampbell]
GO
ALTER ROLE [SWP_ServiceUser] ADD MEMBER [ROSE\mawram ]
GO
ALTER ROLE [SWP_Update] ADD MEMBER [ROSE\mawram ]
GO
ALTER ROLE [SWP_ServiceUser] ADD MEMBER [ROSE\LBULL_Z]
GO
ALTER ROLE [SWP_Update] ADD MEMBER [ROSE\LBULL_Z]
GO
ALTER ROLE [SWP_ServiceUser] ADD MEMBER [rose\larryb]
GO
ALTER ROLE [db_owner] ADD MEMBER [rose\larryb]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [rose\larryb]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [rose\larryb]
GO
ALTER ROLE [db_datareader] ADD MEMBER [rose\larryb]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [rose\larryb]
GO
ALTER ROLE [SWP_Update] ADD MEMBER [rose\larryb]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ROSE\keri]
GO
ALTER ROLE [SWP_ServiceUser] ADD MEMBER [rose\JFCHIN]
GO
ALTER ROLE [db_datareader] ADD MEMBER [rose\JFCHIN]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [rose\JFCHIN]
GO
ALTER ROLE [SWP_Update] ADD MEMBER [rose\JFCHIN]
GO
ALTER ROLE [SWP_ServiceUser] ADD MEMBER [rose\fgriffin]
GO
ALTER ROLE [SWP_Update] ADD MEMBER [rose\fgriffin]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ROSE\ErnestineS]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ROSE\ErnestineS]
GO
ALTER ROLE [SWP_ServiceUser] ADD MEMBER [rose\eatulutofi]
GO
ALTER ROLE [db_datareader] ADD MEMBER [rose\eatulutofi]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [rose\eatulutofi]
GO
ALTER ROLE [SWP_Update] ADD MEMBER [rose\eatulutofi]
GO
ALTER ROLE [db_datareader] ADD MEMBER [rose\donovan]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [rose\donovan]
GO
ALTER ROLE [db_owner] ADD MEMBER [rose\DNelson_adm7]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ROSE\debbie]
GO
ALTER ROLE [db_datareader] ADD MEMBER [Rose\csryanc]
GO
ALTER ROLE [SWP_ServiceUser] ADD MEMBER [rose\cme]
GO
ALTER ROLE [db_datareader] ADD MEMBER [rose\cme]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [rose\cme]
GO
ALTER ROLE [SWP_Update] ADD MEMBER [rose\cme]
GO
ALTER ROLE [db_datareader] ADD MEMBER [rose\chrawlins]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [rose\chrawlins]
GO
ALTER ROLE [db_datareader] ADD MEMBER [rose\ccrary]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [rose\ccrary]
GO
ALTER ROLE [SWP_ServiceUser] ADD MEMBER [rose\c1marial]
GO
ALTER ROLE [db_datareader] ADD MEMBER [rose\c1marial]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [rose\c1marial]
GO
ALTER ROLE [SWP_Update] ADD MEMBER [rose\c1marial]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ROSE\BOBJ_SSO_SVC]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ROSE\BOBJ_DEV_SVC]
GO
ALTER ROLE [SWP_ServiceUser] ADD MEMBER [rose\biorn]
GO
ALTER ROLE [db_datareader] ADD MEMBER [rose\biorn]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [rose\biorn]
GO
ALTER ROLE [SWP_Update] ADD MEMBER [rose\biorn]
GO
ALTER ROLE [SWP_ServiceUser] ADD MEMBER [rose\bayley_r]
GO
ALTER ROLE [db_datareader] ADD MEMBER [rose\bayley_r]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [rose\bayley_r]
GO
ALTER ROLE [SWP_Update] ADD MEMBER [rose\bayley_r]
GO
ALTER ROLE [SWP_ServiceUser] ADD MEMBER [ROSE\adhogan]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ROSE\adhogan]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ROSE\adhogan]
GO
ALTER ROLE [SWP_Update] ADD MEMBER [ROSE\adhogan]
GO
ALTER ROLE [SWP_ServiceUser] ADD MEMBER [jcoryell]
GO
ALTER ROLE [db_datareader] ADD MEMBER [jcoryell]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [jcoryell]
GO
ALTER ROLE [SWP_Update] ADD MEMBER [jcoryell]
GO
ALTER ROLE [db_datareader] ADD MEMBER [CGISTrackIT_User]
GO
ALTER ROLE [SWP_ServiceUser] ADD MEMBER [SWP_Update]
GO
/****** Object:  Schema [ActuateReport]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE SCHEMA [ActuateReport]
GO
/****** Object:  Schema [ArcMap_Admin]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE SCHEMA [ArcMap_Admin]
GO
/****** Object:  Schema [CGISTrackIT_User]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE SCHEMA [CGISTrackIT_User]
GO
/****** Object:  Schema [jcoryell]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE SCHEMA [jcoryell]
GO
/****** Object:  Schema [ROSE\adhogan]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE SCHEMA [ROSE\adhogan]
GO
/****** Object:  Schema [rose\biorn]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE SCHEMA [rose\biorn]
GO
/****** Object:  Schema [ROSE\BOBJ_DEV_SVC]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE SCHEMA [ROSE\BOBJ_DEV_SVC]
GO
/****** Object:  Schema [ROSE\BOBJ_SSO_SVC]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE SCHEMA [ROSE\BOBJ_SSO_SVC]
GO
/****** Object:  Schema [rose\chrawlins]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE SCHEMA [rose\chrawlins]
GO
/****** Object:  Schema [rose\cme]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE SCHEMA [rose\cme]
GO
/****** Object:  Schema [Rose\csryanc]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE SCHEMA [Rose\csryanc]
GO
/****** Object:  Schema [rose\darrick]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE SCHEMA [rose\darrick]
GO
/****** Object:  Schema [ROSE\debbie]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE SCHEMA [ROSE\debbie]
GO
/****** Object:  Schema [rose\dkonkol]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE SCHEMA [rose\dkonkol]
GO
/****** Object:  Schema [rose\DNelson_adm7]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE SCHEMA [rose\DNelson_adm7]
GO
/****** Object:  Schema [ROSE\EDIN]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE SCHEMA [ROSE\EDIN]
GO
/****** Object:  Schema [ROSE\ErnestineS]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE SCHEMA [ROSE\ErnestineS]
GO
/****** Object:  Schema [rose\fgriffin]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE SCHEMA [rose\fgriffin]
GO
/****** Object:  Schema [rose\JFCHIN]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE SCHEMA [rose\JFCHIN]
GO
/****** Object:  Schema [ROSE\keri]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE SCHEMA [ROSE\keri]
GO
/****** Object:  Schema [rose\larryb]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE SCHEMA [rose\larryb]
GO
/****** Object:  Schema [ROSE\LBULL_Z]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE SCHEMA [ROSE\LBULL_Z]
GO
/****** Object:  Schema [ROSE\mcampbell]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE SCHEMA [ROSE\mcampbell]
GO
/****** Object:  Schema [ROSE\mikez]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE SCHEMA [ROSE\mikez]
GO
/****** Object:  Schema [rose\mmcdonald]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE SCHEMA [rose\mmcdonald]
GO
/****** Object:  Schema [ROSE\munson]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE SCHEMA [ROSE\munson]
GO
/****** Object:  Schema [rose\RANGER]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE SCHEMA [rose\RANGER]
GO
/****** Object:  Schema [rose\redeau]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE SCHEMA [rose\redeau]
GO
/****** Object:  Schema [ROSE\rhoyt]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE SCHEMA [ROSE\rhoyt]
GO
/****** Object:  Schema [ROSE\rodg]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE SCHEMA [ROSE\rodg]
GO
/****** Object:  Schema [ROSE\rosemary]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE SCHEMA [ROSE\rosemary]
GO
/****** Object:  Schema [rose\sqlpdotvm5]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE SCHEMA [rose\sqlpdotvm5]
GO
/****** Object:  Schema [ROSE\sundee]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE SCHEMA [ROSE\sundee]
GO
/****** Object:  Schema [ROSE\SWEEP]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE SCHEMA [ROSE\SWEEP]
GO
/****** Object:  Schema [rose\ttappert]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE SCHEMA [rose\ttappert]
GO
/****** Object:  Schema [SWP_Update]    Script Date: 7/12/2018 8:37:15 PM ******/
CREATE SCHEMA [SWP_Update]
GO
/****** Object:  UserDefinedFunction [dbo].[ufnGetNewAffidavitID]    Script Date: 7/12/2018 8:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[ufnGetNewAffidavitID] (@AffNo bigint)
RETURNS varchar(6)
AS
BEGIN
	declare @batchAffidavits table
	(	Sequence int IDENTITY(1,1),
		AffNo int,
		Inspector int,
		InspDate Date
	)

	declare @inspector int 
	declare @post_dt datetime

	select @inspector = inspector_no, @post_dt = post_dt
	from sw_posting
	where aff_no = @AffNo

	insert @batchAffidavits
	(AffNo, Inspector, InspDate)
	select aff_no, inspector_no, Cast(post_dt as date) as 'post_dt' 
	from sw_posting
	where inspector_no = @inspector and @post_dt = post_dt

	declare @year int
	declare @month int
	declare @day int
	declare @sequence int

	select @year=Year(InspDate)-2000, @month=Month(InspDate), @day = Day(InspDate), @sequence = sequence
	from @batchAffidavits
	where AffNo = @AffNo

	select @year=Year(InspDate)-2000, @month=Month(InspDate), @day = Day(InspDate), @sequence = sequence
	from @batchAffidavits
	where AffNo = @AffNo

	Declare @alldigits as varchar(36);
	Set @alldigits='0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'

	declare @inspectorID int
	set @inspectorID = 0
	if @inspector > 35
		select @inspectorID = inspector_no from sw_inspector active 
		where inspector_name in 
		(select inspector_name from sw_inspector
		where inspector_no = @inspector) 
		and active = 1;
	else	
		select @inspectorID = inspector_no
		from sw_posting
		where aff_no = @AffNo

	declare @NewAff varchar(6)
	set @NewAff = SUBSTRING(@alldigits,@year+1,1)+SUBSTRING(@alldigits,@month+1,1)+SUBSTRING(@alldigits,@day+1,1)+SUBSTRING(@alldigits,@sequence+1,1)+SUBSTRING(@alldigits,@inspectorID+1,1)

	RETURN @NewAff

END



GO
/****** Object:  UserDefinedFunction [dbo].[ufnGetPostCostDetail]    Script Date: 7/12/2018 8:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[ufnGetPostCostDetail](@fy int)
RETURNS @cost TABLE 
(  nMonth varchar(10) null,
   sMonth varchar(16) NULL,
   post_dt datetime null,
   aff_no int null,
   aff_action char(1) null,
   status varchar(3) null,
   cost decimal(10, 2) NULL,
   address varchar(100) null
)
AS 
BEGIN
	declare @startdate smalldatetime, @enddate smalldatetime
	select @startdate= '7/1/' + CAST((@fy-1) AS VARCHAR)
		 , @enddate= '6/30/' + CAST(@fy AS VARCHAR)

    INSERT @cost (aff_no, aff_action)
	SELECT p.aff_no, action=MAX(a.action) -- Lucky me. A/E/R  is the order of value, and also the order of desired selection
	FROM SWPOST.DBO.sw_posting p, SWPOST.DBO.sw_action a
	WHERE p.aff_no = a.aff_no
	AND p.POST_DT BETWEEN @startdate AND @enddate
	GROUP BY p.aff_no

	INSERT @cost (nmonth, smonth, post_dt, aff_no, aff_action, status, cost, address)
	SELECT nmonth= DATENAME(YEAR, p.post_dt) + ' - '
	  + CASE WHEN DATEPART(MONTH, p.post_dt) > 9 THEN '' ELSE '0' END
	  + CAST(DATEPART(MONTH, p.post_dt) AS VARCHAR)
	, smonth=DATENAME(month, p.post_dt), p.post_dt, p.aff_no, a.action, p.status, a.total_cost
	, address=CASE WHEN i.comment IS NULL THEN p.property_desc  WHEN i.comment = '' THEN p.property_desc
	 ELSE i.comment END
	FROM SWPOST.DBO.sw_posting p
	  INNER JOIN @cost t ON (p.aff_no = t.aff_no)
	  INNER JOIN SWPost.dbo.sw_action a ON (t.aff_no = a.aff_no AND t.aff_action = a.action)
	  INNER JOIN SWPOST.DBO.inspection i on (a.aff_no = i.aff_no)

	DELETE @cost WHERE nMonth IS NULL
	RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[ufnGetPostCostSummary]    Script Date: 7/12/2018 8:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[ufnGetPostCostSummary](@fynum int)
RETURNS @cost TABLE 
(  iYear int NULL,
   sYear char(4) NULL,
   iMonth int NULL,
   sMonth char(6) NULL,
   aff_no int,
   aff_action char(1),
   cost decimal(10, 2) NULL
)
AS 
BEGIN
	DECLARE @startdate smalldatetime, @enddate smalldatetime
	SET @enddate = GETDATE()
	SET @startdate = '7/1/' + CAST((DATEPART(YEAR, GETDATE())  - @fynum )AS VARCHAR)

    INSERT @cost (aff_no, aff_action)
	SELECT p.aff_no, action=MAX(a.action) -- Lucky me. A/E/R  is the order of value, and the same order of desired selection
	FROM SWPOST.DBO.sw_posting p, SWPOST.DBO.sw_action a
	WHERE p.aff_no = a.aff_no
	AND p.POST_DT BETWEEN @startdate AND @enddate
	GROUP BY p.aff_no

	INSERT @cost (iYear, sYear, iMonth, sMonth, cost)
	SELECT iyear= DATEPART(year, p.post_dt) --+ CASE WHEN DATEPART(MONTH, p.post_dt) < 7 THEN 0 ELSE 1 END
	, syear= CAST((DATEPART(year, p.post_dt) + CASE WHEN DATEPART(MONTH, p.post_dt) < 7 THEN 0 ELSE 1 END) AS VARCHAR)
	, imonth=CASE WHEN DATEPART(month, p.post_dt) > 6 THEN DATEPART(month, p.post_dt) - 6 
		ELSE DATEPART(month, p.post_dt) + 6 END 
	, smonth= CAST(DATEPART(year, p.post_dt) * 100 + DATEPART(month, p.post_dt) AS VARCHAR)
	, cost=SUM(a.total_cost)
	FROM swpost.dbo.sw_posting p
	  INNER JOIN @cost t ON (p.aff_no = t.aff_no)
	  INNER JOIN swpost.dbo.sw_action a ON (t.aff_no = a.aff_no AND t.aff_action = a.action)
	GROUP BY DATEPART(year, p.post_dt) --+ CASE WHEN DATEPART(MONTH, p.post_dt) < 7 THEN 0 ELSE 1 END
	, CAST((DATEPART(year, p.post_dt) + CASE WHEN DATEPART(MONTH, p.post_dt) < 7 THEN 0 ELSE 1 END) AS VARCHAR)
	, DATEPART(month, p.post_dt)
	, CASE WHEN DATEPART(month, p.post_dt) > 6 THEN DATEPART(month, p.post_dt) - 6 ELSE DATEPART(month, p.post_dt) + 6 END 
	ORDER BY 1, 2

	DELETE @cost WHERE iYear IS NULL
	RETURN
END
GO
/****** Object:  Table [ArcMap_Admin].[PORT_TAXLOTS_PDX]    Script Date: 7/12/2018 8:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ArcMap_Admin].[PORT_TAXLOTS_PDX](
	[OBJECTID] [int] NOT NULL,
	[AREA] [numeric](38, 8) NULL,
	[STATE_ID] [nvarchar](20) NULL,
	[RNO] [nvarchar](35) NULL,
	[OWNER1] [nvarchar](35) NULL,
	[OWNER2] [nvarchar](35) NULL,
	[OWNER3] [nvarchar](35) NULL,
	[OWNERADDR] [nvarchar](35) NULL,
	[OWNERCITY] [nvarchar](28) NULL,
	[OWNERSTATE] [nvarchar](2) NULL,
	[OWNERZIP] [nvarchar](10) NULL,
	[SITEADDR] [nvarchar](37) NULL,
	[SITECITY] [nvarchar](30) NULL,
	[SITE_STATE] [nvarchar](6) NULL,
	[SITEZIP] [nvarchar](10) NULL,
	[LEGAL_DESC] [nvarchar](250) NULL,
	[TAXCODE] [nvarchar](7) NULL,
	[PROP_CODE] [nvarchar](4) NULL,
	[PRPCD_DESC] [nvarchar](50) NULL,
	[LANDUSE] [nvarchar](4) NULL,
	[YEARBUILT] [nvarchar](10) NULL,
	[BLDGSQFT] [numeric](38, 8) NULL,
	[BEDROOMS] [numeric](38, 8) NULL,
	[FLOORS] [numeric](38, 8) NULL,
	[UNITS] [numeric](38, 8) NULL,
	[MKTVALYR1] [nvarchar](4) NULL,
	[LANDVAL1] [numeric](38, 8) NULL,
	[BLDGVAL1] [numeric](38, 8) NULL,
	[TOTALVAL1] [numeric](38, 8) NULL,
	[MKTVALYR2] [nvarchar](4) NULL,
	[LANDVAL2] [numeric](38, 8) NULL,
	[BLDGVAL2] [numeric](38, 8) NULL,
	[TOTALVAL2] [numeric](38, 8) NULL,
	[MKTVALYR3] [nvarchar](11) NULL,
	[LANDVAL3] [numeric](38, 8) NULL,
	[BLDGVAL3] [numeric](38, 8) NULL,
	[TOTALVAL3] [numeric](38, 8) NULL,
	[SALEDATE] [nvarchar](11) NULL,
	[SALEPRICE] [numeric](38, 8) NULL,
	[ACC_STATUS] [nvarchar](1) NULL,
	[A_T_SQFT] [numeric](38, 8) NULL,
	[A_T_ACRES] [numeric](38, 8) NULL,
	[FRONTAGE] [numeric](38, 8) NULL,
	[COUNTY] [nvarchar](2) NULL,
	[SOURCE] [nvarchar](10) NULL,
	[PROPERTYID] [nvarchar](7) NULL,
	[TLID] [nvarchar](25) NULL,
	[Shape] [geometry] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[action_codes]    Script Date: 7/12/2018 8:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[action_codes](
	[fis_name] [char](8) NULL,
	[action_code] [char](1) NULL,
	[cost] [money] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [action_codes_idx]    Script Date: 7/12/2018 8:37:16 PM ******/
CREATE CLUSTERED INDEX [action_codes_idx] ON [dbo].[action_codes]
(
	[fis_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[action_detail]    Script Date: 7/12/2018 8:37:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[action_detail](
	[fis_name] [char](8) NULL,
	[action_type] [varchar](20) NULL,
	[unit] [float] NULL,
	[cost] [money] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [action_detail_idx]    Script Date: 7/12/2018 8:37:16 PM ******/
CREATE CLUSTERED INDEX [action_detail_idx] ON [dbo].[action_detail]
(
	[fis_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Activity]    Script Date: 7/12/2018 8:37:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activity](
	[DocType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Activity] PRIMARY KEY CLUSTERED 
(
	[DocType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Affidavit]    Script Date: 7/12/2018 8:37:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Affidavit](
	[AffidavitID] [bigint] IDENTITY(1,1) NOT NULL,
	[InspectorId] [int] NULL,
	[InspectionDate] [datetime] NULL,
	[Status] [int] NULL,
	[VisioDiagram] [varchar](50) NULL,
	[TrackIT] [nchar](10) NULL,
	[RNO] [varchar](24) NULL,
	[QtrSection] [varchar](12) NULL,
	[PropertyID] [varchar](7) NULL,
	[LegalDesc] [varchar](255) NULL,
	[Owner1] [varchar](40) NULL,
	[Owner2] [varchar](35) NULL,
	[Owner3] [varchar](35) NULL,
	[OwnerAddress] [varchar](50) NULL,
	[OwnerCity] [varchar](28) NULL,
	[OwnerState] [varchar](2) NULL,
	[OwnerZip] [varchar](10) NULL,
	[SiteAddress] [varchar](100) NULL,
	[SiteStreetNumber] [varchar](24) NULL,
	[SiteDistrict] [varchar](2) NULL,
	[SiteStreetName] [varchar](40) NULL,
	[SiteStreetDesignator] [varchar](4) NULL,
	[SiteCity] [varchar](24) NULL,
	[SiteZip] [varchar](10) NULL,
	[CityRepair] [char](1) NULL,
	[OwnerRepair] [char](1) NULL,
	[ContractorRepair] [char](1) NULL,
	[RepairDueDate] [smalldatetime] NULL,
	[RepairNoticeSentDate] [datetime] NULL,
	[RepairNoticeSentBy] [varchar](10) NULL,
	[CityRepairStart] [char](1) NULL,
	[CityRepairBy] [varchar](10) NULL,
	[HoldUntilDate] [datetime] NULL,
	[HoldUntilBy] [varchar](10) NULL,
	[permit_no] [int] NULL,
	[permit_issued] [varchar](3) NULL,
	[permit_extended] [char](1) NULL,
	[PermitIssuedDate] [datetime] NULL,
	[PermitExpiredDate] [datetime] NULL,
	[contractor] [varchar](40) NULL,
	[builder_board_no] [varchar](6) NULL,
	[date_cancelled] [datetime] NULL,
	[cancelled_by] [varchar](10) NULL,
	[last_action] [char](1) NULL,
	[CreateDate] [datetime] NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedBy] [varchar](10) NULL,
	[notes] [varchar](max) NULL,
	[VisioRevision] [int] NULL,
	[New_Aff] [varchar](10) NULL,
	[New_RepairDueDate] [smalldatetime] NULL,
	[NEW_ClearWalk] [bit] NULL,
 CONSTRAINT [PK_Affidavit_1] PRIMARY KEY CLUSTERED 
(
	[AffidavitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Affidavit_Old]    Script Date: 7/12/2018 8:37:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Affidavit_Old](
	[AffidavitId] [bigint] IDENTITY(1,1) NOT NULL,
	[AffidavitNumber] [bigint] NOT NULL,
	[QTRSection] [varchar](12) NULL,
	[MapId] [varchar](24) NULL,
	[PostedDate] [datetime] NULL,
	[AffidavitStatus] [bit] NULL,
	[InspectorNo] [bigint] NULL,
	[RepaireByCity] [bit] NULL,
	[RepaireByOwner] [bit] NULL,
	[PartialRepair] [bit] NULL,
	[RepairDate] [datetime] NULL,
	[HoldDate] [datetime] NULL,
	[ContractorName] [varchar](40) NULL,
	[BuilderBoardNumber] [varchar](6) NULL,
	[DateCancelled] [datetime] NULL,
	[CancelledBy] [varchar](10) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[Notes] [varchar](255) NULL,
	[SentDate] [datetime] NULL,
	[NEW_AFF] [varchar](10) NULL,
	[NEW_RepairDueDate] [smalldatetime] NULL,
	[NEW_ClearWalk] [bit] NULL,
 CONSTRAINT [PK_Affidavit] PRIMARY KEY CLUSTERED 
(
	[AffidavitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AffidavitAttachment]    Script Date: 7/12/2018 8:37:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AffidavitAttachment](
	[AttachmentId] [bigint] IDENTITY(1,1) NOT NULL,
	[AffidavitId] [bigint] NOT NULL,
	[DisplayName] [nvarchar](100) NULL,
	[FileName] [nvarchar](100) NULL,
	[Status] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_AffidavitAttachement] PRIMARY KEY CLUSTERED 
(
	[AttachmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AffidavitCosts]    Script Date: 7/12/2018 8:37:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AffidavitCosts](
	[Affidavit_Key] [varchar](10) NOT NULL,
	[CostType_Key] [char](1) NOT NULL,
	[ActionDt] [datetime] NULL,
	[Contract_Key] [int] NULL,
	[Parking] [money] NULL,
	[PermitFee] [money] NULL,
	[TotalCost] [money] NULL,
	[Comments] [varchar](254) NULL,
	[VisioDiagram] [varchar](12) NULL,
	[Batch_Key] [varchar](28) NULL,
 CONSTRAINT [PK_AffidavitCosts] PRIMARY KEY CLUSTERED 
(
	[Affidavit_Key] ASC,
	[CostType_Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AffidavitCostsDetail]    Script Date: 7/12/2018 8:37:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AffidavitCostsDetail](
	[Affidavit_Key] [varchar](10) NOT NULL,
	[CostType_Key] [char](1) NOT NULL,
	[RepairItem_Key] [varchar](20) NOT NULL,
	[Unit] [float] NULL,
	[Rate] [money] NULL,
	[Cost] [money] NULL,
 CONSTRAINT [PK_AffidavitCostsDetail] PRIMARY KEY CLUSTERED 
(
	[Affidavit_Key] ASC,
	[CostType_Key] ASC,
	[RepairItem_Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AffidavitFinalInspection]    Script Date: 7/12/2018 8:37:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AffidavitFinalInspection](
	[FinalInspectionId] [bigint] IDENTITY(1,1) NOT NULL,
	[AffidavitID] [bigint] NOT NULL,
	[InspectionDate] [datetime] NOT NULL,
	[Sidewalk] [bit] NOT NULL,
	[Driveway] [bit] NOT NULL,
	[Curb] [bit] NOT NULL,
	[ContractorRepaired] [bit] NOT NULL,
	[ContractorRepairedNotCitySpec] [bit] NOT NULL,
	[OwnerRepaired] [bit] NOT NULL,
	[OwnerRepairedNotCitySpec] [bit] NOT NULL,
	[OtherRepairsAreCompleteAndSatisfactory] [nvarchar](max) NULL,
	[CompletionDate] [datetime] NULL,
	[RepairsComplete] [bit] NOT NULL,
	[RemoveFormsToGrade] [bit] NOT NULL,
	[MoreBackfill] [bit] NOT NULL,
	[IncompleteRepairs] [bit] NOT NULL,
	[MoreGrinding] [bit] NOT NULL,
	[RemoveMarkedAreas] [bit] NOT NULL,
	[AsphaltWork] [bit] NOT NULL,
	[Graffiti] [bit] NOT NULL,
	[NoRightWayPermit] [bit] NOT NULL,
	[OtherRepairsNotAcceptable] [nvarchar](max) NULL,
	[FinalFailDate] [datetime] NULL,
	[FinalFailInspectorId] [int] NULL,
	[FinalPassInspectorId] [int] NULL,
 CONSTRAINT [PK_AffidavitFinalInspection_1] PRIMARY KEY CLUSTERED 
(
	[FinalInspectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AffidavitFormInspection]    Script Date: 7/12/2018 8:37:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AffidavitFormInspection](
	[FormInspectionId] [bigint] IDENTITY(1,1) NOT NULL,
	[AffidavitId] [bigint] NOT NULL,
	[InspectionDate] [datetime] NOT NULL,
	[Sidewalk] [bit] NOT NULL,
	[Driveway] [bit] NOT NULL,
	[Curb] [bit] NOT NULL,
	[Partial] [bit] NOT NULL,
	[PartialDescription] [nvarchar](50) NULL,
	[MatchJointPattern] [bit] NOT NULL,
	[PlaceJoints] [bit] NOT NULL,
	[ToolDeepJoints] [bit] NOT NULL,
	[OtherGrantedToPour] [nvarchar](max) NULL,
	[CompletionDate] [datetime] NULL,
	[PermissionGranted] [bit] NOT NULL,
	[NotReady] [bit] NOT NULL,
	[InsufficientBarricades] [bit] NOT NULL,
	[RemoveDebris] [bit] NOT NULL,
	[NotDeep] [bit] NOT NULL,
	[CurbHeight] [bit] NOT NULL,
	[SawCutEdges] [bit] NOT NULL,
	[NoPermit] [bit] NOT NULL,
	[AddCrushedRock] [bit] NOT NULL,
	[OtherDoNotPour] [nvarchar](max) NULL,
	[FormFailDate] [datetime] NULL,
	[Notes] [nvarchar](50) NULL,
	[FormFailInspectorId] [int] NULL,
	[FormPassInspectorId] [int] NULL,
 CONSTRAINT [PK_AffidavitFormInspection_1] PRIMARY KEY CLUSTERED 
(
	[FormInspectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AffidavitHistory]    Script Date: 7/12/2018 8:37:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AffidavitHistory](
	[AffidavitHistoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[AffidavitId] [bigint] NOT NULL,
	[AffidavitStatusId] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[StatusValue] [nvarchar](50) NULL,
	[InspectorId] [int] NULL,
	[Comments] [nvarchar](100) NULL,
 CONSTRAINT [PK_AffidavitDocumentHistory] PRIMARY KEY CLUSTERED 
(
	[AffidavitHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AffidavitStatus]    Script Date: 7/12/2018 8:37:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AffidavitStatus](
	[AffidavitStatusId] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[StatusDescription] [nvarchar](50) NULL,
 CONSTRAINT [PK_AffidavitStatus] PRIMARY KEY CLUSTERED 
(
	[AffidavitStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ASSESSOR]    Script Date: 7/12/2018 8:37:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ASSESSOR](
	[RNUM] [varchar](10) NULL,
	[STATE_ID] [varchar](22) NULL,
	[NEW_STATE_ID] [varchar](22) NULL,
	[PROPERTY_ID] [char](7) NOT NULL,
	[OWNER1] [varchar](35) NULL,
	[OWNER2] [varchar](35) NULL,
	[OWNER3] [varchar](35) NULL,
	[OWNER_ADDRESS] [varchar](35) NULL,
	[OWNER_CITY] [varchar](28) NULL,
	[OWNER_STATE] [char](2) NULL,
	[OWNER_ZIP] [varchar](10) NULL,
	[SITE_ADDRESS_NUMBER] [varchar](11) NULL,
	[SITE_STREET_DIRECTION] [varchar](2) NULL,
	[SITE_STREET_NAME] [varchar](28) NULL,
	[SITE_STREET_TYPE] [varchar](4) NULL,
	[SITE_UNIT_TYPE] [varchar](8) NULL,
	[SITE_UNIT_NUMBER] [varchar](5) NULL,
	[SITE_ADDRESS_FULL] [varchar](37) NULL,
	[SITE_CITY] [varchar](30) NULL,
	[SITE_STATE] [varchar](6) NULL,
	[SITE_ZIP] [varchar](8) NULL,
	[SITE_CITY_STATE_ZIP] [varchar](26) NULL,
	[INSTRUMENT_NUMBER] [varchar](50) NULL,
	[MAP_NUMBER] [varchar](9) NULL,
	[LEGAL_DESCRIPTION] [varchar](250) NULL,
	[LOT] [varchar](23) NULL,
	[BLOCK] [varchar](14) NULL,
	[TAXCODE] [varchar](7) NULL,
	[PARCEL_SQUARE_FEET] [int] NULL,
	[PARCEL_WIDTH_FOOTAGE] [int] NULL,
	[PARCEL_LENGTH_FOOTAGE] [smallint] NULL,
	[PROPERTY_CODE] [varchar](2) NULL,
	[PROPERTY_CODE_DESC] [varchar](50) NULL,
	[LANDUSE] [varchar](4) NULL,
	[YEAR_BUILT] [varchar](10) NULL,
	[BLDGSQFT] [int] NULL,
	[NUMBER_OF_BEDROOMS] [int] NULL,
	[NUMBER_OF_STORIES] [int] NULL,
	[NUMBER_OF_UNITS] [int] NULL,
	[MARKET_VALUE_YEAR1] [varchar](4) NOT NULL,
	[MARKET_VALUE_LAND1] [int] NULL,
	[MARKET_VALUE_IMPROVEMENTS1] [int] NULL,
	[MARKET_VALUE_TOTAL1] [int] NULL,
	[MARKET_EXEMPTION_VALUE1] [int] NULL,
	[M50_ASSESSED_VALUE1] [int] NULL,
	[ASSESSED_VALUE_YEAR1] [varchar](4) NOT NULL,
	[ASSESSED_VALUE1] [int] NULL,
	[MARKET_VALUE_YEAR2] [varchar](4) NOT NULL,
	[MARKET_VALUE_LAND2] [int] NULL,
	[MARKET_VALUE_IMPROVEMENTS2] [int] NULL,
	[MARKET_VALUE_TOTAL2] [int] NULL,
	[MARKET_EXEMPTION_VALUE2] [int] NULL,
	[M50_ASSESSED_VALUE2] [int] NULL,
	[ASSESSED_VALUE_YEAR2] [varchar](4) NOT NULL,
	[ASSESSED_VALUE2] [int] NULL,
	[MARKET_VALUE_YEAR3] [varchar](30) NULL,
	[MARKET_VALUE_LAND3] [int] NULL,
	[MARKET_VALUE_IMPROVEMENTS3] [int] NULL,
	[MARKET_VALUE_TOTAL3] [int] NULL,
	[MARKET_EXEMPTION_VALUE3] [int] NULL,
	[M50_ASSESSED_VALUE3] [int] NULL,
	[ASSESSED_VALUE_YEAR3] [varchar](30) NULL,
	[ASSESSED_VALUE3] [int] NULL,
	[SALEDATE] [varchar](30) NULL,
	[SALEPRICE] [int] NULL,
	[EXEMPTION_VALUE_YEAR1] [varchar](4) NOT NULL,
	[EXEMPTION_VALUE_LAND1] [decimal](18, 0) NULL,
	[EXEMPTION_VALUE_IMPROVEMENTS1] [decimal](18, 0) NULL,
	[EXEMPTION_VALUE_YEAR2] [varchar](4) NOT NULL,
	[EXEMPTION_VALUE_LAND2] [decimal](18, 0) NULL,
	[EXEMPTION_VALUE_IMPROVEMENTS2] [decimal](18, 0) NULL,
	[EXEMPTION_VALUE_YEAR3] [varchar](4) NOT NULL,
	[EXEMPTION_VALUE_LAND3] [decimal](18, 0) NULL,
	[EXEMPTION_VALUE_IMPROVEMENTS3] [decimal](18, 0) NULL,
	[COUNTY] [varchar](1) NULL,
	[ACCOUNT_STATUS_CODE] [char](1) NULL,
	[RATIO_CODE] [char](3) NULL,
	[IS_CONDO] [tinyint] NULL,
	[PARENT_ID] [varchar](22) NULL,
	[IS_FAKE_PARENT] [tinyint] NULL,
	[SAME_OWNER_SITE_ADDR] [int] NULL,
	[X_COORD] [int] NULL,
	[Y_COORD] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idxAssessor]    Script Date: 7/12/2018 8:37:16 PM ******/
CREATE CLUSTERED INDEX [idxAssessor] ON [dbo].[ASSESSOR]
(
	[RNUM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CCB_DAILY_LICENSES]    Script Date: 7/12/2018 8:37:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CCB_DAILY_LICENSES](
	[CCB_Id] [uniqueidentifier] NOT NULL,
	[license_number] [bigint] NOT NULL,
	[registration_type] [nvarchar](2) NULL,
	[county_code] [int] NULL,
	[business_name] [nvarchar](200) NULL,
	[address] [nvarchar](100) NULL,
	[city] [nvarchar](50) NULL,
	[state] [nvarchar](2) NULL,
	[zip] [nvarchar](15) NULL,
	[business_telephone] [bigint] NULL,
	[fax_number] [bigint] NULL,
	[S_11] [nvarchar](2000) NULL,
	[S_12] [nvarchar](2000) NULL,
	[S_13] [nvarchar](2000) NULL,
	[ins_co_name] [nvarchar](50) NULL,
	[ins_amount] [bigint] NULL,
	[ins_due_to_exp] [date] NULL,
	[claims_filed] [int] NULL,
	[exempt_nonexempt_status] [nvarchar](20) NULL,
	[sic_codes] [nvarchar](175) NULL,
	[endorsements] [nvarchar](50) NULL,
	[r_bond_co_name] [nvarchar](50) NULL,
	[r_bond_amount] [bigint] NULL,
	[r_bond_due_to_exp] [date] NULL,
	[c_bond_co_name] [nvarchar](50) NULL,
	[c_bond_amount] [bigint] NULL,
	[c_bond_due_to_exp] [date] NULL,
	[rmi_name] [nvarchar](55) NULL,
	[lic_exp_date] [date] NULL,
	[S_29] [nvarchar](2000) NULL,
	[alias_name] [nvarchar](200) NULL,
 CONSTRAINT [PK_CCB_DAILY_LICENSES] PRIMARY KEY CLUSTERED 
(
	[CCB_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CityContract]    Script Date: 7/12/2018 8:37:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CityContract](
	[ContractID] [int] NOT NULL,
	[Contractor_Key] [int] NULL,
	[RevisedDate] [datetime] NULL,
	[RevisedBy] [varchar](15) NULL,
	[Active] [tinyint] NULL,
	[ContractorName_XXX] [varchar](20) NULL,
 CONSTRAINT [PK_CityContract] PRIMARY KEY CLUSTERED 
(
	[ContractID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CityContractRepairItem]    Script Date: 7/12/2018 8:37:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CityContractRepairItem](
	[Contract_Key] [int] NULL,
	[RepairItem_Key] [int] NULL,
	[RepairItemType_Key] [varchar](20) NULL,
	[Rate] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[commontext]    Script Date: 7/12/2018 8:37:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[commontext](
	[txtid] [int] NULL,
	[text] [varchar](80) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contractor]    Script Date: 7/12/2018 8:37:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contractor](
	[ContractorID] [int] IDENTITY(1,1) NOT NULL,
	[ContractorName] [varchar](20) NOT NULL,
	[CCB] [varchar](10) NULL,
	[Name] [varchar](40) NULL,
	[Contact] [varchar](40) NULL,
	[Address] [varchar](40) NULL,
	[City] [varchar](24) NULL,
	[State] [char](2) NULL,
	[Zip] [varchar](10) NULL,
	[Phone] [varchar](16) NULL,
	[MBE] [tinyint] NULL,
	[WBE] [tinyint] NULL,
	[ESB] [tinyint] NULL,
	[Active] [tinyint] NULL,
	[CityContractor] [tinyint] NULL,
 CONSTRAINT [PK_Contractor_1] PRIMARY KEY CLUSTERED 
(
	[ContractorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contractor_Alias]    Script Date: 7/12/2018 8:37:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contractor_Alias](
	[Contractor_Alias_Id] [uniqueidentifier] NOT NULL,
	[CCB_No] [bigint] NOT NULL,
	[Business_Name] [nvarchar](200) NOT NULL,
	[Alias] [nvarchar](200) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Contractor_Alias_Name] PRIMARY KEY CLUSTERED 
(
	[Contractor_Alias_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[CCB_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CostType]    Script Date: 7/12/2018 8:37:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CostType](
	[CostTypeID] [char](1) NOT NULL,
	[Description] [varchar](50) NULL,
 CONSTRAINT [PK_CostType] PRIMARY KEY CLUSTERED 
(
	[CostTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dbo.parcel__hold2]    Script Date: 7/12/2018 8:37:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbo.parcel__hold2](
	[parcel] [char](11) NULL,
	[quarter_sec] [char](12) NULL,
	[property_id] [char](12) NULL,
	[platname] [char](40) NULL,
	[block] [char](7) NULL,
	[lot] [char](7) NULL,
	[legal] [varchar](254) NULL,
	[own_name] [varchar](56) NULL,
	[own_name2] [varchar](56) NULL,
	[own_name3] [varchar](56) NULL,
	[own_addr1] [varchar](56) NULL,
	[own_addr2] [varchar](56) NULL,
	[st_prefix] [char](2) NULL,
	[st_number] [char](12) NULL,
	[st_name] [varchar](30) NULL,
	[st_type] [char](4) NULL,
	[st_suffix] [char](12) NULL,
	[zip] [char](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dntest1]    Script Date: 7/12/2018 8:37:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dntest1](
	[rnum] [char](12) NULL,
	[map_id] [char](10) NULL,
	[qtr_sec] [int] NULL,
	[sw_qtrsec] [char](12) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 7/12/2018 8:37:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLog](
	[LogId] [uniqueidentifier] NOT NULL,
	[Message] [nvarchar](2000) NOT NULL,
	[StackTrace] [nvarchar](2000) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ErrorLog] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inspection]    Script Date: 7/12/2018 8:37:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inspection](
	[fis_name] [varchar](8) NULL,
	[parcel_no] [varchar](11) NULL,
	[parcel_seq] [int] NULL,
	[batch_id] [varchar](28) NULL,
	[inspector_no] [int] NULL,
	[aff_no] [int] NULL,
	[aff_status] [int] NULL,
	[aff_action] [int] NULL,
	[inspect_date] [datetime] NULL,
	[vacant_flag] [char](1) NULL,
	[vacant_desc] [varchar](80) NULL,
	[comment] [varchar](160) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [inspection_idx]    Script Date: 7/12/2018 8:37:16 PM ******/
CREATE UNIQUE CLUSTERED INDEX [inspection_idx] ON [dbo].[inspection]
(
	[fis_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inspector]    Script Date: 7/12/2018 8:37:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inspector](
	[InspectorId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[FullName] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[UserName] [nvarchar](50) NULL,
	[Phone] [bigint] NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Inspector] PRIMARY KEY CLUSTERED 
(
	[InspectorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[parcel]    Script Date: 7/12/2018 8:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[parcel](
	[parcel] [char](11) NULL,
	[quarter_sec] [char](12) NULL,
	[property_id] [char](12) NULL,
	[platname] [char](40) NULL,
	[block] [char](7) NULL,
	[lot] [char](7) NULL,
	[legal] [varchar](254) NULL,
	[own_name] [varchar](56) NULL,
	[own_name2] [varchar](56) NULL,
	[own_name3] [varchar](56) NULL,
	[own_addr1] [varchar](56) NULL,
	[own_addr2] [varchar](56) NULL,
	[st_prefix] [char](2) NULL,
	[st_number] [char](12) NULL,
	[st_name] [varchar](30) NULL,
	[st_type] [char](4) NULL,
	[st_suffix] [char](12) NULL,
	[zip] [char](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[parcel_hold]    Script Date: 7/12/2018 8:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[parcel_hold](
	[parcel] [char](11) NULL,
	[quarter_sec] [char](12) NULL,
	[property_id] [char](12) NULL,
	[platname] [char](40) NULL,
	[block] [char](7) NULL,
	[lot] [char](7) NULL,
	[legal] [varchar](254) NULL,
	[own_name] [varchar](56) NULL,
	[own_name2] [varchar](56) NULL,
	[own_name3] [varchar](56) NULL,
	[own_addr1] [varchar](56) NULL,
	[own_addr2] [varchar](56) NULL,
	[st_prefix] [char](2) NULL,
	[st_number] [char](12) NULL,
	[st_name] [varchar](30) NULL,
	[st_type] [char](4) NULL,
	[st_suffix] [char](12) NULL,
	[zip] [char](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[parcel_work]    Script Date: 7/12/2018 8:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[parcel_work](
	[parcel] [char](11) NULL,
	[quarter_sec] [char](12) NULL,
	[property_id] [char](12) NULL,
	[platname] [char](40) NULL,
	[block] [char](7) NULL,
	[lot] [char](7) NULL,
	[legal] [varchar](254) NULL,
	[own_name] [varchar](56) NULL,
	[own_name2] [varchar](56) NULL,
	[own_name3] [varchar](56) NULL,
	[own_addr1] [varchar](56) NULL,
	[own_addr2] [varchar](56) NULL,
	[st_prefix] [char](2) NULL,
	[st_number] [char](12) NULL,
	[st_name] [varchar](30) NULL,
	[st_type] [char](4) NULL,
	[st_suffix] [char](12) NULL,
	[zip] [char](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permit]    Script Date: 7/12/2018 8:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permit](
	[PermitID] [bigint] IDENTITY(1,1) NOT NULL,
	[PermitNo] [nvarchar](50) NULL,
	[PermitIssued] [nvarchar](50) NULL,
	[PermitExtended] [nvarchar](50) NULL,
	[DateIssued] [datetime] NULL,
	[DateExpired] [datetime] NULL,
	[BuilderBoardNo] [nvarchar](50) NULL,
	[DateCancelled] [datetime] NULL,
	[CancelledBy] [nvarchar](50) NULL,
	[LastAction] [nvarchar](50) NULL,
	[ApplicantType] [nvarchar](50) NULL,
	[ContractorID] [nvarchar](200) NULL,
	[AffidavitID] [bigint] NULL,
	[TotalFee] [decimal](18, 2) NULL,
	[PermitStatus] [bigint] NULL,
	[ApplicantID] [bigint] NULL,
	[SubmissionDate] [datetime] NULL,
	[PropertyAddress] [nvarchar](max) NULL,
	[DateExpiredNew] [datetime] NULL,
	[IssuedBy] [nvarchar](50) NULL,
	[DatePermitExtended] [datetime] NULL,
	[NEW_AFF] [nvarchar](50) NULL,
	[Notes] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Permit] PRIMARY KEY CLUSTERED 
(
	[PermitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PermitApplicant]    Script Date: 7/12/2018 8:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermitApplicant](
	[ApplicantID] [bigint] IDENTITY(1,1) NOT NULL,
	[ApplicantType] [nvarchar](50) NULL,
	[Name] [nvarchar](200) NULL,
	[Contact] [nvarchar](50) NULL,
	[Address] [nvarchar](200) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Zip] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[PermitID] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[ContactPhoneNumber] [nvarchar](50) NULL,
 CONSTRAINT [PK_PermitApplicant] PRIMARY KEY CLUSTERED 
(
	[ApplicantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PermitCostsDetail]    Script Date: 7/12/2018 8:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermitCostsDetail](
	[PermitCostID] [bigint] IDENTITY(1,1) NOT NULL,
	[AffidavitID] [bigint] NULL,
	[CostType] [nvarchar](50) NULL,
	[RepairItem] [nvarchar](50) NULL,
	[Unit] [decimal](18, 2) NULL,
	[Rate] [decimal](18, 2) NULL,
	[Cost] [decimal](18, 2) NULL,
 CONSTRAINT [PK_PermitCostDetails] PRIMARY KEY CLUSTERED 
(
	[PermitCostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PermitFee]    Script Date: 7/12/2018 8:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermitFee](
	[PermitFeeId] [bigint] IDENTITY(1,1) NOT NULL,
	[MinimumFee] [smallmoney] NULL,
	[MaximumFee] [smallmoney] NULL,
	[NewEffectiveDate] [smalldatetime] NULL,
	[NewMinimumFee] [smallmoney] NULL,
	[NewMaximumFee] [smallmoney] NULL,
 CONSTRAINT [PK_PermitFee] PRIMARY KEY CLUSTERED 
(
	[PermitFeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PermitFeeRate]    Script Date: 7/12/2018 8:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermitFeeRate](
	[PermitFeeID] [bigint] IDENTITY(1,1) NOT NULL,
	[Action_Type] [nvarchar](50) NULL,
	[CurrentRate] [decimal](18, 2) NULL,
	[NewEffectiveRate] [decimal](18, 2) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_PermitFeeRate] PRIMARY KEY CLUSTERED 
(
	[PermitFeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PermitHistory]    Script Date: 7/12/2018 8:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermitHistory](
	[PermitHistoryID] [bigint] IDENTITY(1,1) NOT NULL,
	[PermitID] [bigint] NULL,
	[Status] [nvarchar](100) NULL,
	[ActivityTime] [datetime] NULL,
	[Comments] [nvarchar](max) NULL,
 CONSTRAINT [PK_PermitHistory] PRIMARY KEY CLUSTERED 
(
	[PermitHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PermitPayment]    Script Date: 7/12/2018 8:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermitPayment](
	[PermitPaymentID] [bigint] IDENTITY(100001,1) NOT NULL,
	[PermitID] [bigint] NULL,
	[IssueDate] [datetime] NULL,
	[IssuedBy] [nvarchar](50) NULL,
	[PaymentMethod] [nvarchar](50) NULL,
	[ApprovalCode] [nvarchar](50) NULL,
	[CheckNumber] [nvarchar](50) NULL,
	[Notes] [nvarchar](500) NULL,
 CONSTRAINT [PK_PermitPayment] PRIMARY KEY CLUSTERED 
(
	[PermitPaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_PermitID] UNIQUE NONCLUSTERED 
(
	[PermitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PermitStatus]    Script Date: 7/12/2018 8:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermitStatus](
	[PermitStatusID] [bigint] IDENTITY(1,1) NOT NULL,
	[PermitStatusValue] [nvarchar](50) NULL,
 CONSTRAINT [PK_PermitStatus] PRIMARY KEY CLUSTERED 
(
	[PermitStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PORT_TAXLOTS_PDX]    Script Date: 7/12/2018 8:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PORT_TAXLOTS_PDX](
	[AREA] [numeric](38, 8) NULL,
	[STATE_ID] [varchar](20) NULL,
	[RNO] [varchar](35) NULL,
	[OWNER1] [varchar](35) NULL,
	[OWNER2] [varchar](35) NULL,
	[OWNER3] [varchar](35) NULL,
	[OWNERADDR] [varchar](35) NULL,
	[OWNERCITY] [varchar](28) NULL,
	[OWNERSTATE] [varchar](2) NULL,
	[OWNERZIP] [varchar](10) NULL,
	[SITEADDR] [varchar](37) NULL,
	[SITECITY] [varchar](30) NULL,
	[SITE_STATE] [varchar](6) NULL,
	[SITEZIP] [varchar](8) NULL,
	[LEGAL_DESC] [varchar](250) NULL,
	[TAXCODE] [varchar](7) NULL,
	[PROP_CODE] [varchar](2) NULL,
	[PRPCD_DESC] [varchar](50) NULL,
	[LANDUSE] [varchar](4) NULL,
	[YEARBUILT] [varchar](10) NULL,
	[BLDGSQFT] [numeric](10, 2) NULL,
	[BEDROOMS] [numeric](10, 2) NULL,
	[FLOORS] [numeric](10, 2) NULL,
	[UNITS] [numeric](10, 2) NULL,
	[PROPERTYID] [varchar](7) NULL,
	[TLID] [varchar](25) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PORT_TAXLOTS_PDX_old]    Script Date: 7/12/2018 8:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PORT_TAXLOTS_PDX_old](
	[AREA] [numeric](38, 8) NULL,
	[STATE_ID] [varchar](20) NULL,
	[RNO] [varchar](35) NULL,
	[OWNER1] [varchar](35) NULL,
	[OWNER2] [varchar](35) NULL,
	[OWNER3] [varchar](35) NULL,
	[OWNERADDR] [varchar](35) NULL,
	[OWNERCITY] [varchar](28) NULL,
	[OWNERSTATE] [varchar](2) NULL,
	[OWNERZIP] [varchar](10) NULL,
	[SITEADDR] [varchar](37) NULL,
	[SITECITY] [varchar](30) NULL,
	[SITE_STATE] [varchar](6) NULL,
	[SITEZIP] [varchar](8) NULL,
	[LEGAL_DESC] [varchar](250) NULL,
	[TAXCODE] [varchar](7) NULL,
	[PROP_CODE] [varchar](2) NULL,
	[PRPCD_DESC] [varchar](50) NULL,
	[LANDUSE] [varchar](4) NULL,
	[YEARBUILT] [varchar](10) NULL,
	[BLDGSQFT] [numeric](10, 2) NULL,
	[BEDROOMS] [numeric](10, 2) NULL,
	[FLOORS] [numeric](10, 2) NULL,
	[UNITS] [numeric](10, 2) NULL,
	[PROPERTYID] [varchar](7) NULL,
	[TLID] [varchar](25) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrintCode]    Script Date: 7/12/2018 8:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrintCode](
	[PrintID] [int] IDENTITY(1,1) NOT NULL,
	[PrintCodeID] [nvarchar](50) NOT NULL,
	[PrintDescription] [nvarchar](50) NULL,
 CONSTRAINT [PK_PrintCode_1] PRIMARY KEY CLUSTERED 
(
	[PrintID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RepairItemRate]    Script Date: 7/12/2018 8:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RepairItemRate](
	[RateID] [bigint] IDENTITY(1,1) NOT NULL,
	[ActionType] [nvarchar](100) NULL,
	[CurrentRate] [decimal](18, 2) NULL,
	[NewRate] [decimal](18, 2) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_RepairItemRate] PRIMARY KEY CLUSTERED 
(
	[RateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 7/12/2018 8:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[PERNR] [int] NOT NULL,
	[UserID] [varchar](10) NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Supervisor] [bit] NULL,
	[Inspector] [bit] NULL,
	[Forms] [bit] NULL,
	[Final] [bit] NULL,
	[Permit] [bit] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[PERNR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sw_action]    Script Date: 7/12/2018 8:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sw_action](
	[aff_no] [int] NULL,
	[action] [char](1) NULL,
	[action_dt] [datetime] NULL,
	[cost_dt] [datetime] NULL,
	[contract_id] [int] NULL,
	[special_cost] [money] NULL,
	[move_in] [money] NULL,
	[adjustment] [money] NULL,
	[total_cost] [money] NULL,
	[comments] [varchar](254) NULL,
	[override] [char](1) NULL,
	[fis_name] [varchar](12) NULL,
	[batch_id] [varchar](28) NULL
) ON [PRIMARY]
GO
/****** Object:  Index [sw_action_idx]    Script Date: 7/12/2018 8:37:17 PM ******/
CREATE CLUSTERED INDEX [sw_action_idx] ON [dbo].[sw_action]
(
	[aff_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sw_action_codes]    Script Date: 7/12/2018 8:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sw_action_codes](
	[aff_no] [int] NULL,
	[action] [char](1) NULL,
	[action_code] [char](1) NULL,
	[cost] [money] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [sw_action_codes_idx]    Script Date: 7/12/2018 8:37:17 PM ******/
CREATE CLUSTERED INDEX [sw_action_codes_idx] ON [dbo].[sw_action_codes]
(
	[aff_no] ASC,
	[action] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sw_action_codes_txt]    Script Date: 7/12/2018 8:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sw_action_codes_txt](
	[action_code] [char](1) NULL,
	[code_txt] [varchar](15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sw_action_detail]    Script Date: 7/12/2018 8:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sw_action_detail](
	[aff_no] [int] NULL,
	[action] [char](1) NULL,
	[action_type] [varchar](20) NULL,
	[unit] [float] NULL,
	[cost] [money] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [sw_action_detail_idx]    Script Date: 7/12/2018 8:37:17 PM ******/
CREATE CLUSTERED INDEX [sw_action_detail_idx] ON [dbo].[sw_action_detail]
(
	[aff_no] ASC,
	[action] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sw_address]    Script Date: 7/12/2018 8:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sw_address](
	[aff_no] [int] NULL,
	[own_addr] [varchar](45) NULL,
	[own_addr2] [varchar](45) NULL,
	[own_city] [varchar](20) NULL,
	[own_state] [char](2) NULL,
	[own_zip] [varchar](10) NULL,
	[own_country] [varchar](18) NULL
) ON [PRIMARY]
GO
/****** Object:  Index [sw_address_idx]    Script Date: 7/12/2018 8:37:17 PM ******/
CREATE CLUSTERED INDEX [sw_address_idx] ON [dbo].[sw_address]
(
	[aff_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sw_batch]    Script Date: 7/12/2018 8:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sw_batch](
	[batch_id] [varchar](28) NULL,
	[batch_count] [int] NULL,
	[batch_date] [datetime] NULL,
	[batch_prefix] [char](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sw_batch_log]    Script Date: 7/12/2018 8:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sw_batch_log](
	[batch_id] [varchar](28) NULL,
	[aff_no] [int] NULL,
	[message_code] [int] NULL,
	[message_text] [varchar](80) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sw_contract]    Script Date: 7/12/2018 8:37:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sw_contract](
	[contract_id] [int] NULL,
	[contractor_id] [varchar](12) NULL,
	[date_from] [datetime] NULL,
	[date_to] [datetime] NULL,
	[contract_min] [money] NULL,
	[contract_max] [money] NULL,
	[contract_act] [money] NULL,
	[move_in] [money] NULL,
	[active_flag] [char](1) NULL,
	[revised_date] [datetime] NULL,
	[revised_by] [varchar](15) NULL,
	[contract_code] [varchar](48) NULL,
	[active] [tinyint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sw_contract_rates]    Script Date: 7/12/2018 8:37:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sw_contract_rates](
	[contract_id] [int] NULL,
	[action_type] [varchar](20) NULL,
	[rate] [money] NULL,
	[min_unit] [int] NULL,
	[min_charge] [money] NULL,
	[include_move_in] [char](1) NULL,
	[pcode] [char](1) NULL,
	[sequence] [int] NULL,
	[unit_desc] [varchar](16) NULL,
	[short_desc] [varchar](6) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sw_contractor]    Script Date: 7/12/2018 8:37:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sw_contractor](
	[contractor_id] [varchar](12) NULL,
	[name] [varchar](40) NULL,
	[contact] [varchar](40) NULL,
	[address] [varchar](40) NULL,
	[city] [varchar](24) NULL,
	[state] [char](2) NULL,
	[zip] [varchar](10) NULL,
	[phone] [int] NULL,
	[license_no] [varchar](10) NULL,
	[mbe_status] [char](1) NULL,
	[wbe_status] [char](1) NULL,
	[esb_status] [char](1) NULL,
	[active_flag] [char](1) NULL,
	[phone1] [varchar](16) NULL,
	[mbe] [tinyint] NULL,
	[wbe] [tinyint] NULL,
	[esb] [tinyint] NULL,
	[active] [tinyint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sw_inspector]    Script Date: 7/12/2018 8:37:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sw_inspector](
	[inspector_no] [int] NULL,
	[lname] [varchar](20) NULL,
	[fname] [varchar](10) NULL,
	[inspector_name] [varchar](36) NULL,
	[active] [tinyint] NULL,
	[network_username] [varchar](25) NULL,
	[phone] [varchar](15) NULL,
	[email] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sw_letter_date]    Script Date: 7/12/2018 8:37:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sw_letter_date](
	[aff_no] [int] NULL,
	[date_type] [char](2) NULL,
	[letter_dt] [datetime] NULL,
	[proj_repair_dt] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [sw_letter_date_idx]    Script Date: 7/12/2018 8:37:18 PM ******/
CREATE CLUSTERED INDEX [sw_letter_date_idx] ON [dbo].[sw_letter_date]
(
	[aff_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sw_letter_date_txt]    Script Date: 7/12/2018 8:37:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sw_letter_date_txt](
	[date_type] [char](2) NULL,
	[descrip] [varchar](20) NULL,
	[letter_template] [varchar](40) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sw_parameters]    Script Date: 7/12/2018 8:37:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sw_parameters](
	[default_contract] [int] NULL,
	[min_aff_no] [int] NULL,
	[max_aff_no] [int] NULL,
	[last_aff_no] [int] NULL,
	[default_printer] [varchar](12) NULL,
	[print_aff] [int] NULL,
	[print_est] [int] NULL,
	[lock_flag] [int] NULL,
	[letter30] [int] NULL,
	[letter30_est] [int] NULL,
	[notice1] [int] NULL,
	[notice2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sw_permit_fee]    Script Date: 7/12/2018 8:37:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sw_permit_fee](
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[rate] [money] NULL,
	[minimum] [money] NULL,
	[maximum] [money] NULL,
	[flag] [char](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sw_posting]    Script Date: 7/12/2018 8:37:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sw_posting](
	[aff_no] [int] NULL,
	[qtr_sec] [varchar](12) NULL,
	[map_id] [varchar](24) NULL,
	[post_dt] [datetime] NULL,
	[acct_period] [int] NULL,
	[property_id] [varchar](24) NULL,
	[property_id2] [varchar](24) NULL,
	[property_desc] [varchar](255) NULL,
	[aff_status] [int] NULL,
	[owner_name] [varchar](40) NULL,
	[attn1] [varchar](40) NULL,
	[attn2] [varchar](40) NULL,
	[st_no] [varchar](24) NULL,
	[district] [varchar](2) NULL,
	[st_name] [varchar](40) NULL,
	[designator] [varchar](4) NULL,
	[city] [varchar](24) NULL,
	[zip] [varchar](10) NULL,
	[inspector_no] [int] NULL,
	[city_owned_flag] [char](1) NULL,
	[owner_resident_flag] [char](1) NULL,
	[service_req_flag] [char](1) NULL,
	[rep_by_city] [char](1) NULL,
	[rep_by_owner] [char](1) NULL,
	[partial_repair] [char](1) NULL,
	[vacant_lot_flag] [char](1) NULL,
	[vacant_desc] [varchar](255) NULL,
	[repair_dt] [datetime] NULL,
	[billed_dt] [datetime] NULL,
	[bill_flag] [char](1) NULL,
	[hold_until_dt] [datetime] NULL,
	[permit_no] [int] NULL,
	[permit_issued] [varchar](3) NULL,
	[permit_extended] [char](1) NULL,
	[date_issued] [datetime] NULL,
	[date_expired] [datetime] NULL,
	[contractor] [varchar](40) NULL,
	[builder_board_no] [varchar](6) NULL,
	[license_no] [varchar](10) NULL,
	[date_cancelled] [datetime] NULL,
	[cancelled_by] [varchar](10) NULL,
	[status] [char](1) NULL,
	[last_action] [char](1) NULL,
	[date_added] [datetime] NULL,
	[date_updated] [datetime] NULL,
	[notes] [varchar](255) NULL,
	[sent_dt] [datetime] NULL,
	[NEW_AFF] [varchar](10) NULL,
	[NEW_RepairDueDate] [smalldatetime] NULL,
	[NEW_ClearWalk] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sw_qsum_header]    Script Date: 7/12/2018 8:37:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sw_qsum_header](
	[c1at] [varchar](6) NULL,
	[c2at] [varchar](6) NULL,
	[c3at] [varchar](6) NULL,
	[c4at] [varchar](6) NULL,
	[c5at] [varchar](6) NULL,
	[c1ud] [varchar](6) NULL,
	[c2ud] [varchar](6) NULL,
	[c3ud] [varchar](6) NULL,
	[c4ud] [varchar](6) NULL,
	[c5ud] [varchar](6) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sw_qtr_list]    Script Date: 7/12/2018 8:37:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sw_qtr_list](
	[name] [varchar](24) NULL,
	[aff_no] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sw_user]    Script Date: 7/12/2018 8:37:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sw_user](
	[username] [char](32) NOT NULL,
	[batchlistdays] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnitOfMeasure]    Script Date: 7/12/2018 8:37:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitOfMeasure](
	[UnitID] [int] IDENTITY(1,1) NOT NULL,
	[UomID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UnitOfMeasure_1] PRIMARY KEY CLUSTERED 
(
	[UnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [rose\RANGER].[dan_work]    Script Date: 7/12/2018 8:37:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rose\RANGER].[dan_work](
	[aff_no] [int] NULL,
	[repair_dt] [datetime] NULL,
	[date_cancelled] [datetime] NULL,
	[fis_name] [varchar](12) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [rose\RANGER].[qip]    Script Date: 7/12/2018 8:37:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rose\RANGER].[qip](
	[OBJECTID] [int] NOT NULL,
	[AREA] [numeric](14, 3) NULL,
	[PERIMETER] [numeric](14, 3) NULL,
	[QTRSEC_] [numeric](11, 0) NULL,
	[QTRSEC_ID] [numeric](11, 0) NULL,
	[QTRNO] [nvarchar](4) NULL,
	[QTRSEC] [nvarchar](7) NULL,
	[SHIFT] [nvarchar](1) NULL,
	[FULLSEC] [nvarchar](1) NULL,
	[EZONE] [nvarchar](1) NULL,
	[FOURSEC] [nvarchar](8) NULL,
	[QTRNUM] [smallint] NULL,
	[TOWN] [nvarchar](4) NULL,
	[SECT] [nvarchar](6) NULL,
	[Shape] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [rose\RANGER].[strFisFile]    Script Date: 7/12/2018 8:37:18 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rose\RANGER].[strFisFile](
	[fis_name] [varchar](12) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [rose\RANGER].[test_den]    Script Date: 7/12/2018 8:37:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rose\RANGER].[test_den](
	[inspector_no] [int] NULL,
	[lname] [varchar](20) NULL,
	[fname] [varchar](10) NULL,
	[inspector_name] [varchar](36) NULL,
	[active] [tinyint] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [inspection_idx2]    Script Date: 7/12/2018 8:37:18 PM ******/
CREATE NONCLUSTERED INDEX [inspection_idx2] ON [dbo].[inspection]
(
	[batch_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [inspection_idx3]    Script Date: 7/12/2018 8:37:18 PM ******/
CREATE NONCLUSTERED INDEX [inspection_idx3] ON [dbo].[inspection]
(
	[aff_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Idx_PORT_TAXLOTS_PDX]    Script Date: 7/12/2018 8:37:18 PM ******/
CREATE NONCLUSTERED INDEX [Idx_PORT_TAXLOTS_PDX] ON [dbo].[PORT_TAXLOTS_PDX]
(
	[RNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Idx_PORT_TAXLOTS_PDX]    Script Date: 7/12/2018 8:37:18 PM ******/
CREATE NONCLUSTERED INDEX [Idx_PORT_TAXLOTS_PDX] ON [dbo].[PORT_TAXLOTS_PDX_old]
(
	[RNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Affidavit_Old] ADD  CONSTRAINT [DF_Affidavit_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Affidavit_Old] ADD  CONSTRAINT [DF_Affidavit_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[AffidavitFormInspection] ADD  CONSTRAINT [DF_AffidavitFormInspection_Sidewalk]  DEFAULT ((0)) FOR [Sidewalk]
GO
ALTER TABLE [dbo].[AffidavitFormInspection] ADD  CONSTRAINT [DF_AffidavitFormInspection_Driveway]  DEFAULT ((0)) FOR [Driveway]
GO
ALTER TABLE [dbo].[AffidavitFormInspection] ADD  CONSTRAINT [DF_AffidavitFormInspection_Curb]  DEFAULT ((0)) FOR [Curb]
GO
ALTER TABLE [dbo].[AffidavitFormInspection] ADD  CONSTRAINT [DF_AffidavitFormInspection_Partial]  DEFAULT ((0)) FOR [Partial]
GO
ALTER TABLE [dbo].[AffidavitFormInspection] ADD  CONSTRAINT [DF_AffidavitFormInspection_MatchJointPattern]  DEFAULT ((0)) FOR [MatchJointPattern]
GO
ALTER TABLE [dbo].[AffidavitFormInspection] ADD  CONSTRAINT [DF_AffidavitFormInspection_PlaceJoints]  DEFAULT ((0)) FOR [PlaceJoints]
GO
ALTER TABLE [dbo].[AffidavitFormInspection] ADD  CONSTRAINT [DF_AffidavitFormInspection_ToolDeepJoints]  DEFAULT ((0)) FOR [ToolDeepJoints]
GO
ALTER TABLE [dbo].[AffidavitFormInspection] ADD  CONSTRAINT [DF_AffidavitFormInspection_NotReady]  DEFAULT ((0)) FOR [NotReady]
GO
ALTER TABLE [dbo].[AffidavitFormInspection] ADD  CONSTRAINT [DF_AffidavitFormInspection_InsufficientBarricades]  DEFAULT ((0)) FOR [InsufficientBarricades]
GO
ALTER TABLE [dbo].[AffidavitFormInspection] ADD  CONSTRAINT [DF_AffidavitFormInspection_RemoveDebris]  DEFAULT ((0)) FOR [RemoveDebris]
GO
ALTER TABLE [dbo].[AffidavitFormInspection] ADD  CONSTRAINT [DF_AffidavitFormInspection_NotDeep]  DEFAULT ((0)) FOR [NotDeep]
GO
ALTER TABLE [dbo].[AffidavitFormInspection] ADD  CONSTRAINT [DF_AffidavitFormInspection_CurbHeight]  DEFAULT ((0)) FOR [CurbHeight]
GO
ALTER TABLE [dbo].[AffidavitFormInspection] ADD  CONSTRAINT [DF_AffidavitFormInspection_SawCutEdges]  DEFAULT ((0)) FOR [SawCutEdges]
GO
ALTER TABLE [dbo].[AffidavitFormInspection] ADD  CONSTRAINT [DF_AffidavitFormInspection_NoPermit]  DEFAULT ((0)) FOR [NoPermit]
GO
ALTER TABLE [dbo].[AffidavitFormInspection] ADD  CONSTRAINT [DF_AffidavitFormInspection_AddCrushedRock]  DEFAULT ((0)) FOR [AddCrushedRock]
GO
ALTER TABLE [dbo].[AffidavitHistory] ADD  CONSTRAINT [DF_AffidavitHistory_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[AffidavitStatus] ADD  CONSTRAINT [DF_AffidavitStatus_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[AffidavitStatus] ADD  CONSTRAINT [DF_AffidavitStatus_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[CCB_DAILY_LICENSES] ADD  CONSTRAINT [DF_CCB_DAILY_LICENSES_CCB_Id]  DEFAULT (newid()) FOR [CCB_Id]
GO
ALTER TABLE [dbo].[Contractor_Alias] ADD  CONSTRAINT [DF_Contractor_Alias_Name_CCB_Alias_Id]  DEFAULT (newid()) FOR [Contractor_Alias_Id]
GO
ALTER TABLE [dbo].[Contractor_Alias] ADD  CONSTRAINT [DF_Contractor_Alias_Created_Date]  DEFAULT (getdate()) FOR [Created_Date]
GO
ALTER TABLE [dbo].[ErrorLog] ADD  CONSTRAINT [DF_ErrorLog_LogId]  DEFAULT (newid()) FOR [LogId]
GO
ALTER TABLE [dbo].[ErrorLog] ADD  CONSTRAINT [DF_ErrorLog_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[RepairItemRate] ADD  CONSTRAINT [DF_RepairItemRate_CurrentRate]  DEFAULT ((0.00)) FOR [CurrentRate]
GO
ALTER TABLE [dbo].[RepairItemRate] ADD  CONSTRAINT [DF_RepairItemRate_NewRate]  DEFAULT ((0.00)) FOR [NewRate]
GO
ALTER TABLE [dbo].[RepairItemRate] ADD  CONSTRAINT [DF_RepairItemRate_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Affidavit]  WITH CHECK ADD  CONSTRAINT [FK_Affidavit_Affidavit] FOREIGN KEY([Status])
REFERENCES [dbo].[AffidavitStatus] ([AffidavitStatusId])
GO
ALTER TABLE [dbo].[Affidavit] CHECK CONSTRAINT [FK_Affidavit_Affidavit]
GO
ALTER TABLE [dbo].[Affidavit]  WITH CHECK ADD  CONSTRAINT [FK_Affidavit_Inspector] FOREIGN KEY([InspectorId])
REFERENCES [dbo].[Inspector] ([InspectorId])
GO
ALTER TABLE [dbo].[Affidavit] CHECK CONSTRAINT [FK_Affidavit_Inspector]
GO
ALTER TABLE [dbo].[AffidavitCosts]  WITH CHECK ADD  CONSTRAINT [FK_AffidavitCosts_CostType] FOREIGN KEY([CostType_Key])
REFERENCES [dbo].[CostType] ([CostTypeID])
GO
ALTER TABLE [dbo].[AffidavitCosts] CHECK CONSTRAINT [FK_AffidavitCosts_CostType]
GO
ALTER TABLE [dbo].[AffidavitCostsDetail]  WITH CHECK ADD  CONSTRAINT [FK_AffidavitCostsDetail_CostType] FOREIGN KEY([CostType_Key])
REFERENCES [dbo].[CostType] ([CostTypeID])
GO
ALTER TABLE [dbo].[AffidavitCostsDetail] CHECK CONSTRAINT [FK_AffidavitCostsDetail_CostType]
GO
ALTER TABLE [dbo].[AffidavitFinalInspection]  WITH CHECK ADD  CONSTRAINT [FK_AffidavitFinalInspection_Affidavit] FOREIGN KEY([AffidavitID])
REFERENCES [dbo].[Affidavit] ([AffidavitID])
GO
ALTER TABLE [dbo].[AffidavitFinalInspection] CHECK CONSTRAINT [FK_AffidavitFinalInspection_Affidavit]
GO
ALTER TABLE [dbo].[AffidavitFinalInspection]  WITH CHECK ADD  CONSTRAINT [FK_AffidavitFinalInspection_Inspector] FOREIGN KEY([FinalPassInspectorId])
REFERENCES [dbo].[Inspector] ([InspectorId])
GO
ALTER TABLE [dbo].[AffidavitFinalInspection] CHECK CONSTRAINT [FK_AffidavitFinalInspection_Inspector]
GO
ALTER TABLE [dbo].[AffidavitFinalInspection]  WITH CHECK ADD  CONSTRAINT [FK_AffidavitFinalInspection_Inspector_Pour] FOREIGN KEY([FinalFailInspectorId])
REFERENCES [dbo].[Inspector] ([InspectorId])
GO
ALTER TABLE [dbo].[AffidavitFinalInspection] CHECK CONSTRAINT [FK_AffidavitFinalInspection_Inspector_Pour]
GO
ALTER TABLE [dbo].[AffidavitFormInspection]  WITH CHECK ADD  CONSTRAINT [FK_AffidavitFormInspection_Affidavit] FOREIGN KEY([AffidavitId])
REFERENCES [dbo].[Affidavit] ([AffidavitID])
GO
ALTER TABLE [dbo].[AffidavitFormInspection] CHECK CONSTRAINT [FK_AffidavitFormInspection_Affidavit]
GO
ALTER TABLE [dbo].[AffidavitFormInspection]  WITH CHECK ADD  CONSTRAINT [FK_AffidavitFormInspection_Inspector_Fail] FOREIGN KEY([FormFailInspectorId])
REFERENCES [dbo].[Inspector] ([InspectorId])
GO
ALTER TABLE [dbo].[AffidavitFormInspection] CHECK CONSTRAINT [FK_AffidavitFormInspection_Inspector_Fail]
GO
ALTER TABLE [dbo].[AffidavitFormInspection]  WITH CHECK ADD  CONSTRAINT [FK_AffidavitFormInspection_Inspector_Pass] FOREIGN KEY([FormPassInspectorId])
REFERENCES [dbo].[Inspector] ([InspectorId])
GO
ALTER TABLE [dbo].[AffidavitFormInspection] CHECK CONSTRAINT [FK_AffidavitFormInspection_Inspector_Pass]
GO
ALTER TABLE [dbo].[AffidavitHistory]  WITH CHECK ADD  CONSTRAINT [FK_AffidavitActivity_Activity] FOREIGN KEY([AffidavitId])
REFERENCES [dbo].[Affidavit] ([AffidavitID])
GO
ALTER TABLE [dbo].[AffidavitHistory] CHECK CONSTRAINT [FK_AffidavitActivity_Activity]
GO
ALTER TABLE [dbo].[AffidavitHistory]  WITH CHECK ADD  CONSTRAINT [FK_AffidavitHistory_AffidavitHistory] FOREIGN KEY([AffidavitStatusId])
REFERENCES [dbo].[AffidavitStatus] ([AffidavitStatusId])
GO
ALTER TABLE [dbo].[AffidavitHistory] CHECK CONSTRAINT [FK_AffidavitHistory_AffidavitHistory]
GO
ALTER TABLE [dbo].[AffidavitHistory]  WITH CHECK ADD  CONSTRAINT [FK_AffidavitHistory_Inspector] FOREIGN KEY([InspectorId])
REFERENCES [dbo].[Inspector] ([InspectorId])
GO
ALTER TABLE [dbo].[AffidavitHistory] CHECK CONSTRAINT [FK_AffidavitHistory_Inspector]
GO
ALTER TABLE [dbo].[CityContract]  WITH CHECK ADD  CONSTRAINT [FK_CityContract_Contractor] FOREIGN KEY([Contractor_Key])
REFERENCES [dbo].[Contractor] ([ContractorID])
GO
ALTER TABLE [dbo].[CityContract] CHECK CONSTRAINT [FK_CityContract_Contractor]
GO
ALTER TABLE [dbo].[CityContractRepairItem]  WITH CHECK ADD  CONSTRAINT [FK_CityContractRepairItem_CityContract] FOREIGN KEY([Contract_Key])
REFERENCES [dbo].[CityContract] ([ContractID])
GO
ALTER TABLE [dbo].[CityContractRepairItem] CHECK CONSTRAINT [FK_CityContractRepairItem_CityContract]
GO
ALTER TABLE [dbo].[Permit]  WITH CHECK ADD  CONSTRAINT [FK_Permit_PermitApplicant] FOREIGN KEY([ApplicantID])
REFERENCES [dbo].[PermitApplicant] ([ApplicantID])
GO
ALTER TABLE [dbo].[Permit] CHECK CONSTRAINT [FK_Permit_PermitApplicant]
GO
ALTER TABLE [dbo].[Permit]  WITH CHECK ADD  CONSTRAINT [FK_Permit_PermitStatus] FOREIGN KEY([PermitStatus])
REFERENCES [dbo].[PermitStatus] ([PermitStatusID])
GO
ALTER TABLE [dbo].[Permit] CHECK CONSTRAINT [FK_Permit_PermitStatus]
GO
ALTER TABLE [dbo].[PermitHistory]  WITH CHECK ADD  CONSTRAINT [FK_PermitHistory_Permit] FOREIGN KEY([PermitID])
REFERENCES [dbo].[Permit] ([PermitID])
GO
ALTER TABLE [dbo].[PermitHistory] CHECK CONSTRAINT [FK_PermitHistory_Permit]
GO
ALTER TABLE [dbo].[PermitPayment]  WITH CHECK ADD  CONSTRAINT [FK_PermitPayment_Permit] FOREIGN KEY([PermitID])
REFERENCES [dbo].[Permit] ([PermitID])
GO
ALTER TABLE [dbo].[PermitPayment] CHECK CONSTRAINT [FK_PermitPayment_Permit]
GO
/****** Object:  StoredProcedure [dbo].[getAffidavitByKeyword]    Script Date: 7/12/2018 8:37:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[getAffidavitByKeyword] 
@keyword nvarchar(50)
As
Begin
     select distinct * from sw_posting where (aff_no like @keyword+'%' and (status) NOT like 'I' and permit_no is null and (permit_issued='' or permit_issued='No' or permit_issued is NULL)) order by aff_no
     End


GO
/****** Object:  StoredProcedure [dbo].[getAffidavitByParameter]    Script Date: 7/12/2018 8:37:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Exec getAffidavitByParameter '','','','','','','',''
CREATE Procedure [dbo].[getAffidavitByParameter] 
@affidavitId varchar(100)='', @propertyId varchar(100)='', @inspectionDate varchar(10)='', @postingDate varchar(10)='', @trackId varchar(100)='',
@inspectorName varchar(100)='', @propertoyAddress varchar(100)='', @previouslyPrinted varchar(100)='', @fromDate varchar(10),@todate varchar(10)
As
	Begin
	if(Len(@affidavitId)>0)
	Begin
	    select distinct swp.aff_no,swp.qtr_sec,swp.map_id,swp.post_dt,swp.acct_period,swp.property_id,swp.property_id2,swp.st_no+' '+swp.district+' '+swp.st_name+' '+swp.designator as property_desc,swp.aff_status,swp.owner_name,swp.attn1,swp.attn2,swp.st_no,swp.district,swp.st_name,IsNull(i.inspector_name,'') as designator, swp.city,swp.zip,swp.inspector_no,swp.city_owned_flag,swp.owner_resident_flag,swp.service_req_flag,swp.rep_by_city,swp.rep_by_owner,swp.partial_repair,swp.vacant_lot_flag,swp.vacant_desc,swp.repair_dt,swp.billed_dt,swp.bill_flag,swp.hold_until_dt,swp.permit_no,swp.permit_issued,swp.permit_extended,swp.date_issued,swp.date_expired,swp.contractor,swp.builder_board_no,swp.license_no,swp.date_cancelled,swp.cancelled_by,swp.status,swp.last_action,swp.date_added,swp.date_updated,swp.notes,swp.sent_dt,swp.NEW_AFF,swp.NEW_RepairDueDate,swp.NEW_ClearWalk from sw_posting as swp with(nolock,nowait)
		Left Join sw_inspector as i with(nolock,nowait) on swp.inspector_no=i.inspector_no 
	     where convert(varchar(10),swp.post_dt ,121) between @fromDate and @todate and (CHARINDEX(@affidavitId,swp.aff_no)>0 or 
	     CHARINDEX(@propertyId,swp.property_id)>0 or 
	     CHARINDEX(@inspectionDate,swp.post_dt)>0 and CHARINDEX('I',swp.status)=0)
	     order by swp.aff_no desc
	End
	Else
	Begin
		 select distinct swp.aff_no,swp.qtr_sec,swp.map_id,swp.post_dt,swp.acct_period,swp.property_id,swp.property_id2,swp.st_no+' '+swp.district+' '+swp.st_name+' '+swp.designator as property_desc,swp.aff_status,swp.owner_name,swp.attn1,swp.attn2,swp.st_no,swp.district,swp.st_name,IsNull(i.inspector_name,'') as designator, swp.city,swp.zip,swp.inspector_no,swp.city_owned_flag,swp.owner_resident_flag,swp.service_req_flag,swp.rep_by_city,swp.rep_by_owner,swp.partial_repair,swp.vacant_lot_flag,swp.vacant_desc,swp.repair_dt,swp.billed_dt,swp.bill_flag,swp.hold_until_dt,swp.permit_no,swp.permit_issued,swp.permit_extended,swp.date_issued,swp.date_expired,swp.contractor,swp.builder_board_no,swp.license_no,swp.date_cancelled,swp.cancelled_by,swp.status,swp.last_action,swp.date_added,swp.date_updated,swp.notes,swp.sent_dt,swp.NEW_AFF,swp.NEW_RepairDueDate,swp.NEW_ClearWalk from sw_posting as swp with(nolock,nowait)
		 Left Join sw_inspector as i with(nolock,nowait) on swp.inspector_no=i.inspector_no
		 where CHARINDEX('I',swp.status)=0 and convert(varchar(10),swp.post_dt ,121) between @fromDate and @todate
	     order by swp.aff_no desc
	End     
	     
End


GO
/****** Object:  StoredProcedure [dbo].[getAffidavitByProperty]    Script Date: 7/12/2018 8:37:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[getAffidavitByProperty] 
@keyword nvarchar(50)
As
Begin
     select distinct * from sw_posting where ( st_no like @keyword+'%' or (st_name) like @keyword+'%') and (status) NOT like 'I' and (permit_issued='' or permit_issued='No' or permit_issued is NULL) and permit_no is null order by aff_no
End


GO
/****** Object:  StoredProcedure [dbo].[getAffidavitCostDetails]    Script Date: 7/12/2018 8:37:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec getAffidavitCostDetails 80795,''
CREATE proc [dbo].[getAffidavitCostDetails]
@affidavitId nvarchar(50),
@costTypeKey nvarchar(50)
As
Begin
	If(LEN(@costTypeKey)>0)
	Begin
		select distinct *,0.00 as rate from sw_action_detail where aff_no=@affidavitId and [action]=@costTypeKey
	End
	Else
	Begin
		select distinct sad.aff_no,sad.action,sad.action_type,sad.unit,(pfr.CurrentRate*sad.unit) as cost,pfr.CurrentRate  as rate from sw_action_detail as sad
		Join RepairItemRate as pfr on sad.action_type=pfr.ActionType where sad.aff_no=@affidavitId
	End
end

GO
/****** Object:  StoredProcedure [dbo].[getAffidavitDetails]    Script Date: 7/12/2018 8:37:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[getAffidavitDetails]
@affidavitId nvarchar(50)
As
Begin
     select DISTINCT swp.*,i.*,swp.st_no+' '+swp.district+' '+swp.st_name+' '+swp.designator as PropertyDescription,IsNull(i.inspector_name,'') as InspectorName from sw_posting as swp
     inner join sw_inspector as i on swp.inspector_no=i.inspector_no
     where swp.aff_no=@affidavitId
End
GO
/****** Object:  StoredProcedure [dbo].[getAffidavitList]    Script Date: 7/12/2018 8:37:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[getAffidavitList] 
As
Begin
     select distinct * from sw_posting
End
GO
/****** Object:  StoredProcedure [dbo].[getContractorByKeyword]    Script Date: 7/12/2018 8:37:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[getContractorByKeyword] 
@keyword nvarchar(50)
As
Begin
     select distinct license_number,business_name,address,city,[state],zip,business_telephone,rmi_name,alias_name from CCB_DAILY_LICENSES where license_number like '%'+@keyword+'%' or business_name like '%'+@keyword+'%' or alias_name like '%'+@keyword+'%' order by license_number asc
End





     
GO
/****** Object:  StoredProcedure [dbo].[getContractorDetailsByCCBNumber]    Script Date: 7/12/2018 8:37:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[getContractorDetailsByCCBNumber]
@ccbNumber nvarchar(50)
As
Begin
     select distinct license_number,business_name,address,city,[state],zip,business_telephone,rmi_name from CCB_DAILY_LICENSES where license_number=@ccbNumber order by license_number asc
End
GO
/****** Object:  StoredProcedure [dbo].[getContractorDetailsByName]    Script Date: 7/12/2018 8:37:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[getContractorDetailsByName]
@name nvarchar(50)
As
Begin
     select distinct * from sw_contractor where contractor_id=@name
End
GO
/****** Object:  StoredProcedure [dbo].[SP_AfterInsertPermit]    Script Date: 7/12/2018 8:37:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  Stored Procedure [dbo].[SP_AfterInsertPermit]    Script Date: 05/16/2017 08:40:46 ******/
--exec SP_AfterInsertPermit 2
Create Proc [dbo].[SP_AfterInsertPermit]
@PermitId bigint
AS
Begin
	declare @permit_no varchar(100);
	declare @permit_issued varchar(100);
	declare @permit_extended varchar(100);
	declare @date_issued varchar(100);
	declare @date_expired varchar(100);
	declare @builder_board_no varchar(100);
	declare @contractor varchar(100);
	declare @date_cancelled varchar(100);
	declare @cancelled_by varchar(100);
	declare @date_added varchar(100);
	declare @date_updated varchar(100);
	declare @date_expired_new varchar(100);
	declare @affidavit_no int;
	declare @permit_status int;
		
	select @permit_no=PermitID,@permit_status=PermitStatus,
	@permit_issued=IssuedBy,@permit_extended=PermitExtended,@date_issued=DateIssued,@date_expired=DateExpired,
	 @date_expired_new=DateExpiredNew,--
	@builder_board_no=BuilderBoardNo,
	@contractor=ContractorID,
	@date_cancelled=DateCancelled,
	@cancelled_by=CancelledBy,
	@date_added=DateIssued ,
	@date_updated=PermitExtended ,
	@affidavit_no=AffidavitID
	from Permit where PermitID=@PermitId;
	print @permit_no;
	print @permit_issued;
	print SUBSTRING (@permit_extended, 1, 1);
	print @date_issued;
	print @date_expired;
	print @builder_board_no;
	print @contractor;
	print @date_cancelled;
	print @cancelled_by;
	print @date_added;
	print @date_updated;
	print @affidavit_no;
	IF(@permit_status=2)
	Begin
		update sw_posting set permit_no=(select CONVERT(int,@permit_no) as permit_no) ,  permit_extended=SUBSTRING (@permit_extended, 1, 1), date_issued=@date_issued,permit_issued=SUBSTRING (@permit_issued, 1, 2),	date_expired=@date_expired,contractor=SUBSTRING(@contractor, 1, 40) ,builder_board_no=@builder_board_no,date_added=@date_added,date_updated=GETDATE() where aff_no=@affidavit_no	
	End
End
GO
/****** Object:  StoredProcedure [dbo].[SP_AfterUpdatePermit]    Script Date: 7/12/2018 8:37:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  Stored Procedure [dbo].[SP_AfterUpdatePermit]    Script Date: 05/16/2017 08:22:54 ******/
--select * from Permit
--exec SP_AfterUpdatePermit 2,149
Create Proc [dbo].[SP_AfterUpdatePermit]
@PermitId bigint,@ApplicantId bigint
AS
Begin
	declare @permit_no varchar(100);
	declare @permit_issued varchar(100);
	declare @permit_extended varchar(100);
	declare @date_issued varchar(100);
	declare @date_expired varchar(100);
	declare @date_expired_new varchar(100);
	declare @builder_board_no varchar(100);
	declare @contractor varchar(100);
	declare @date_cancelled varchar(100);
	declare @cancelled_by varchar(100);
	declare @date_added varchar(100);
	declare @date_updated varchar(100);
	declare @affidavit_no int;
	declare @permit_status int;
	declare @applicantType varchar(100);
	
	
	
	set @applicantType=(select ApplicantType from PermitApplicant where ApplicantID= @ApplicantId);
	select @permit_no=PermitID,@permit_status=PermitStatus,
	@permit_issued=IssuedBy,@permit_extended=PermitExtended,@date_issued=DateIssued,@date_expired=DateExpired,
	 @date_expired_new=DateExpiredNew,--
	@builder_board_no=BuilderBoardNo,
	@contractor=ContractorID,
	@date_cancelled=DateCancelled,
	@cancelled_by=CancelledBy,
	@date_added=DateIssued ,
	@date_updated=PermitExtended ,
	@affidavit_no=AffidavitID
	from Permit where PermitID=@PermitId;
	print @permit_no;
	print @permit_issued;
	print SUBSTRING (@permit_extended, 1, 1);
	print @date_issued;
	print @date_expired;
	print @builder_board_no;
	print @contractor;
	print @date_cancelled;
	print @cancelled_by;
	print @date_added;
	print @date_updated;
	print @affidavit_no;
	if @date_expired_new is not null
		set @date_expired=@date_expired_new
	
	if (@applicantType !='Contractor')
	BEGIN
		set @contractor='PO'
		set @builder_board_no=null
	END	
	
	
if(@permit_status=3 or @permit_status=5)
	update sw_posting set  permit_no=NULL,permit_extended=NULL, date_issued=NULL,permit_issued=NULL,	
	date_expired=NULL, contractor=NULL,builder_board_no=NULL, date_added=NULL,date_updated=NULL 	
	where aff_no=@affidavit_no
else
	update sw_posting set permit_no=(select CONVERT(int,@permit_no) as permit_no), 
	permit_extended=SUBSTRING (@permit_extended, 1, 1),	date_issued=@date_issued,permit_issued=SUBSTRING (@permit_issued, 1, 3),
	date_expired=@date_expired,	contractor=SUBSTRING(@contractor, 1, 40),builder_board_no=@builder_board_no, 
	date_added=@date_added,date_updated=GETDATE() 	
	where aff_no=@affidavit_no
End

GO
/****** Object:  StoredProcedure [dbo].[sp_getAffidavitByParameter_swp]    Script Date: 7/12/2018 8:37:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec sp_getAffidavitByParameter_swp '','','','','','','','','2017-05-21','2018-05-21'
--select * from Affidavit where AffidavitID=81000
/****** Object:  StoredProcedure [dbo].[getAffidavitByParameter]    Script Date: 5/10/2018 7:09:58 PM ******/
CREATE Procedure [dbo].[sp_getAffidavitByParameter_swp] 
@affidavitId varchar(100)='', @propertyId varchar(100)='', @inspectionDate varchar(10)='', @postingDate varchar(10)='', @trackId varchar(100)='',
@inspectorName varchar(100)='', @propertyAddress varchar(100)='', @previouslyPrinted varchar(100)='', @fromDate varchar(10),@todate varchar(10)
As
	Begin
	if(Len(@affidavitId)>0)
	Begin
	    select distinct 
		swp.AffidavitID, swp.InspectorId, swp.InspectionDate, swp.Status,st.Status as AffidavitStatus,st.Status as StatusValue, swp.VisioDiagram, swp.TrackIT, swp.RNO, swp.QtrSection, swp.PropertyID, swp.LegalDesc, swp.Owner1, swp.Owner2, swp.Owner3, swp.OwnerAddress, swp.OwnerCity, swp.OwnerState, swp.OwnerZip, swp.SiteAddress, swp.SiteStreetNumber, swp.SiteDistrict, swp.SiteStreetName, swp.SiteStreetDesignator, swp.SiteCity, swp.SiteZip, swp.CityRepair, swp.OwnerRepair, swp.ContractorRepair, swp.RepairDueDate, swp.RepairNoticeSentDate, swp.RepairNoticeSentBy, swp.CityRepairStart, swp.CityRepairBy, swp.HoldUntilDate, swp.HoldUntilBy, swp.permit_no, swp.permit_issued, swp.permit_extended, swp.PermitIssuedDate, swp.PermitExpiredDate, swp.contractor, swp.builder_board_no, swp.date_cancelled, swp.cancelled_by, swp.last_action, swp.CreateDate, swp.LastModifiedDate, swp.LastModifiedBy, swp.notes, swp.VisioRevision, swp.New_Aff, swp.New_RepairDueDate, swp.NEW_ClearWalk
		,swp.SiteStreetNumber+' '+swp.SiteDistrict+' '+swp.SiteStreetName+' '+swp.SiteStreetDesignator as PropertyDescription,IsNull(i.inspector_name,'') as InspectorName,pdx.OWNER1 as CurrentOwner
		--swp.AffidavitID ,swp.QtrSection,0 map_id,swp.InspectionDate as post_dt,'' acct_period,swp.PropertyID as property_id, 0 property_id2,swp.SiteStreetNumber+' '+swp.SiteDistrict+' '+swp.SiteStreetName+' '
		--+swp.SiteStreetDesignator as property_desc,swp.AffidavitStatus, swp.Owner1 as owner_name,'' attn1,'' attn2, swp.SiteStreetNumber,swp.SiteDistrict,swp.SiteStreetName,IsNull(i.inspector_name,'') as designator, 
		--swp.SiteCity,swp.SiteZip, swp.Inspector_Key,swp.CityRepair, swp.OwnerRepair, '' service_req_flag, '' partial_repair,'' vacant_lot_flag,'' vacant_desc, null repair_dt,null billed_dt,null bill_flag,
		--swp.HoldUntilDate,swp.permit_no,swp.permit_issued,swp.permit_extended,swp.PermitIssuedDate,swp.PermitExpiredDate,swp.contractor,swp.builder_board_no,null license_no,swp.date_cancelled,
		--swp.cancelled_by,swp.status,swp.last_action,swp.CreateDate, swp.LastModifiedDate,swp.notes as notes,swp.RepairNoticeSentDate,swp.NEW_AFF,swp.NEW_RepairDueDate, swp.NEW_ClearWalk 
		from Affidavit as swp with(nolock,nowait)
		Join AffidavitStatus as st with(nolock,nowait) on swp.Status=st.AffidavitStatusId
		Left Join sw_inspector as i with(nolock,nowait) on swp.InspectorId=i.inspector_no 
		Left Join ArcMap_Admin.PORT_TAXLOTS_PDX as pdx on swp.PropertyID=pdx.PROPERTYID
	     where st.IsActive=1 and st.IsDeleted=0 and convert(varchar(10),swp.InspectionDate ,121) between @fromDate and @todate or (CHARINDEX(@affidavitId,swp.AffidavitID)>0 or 
	     CHARINDEX(@propertyId,swp.PropertyID)>0 or 
	     CHARINDEX(@inspectionDate,swp.InspectionDate)>0 and CHARINDEX('I',swp.status)=0)
	     order by swp.AffidavitID desc
	End
	Else
	Begin
		 select distinct swp.AffidavitID, swp.InspectorId, swp.InspectionDate, swp.Status,st.Status as AffidavitStatus,st.Status as StatusValue, swp.VisioDiagram, swp.TrackIT, swp.RNO, swp.QtrSection, swp.PropertyID, swp.LegalDesc, swp.Owner1, swp.Owner2, swp.Owner3, swp.OwnerAddress, swp.OwnerCity, swp.OwnerState, swp.OwnerZip, swp.SiteAddress, swp.SiteStreetNumber, swp.SiteDistrict, swp.SiteStreetName, swp.SiteStreetDesignator, swp.SiteCity, swp.SiteZip, swp.CityRepair, swp.OwnerRepair, swp.ContractorRepair, swp.RepairDueDate, swp.RepairNoticeSentDate, swp.RepairNoticeSentBy, swp.CityRepairStart, swp.CityRepairBy, swp.HoldUntilDate, swp.HoldUntilBy, swp.permit_no, swp.permit_issued, swp.permit_extended, swp.PermitIssuedDate, swp.PermitExpiredDate, swp.contractor, swp.builder_board_no, swp.date_cancelled, swp.cancelled_by, swp.last_action, swp.CreateDate, swp.LastModifiedDate, swp.LastModifiedBy, swp.notes, swp.VisioRevision, swp.New_Aff, swp.New_RepairDueDate, swp.NEW_ClearWalk
		,swp.SiteStreetNumber+' '+swp.SiteDistrict+' '+swp.SiteStreetName+' '+swp.SiteStreetDesignator as PropertyDescription,IsNull(i.inspector_name,'') as InspectorName,pdx.OWNER1 as CurrentOwner
		 from Affidavit as swp with(nolock,nowait)
		 Join AffidavitStatus as st with(nolock,nowait) on swp.Status=st.AffidavitStatusId
		 Left Join sw_inspector as i with(nolock,nowait) on swp.InspectorId=i.inspector_no
		 Left Join ArcMap_Admin.PORT_TAXLOTS_PDX as pdx on swp.PropertyID=pdx.PROPERTYID
		 where st.IsActive=1 and st.IsDeleted=0 and CHARINDEX('I',swp.status)=0 and convert(varchar(10),swp.InspectionDate ,121) between @fromDate and @todate
	     order by swp.AffidavitID desc


		 --select distinct swp.aff_no,swp.qtr_sec,swp.map_id,swp.post_dt,swp.acct_period,swp.property_id,
			--swp.property_id2,swp.st_no+' '+swp.district+' '+swp.st_name+' '+swp.designator as property_desc,swp.aff_status,swp.owner_name,swp.attn1,swp.attn2,
			--swp.st_no,swp.district,swp.st_name,IsNull(i.inspector_name,'') as designator, swp.city,swp.zip,swp.inspector_no,swp.city_owned_flag,swp.owner_resident_flag,
			--swp.service_req_flag,swp.rep_by_city,swp.rep_by_owner,swp.partial_repair,swp.vacant_lot_flag,swp.vacant_desc,swp.repair_dt,swp.billed_dt,swp.bill_flag,
			--swp.hold_until_dt,swp.permit_no,swp.permit_issued,swp.permit_extended,swp.date_issued,swp.date_expired,swp.contractor,swp.builder_board_no,swp.license_no,
			--swp.date_cancelled,swp.cancelled_by,swp.status,swp.last_action,swp.date_added,swp.date_updated,swp.notes,swp.sent_dt,swp.NEW_AFF,swp.NEW_RepairDueDate,
			--swp.NEW_ClearWalk 
		 --from Affidavit as swp with(nolock,nowait)
			-- Left Join sw_inspector as i with(nolock,nowait) on swp.Inspector_Key=i.inspector_no
		 --where CHARINDEX('I',swp.status)=0 and convert(varchar(10),swp.RepairNoticeSentDate ,121) between @fromDate and @todate
	  --   order by swp.AffidavitID desc
	End     
	     
End

GO
/****** Object:  StoredProcedure [dbo].[sp_getAffidavitByProperty_swp]    Script Date: 7/12/2018 8:37:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE Procedure [dbo].[sp_getAffidavitByProperty_swp]   
@keyword nvarchar(50)  
As  
Begin  
     select distinct * from Affidavit where (Charindex(@keyword,SiteStreetNumber)>0  or Charindex(@keyword,SiteStreetName)>0) 
	 and (status) NOT like 'I' and (permit_issued='' or permit_issued='No' or permit_issued is NULL) and permit_no is null order by AffidavitID  
End  
  
  
GO
/****** Object:  StoredProcedure [dbo].[sp_getAffidavitDetails_swp]    Script Date: 7/12/2018 8:37:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  --sp_getAffidavitDetails_swp 81000
CREATE Procedure [dbo].[sp_getAffidavitDetails_swp]  
@affidavitId nvarchar(50)  
As  
Begin  
     select DISTINCT swp.*,st.Status as AffidavitStatus,i.*,swp.SiteStreetNumber+' '+swp.SiteDistrict+' '+swp.SiteStreetName+' '+swp.SiteStreetDesignator as PropertyDescription,IsNull(i.inspector_name,'') as InspectorName,pdx.OWNER1 as CurrentOwner from Affidavit as swp  
	 Join AffidavitStatus as st with(nolock,nowait) on swp.Status=st.AffidavitStatusId
     Left join sw_inspector as i on swp.InspectorId=i.inspector_no 
	 Left Join ArcMap_Admin.PORT_TAXLOTS_PDX as pdx on swp.PropertyID=pdx.PROPERTYID 
     where swp.AffidavitID=@affidavitId  
End  
GO
/****** Object:  StoredProcedure [dbo].[sp_getAffidavitList_swp]    Script Date: 7/12/2018 8:37:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_getAffidavitList_swp] 
As
Begin
     select distinct * from Affidavit
End
GO
USE [master]
GO
ALTER DATABASE [SWPostTest] SET  READ_WRITE 
GO
