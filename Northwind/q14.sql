--�C�X���g�B�z�L�u�͸۰���U�ݤ��q�v�M�u�v�j�T���v���q�檺���uID�Ωm�W�åHID�ƧǡC

--��X���qID
select CustomerID 
from Customers 
where CompanyName='�͸۰���U�ݤ��q' 
or CompanyName='�v�j�T��'

--��X�B�z�L�����uID
select distinct b.EmployeeID 
from (
	select * 
	from Orders 
	where CustomerID='HUNGO' 
	) a
join (
	select * 
	from Orders 
	where CustomerID='WELLI'
	)b
on a.EmployeeID=b.EmployeeID 


--��X���u�m�W
select EmployeeID,EmployeeName
from Employees


--ANS
select empname.EmployeeID,EmployeeName
from (
	select distinct b.EmployeeID 
	from (
		select * 
		from Orders 
		where CustomerID=
			(select distinct CustomerID 
			from Customers 
			where CompanyName='�͸۰���U�ݤ��q') 
		) a
	join (
		select * 
		from Orders 
		where CustomerID=
			(select distinct CustomerID 
			from Customers 
			where CompanyName='�v�j�T��')
		)b
	on a.EmployeeID=b.EmployeeID 
	) empid 
join (
	select EmployeeID,EmployeeName
	from Employees
	) empname
on empid.EmployeeID=empname.EmployeeID
order by empname.EmployeeID
