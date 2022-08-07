WITH cteEmployeeName
     AS (SELECT FullName = userid + ' ~ ' + RTRIM(first_name) + ' ' + RTRIM(last_name), supv_id, location, userID, employees
         FROM   AZISIMSQL01T.dpsrep1.dbo.people e),
     cteSubordinates
     AS (SELECT userID, LEVEL = 0
         FROM   AZISIMSQL01T.dpsrep1.dbo.people
         WHERE  userID = 'PS4820'
         UNION ALL
         SELECT e.userID, LEVEL + 1
         FROM   cteSubordinates cte
                INNER JOIN AZISIMSQL01T.dpsrep1.dbo.people e ON cte.userid = e.supv_id)
SELECT FullName, s.userid, en.supv_id, location, Level
FROM   cteSubordinates s
       INNER JOIN cteEmployeeName en ON s.userid = en.userid
