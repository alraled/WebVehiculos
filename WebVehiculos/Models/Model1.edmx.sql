
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/25/2015 12:14:18
-- Generated from EDMX file: C:\Users\Alumno\Documents\Visual Studio 2015\Projects\MVC\WebVehiculos2015\WebVehiculos\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [VehiculosLuis];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Vehiculo_TipoVehiculo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Vehiculo] DROP CONSTRAINT [FK_Vehiculo_TipoVehiculo];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[TipoVehiculo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TipoVehiculo];
GO
IF OBJECT_ID(N'[dbo].[Vehiculo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Vehiculo];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'TipoVehiculo'
CREATE TABLE [dbo].[TipoVehiculo] (
    [idTipo] int IDENTITY(1,1) NOT NULL,
    [nombre] nvarchar(50)  NOT NULL,
    [descripcion] nvarchar(max)  NULL
);
GO

-- Creating table 'Vehiculo'
CREATE TABLE [dbo].[Vehiculo] (
    [idVehiculo] int IDENTITY(1,1) NOT NULL,
    [idTipo] int  NOT NULL,
    [marca] nvarchar(50)  NOT NULL,
    [modelo] nvarchar(50)  NOT NULL,
    [matricula] nvarchar(50)  NOT NULL,
    [precio] decimal(18,2)  NOT NULL
);
GO

-- Creating table 'UsuarioSet'
CREATE TABLE [dbo].[UsuarioSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Apellidos] nvarchar(max)  NOT NULL,
    [Login] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [RolId] int  NOT NULL
);
GO

-- Creating table 'RolSet'
CREATE TABLE [dbo].[RolSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [idTipo] in table 'TipoVehiculo'
ALTER TABLE [dbo].[TipoVehiculo]
ADD CONSTRAINT [PK_TipoVehiculo]
    PRIMARY KEY CLUSTERED ([idTipo] ASC);
GO

-- Creating primary key on [idVehiculo] in table 'Vehiculo'
ALTER TABLE [dbo].[Vehiculo]
ADD CONSTRAINT [PK_Vehiculo]
    PRIMARY KEY CLUSTERED ([idVehiculo] ASC);
GO

-- Creating primary key on [Id] in table 'UsuarioSet'
ALTER TABLE [dbo].[UsuarioSet]
ADD CONSTRAINT [PK_UsuarioSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'RolSet'
ALTER TABLE [dbo].[RolSet]
ADD CONSTRAINT [PK_RolSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [idTipo] in table 'Vehiculo'
ALTER TABLE [dbo].[Vehiculo]
ADD CONSTRAINT [FK_Vehiculo_TipoVehiculo]
    FOREIGN KEY ([idTipo])
    REFERENCES [dbo].[TipoVehiculo]
        ([idTipo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Vehiculo_TipoVehiculo'
CREATE INDEX [IX_FK_Vehiculo_TipoVehiculo]
ON [dbo].[Vehiculo]
    ([idTipo]);
GO

-- Creating foreign key on [RolId] in table 'UsuarioSet'
ALTER TABLE [dbo].[UsuarioSet]
ADD CONSTRAINT [FK_UsuarioRol]
    FOREIGN KEY ([RolId])
    REFERENCES [dbo].[RolSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UsuarioRol'
CREATE INDEX [IX_FK_UsuarioRol]
ON [dbo].[UsuarioSet]
    ([RolId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------