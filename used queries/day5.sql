CREATE TABLE activityData 
(
activityId int primary key,
activityDesc text,
activityPoints int
)

CREATE TABLE userRecords
(
serialNumber int primary key,
usernames varchar(50) foreign key references userSignUp(userName),
activityIds int foreign key references activityData(activityId),
scores int, 
activityDates date,
imageUrlPath text
)

CREATE TABLE adminModule
(
SrNumber int primary key IDENTITY(1,1),
userName varchar(50) foreign key references userSignUp(userName),
activityId int foreign key references activityData(activityId),
score int, 
activityDate date,
imageUrl text
)

DROP TABLE adminModule

INSERT INTO activityData(activityId,activityDesc,activityPoints) 
VALUES(1,'Compost - Get a compost bin or worm farm for food scraps.',5);
INSERT INTO activityData(activityId,activityDesc,activityPoints) 
VALUES(2,'Plan Meals - Planning meals & portion can help ensure you dont throw away food after meals.',2);
INSERT INTO activityData(activityId,activityDesc,activityPoints) 
VALUES(3,'Take it Home - Ask to have your leftovers wrapped up to take home & enjoy later.',3);
INSERT INTO activityData(activityId,activityDesc,activityPoints) 
VALUES(4,'Shop Fresh - Cut down on processed food.',2);
INSERT INTO activityData(activityId,activityDesc,activityPoints) 
VALUES(5,'Shop Local - Buy food that''s grown locally and in season.',3);
INSERT INTO activityData(activityId,activityDesc,activityPoints) 
VALUES(6,'Freeze it - Freeze portion sizes in airtight containers.',4);
INSERT INTO activityData(activityId,activityDesc,activityPoints) 
VALUES(7,'Little & Often - Avoid stocking up, pilling it high and wasting food.',2);
INSERT INTO activityData(activityId,activityDesc,activityPoints) 
VALUES(8,'Surplus Veggies? Blend up, soups, pickle or ferment.',3);
INSERT INTO activityData(activityId,activityDesc,activityPoints) 
VALUES(9,'Turn off lights when not in use.',2);
INSERT INTO activityData(activityId,activityDesc,activityPoints) 
VALUES(10,'Eat less meat',3);
INSERT INTO activityData(activityId,activityDesc,activityPoints) 
VALUES(11,'Ask for no receipt.',2);
INSERT INTO activityData(activityId,activityDesc,activityPoints) 
VALUES(12,'Wash plastic baggies to use it again',5);
INSERT INTO activityData(activityId,activityDesc,activityPoints) 
VALUES(13,'Repurpose old shirts as rags.',4);
INSERT INTO activityData(activityId,activityDesc,activityPoints) 
VALUES(14,'Learn to sew and patch your clothing.',3);
INSERT INTO activityData(activityId,activityDesc,activityPoints) 
VALUES(15,'Opt in to paperless billing.',2);
INSERT INTO activityData(activityId,activityDesc,activityPoints) 
VALUES(16,'Skip plastic produce bags.',2);
INSERT INTO activityData(activityId,activityDesc,activityPoints) 
VALUES(17,'Hold an educational film or screening talk.',4);
INSERT INTO activityData(activityId,activityDesc,activityPoints) 
VALUES(18,'Organize school, park, beach cleanups.',5);
INSERT INTO activityData(activityId,activityDesc,activityPoints) 
VALUES(19,'Request the supplier deliveries are plastic free.',3);
INSERT INTO activityData(activityId,activityDesc,activityPoints) 
VALUES(20,'Carpooling.',2);

select * from tableState


