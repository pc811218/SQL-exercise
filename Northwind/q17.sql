--列出主管ID、姓名、薪資、其管理的下屬數量和下屬平均薪資。以主管ID排序。


--主管ID、姓名、薪資
select distinct a.ManagerID,b.EmployeeName,b.Salary
from Employees a 
join Employees b
on a.ManagerID=b.EmployeeID

--用主管ID分組 不能NULL 其下屬數量和下屬平均薪資
select ManagerID,COUNT(*) as SubCount,AVG(Salary) as SubAverageSalary
from Employees 
where ManagerID is not null
group by ManagerID


--ANS
select e.ManagerID,e.EmployeeName,e.Salary,sub.SubCount,sub.SubAverageSalary 
from (
	select ManagerID,COUNT(*) as SubCount,AVG(Salary) as SubAverageSalary
	from Employees 
	where ManagerID is not null
	group by ManagerID ) sub
join (
	select distinct a.ManagerID,b.EmployeeName,b.Salary
	from Employees a 
	join Employees b
	on a.ManagerID=b.EmployeeID
	) e
on sub.ManagerID=e.ManagerID



