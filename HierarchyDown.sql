IF OBJECT_ID('dbo.Hierarchy','U') IS NOT NULL
  DROP TABLE dbo.Hierarchy;

WITH cteBuildPath AS 
(
SELECT anchor.userid, 
        anchor.supv_id, 
		anchor.[location],
        HLevel   = 1
   FROM AZISIMSQL01T.dpsrep1.dbo.people AS anchor
  WHERE supv_id = 'PS10550'
  UNION ALL 
  SELECT recur.userid, 
        recur.supv_id, 
		recur.[location],
        HLevel   =  cte.HLevel + 1
   FROM AZISIMSQL01T.dpsrep1.dbo.people AS recur
  INNER JOIN cteBuildPath AS cte 
          ON cte.userid = recur.supv_id
)
SELECT userid = ISNULL(sorted.userid,0),
		sorted.[location]
   FROM cteBuildPath AS sorted

