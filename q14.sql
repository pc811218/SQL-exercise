--列出曾經處理過「凱誠國際顧問公司」和「師大貿易」的訂單的員工ID及姓名並以ID排序。

--找出公司ID
select CustomerID 
from Customers 
where CompanyName='凱誠國際顧問公司' 
or CompanyName='師大貿易'

--找出處理過的員工ID
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


--找出員工姓名
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
			where CompanyName='凱誠國際顧問公司') 
		) a
	join (
		select * 
		from Orders 
		where CustomerID=
			(select distinct CustomerID 
			from Customers 
			where CompanyName='師大貿易')
		)b
	on a.EmployeeID=b.EmployeeID 
	) empid 
join (
	select EmployeeID,EmployeeName
	from Employees
	) empname
on empid.EmployeeID=empname.EmployeeID
order by empname.EmployeeID
