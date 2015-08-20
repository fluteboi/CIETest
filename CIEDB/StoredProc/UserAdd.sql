CREATE PROCEDURE [dbo].[UserAdd]
	@Name varchar(20),
	@UserName varchar(20),
	@Password varchar(50),
	@GUID uniqueidentifier
AS
	
INSERT INTO [User] 
	(Name, UserName, [Password], [GUID])
VALUES
	(@Name, @UserName, @Password, @GUID);
