
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/22/2019 11:05:24
-- Generated from EDMX file: C:\Users\czcz2\IEProject\gosafe-back\gosafe-back\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [gosafeDb];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_SuburbCrimeRate]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CrimeRate] DROP CONSTRAINT [FK_SuburbCrimeRate];
GO
IF OBJECT_ID(N'[dbo].[FK_TempLinkJourney]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TempLink] DROP CONSTRAINT [FK_TempLinkJourney];
GO
IF OBJECT_ID(N'[dbo].[FK_UserProfileTempLink]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TempLink] DROP CONSTRAINT [FK_UserProfileTempLink];
GO
IF OBJECT_ID(N'[dbo].[FK_JTrackingJourney]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[JTracking] DROP CONSTRAINT [FK_JTrackingJourney];
GO
IF OBJECT_ID(N'[dbo].[FK_UserProfileJourney]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Journey] DROP CONSTRAINT [FK_UserProfileJourney];
GO
IF OBJECT_ID(N'[dbo].[FK_EmergencyContactUserProfile]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserProfile] DROP CONSTRAINT [FK_EmergencyContactUserProfile];
GO
IF OBJECT_ID(N'[dbo].[FK_UserEmergencyEmergencyContact]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserEmergency] DROP CONSTRAINT [FK_UserEmergencyEmergencyContact];
GO
IF OBJECT_ID(N'[dbo].[FK_UserProfileUserEmergency]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserEmergency] DROP CONSTRAINT [FK_UserProfileUserEmergency];
GO
IF OBJECT_ID(N'[dbo].[FK_UserProfilePin]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Pin] DROP CONSTRAINT [FK_UserProfilePin];
GO
IF OBJECT_ID(N'[dbo].[FK_SuburbPin]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Pin] DROP CONSTRAINT [FK_SuburbPin];
GO
IF OBJECT_ID(N'[dbo].[FK_CCTVPin]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Pin] DROP CONSTRAINT [FK_CCTVPin];
GO
IF OBJECT_ID(N'[dbo].[FK_StreetLightPin]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Pin] DROP CONSTRAINT [FK_StreetLightPin];
GO
IF OBJECT_ID(N'[dbo].[FK_ExperienceTypePin]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Pin] DROP CONSTRAINT [FK_ExperienceTypePin];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Suburb]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Suburb];
GO
IF OBJECT_ID(N'[dbo].[CrimeRate]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CrimeRate];
GO
IF OBJECT_ID(N'[dbo].[TempLink]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TempLink];
GO
IF OBJECT_ID(N'[dbo].[JTracking]', 'U') IS NOT NULL
    DROP TABLE [dbo].[JTracking];
GO
IF OBJECT_ID(N'[dbo].[UserProfile]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserProfile];
GO
IF OBJECT_ID(N'[dbo].[UserEmergency]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserEmergency];
GO
IF OBJECT_ID(N'[dbo].[EmergencyContact]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EmergencyContact];
GO
IF OBJECT_ID(N'[dbo].[Journey]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Journey];
GO
IF OBJECT_ID(N'[dbo].[Pin]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Pin];
GO
IF OBJECT_ID(N'[dbo].[CCTV]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CCTV];
GO
IF OBJECT_ID(N'[dbo].[StreetLight]', 'U') IS NOT NULL
    DROP TABLE [dbo].[StreetLight];
GO
IF OBJECT_ID(N'[dbo].[ExperienceType]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ExperienceType];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Suburb'
CREATE TABLE [dbo].[Suburb] (
    [SuburbName] nvarchar(128)  NOT NULL,
    [Postcode] int  NULL,
    [Boundary1] nvarchar(max)  NOT NULL,
    [Boundary2] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'CrimeRate'
CREATE TABLE [dbo].[CrimeRate] (
    [SuburbSuburbName] nvarchar(128)  NOT NULL,
    [Rate] real  NULL,
    [OffenceCount] int  NULL,
    [Totpopulation] int  NULL
);
GO

-- Creating table 'TempLink'
CREATE TABLE [dbo].[TempLink] (
    [TempLinkId] nvarchar(20)  NOT NULL,
    [JourneyJourneyId] int  NOT NULL,
    [UserProfileId] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'JTracking'
CREATE TABLE [dbo].[JTracking] (
    [JourneyJourneyId] int  NOT NULL,
    [Time] datetime  NOT NULL,
    [CoordLat] float  NOT NULL,
    [CoordLog] float  NOT NULL
);
GO

-- Creating table 'UserProfile'
CREATE TABLE [dbo].[UserProfile] (
    [Id] nvarchar(128)  NOT NULL,
    [Address] nvarchar(max)  NULL,
    [Gender] nvarchar(max)  NULL,
    [FirstName] nvarchar(max)  NULL,
    [LastName] nvarchar(max)  NULL,
    [fcmID] nvarchar(max)  NULL,
    [EmergencyContact_Phone] nvarchar(256)  NULL
);
GO

-- Creating table 'UserEmergency'
CREATE TABLE [dbo].[UserEmergency] (
    [ECname] nvarchar(max)  NULL,
    [EmergencyContactPhone] nvarchar(256)  NOT NULL,
    [UserProfileId] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'EmergencyContact'
CREATE TABLE [dbo].[EmergencyContact] (
    [Phone] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'Journey'
CREATE TABLE [dbo].[Journey] (
    [JourneyId] int IDENTITY(1,1) NOT NULL,
    [StartTime] datetime  NOT NULL,
    [EndTime] datetime  NULL,
    [NavigateRoute] nvarchar(max)  NULL,
    [SCoordLat] float  NOT NULL,
    [SCoordLog] float  NOT NULL,
    [ECoordLat] float  NULL,
    [ECoordLog] float  NULL,
    [Status] nvarchar(max)  NOT NULL,
    [UserProfileId] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'Pin'
CREATE TABLE [dbo].[Pin] (
    [PinId] int IDENTITY(1,1) NOT NULL,
    [Time] datetime  NOT NULL,
    [CoordLat] float  NOT NULL,
    [CoordLog] float  NOT NULL,
    [Experience] nvarchar(max)  NULL,
    [OtherDetails] nvarchar(max)  NULL,
    [UserProfileId] nvarchar(128)  NOT NULL,
    [State] nvarchar(max)  NOT NULL,
    [Street] nvarchar(max)  NULL,
    [SuburbSuburbName] nvarchar(128)  NOT NULL,
    [CCTVId] int  NOT NULL,
    [StreetLightId] int  NOT NULL,
    [ExperienceTypeId] int  NOT NULL
);
GO

-- Creating table 'CCTV'
CREATE TABLE [dbo].[CCTV] (
    [Id] int  NOT NULL,
    [Description] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'StreetLight'
CREATE TABLE [dbo].[StreetLight] (
    [Id] int  NOT NULL,
    [Description] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ExperienceType'
CREATE TABLE [dbo].[ExperienceType] (
    [Id] int  NOT NULL,
    [Description] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [SuburbName] in table 'Suburb'
ALTER TABLE [dbo].[Suburb]
ADD CONSTRAINT [PK_Suburb]
    PRIMARY KEY CLUSTERED ([SuburbName] ASC);
GO

-- Creating primary key on [SuburbSuburbName] in table 'CrimeRate'
ALTER TABLE [dbo].[CrimeRate]
ADD CONSTRAINT [PK_CrimeRate]
    PRIMARY KEY CLUSTERED ([SuburbSuburbName] ASC);
GO

-- Creating primary key on [TempLinkId] in table 'TempLink'
ALTER TABLE [dbo].[TempLink]
ADD CONSTRAINT [PK_TempLink]
    PRIMARY KEY CLUSTERED ([TempLinkId] ASC);
GO

-- Creating primary key on [JourneyJourneyId], [Time] in table 'JTracking'
ALTER TABLE [dbo].[JTracking]
ADD CONSTRAINT [PK_JTracking]
    PRIMARY KEY CLUSTERED ([JourneyJourneyId], [Time] ASC);
GO

-- Creating primary key on [Id] in table 'UserProfile'
ALTER TABLE [dbo].[UserProfile]
ADD CONSTRAINT [PK_UserProfile]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [EmergencyContactPhone], [UserProfileId] in table 'UserEmergency'
ALTER TABLE [dbo].[UserEmergency]
ADD CONSTRAINT [PK_UserEmergency]
    PRIMARY KEY CLUSTERED ([EmergencyContactPhone], [UserProfileId] ASC);
GO

-- Creating primary key on [Phone] in table 'EmergencyContact'
ALTER TABLE [dbo].[EmergencyContact]
ADD CONSTRAINT [PK_EmergencyContact]
    PRIMARY KEY CLUSTERED ([Phone] ASC);
GO

-- Creating primary key on [JourneyId] in table 'Journey'
ALTER TABLE [dbo].[Journey]
ADD CONSTRAINT [PK_Journey]
    PRIMARY KEY CLUSTERED ([JourneyId] ASC);
GO

-- Creating primary key on [PinId] in table 'Pin'
ALTER TABLE [dbo].[Pin]
ADD CONSTRAINT [PK_Pin]
    PRIMARY KEY CLUSTERED ([PinId] ASC);
GO

-- Creating primary key on [Id] in table 'CCTV'
ALTER TABLE [dbo].[CCTV]
ADD CONSTRAINT [PK_CCTV]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'StreetLight'
ALTER TABLE [dbo].[StreetLight]
ADD CONSTRAINT [PK_StreetLight]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ExperienceType'
ALTER TABLE [dbo].[ExperienceType]
ADD CONSTRAINT [PK_ExperienceType]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [SuburbSuburbName] in table 'CrimeRate'
ALTER TABLE [dbo].[CrimeRate]
ADD CONSTRAINT [FK_SuburbCrimeRate]
    FOREIGN KEY ([SuburbSuburbName])
    REFERENCES [dbo].[Suburb]
        ([SuburbName])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [JourneyJourneyId] in table 'TempLink'
ALTER TABLE [dbo].[TempLink]
ADD CONSTRAINT [FK_TempLinkJourney]
    FOREIGN KEY ([JourneyJourneyId])
    REFERENCES [dbo].[Journey]
        ([JourneyId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TempLinkJourney'
CREATE INDEX [IX_FK_TempLinkJourney]
ON [dbo].[TempLink]
    ([JourneyJourneyId]);
GO

-- Creating foreign key on [UserProfileId] in table 'TempLink'
ALTER TABLE [dbo].[TempLink]
ADD CONSTRAINT [FK_UserProfileTempLink]
    FOREIGN KEY ([UserProfileId])
    REFERENCES [dbo].[UserProfile]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserProfileTempLink'
CREATE INDEX [IX_FK_UserProfileTempLink]
ON [dbo].[TempLink]
    ([UserProfileId]);
GO

-- Creating foreign key on [JourneyJourneyId] in table 'JTracking'
ALTER TABLE [dbo].[JTracking]
ADD CONSTRAINT [FK_JTrackingJourney]
    FOREIGN KEY ([JourneyJourneyId])
    REFERENCES [dbo].[Journey]
        ([JourneyId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [UserProfileId] in table 'Journey'
ALTER TABLE [dbo].[Journey]
ADD CONSTRAINT [FK_UserProfileJourney]
    FOREIGN KEY ([UserProfileId])
    REFERENCES [dbo].[UserProfile]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserProfileJourney'
CREATE INDEX [IX_FK_UserProfileJourney]
ON [dbo].[Journey]
    ([UserProfileId]);
GO

-- Creating foreign key on [EmergencyContact_Phone] in table 'UserProfile'
ALTER TABLE [dbo].[UserProfile]
ADD CONSTRAINT [FK_EmergencyContactUserProfile]
    FOREIGN KEY ([EmergencyContact_Phone])
    REFERENCES [dbo].[EmergencyContact]
        ([Phone])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmergencyContactUserProfile'
CREATE INDEX [IX_FK_EmergencyContactUserProfile]
ON [dbo].[UserProfile]
    ([EmergencyContact_Phone]);
GO

-- Creating foreign key on [EmergencyContactPhone] in table 'UserEmergency'
ALTER TABLE [dbo].[UserEmergency]
ADD CONSTRAINT [FK_UserEmergencyEmergencyContact]
    FOREIGN KEY ([EmergencyContactPhone])
    REFERENCES [dbo].[EmergencyContact]
        ([Phone])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [UserProfileId] in table 'UserEmergency'
ALTER TABLE [dbo].[UserEmergency]
ADD CONSTRAINT [FK_UserProfileUserEmergency]
    FOREIGN KEY ([UserProfileId])
    REFERENCES [dbo].[UserProfile]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserProfileUserEmergency'
CREATE INDEX [IX_FK_UserProfileUserEmergency]
ON [dbo].[UserEmergency]
    ([UserProfileId]);
GO

-- Creating foreign key on [UserProfileId] in table 'Pin'
ALTER TABLE [dbo].[Pin]
ADD CONSTRAINT [FK_UserProfilePin]
    FOREIGN KEY ([UserProfileId])
    REFERENCES [dbo].[UserProfile]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserProfilePin'
CREATE INDEX [IX_FK_UserProfilePin]
ON [dbo].[Pin]
    ([UserProfileId]);
GO

-- Creating foreign key on [SuburbSuburbName] in table 'Pin'
ALTER TABLE [dbo].[Pin]
ADD CONSTRAINT [FK_SuburbPin]
    FOREIGN KEY ([SuburbSuburbName])
    REFERENCES [dbo].[Suburb]
        ([SuburbName])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SuburbPin'
CREATE INDEX [IX_FK_SuburbPin]
ON [dbo].[Pin]
    ([SuburbSuburbName]);
GO

-- Creating foreign key on [CCTVId] in table 'Pin'
ALTER TABLE [dbo].[Pin]
ADD CONSTRAINT [FK_CCTVPin]
    FOREIGN KEY ([CCTVId])
    REFERENCES [dbo].[CCTV]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CCTVPin'
CREATE INDEX [IX_FK_CCTVPin]
ON [dbo].[Pin]
    ([CCTVId]);
GO

-- Creating foreign key on [StreetLightId] in table 'Pin'
ALTER TABLE [dbo].[Pin]
ADD CONSTRAINT [FK_StreetLightPin]
    FOREIGN KEY ([StreetLightId])
    REFERENCES [dbo].[StreetLight]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StreetLightPin'
CREATE INDEX [IX_FK_StreetLightPin]
ON [dbo].[Pin]
    ([StreetLightId]);
GO

-- Creating foreign key on [ExperienceTypeId] in table 'Pin'
ALTER TABLE [dbo].[Pin]
ADD CONSTRAINT [FK_ExperienceTypePin]
    FOREIGN KEY ([ExperienceTypeId])
    REFERENCES [dbo].[ExperienceType]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ExperienceTypePin'
CREATE INDEX [IX_FK_ExperienceTypePin]
ON [dbo].[Pin]
    ([ExperienceTypeId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------