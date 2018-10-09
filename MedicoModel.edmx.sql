
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 05/10/2013 18:19:38
-- Generated from EDMX file: c:\users\slimane\documents\visual studio 2012\Projects\MEDICO\MEDICO\MedicoModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [MedicoDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Personnes'
CREATE TABLE [dbo].[Personnes] (
    [idPersonne] int IDENTITY(1,1) NOT NULL,
    [nom] nvarchar(50)  NOT NULL,
    [prenom] nvarchar(50)  NOT NULL,
    [adresse] nvarchar(100)  NULL,
    [ville] int  NOT NULL,
    [email] nvarchar(50)  NOT NULL,
    [telephone] nvarchar(20)  NOT NULL,
    [photo] nvarchar(max)  NOT NULL,
    [Cabinet_idCabinet] int  NOT NULL
);
GO

-- Creating table 'Comptes'
CREATE TABLE [dbo].[Comptes] (
    [idCompte] int IDENTITY(1,1) NOT NULL,
    [login] nvarchar(60)  NOT NULL,
    [motDePass] nvarchar(60)  NOT NULL,
    [active] bit  NOT NULL,
    [Personne_idPersonne] int  NOT NULL
);
GO

-- Creating table 'Specialites'
CREATE TABLE [dbo].[Specialites] (
    [idSpecialite] int IDENTITY(1,1) NOT NULL,
    [nom] nvarchar(60)  NOT NULL,
    [description] nvarchar(300)  NULL
);
GO

-- Creating table 'RendezVouss'
CREATE TABLE [dbo].[RendezVouss] (
    [idRendezVous] int IDENTITY(1,1) NOT NULL,
    [sujet] nvarchar(150)  NOT NULL,
    [dateDajout] datetime  NOT NULL,
    [startTime] time  NOT NULL,
    [endTime] time  NOT NULL,
    [motif] nvarchar(500)  NULL,
    [accepte] bit  NOT NULL,
    [Patient_idPersonne] int  NOT NULL,
    [Medecin_idPersonne] int  NOT NULL
);
GO

-- Creating table 'Cabinets'
CREATE TABLE [dbo].[Cabinets] (
    [idCabinet] int IDENTITY(1,1) NOT NULL,
    [nom] nvarchar(100)  NOT NULL,
    [ville] int  NOT NULL,
    [code_postale] nvarchar(max)  NULL,
    [photo] nvarchar(max)  NOT NULL,
    [adresse] nvarchar(max)  NOT NULL,
    [description] nvarchar(max)  NULL,
    [geoLocationX] nvarchar(max)  NOT NULL,
    [geoLocationY] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Personnes_CabinetService'
CREATE TABLE [dbo].[Personnes_CabinetService] (
    [Cabinet_idCabinet1] int  NOT NULL,
    [idPersonne] int  NOT NULL
);
GO

-- Creating table 'Personnes_Patient'
CREATE TABLE [dbo].[Personnes_Patient] (
    [dateNaissance] datetime  NOT NULL,
    [nb_warning] int  NOT NULL,
    [idPersonne] int  NOT NULL
);
GO

-- Creating table 'Personnes_Medecin'
CREATE TABLE [dbo].[Personnes_Medecin] (
    [timeStartJob] time  NOT NULL,
    [timeEndJob] time  NOT NULL,
    [Specialite_idSpecialite] int  NOT NULL,
    [idPersonne] int  NOT NULL
);
GO

-- Creating table 'Personnes_Secretaire'
CREATE TABLE [dbo].[Personnes_Secretaire] (
    [idPersonne] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [idPersonne] in table 'Personnes'
ALTER TABLE [dbo].[Personnes]
ADD CONSTRAINT [PK_Personnes]
    PRIMARY KEY CLUSTERED ([idPersonne] ASC);
GO

-- Creating primary key on [idCompte] in table 'Comptes'
ALTER TABLE [dbo].[Comptes]
ADD CONSTRAINT [PK_Comptes]
    PRIMARY KEY CLUSTERED ([idCompte] ASC);
GO

-- Creating primary key on [idSpecialite] in table 'Specialites'
ALTER TABLE [dbo].[Specialites]
ADD CONSTRAINT [PK_Specialites]
    PRIMARY KEY CLUSTERED ([idSpecialite] ASC);
GO

-- Creating primary key on [idRendezVous] in table 'RendezVouss'
ALTER TABLE [dbo].[RendezVouss]
ADD CONSTRAINT [PK_RendezVouss]
    PRIMARY KEY CLUSTERED ([idRendezVous] ASC);
GO

-- Creating primary key on [idCabinet] in table 'Cabinets'
ALTER TABLE [dbo].[Cabinets]
ADD CONSTRAINT [PK_Cabinets]
    PRIMARY KEY CLUSTERED ([idCabinet] ASC);
GO

-- Creating primary key on [idPersonne] in table 'Personnes_CabinetService'
ALTER TABLE [dbo].[Personnes_CabinetService]
ADD CONSTRAINT [PK_Personnes_CabinetService]
    PRIMARY KEY CLUSTERED ([idPersonne] ASC);
GO

-- Creating primary key on [idPersonne] in table 'Personnes_Patient'
ALTER TABLE [dbo].[Personnes_Patient]
ADD CONSTRAINT [PK_Personnes_Patient]
    PRIMARY KEY CLUSTERED ([idPersonne] ASC);
GO

-- Creating primary key on [idPersonne] in table 'Personnes_Medecin'
ALTER TABLE [dbo].[Personnes_Medecin]
ADD CONSTRAINT [PK_Personnes_Medecin]
    PRIMARY KEY CLUSTERED ([idPersonne] ASC);
GO

-- Creating primary key on [idPersonne] in table 'Personnes_Secretaire'
ALTER TABLE [dbo].[Personnes_Secretaire]
ADD CONSTRAINT [PK_Personnes_Secretaire]
    PRIMARY KEY CLUSTERED ([idPersonne] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Personne_idPersonne] in table 'Comptes'
ALTER TABLE [dbo].[Comptes]
ADD CONSTRAINT [FK_ComptePersonne]
    FOREIGN KEY ([Personne_idPersonne])
    REFERENCES [dbo].[Personnes]
        ([idPersonne])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ComptePersonne'
CREATE INDEX [IX_FK_ComptePersonne]
ON [dbo].[Comptes]
    ([Personne_idPersonne]);
GO

-- Creating foreign key on [Cabinet_idCabinet1] in table 'Personnes_CabinetService'
ALTER TABLE [dbo].[Personnes_CabinetService]
ADD CONSTRAINT [FK_CabinetCabinetService]
    FOREIGN KEY ([Cabinet_idCabinet1])
    REFERENCES [dbo].[Cabinets]
        ([idCabinet])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CabinetCabinetService'
CREATE INDEX [IX_FK_CabinetCabinetService]
ON [dbo].[Personnes_CabinetService]
    ([Cabinet_idCabinet1]);
GO

-- Creating foreign key on [Patient_idPersonne] in table 'RendezVouss'
ALTER TABLE [dbo].[RendezVouss]
ADD CONSTRAINT [FK_PatientRendezVous]
    FOREIGN KEY ([Patient_idPersonne])
    REFERENCES [dbo].[Personnes_Patient]
        ([idPersonne])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PatientRendezVous'
CREATE INDEX [IX_FK_PatientRendezVous]
ON [dbo].[RendezVouss]
    ([Patient_idPersonne]);
GO

-- Creating foreign key on [Medecin_idPersonne] in table 'RendezVouss'
ALTER TABLE [dbo].[RendezVouss]
ADD CONSTRAINT [FK_MedecinRendezVous]
    FOREIGN KEY ([Medecin_idPersonne])
    REFERENCES [dbo].[Personnes_Medecin]
        ([idPersonne])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_MedecinRendezVous'
CREATE INDEX [IX_FK_MedecinRendezVous]
ON [dbo].[RendezVouss]
    ([Medecin_idPersonne]);
GO

-- Creating foreign key on [Specialite_idSpecialite] in table 'Personnes_Medecin'
ALTER TABLE [dbo].[Personnes_Medecin]
ADD CONSTRAINT [FK_MedecinSpecialite]
    FOREIGN KEY ([Specialite_idSpecialite])
    REFERENCES [dbo].[Specialites]
        ([idSpecialite])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_MedecinSpecialite'
CREATE INDEX [IX_FK_MedecinSpecialite]
ON [dbo].[Personnes_Medecin]
    ([Specialite_idSpecialite]);
GO

-- Creating foreign key on [idPersonne] in table 'Personnes_CabinetService'
ALTER TABLE [dbo].[Personnes_CabinetService]
ADD CONSTRAINT [FK_CabinetService_inherits_Personne]
    FOREIGN KEY ([idPersonne])
    REFERENCES [dbo].[Personnes]
        ([idPersonne])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [idPersonne] in table 'Personnes_Patient'
ALTER TABLE [dbo].[Personnes_Patient]
ADD CONSTRAINT [FK_Patient_inherits_Personne]
    FOREIGN KEY ([idPersonne])
    REFERENCES [dbo].[Personnes]
        ([idPersonne])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [idPersonne] in table 'Personnes_Medecin'
ALTER TABLE [dbo].[Personnes_Medecin]
ADD CONSTRAINT [FK_Medecin_inherits_CabinetService]
    FOREIGN KEY ([idPersonne])
    REFERENCES [dbo].[Personnes_CabinetService]
        ([idPersonne])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [idPersonne] in table 'Personnes_Secretaire'
ALTER TABLE [dbo].[Personnes_Secretaire]
ADD CONSTRAINT [FK_Secretaire_inherits_CabinetService]
    FOREIGN KEY ([idPersonne])
    REFERENCES [dbo].[Personnes_CabinetService]
        ([idPersonne])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------