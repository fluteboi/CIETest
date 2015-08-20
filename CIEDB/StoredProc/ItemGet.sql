CREATE PROCEDURE [dbo].[ItemGet]
	@id int = 0
AS
	SELECT * FROM Item
	WHERE Id = @id;

