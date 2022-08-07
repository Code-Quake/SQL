WITH OrganizationemployeeCTE AS
(
     Select userid, supv_id, e.[location]
     From AZISIMSQL01T.dpsrep1.dbo.people e
     Where userId = 'PS10550'
     UNION ALL
     Select e.userid,
            e.supv_id,
			e.[location]
     From AZISIMSQL01T.dpsrep1.dbo.people e
     JOIN OrganizationemployeeCTE o
     ON e.userid = o.supv_id
)
Select emp1.userid, emp1.[location]
From OrganizationemployeeCTE emp1
LEFT Join OrganizationemployeeCTE emp2
ON emp1.supv_id = emp2.userid

