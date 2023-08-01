

CREATE PROCEDURE ecochaseLogin
@Username varchar(50),
@Password varchar(50)
AS
BEGIN 
	Declare @Count int
	Declare @returnValue int

	SELECT @Count = COUNT(Username)
	from userSignUp where userName = @Username AND userPassword	= @Password
	IF @Count > 0 
	BEGIN 
		Set @returnValue = 1
	END
	ELSE 
	BEGIN 
		Set @returnValue = -1 
	END 
	SELECT @returnValue AS valuesReturned 
END