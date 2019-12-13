--Use ROW_NUMBER()
;with rn as(
select  USER_ID,[page],[unix_timestamp]
,ROW_NUMBER()OVER(partition by User_id order by [unix_timestamp] desc) rn
from [dbo].[query_one]
)
select l.User_ID,(l.unix_timestamp - sl.unix_timestamp) as delta
from rn l join rn sl on l.user_id = sl.User_id and l.rn = sl.rn-1
where l.rn <=2 and sl.rn <=2  


--Without ROW_NUMBER()
select o.user_id,a.max_t-MAX(o.unix_timestamp) as delta
from [query_one] o
JOIN
(
	select user_id,MAX(unix_timestamp) max_t
	FROM [PTEMP].[dbo].[query_one]
	group by user_id
) a
on o.user_id = a.user_id and o.unix_timestamp <> a.max_t
group by o.user_id,a.max_t