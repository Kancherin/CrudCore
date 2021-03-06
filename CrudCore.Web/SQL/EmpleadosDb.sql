USE [master]
GO
/****** Object:  Database [EmpleadosDB]    Script Date: 09/04/2021 8:19:10 ******/
CREATE DATABASE [EmpleadosDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Empleados', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Empleados.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Empleados_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Empleados_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EmpleadosDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EmpleadosDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EmpleadosDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EmpleadosDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EmpleadosDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EmpleadosDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EmpleadosDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [EmpleadosDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EmpleadosDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [EmpleadosDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EmpleadosDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EmpleadosDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EmpleadosDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EmpleadosDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EmpleadosDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EmpleadosDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EmpleadosDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EmpleadosDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EmpleadosDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EmpleadosDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EmpleadosDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EmpleadosDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EmpleadosDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EmpleadosDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EmpleadosDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EmpleadosDB] SET RECOVERY FULL 
GO
ALTER DATABASE [EmpleadosDB] SET  MULTI_USER 
GO
ALTER DATABASE [EmpleadosDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EmpleadosDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EmpleadosDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EmpleadosDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'EmpleadosDB', N'ON'
GO
USE [EmpleadosDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddEmpleado]    Script Date: 09/04/2021 8:19:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*create procedure sp_GetEmpleados
as
BEGIN
select * from Empleados
END*/

create procedure [dbo].[sp_AddEmpleado]
(
	@Name varchar(50)='',
	@Gender varchar(50)='',
	@Company varchar(50)='',
	@Department varchar(50)=''
)
as
BEGIN
	Insert into Empleados (Name, Gender, Company, Department)
	Values(@Name, @Gender, @Company, @Department)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteEmpleado]    Script Date: 09/04/2021 8:19:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_DeleteEmpleado]
(
@Id int
)
as
BEGIN
delete from Empleados where Id=@Id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetEmpleado]    Script Date: 09/04/2021 8:19:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_GetEmpleado]
(
@Id int
)
as
BEGIN
Select * from Empleados where Id=@Id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetEmpleados]    Script Date: 09/04/2021 8:19:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_GetEmpleados]
as
BEGIN
select * from Empleados
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateEmpleado]    Script Date: 09/04/2021 8:19:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*create procedure sp_GetEmpleados
as
BEGIN
select * from Empleados
END*/

create procedure [dbo].[sp_UpdateEmpleado]
(
	@Id int = 0,
	@Name varchar(50)='',
	@Gender varchar(50)='',
	@Company varchar(50)='',
	@Department varchar(50)=''
)
as
BEGIN
	Update Empleados set Name=@Name, Gender=@Gender, Company=@Company, Department=@Department Where Id = @Id
END
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 09/04/2021 8:19:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empleados](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[Company] [varchar](50) NULL,
	[Department] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [EmpleadosDB] SET  READ_WRITE 
GO
