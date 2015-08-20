CREATE PROCEDURE [dbo].[ItemUpdate]
	@id int = 0,
	@userID int = 0,
	@message varchar(50)
AS
	UPDATE Item
	SET UserId = @userID, [Message] = @message
	WHERE Id = @id;
