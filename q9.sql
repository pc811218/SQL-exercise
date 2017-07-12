--列出每項產品類別共有多少產品（欄位：類別名稱、數量）並以CategoryID排序。
select c.CategoryName,COUNT(*) as Num 
from Categories c 
join Products p on c.CategoryID=p.CategoryID 
group by c.CategoryName,c.CategoryID 
order by c.CategoryID
