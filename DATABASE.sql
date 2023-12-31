USE [master]
GO
/****** Object:  Database [JTrend]    Script Date: 24/07/2023 5:03:18 a. m. ******/
CREATE DATABASE [JTrend]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JTrend', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\JTrend.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'JTrend_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\JTrend_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [JTrend] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JTrend].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JTrend] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JTrend] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JTrend] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JTrend] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JTrend] SET ARITHABORT OFF 
GO
ALTER DATABASE [JTrend] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JTrend] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JTrend] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JTrend] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JTrend] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JTrend] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JTrend] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JTrend] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JTrend] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JTrend] SET  ENABLE_BROKER 
GO
ALTER DATABASE [JTrend] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JTrend] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JTrend] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JTrend] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JTrend] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JTrend] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JTrend] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JTrend] SET RECOVERY FULL 
GO
ALTER DATABASE [JTrend] SET  MULTI_USER 
GO
ALTER DATABASE [JTrend] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JTrend] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JTrend] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JTrend] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [JTrend] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [JTrend] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'JTrend', N'ON'
GO
ALTER DATABASE [JTrend] SET QUERY_STORE = ON
GO
ALTER DATABASE [JTrend] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [JTrend]
GO
/****** Object:  User [sqlmontes]    Script Date: 24/07/2023 5:03:18 a. m. ******/
CREATE USER [sqlmontes] FOR LOGIN [sqlmontes] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [montes1]    Script Date: 24/07/2023 5:03:18 a. m. ******/
CREATE USER [montes1] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [montes]    Script Date: 24/07/2023 5:03:18 a. m. ******/
CREATE USER [montes] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [sqlmontes]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [sqlmontes]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [sqlmontes]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [sqlmontes]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [sqlmontes]
GO
ALTER ROLE [db_datareader] ADD MEMBER [sqlmontes]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [sqlmontes]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [sqlmontes]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [sqlmontes]
GO
ALTER ROLE [db_datareader] ADD MEMBER [montes1]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [montes1]
GO
/****** Object:  Table [dbo].[Publicacion]    Script Date: 24/07/2023 5:03:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publicacion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](100) NULL,
	[Contenido] [text] NULL,
	[FechaActual] [datetime] NULL,
	[UsuarioID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 24/07/2023 5:03:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IDUsuario] [int] NOT NULL,
	[Nombres] [varchar](50) NULL,
	[Apellidos] [varchar](50) NULL,
	[Edad] [int] NULL,
	[Correo] [varchar](100) NULL,
	[Contraseña] [varchar](50) NULL,
	[FechaNacimiento] [datetime] NULL,
	[FotoDePerfil] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Publicacion] ON 

INSERT [dbo].[Publicacion] ([ID], [Titulo], [Contenido], [FechaActual], [UsuarioID]) VALUES (37, N'Example', N'ExampleContent', CAST(N'2023-07-20T08:39:01.497' AS DateTime), 10)
INSERT [dbo].[Publicacion] ([ID], [Titulo], [Contenido], [FechaActual], [UsuarioID]) VALUES (38, N'Example', N'ExampleContent', CAST(N'2023-07-20T08:39:07.420' AS DateTime), 1)
INSERT [dbo].[Publicacion] ([ID], [Titulo], [Contenido], [FechaActual], [UsuarioID]) VALUES (39, N'Example', N'ExampleContent', CAST(N'2023-07-20T08:53:00.930' AS DateTime), 1)
INSERT [dbo].[Publicacion] ([ID], [Titulo], [Contenido], [FechaActual], [UsuarioID]) VALUES (40, N'Example', N'ExampleContent', CAST(N'2023-07-20T08:53:01.257' AS DateTime), 1)
INSERT [dbo].[Publicacion] ([ID], [Titulo], [Contenido], [FechaActual], [UsuarioID]) VALUES (41, N'Example', N'ExampleContent', CAST(N'2023-07-20T08:53:01.800' AS DateTime), 1)
INSERT [dbo].[Publicacion] ([ID], [Titulo], [Contenido], [FechaActual], [UsuarioID]) VALUES (42, N'Example', N'ExampleContent', CAST(N'2023-07-20T08:53:02.090' AS DateTime), 1)
INSERT [dbo].[Publicacion] ([ID], [Titulo], [Contenido], [FechaActual], [UsuarioID]) VALUES (43, N'Example', N'ExampleContent', CAST(N'2023-07-20T08:53:02.253' AS DateTime), 1)
INSERT [dbo].[Publicacion] ([ID], [Titulo], [Contenido], [FechaActual], [UsuarioID]) VALUES (44, N'Example', N'ExampleContent', CAST(N'2023-07-20T08:53:02.430' AS DateTime), 1)
INSERT [dbo].[Publicacion] ([ID], [Titulo], [Contenido], [FechaActual], [UsuarioID]) VALUES (45, N'Example', N'ExampleContent', CAST(N'2023-07-20T08:53:02.660' AS DateTime), 1)
INSERT [dbo].[Publicacion] ([ID], [Titulo], [Contenido], [FechaActual], [UsuarioID]) VALUES (46, N'Example', N'ExampleContent', CAST(N'2023-07-20T08:53:02.847' AS DateTime), 1)
INSERT [dbo].[Publicacion] ([ID], [Titulo], [Contenido], [FechaActual], [UsuarioID]) VALUES (47, N'Example', N'ExampleContent', CAST(N'2023-07-20T08:53:03.020' AS DateTime), 1)
INSERT [dbo].[Publicacion] ([ID], [Titulo], [Contenido], [FechaActual], [UsuarioID]) VALUES (48, N'Example', N'ExampleContent', CAST(N'2023-07-20T08:53:03.180' AS DateTime), 1)
INSERT [dbo].[Publicacion] ([ID], [Titulo], [Contenido], [FechaActual], [UsuarioID]) VALUES (49, N'Example', N'ExampleContent', CAST(N'2023-07-20T08:53:03.370' AS DateTime), 1)
INSERT [dbo].[Publicacion] ([ID], [Titulo], [Contenido], [FechaActual], [UsuarioID]) VALUES (50, N'Example', N'ExampleContent', CAST(N'2023-07-20T08:53:03.617' AS DateTime), 1)
INSERT [dbo].[Publicacion] ([ID], [Titulo], [Contenido], [FechaActual], [UsuarioID]) VALUES (51, N'Example', N'ExampleContent', CAST(N'2023-07-20T08:53:03.770' AS DateTime), 1)
INSERT [dbo].[Publicacion] ([ID], [Titulo], [Contenido], [FechaActual], [UsuarioID]) VALUES (52, N'Example', N'ExampleContent', CAST(N'2023-07-20T08:53:03.957' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Publicacion] OFF
GO
INSERT [dbo].[Usuarios] ([IDUsuario], [Nombres], [Apellidos], [Edad], [Correo], [Contraseña], [FechaNacimiento], [FotoDePerfil]) VALUES (0, N'Andres Felipe', N'Ramirez Vasquez', 17, N'SamuelMontes1105@gmail.com', N'321654987', CAST(N'2005-11-11T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Usuarios] ([IDUsuario], [Nombres], [Apellidos], [Edad], [Correo], [Contraseña], [FechaNacimiento], [FotoDePerfil]) VALUES (1, N'Daniel', N'Vasquez', 17, N'abc', N'123', CAST(N'2006-04-16T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Usuarios] ([IDUsuario], [Nombres], [Apellidos], [Edad], [Correo], [Contraseña], [FechaNacimiento], [FotoDePerfil]) VALUES (10, N'Julian Andres', N'Ramirez Perez', 18, N'andrew@gmail.com', N'123123', CAST(N'2004-08-15T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Usuarios] ([IDUsuario], [Nombres], [Apellidos], [Edad], [Correo], [Contraseña], [FechaNacimiento], [FotoDePerfil]) VALUES (111, N'a', N'b', 22, N'da', N'123', CAST(N'2000-11-11T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Usuarios] ([IDUsuario], [Nombres], [Apellidos], [Edad], [Correo], [Contraseña], [FechaNacimiento], [FotoDePerfil]) VALUES (105612423, N'Leidy Daniela', N'Morales Vasquez', 17, N'dani@gmail.com', N'3217029622', CAST(N'2006-04-16T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Usuarios] ([IDUsuario], [Nombres], [Apellidos], [Edad], [Correo], [Contraseña], [FechaNacimiento], [FotoDePerfil]) VALUES (1094892672, N'Samuel', N'Montes', 17, N'samuelmontes1109@gmail.com', N'3217029622', CAST(N'2005-11-11T00:00:00.000' AS DateTime), NULL)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Usuarios_Correo]    Script Date: 24/07/2023 5:03:18 a. m. ******/
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [UQ_Usuarios_Correo] UNIQUE NONCLUSTERED 
(
	[Correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Publicacion] ADD  DEFAULT (getdate()) FOR [FechaActual]
GO
ALTER TABLE [dbo].[Publicacion]  WITH CHECK ADD FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuarios] ([IDUsuario])
GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarUsuario]    Script Date: 24/07/2023 5:03:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ActualizarUsuario] @Nombres VARCHAR(50),
								@Apellidos VARCHAR(50),
								@Edad INT,
								@FechaNacimiento VARCHAR(10),
								@Foto IMAGE = null
