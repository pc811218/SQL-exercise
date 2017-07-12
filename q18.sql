--列出產品編號、名稱、庫存量UnitsInStock、已訂購量UnitsOnOrder及安全存量ReorderLevel
--並新增一欄位其值為'safe'（庫存量 >= 安全存量）
--或'reordering'（庫存量 < 安全存量 & 已訂購量+庫存量 >= 安全存量）
--或'unsafe'（其他）。

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


--列出狀態
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

