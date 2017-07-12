--�C�X���~�s���B�W�١B�w�s�qUnitsInStock�B�w�q�ʶqUnitsOnOrder�Φw���s�qReorderLevel
--�÷s�W�@����Ȭ�'safe'�]�w�s�q >= �w���s�q�^
--��'reordering'�]�w�s�q < �w���s�q & �w�q�ʶq+�w�s�q >= �w���s�q�^
--��'unsafe'�]��L�^�C

--ANS
select ProductID,ProductName,UnitsInStock,UnitsOnOrder,ReorderLevel,CAST(
	case
		when UnitsInStock>ReorderLevel or ReorderLevel=0
			then 'safe'
		when UnitsInStock<ReorderLevel and UnitsInStock+UnitsOnOrder>=ReorderLevel
			then 'reordering'
		else	
			'unsafe'
	end as varchar(10)
) as status
from Products


--�C�X���A
select CAST(
	case
		when UnitsInStock>ReorderLevel
			then 'safe'
			
		when UnitsInStock<ReorderLevel and UnitsInStock+UnitsOnOrder>=ReorderLevel
			then 'reordering'
		else	
			'unsafe'
	end as varchar(10)
) as status
from Products

