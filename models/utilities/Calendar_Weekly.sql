With calendarWeekly  as (

Select distinct 
c.year
, c.yearweek 
, c.weekOfYear
, c.MONTHOFYEAR
, c.FIRSTOFWEEK 
, c.LASTOFWEEK 
from CALENDAR  c

)

Select * from calendarWeekly