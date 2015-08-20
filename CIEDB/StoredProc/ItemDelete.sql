CREATE PROCEDURE [dbo].[ItemDelete]
	@id int = 0
AS
	DELETE FROM Item
	WHERE Id = @id;

