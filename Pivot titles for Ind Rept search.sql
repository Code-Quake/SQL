select i.id, employeename, locationcode, employeebadge, e.OtherTitle from IndividualReporting i
join IndividualReportingElements e on i.Id = e.IndReptId
where employeename like '%gao%' or employeebadge like '%gao%' or locationcode like '%gao%'

DECLARE @PivotColumns AS NVARCHAR(MAX)

SELECT @PivotColumns= COALESCE(@PivotColumns + ',','') + QUOTENAME(OtherTitle)
FROM (select e.OtherTitle from IndividualReporting i
join IndividualReportingElements e on i.Id = e.IndReptId
where i.id = '4CEAA44F-9CB8-4E3B-A2CF-D7336884A2C0'
) AS PivotExample

select @PivotColumns



select @PivotColumns =
	COALESCE(@PivotColumns + ',','') + QUOTENAME(OtherTitle)
	FROM (select e.OtherTitle from IndividualReporting i1
	join IndividualReportingElements e on i1.Id = e.IndReptId
	where i1.id = '4CEAA44F-9CB8-4E3B-A2CF-D7336884A2C0')	
as e1

select i.id, employeename, locationcode, employeebadge, (
	select 
	COALESCE(OtherTitle + ',','') + QUOTENAME(OtherTitle)
	FROM (select e.OtherTitle from IndividualReporting i1
	join IndividualReportingElements e on i1.Id = e.IndReptId
	where i1.id = '4CEAA44F-9CB8-4E3B-A2CF-D7336884A2C0')	
as e1) from IndividualReporting i
