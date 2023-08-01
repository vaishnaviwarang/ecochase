
CREATE PROCEDURE ecochaseInsertIntoAdmin
@Username varchar(50),
@ActivityId int,
@ActivityPoints int,
@ActivityDate date,
@ImagePath text
AS
BEGIN 
	INSERT INTO adminModule values(@Username,@ActivityId,@ActivityPoints,@ActivityDate,@ImagePath)
END



DROP TABLE adminModule

CREATE PROCEDURE ecochaseDelete
@Id int
AS
BEGIN 
	DELETE FROM adminModule WHERE SrNumber = @Id
END

CREATE PROCEDURE ecochaseDeleteFromAdmin
@Id int
AS
BEGIN 
	DELETE FROM adminModule WHERE SrNumber = @Id
END

CREATE PROCEDURE ecochaseAcceptRequest
@Id int,
@Username varchar(50),
@ActivityId int,
@ActivityPoints int,
@ActivityDate date,
@ImagePath text
AS
BEGIN 
	INSERT INTO userRecords values(@Id,@Username,@ActivityId,@ActivityPoints,@ActivityDate,@ImagePath)
END

CREATE PROCEDURE ecochaseAcceptRequestF
@Id int,
@Username varchar(50),
@ActivityId int,
@ActivityPoints int,
@ActivityDate date,
@ImagePath text
AS
BEGIN 
	INSERT INTO userRecords values(@Id,@Username,@ActivityId,@ActivityPoints,@ActivityDate,@ImagePath)
	DELETE FROM adminModule WHERE SrNumber = @Id
END

DELETE FROM userRecords

TRUNCATE TABLE userRecords
TRUNCATE TABLE adminModule

CREATE PROCEDURE ecochaseGetScore 
@Username varchar(50)
AS 
BEGIN 
	SELECT SUM(scores) from userRecords WHERE usernames = @Username
END 



CREATE TABLE ecochaseNewTableData
(
Username varchar(50) primary key,
score int
)

SELECT * FROM ecochaseNewTableData