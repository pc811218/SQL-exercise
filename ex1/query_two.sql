select 
ROUND(SUM(CASE when m.user_id is null then 1 else 0 END) / CAST(COUNT(*)as float),2)*100 as web_only
,ROUND(SUM(CASE when w.user_id is null then 1 else 0 END) / CAST(COUNT(*)as float),2)*100 as mobile_only
,ROUND(SUM(CASE when w.user_id is not null and m.user_id is not null then 1 else 0 END) / CAST(COUNT(*)as float),2)*100 as both
from 
(select distinct [user_id]  from [dbo].[query_two_web]) w
FULL JOIN
(select distinct [user_id]  from [dbo].[query_two_mobile] ) m
on w.user_id = m.user_id