--�C�X�b2002�~�t�d20���H�W�q�檺���uID�åH���uID�ƧǡC
select EmployeeID 
from Orders 
where OrderDate between '2002' and '2003' 
group by EmployeeID 
having COUNT(*)>=20
