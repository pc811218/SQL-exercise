--列出送貨日期延誤的訂單編號（ShippedDate晚於RequiredDate）及延誤天數並以訂單編號排序。

select OrderID,DATEDIFF(d ,RequiredDate,ShippedDate)as DelayDays from orders
where ShippedDate>RequiredDate
order by OrderID