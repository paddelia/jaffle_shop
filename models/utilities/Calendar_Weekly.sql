With calendarWeekly  as (

Select distinct 
c.year
, c.weekOfYear
, c.FIRSTOFWEEK 
, c.LASTOFWEEK 
from CALENDAR  c

)

Select * from calendarWeekly