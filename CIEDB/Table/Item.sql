CREATE TABLE [dbo].[Item]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [UserId] INT NOT NULL, 
    [Message] VARCHAR(50) NOT NULL, 
    CONSTRAINT [FK_Item_ToTable] FOREIGN KEY ([UserId]) REFERENCES [User]([id])
)

GO

CREATE INDEX [IX_Item_Column] ON [dbo].[Item] ([UserId])
