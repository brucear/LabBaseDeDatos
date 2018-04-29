USE [master]
GO
/****** Object:  Database [practica2]    Script Date: 3/5/2018 1:46:48 AM ******/
CREATE DATABASE [practica2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'practica2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\practica2.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'practica2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\practica2_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [practica2] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [practica2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [practica2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [practica2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [practica2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [practica2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [practica2] SET ARITHABORT OFF 
GO
ALTER DATABASE [practica2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [practica2] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [practica2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [practica2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [practica2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [practica2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [practica2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [practica2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [practica2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [practica2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [practica2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [practica2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [practica2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [practica2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [practica2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [practica2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [practica2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [practica2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [practica2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [practica2] SET  MULTI_USER 
GO
ALTER DATABASE [practica2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [practica2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [practica2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [practica2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [practica2]
GO
/****** Object:  Table [dbo].[Recepcion]    Script Date: 3/5/2018 1:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recepcion](
	[IdVendedor] [uniqueidentifier] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Direccion] [nvarchar](50) NOT NULL,
	[Telefono] [nvarchar](50) NOT NULL,
	[Observacion] [text] NOT NULL,
 CONSTRAINT [PK_Recepcion] PRIMARY KEY CLUSTERED 
(
	[IdVendedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tAlquiler]    Script Date: 3/5/2018 1:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tAlquiler](
	[FechaEntrada] [datetime] NOT NULL,
	[FechaSalida] [datetime] NOT NULL,
	[Observacion] [text] NOT NULL,
	[FkHabitacion] [uniqueidentifier] NOT NULL,
	[FkCliente] [uniqueidentifier] NOT NULL,
	[FkVendedor] [uniqueidentifier] NOT NULL,
	[PrecioFinal] [numeric](18, 0) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tCliente]    Script Date: 3/5/2018 1:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tCliente](
	[Nombre] [nvarchar](50) NOT NULL,
	[Apellidos] [nvarchar](50) NOT NULL,
	[FechaDeNacimiento] [date] NOT NULL,
	[IdCliente] [uniqueidentifier] NOT NULL,
	[Password] [uniqueidentifier] NOT NULL,
	[NumeroDeTelefono] [numeric](18, 0) NOT NULL,
	[Direccion] [text] NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tHabitacion]    Script Date: 3/5/2018 1:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tHabitacion](
	[IdHabitacion] [uniqueidentifier] NOT NULL,
	[NumeroPersonas] [numeric](18, 0) NOT NULL,
	[NumeroCamas] [numeric](18, 0) NOT NULL,
	[Descripcion] [text] NOT NULL,
	[FkTipo] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Habitacion] PRIMARY KEY CLUSTERED 
(
	[IdHabitacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tTipo]    Script Date: 3/5/2018 1:46:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tTipo](
	[IdTipo] [nvarchar](50) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Limpieza] [datetime] NOT NULL,
	[Costo] [numeric](18, 0) NOT NULL,
	[CapacidadMaxima] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_tTipo] PRIMARY KEY CLUSTERED 
(
	[IdTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[tHabitacion]  WITH CHECK ADD  CONSTRAINT [FK_tHabitacion_tTipo] FOREIGN KEY([FkTipo])
REFERENCES [dbo].[tTipo] ([IdTipo])
GO
ALTER TABLE [dbo].[tHabitacion] CHECK CONSTRAINT [FK_tHabitacion_tTipo]
GO
USE [master]
GO
ALTER DATABASE [practica2] SET  READ_WRITE 
GO