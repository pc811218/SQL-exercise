;with rn as(
select  USER_ID,[page],[unix_timestamp]
,ROW_NUMBER()OVER(partition by User_id order by [unix_timestamp] desc) rn
from [dbo].[query_one]
)
select l.User_ID,(l.unix_timestamp - sl.unix_timestamp) as delta
from rn l join rn sl on l.user_id = sl.User_id and l.rn = sl.rn-1
where l.rn <=2 and sl.rn <=2  