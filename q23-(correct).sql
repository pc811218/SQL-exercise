--調整薪資，全年處理50筆以上訂單的員工薪資加5%，處理100筆以上訂單則加10%，
--最多加5000元，且不得高於其主管。

------------------------

declare @level table(
	EmployeeID int,
	empSalary int,
	ManagerID int,
	mgrSalary int,
	lv int
)
--
insert into @level
select emp.EmployeeID,emp.Salary,emp.ManagerID,mgr.Salary,1 
from Employees emp left join Employees mgr
on emp.ManagerID=mgr.EmployeeID

--設定大主管 lv3
update @level set lv =3
where ManagerID is null 


--設定二主管 lv2
update @level set lv =2
where ManagerID in (select EmployeeID from @level where lv=3)


--顯示排序BY lv
--select * from @level order by lv desc

--看哪些人要調

--50以上暫存表
declare @fifty table(
	EmployeeID int
)
insert into @fifty
--全年的員工訂單數量>50 <100
select EmployeeID 
from Orders 
group by EmployeeID
having COUNT(*)>50 and COUNT(*)<100

--100以上暫存表
declare @hundred table(
	EmployeeID int
)
insert into @hundred 
--全年的員工訂單數量>100
select EmployeeID 
from Orders 
group by EmployeeID
having COUNT(*)>100

--顯示
--select *from @fifty
--select *from @hundred
--select * from @level order by lv desc
--開始調薪
	--大主管 
		--50
update @level set empSalary=
(
case
	when empSalary*0.05<5000 then empSalary*1.05
	else empSalary+5000 
end
)
where lv=3 and EmployeeID in (select EmployeeID from @fifty)

	--大主管 
		--100
update @level set empSalary=
(
case
	when empSalary*0.1<5000 then empSalary*1.1
	else empSalary+5000 
end
)
where lv=3 and EmployeeID in (select EmployeeID from @hundred)		

--同步主管薪水
update orgin set orgin.mgrSalary=plused.empSalary
from @level plused join @level orgin
on plused.EmployeeID=orgin.ManagerID
where plused.lv=3



	--中主管
		--50
update @level set empSalary=
(
case
	when empSalary*0.05<5000 and empSalary*1.05<mgrSalary then empSalary*1.05
	when empSalary*0.05<5000 and empSalary*1.05>mgrSalary then mgrSalary
	when empSalary*0.05>=5000 and empSalary*1.05>mgrSalary and empSalary+5000>mgrSalary then mgrSalary
	when empSalary*0.05>=5000 and empSalary*1.05>mgrSalary and empSalary+5000<mgrSalary then empSalary+5000
	when empSalary*0.05>=5000 and empSalary*1.05<mgrSalary  then empSalary+5000
	 
end
)
where lv=2 and EmployeeID in (select EmployeeID from @fifty)

	--中主管
		--100
update @level set empSalary=
(
case
	when empSalary*0.1<5000 and empSalary*1.1<mgrSalary then empSalary*1.1
	when empSalary*0.1<5000 and empSalary*1.1>mgrSalary then mgrSalary
	when empSalary*0.1>=5000 and empSalary*1.1>mgrSalary and empSalary+5000>mgrSalary then mgrSalary
	when empSalary*0.1>=5000 and empSalary*1.1>mgrSalary and empSalary+5000<mgrSalary then empSalary+5000
	when empSalary*0.1>=5000 and empSalary*1.1<mgrSalary  then empSalary+5000

end
)
where lv=2 and EmployeeID in (select EmployeeID from @hundred)		

--同步主管薪水
update orgin set orgin.mgrSalary=plused.empSalary
from @level plused join @level orgin
on plused.EmployeeID=orgin.ManagerID
where plused.lv=2

	--普通
		--50
update @level set empSalary=
(
case
	when empSalary*0.05<5000 and empSalary*1.05<mgrSalary then empSalary*1.05
	when empSalary*0.05<5000 and empSalary*1.05>mgrSalary then mgrSalary
	when empSalary*0.05>=5000 and empSalary*1.05>mgrSalary and empSalary+5000>mgrSalary then mgrSalary
	when empSalary*0.05>=5000 and empSalary*1.05>mgrSalary and empSalary+5000<mgrSalary then empSalary+5000
	when empSalary*0.05>=5000 and empSalary*1.05<mgrSalary  then empSalary+5000
	 
end
)
where lv=1 and EmployeeID in (select EmployeeID from @fifty)

	--普通人
		--100
update @level set empSalary=
(
case
	when empSalary*0.1<5000 and empSalary*1.1<mgrSalary then empSalary*1.1
	when empSalary*0.1<5000 and empSalary*1.1>mgrSalary then mgrSalary
	when empSalary*0.1>=5000 and empSalary*1.1>mgrSalary and empSalary+5000>mgrSalary then mgrSalary
	when empSalary*0.1>=5000 and empSalary*1.1>mgrSalary and empSalary+5000<mgrSalary then empSalary+5000
	when empSalary*0.1>=5000 and empSalary*1.1<mgrSalary  then empSalary+5000

end
)
where lv=1 and EmployeeID in (select EmployeeID from @hundred)

--final 
update Employees set salary=plused.empSalary
from Employees join @level plused
on Employees.EmployeeID=plused.EmployeeID

--select EmployeeID,empSalary from @level order by lv desc