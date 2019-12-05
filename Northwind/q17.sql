--�C�X�D��ID�B�m�W�B�~��B��޲z���U�ݼƶq�M�U�ݥ����~��C�H�D��ID�ƧǡC


--�D��ID�B�m�W�B�~��
select distinct a.ManagerID,b.EmployeeName,b.Salary
from Employees a 
join Employees b
on a.ManagerID=b.EmployeeID

--�ΥD��ID���� ����NULL ��U�ݼƶq�M�U�ݥ����~��
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



