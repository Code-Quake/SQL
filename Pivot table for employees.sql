select * from AZISIMSQL01T.dpsrep1.dbo.people where userid = 'PS4820'

select employees from AZISIMSQL01T.dpsrep1.dbo.people where userid = 'PS5262'

select userid + ' ~ ' + RTRIM(first_name) + ' ' + RTRIM(last_name) as Leader, location as LeaderLocator, unit as LeaderUnit, employees from AZISIMSQL01T.dpsrep1.dbo.people where supv_id = 'PS5262'

select p1.userid + ' ~ ' + RTRIM(p1.first_name) + ' ' + RTRIM(p1.last_name) as Employee from AZISIMSQL01T.dpsrep1.dbo.people p1 where p1.supv_id = 'PS5262'


Select p1.userid + ' ~ ' + RTRIM(p1.first_name) + ' ' + RTRIM(p1.last_name) as Employee, p2.userid as ManagerID
from AZISIMSQL01T.dpsrep1.dbo.people p1
left join AZISIMSQL01T.dpsrep1.dbo.people p2
on (p1.supv_id=p2.userid)
where p1.supv_id = 'PS5262'

--SELECT 'PS' + LEFT(t.Declaration,CHARINDEX(' ',t.Declaration)-1) as empid,
--    x.[userid], t.Declaration  
--    From
--    (
--        Select 
--        *,
--        Cast('<X>'+Replace(t.[employees],'~','</X><X>')+'</X>' As XML) As record

--        From AZISIMSQL01T.dpsrep1.dbo.people t where userid = 'PS5262'
--    )x
--    Cross Apply
--    ( 
--        Select fdata.D.value('.','varchar(50)') As Declaration 
--        From x.record.nodes('X') As fdata(D)
--		where fdata.D.value('.','varchar(50)') not like 'EMPLOYEES FOR%'
--		and fdata.D.value('.','varchar(50)') <> ''
--    ) t



