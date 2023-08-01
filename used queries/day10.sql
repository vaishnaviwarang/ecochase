

SELECT TOP 5 userRecords.usernames AS Usernames, SUM(userRecords.scores) AS TotalScores, tableState.StateName AS States
FROM userRecords
LEFT JOIN tableState ON userRecords.activityIds = tableState.StateId
GROUP BY userRecords.usernames, tableState.StateName ORDER BY SUM(userRecords.scores) DESC

DELETE FROM userSignUp WHERE StateId = 7

SELECT userSignUp.userName AS Usernames, tableState.StateName AS States
FROM userSignUp 
JOIN tableState ON userSignUp.StateId = tableState.StateId
GROUP BY userSignUp.userName, tableState.StateName 

SELECT TOP 5 userSignUp.userName AS Usernames, tableState.StateName AS States, SUM(userRecords.scores) AS TotalScores
FROM tableState 
JOIN userSignUp ON tableState.StateId = userSignUp.StateId
JOIN userRecords ON userSignUp.userName = userRecords.usernames
GROUP BY userSignUp.userName, tableState.StateName
ORDER BY SUM(userRecords.scores) DESC