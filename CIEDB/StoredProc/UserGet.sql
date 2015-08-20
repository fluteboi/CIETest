CREATE PROCEDURE [dbo].[UserGet]
	@id int = 0
AS

	SELECT * FROM [User]
	WHERE Id = @id;
