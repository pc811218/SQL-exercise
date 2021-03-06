--Use ROW_NUMBER()
;with rn as(
select  USER_ID,[page],[unix_timestamp]
,ROW_NUMBER()OVER(partition by User_id order by [unix_timestamp] desc) rn
from [dbo].[query_one]
)
select l.User_ID,(l.unix_timestamp - sl.unix_timestamp) as delta
from rn l join rn sl on l.user_id = sl.User_id and l.rn = sl.rn-1
where l.rn <=2 and sl.rn <=2  

--Use ROW_NUMBER(), has NULL
;with rn as(
select USER_ID,[page],[unix_timestamp]
,ROW_NUMBER()OVER(partition by User_id order by [unix_timestamp] desc) rn
from [dbo].[query_one]
)
select l.User_ID,(l.unix_timestamp - sl.unix_timestamp) as delta
from rn l LEFT join rn sl on l.user_id = sl.User_id and l.rn = NULLIF(sl.rn-1,0)
where (l.rn <=2 and sl.rn <=2) or NULLIF(sl.rn-1,0) is null 
order by l.user_id


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


--Without ROW_NUMBER() ,has NULL
select a.user_id,a.max_t-MAX(o.unix_timestamp) as delta
from [query_one] o
RIGHT JOIN
(
	select user_id,MAX(unix_timestamp) max_t
	FROM [PTEMP].[dbo].[query_one]
	group by user_id
) a
on o.user_id = a.user_id and o.unix_timestamp <> a.max_t
group by a.user_id,a.max_t
order by a.user_id
