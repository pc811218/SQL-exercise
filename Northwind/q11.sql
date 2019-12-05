--依照年度（OrderDate）列出該年度訂單總數、總訂單金額（UnitPrice * Quantity * (1-Discount)） 、平均每筆訂單金額（金額皆四捨五入至小數點後第二位）並以總金額排序由大到小排序。
select datepart(yyyy, o.OrderDate) as Years,
COUNT(distinct o.OrderID) as Counts,
ROUND(SUM(od.Quantity*od.UnitPrice*(1-od.Discount)),2)as PriceSum,
ROUND(SUM(od.Quantity*od.UnitPrice*(1-od.Discount))/COUNT(distinct o.OrderID),2)as PriceAverage 
from Orders o join OrderDetails od on o.OrderID=od.OrderID 
group by datepart(yyyy, o.OrderDate)
order by PriceSum desc