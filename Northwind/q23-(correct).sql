--�վ��~��A���~�B�z50���H�W�q�檺���u�~��[5%�A�B�z100���H�W�q��h�[10%�A
--�̦h�[5000���A�B���o�����D�ޡC

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

--�]�w�j�D�� lv3
update @level set lv =3
where ManagerID is null 


--�]�w�G�D�� lv2
update @level set lv =2
where ManagerID in (select EmployeeID from @level where lv=3)


--��ܱƧ�BY lv
--select * from @level order by lv desc

--�ݭ��ǤH�n��

--50�H�W�Ȧs��
declare @fifty table(
	EmployeeID int
)
insert into @fifty
--���~�����u�q��ƶq>50 <100
select EmployeeID 
from Orders 
group by EmployeeID
having COUNT(*)>50 and COUNT(*)<100

--100�H�W�Ȧs��
declare @hundred table(
	EmployeeID int
)
insert into @hundred 
--���~�����u�q��ƶq>100
select EmployeeID 
from Orders 
group by EmployeeID
having COUNT(*)>100

--���
--select *from @fifty
--select *from @hundred
--select * from @level order by lv desc
--�}�l���~
	--�j�D�� 
		--50
update @level set empSalary=
(
case
	when empSalary*0.05<5000 then empSalary*1.05
	else empSalary+5000 
end
)
where lv=3 and EmployeeID in (select EmployeeID from @fifty)

	--�j�D�� 
		--100
update @level set empSalary=
(
case
	when empSalary*0.1<5000 then empSalary*1.1
	else empSalary+5000 
end
)
where lv=3 and EmployeeID in (select EmployeeID from @hundred)		

--�P�B�D���~��
update orgin set orgin.mgrSalary=plused.empSalary
from @level plused join @level orgin
on plused.EmployeeID=orgin.ManagerID
where plused.lv=3



	--���D��
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

	--���D��
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

--�P�B�D���~��
update orgin set orgin.mgrSalary=plused.empSalary
from @level plused join @level orgin
on plused.EmployeeID=orgin.ManagerID
where plused.lv=2

	--���q
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

	--���q�H
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