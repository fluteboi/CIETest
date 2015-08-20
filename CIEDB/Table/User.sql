﻿CREATE TABLE [dbo].[User]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Name] VARCHAR(50) NOT NULL, 
    [UserName] VARCHAR(20) NOT NULL, 
    [Password] VARCHAR(50) NOT NULL, 
    [GUID] UNIQUEIDENTIFIER NOT NULL
)

GO

CREATE INDEX [IX_User_Column] ON [dbo].[User] ([UserName])
