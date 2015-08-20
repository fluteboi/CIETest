CREATE PROCEDURE [dbo].[ItemAdd]
	@userId int=0,
	@message varchar(50)
AS
	INSERT INTO Item
		(UserId, [Message])
	VALUES
		(@userId, @message);