AS
BEGIN
	DECLARE @FechaFinal DATE
	SET @FechaFinal = CONVERT(DATETIME, @FechaNacimiento, 103)


	UPDATE Usuarios SET Nombres = @Nombres,
						Apellidos = @Apellidos,
						Edad = @Edad,
						FechaNacimiento = @FechaFinal,
						FotoDePerfil = @Foto
END
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertarPublicacion]    Script Date: 24/07/2023 5:03:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_InsertarPublicacion]
    @Titulo VARCHAR(100),
    @Contenido TEXT,
    @UsuarioID INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Publicacion (Titulo, Contenido, FechaActual, UsuarioID)
    VALUES ( @Titulo, @Contenido, GETDATE(), @UsuarioID);

END;
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertarUsuario]    Script Date: 24/07/2023 5:03:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_InsertarUsuario] (
    @IDUsuario INT,
    @Nombres VARCHAR(50),
    @Apellidos VARCHAR(50),
    @Correo VARCHAR(100),
    @Contraseña VARCHAR(50),
    @FechaNacimiento VARCHAR(10),
	@Foto IMAGE = null
)
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @FechaNacimientoFinal DATETIME;
    SET @FechaNacimientoFinal = CONVERT(DATETIME, @FechaNacimiento, 103);
	DECLARE @EdadFinal INT
	IF ((MONTH(@FechaNacimientoFinal) < MONTH(GETDATE())
		OR (MONTH(GETDATE()) = MONTH(@FechaNacimientoFinal) AND DAY(@FechaNacimientoFinal) < DAY(GETDATE()))
	))
		SET @EdadFinal = YEAR(GETDATE()) - YEAR(@FechaNacimientoFinal)
	ELSE 
		SET @EdadFinal = (YEAR(GETDATE()) - YEAR(@FechaNacimientoFinal))-1
    INSERT INTO Usuarios (IDUsuario, Nombres, Apellidos, Edad, Correo, Contraseña, FechaNacimiento, FotoDePerfil)
    VALUES (@IDUsuario, @Nombres, @Apellidos, @EdadFinal, @Correo, @Contraseña, @FechaNacimientoFinal, @Foto);
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_SeleccionarPublicacionesEnOrdenConParametros]    Script Date: 24/07/2023 5:03:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_SeleccionarPublicacionesEnOrdenConParametros]
@Busqueda Varchar(500)
AS
BEGIN
	SET NOCOUNT ON
	SELECT * FROM Publicacion, Usuarios WHERE IDUsuario = UsuarioID AND (
	 Nombres LIKE '%'+@Busqueda+'%' OR Apellidos LIKE '%'+@Busqueda+'%' OR Titulo LIKE '%'+@Busqueda+'%'
	 OR Contenido LIKE '%'+@Busqueda+'%'
	 )
	ORDER BY FechaActual 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_SeleccionarPublicacionesPorUsuario]    Script Date: 24/07/2023 5:03:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_SeleccionarPublicacionesPorUsuario]
    @UsuarioID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT P.ID, P.Titulo, P.Contenido, P.FechaActual, U.Nombres, U.Apellidos, U.FotoDePerfil
    FROM Publicacion P
    INNER JOIN Usuarios U ON P.UsuarioID = U.IDUsuario
    WHERE P.UsuarioID = @UsuarioID;
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_SeleccionarUsuario]    Script Date: 24/07/2023 5:03:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE  [dbo].[usp_SeleccionarUsuario]
@ID int
AS
	SELECT * FROM Usuarios WHERE IDUsuario = @ID
GO
/****** Object:  StoredProcedure [dbo].[usp_SeleccionarUsuarios]    Script Date: 24/07/2023 5:03:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[usp_SeleccionarUsuarios]
AS
	SELECT * FROM Usuarios 
GO
/****** Object:  StoredProcedure [dbo].[usp_ValidacionCuenta]    Script Date: 24/07/2023 5:03:18 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_ValidacionCuenta]
@Correo VARCHAR(100), @Contraseña VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON
	IF EXISTS (SELECT * FROM Usuarios WHERE Correo = @Correo AND Contraseña = @Contraseña )
		SELECT IDUsuario FROM Usuarios WHERE Correo = @Correo AND Contraseña = @Contraseña
	ELSE 
		RETURN
END
GO
USE [master]
GO
ALTER DATABASE [JTrend] SET  READ_WRITE 
GO
