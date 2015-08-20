CREATE PROCEDURE [dbo].[ItemList]
AS
BEGIN
	SELECT tb1.Id, tb1.UserId, tb1.[Message], tb2.Name 
	FROM Item tb1 INNER JOIN [User] tb2
	ON tb1.UserId = tb2.Id;
END
