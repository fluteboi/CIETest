CREATE PROCEDURE [dbo].[UserGetByUserName]
	@UserName varchar(20)

AS
	SELECT * FROM [User]
	WHERE UserName = @UserName;