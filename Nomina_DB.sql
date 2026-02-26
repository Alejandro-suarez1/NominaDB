USE [master]
GO
/****** Object:  Database [NominaDB]    Script Date: 25/02/2026 10:50:12 p. m. ******/
CREATE DATABASE [NominaDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NominaDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.SQLEXPRESS\MSSQL\DATA\NominaDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NominaDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.SQLEXPRESS\MSSQL\DATA\NominaDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [NominaDB] SET COMPATIBILITY_LEVEL = 170
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NominaDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NominaDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NominaDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NominaDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NominaDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NominaDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [NominaDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [NominaDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NominaDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NominaDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NominaDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NominaDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NominaDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NominaDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NominaDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NominaDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [NominaDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NominaDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NominaDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NominaDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NominaDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NominaDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NominaDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NominaDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NominaDB] SET  MULTI_USER 
GO
ALTER DATABASE [NominaDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NominaDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NominaDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NominaDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NominaDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NominaDB] SET OPTIMIZED_LOCKING = OFF 
GO
ALTER DATABASE [NominaDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [NominaDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [NominaDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [NominaDB]
GO
/****** Object:  Table [dbo].[Cargo]    Script Date: 25/02/2026 10:50:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cargo](
	[IdCargo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[SalarioBase] [decimal](10, 2) NOT NULL,
	[IdDepartamento] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCargo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 25/02/2026 10:50:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamento](
	[IdDepartamento] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleNomina]    Script Date: 25/02/2026 10:50:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleNomina](
	[IdDetalle] [int] IDENTITY(1,1) NOT NULL,
	[IdNomina] [int] NOT NULL,
	[Concepto] [varchar](100) NOT NULL,
	[Tipo] [varchar](100) NULL,
	[Valor] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 25/02/2026 10:50:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[IdEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[Documento] [varchar](20) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Apellido] [varchar](100) NOT NULL,
	[FechaIngreso] [date] NOT NULL,
	[IdCargo] [int] NOT NULL,
	[IdTipoContrato] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nomina]    Script Date: 25/02/2026 10:50:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nomina](
	[IdNomina] [int] IDENTITY(1,1) NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFin] [date] NOT NULL,
	[TotalDevengado] [decimal](10, 2) NULL,
	[TotalDeducciones] [decimal](10, 2) NULL,
	[NetoPagar] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdNomina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoContrato]    Script Date: 25/02/2026 10:50:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoContrato](
	[IdTipoContrato] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTipoContrato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cargo] ON 

INSERT [dbo].[Cargo] ([IdCargo], [Nombre], [SalarioBase], [IdDepartamento]) VALUES (1, N'Desarrollador', CAST(3500000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Cargo] ([IdCargo], [Nombre], [SalarioBase], [IdDepartamento]) VALUES (2, N'Analista Contable', CAST(2800000.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[Cargo] ([IdCargo], [Nombre], [SalarioBase], [IdDepartamento]) VALUES (3, N'Auxiliar RRHH', CAST(2200000.00 AS Decimal(10, 2)), 3)
INSERT [dbo].[Cargo] ([IdCargo], [Nombre], [SalarioBase], [IdDepartamento]) VALUES (4, N'Ejecutivo Comercial', CAST(3000000.00 AS Decimal(10, 2)), 4)
SET IDENTITY_INSERT [dbo].[Cargo] OFF
GO
SET IDENTITY_INSERT [dbo].[Departamento] ON 

INSERT [dbo].[Departamento] ([IdDepartamento], [Nombre]) VALUES (1, N'Sistemas')
INSERT [dbo].[Departamento] ([IdDepartamento], [Nombre]) VALUES (2, N'Contabilidad')
INSERT [dbo].[Departamento] ([IdDepartamento], [Nombre]) VALUES (3, N'Recursos Humanos')
INSERT [dbo].[Departamento] ([IdDepartamento], [Nombre]) VALUES (4, N'Ventas')
SET IDENTITY_INSERT [dbo].[Departamento] OFF
GO
SET IDENTITY_INSERT [dbo].[DetalleNomina] ON 

INSERT [dbo].[DetalleNomina] ([IdDetalle], [IdNomina], [Concepto], [Tipo], [Valor]) VALUES (1, 1, N'Salario Basico', N'DEVENGADO', CAST(3500000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleNomina] ([IdDetalle], [IdNomina], [Concepto], [Tipo], [Valor]) VALUES (2, 1, N'Salud', N'DEDUCCION', CAST(140000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleNomina] ([IdDetalle], [IdNomina], [Concepto], [Tipo], [Valor]) VALUES (3, 1, N'Pension', N'DEDUCCION', CAST(140000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleNomina] ([IdDetalle], [IdNomina], [Concepto], [Tipo], [Valor]) VALUES (4, 2, N'Salario Basico', N'DEVENGADO', CAST(2800000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleNomina] ([IdDetalle], [IdNomina], [Concepto], [Tipo], [Valor]) VALUES (5, 2, N'Salud', N'DEDUCCION', CAST(112000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleNomina] ([IdDetalle], [IdNomina], [Concepto], [Tipo], [Valor]) VALUES (6, 2, N'Pension', N'DEDUCCION', CAST(112000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleNomina] ([IdDetalle], [IdNomina], [Concepto], [Tipo], [Valor]) VALUES (7, 3, N'Salario Basico', N'DEVENGADO', CAST(3000000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleNomina] ([IdDetalle], [IdNomina], [Concepto], [Tipo], [Valor]) VALUES (8, 3, N'Comision', N'DEVENGADO', CAST(500000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleNomina] ([IdDetalle], [IdNomina], [Concepto], [Tipo], [Valor]) VALUES (9, 3, N'Salud', N'DEDUCCION', CAST(140000.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[DetalleNomina] OFF
GO
SET IDENTITY_INSERT [dbo].[Empleado] ON 

INSERT [dbo].[Empleado] ([IdEmpleado], [Documento], [Nombre], [Apellido], [FechaIngreso], [IdCargo], [IdTipoContrato]) VALUES (1, N'1010', N'Juan', N'Perez', CAST(N'2024-01-10' AS Date), 1, 2)
INSERT [dbo].[Empleado] ([IdEmpleado], [Documento], [Nombre], [Apellido], [FechaIngreso], [IdCargo], [IdTipoContrato]) VALUES (2, N'2020', N'Maria', N'Gomez', CAST(N'2023-05-15' AS Date), 2, 1)
INSERT [dbo].[Empleado] ([IdEmpleado], [Documento], [Nombre], [Apellido], [FechaIngreso], [IdCargo], [IdTipoContrato]) VALUES (3, N'3030', N'Carlos', N'Lopez', CAST(N'2022-08-01' AS Date), 4, 2)
SET IDENTITY_INSERT [dbo].[Empleado] OFF
GO
SET IDENTITY_INSERT [dbo].[Nomina] ON 

INSERT [dbo].[Nomina] ([IdNomina], [IdEmpleado], [FechaInicio], [FechaFin], [TotalDevengado], [TotalDeducciones], [NetoPagar]) VALUES (1, 1, CAST(N'2026-05-01' AS Date), CAST(N'2026-05-31' AS Date), NULL, NULL, NULL)
INSERT [dbo].[Nomina] ([IdNomina], [IdEmpleado], [FechaInicio], [FechaFin], [TotalDevengado], [TotalDeducciones], [NetoPagar]) VALUES (2, 2, CAST(N'2026-05-01' AS Date), CAST(N'2026-05-31' AS Date), NULL, NULL, NULL)
INSERT [dbo].[Nomina] ([IdNomina], [IdEmpleado], [FechaInicio], [FechaFin], [TotalDevengado], [TotalDeducciones], [NetoPagar]) VALUES (3, 3, CAST(N'2026-05-01' AS Date), CAST(N'2026-05-31' AS Date), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Nomina] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoContrato] ON 

INSERT [dbo].[TipoContrato] ([IdTipoContrato], [Descripcion]) VALUES (1, N'Termino Fijo')
INSERT [dbo].[TipoContrato] ([IdTipoContrato], [Descripcion]) VALUES (2, N'Termino Indefinido')
INSERT [dbo].[TipoContrato] ([IdTipoContrato], [Descripcion]) VALUES (3, N'Prestacion de Servicios')
SET IDENTITY_INSERT [dbo].[TipoContrato] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Empleado__AF73706DB0A1453E]    Script Date: 25/02/2026 10:50:13 p. m. ******/
ALTER TABLE [dbo].[Empleado] ADD UNIQUE NONCLUSTERED 
(
	[Documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cargo]  WITH CHECK ADD FOREIGN KEY([IdDepartamento])
REFERENCES [dbo].[Departamento] ([IdDepartamento])
GO
ALTER TABLE [dbo].[DetalleNomina]  WITH CHECK ADD FOREIGN KEY([IdNomina])
REFERENCES [dbo].[Nomina] ([IdNomina])
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD FOREIGN KEY([IdCargo])
REFERENCES [dbo].[Cargo] ([IdCargo])
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD FOREIGN KEY([IdTipoContrato])
REFERENCES [dbo].[TipoContrato] ([IdTipoContrato])
GO
ALTER TABLE [dbo].[Nomina]  WITH CHECK ADD FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([IdEmpleado])
GO
ALTER TABLE [dbo].[DetalleNomina]  WITH CHECK ADD CHECK  (([Tipo]='Deduccion' OR [Tipo]='Devengado'))
GO
USE [master]
GO
ALTER DATABASE [NominaDB] SET  READ_WRITE 
GO
