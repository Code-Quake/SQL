select * from AZISIMSQL01T.dpsrep1.dbo.people where last_name = 'toribio'
location = 45000001



DECLARE @String nvarchar(max),
@Delimiter char(1),
@XMLString xml;

SELECT @String = (select employees from AZISIMSQL01T.dpsrep1.dbo.people where userid = 'PS2954'),
@Delimiter = '~'

SET @XMLString = 
CONVERT(xml,'<root><employee>' +
REPLACE(@String,@Delimiter,'</employee><employee>') +
'</employee></root>')

select * into #TempEmp1 from (SELECT Result.value('.','varchar(20)') AS employee
FROM @XMLString.nodes('/root/employee') AS T(Result)) as emp

select * into #TempEmp from (select 'PS' + substring(employee, 1, charindex(' ', employee)) as UserId, substring(employee, charindex(' ', employee), 1000) as Employee from #TempEmp1) as emp1

select a.UserId, rtrim(a.First_name) + ' ' + rtrim(a.Last_Name), a.Location from AZISIMSQL01T.dpsrep1.dbo.people a
join #TempEmp e on a.UserId = e.UserId

drop table #tempEmp1
drop table #tempEmp

