
  
    

  create  table "flights_dbt_course"."flights_wh"."fact_flights__dbt_tmp"
  
  
    as
  
  (
    

with cte1 as 
(
select *,
ROUND((EXTRACT(EPOCH FROM (scheduled_arrival-scheduled_departure)) / 3600)::numeric, 2) AS flight_duration_expected
,ROUND((EXTRACT(EPOCH FROM (actual_arrival-actual_departure)) / 3600)::numeric, 2) AS flight_duration
from stg.flights 
)
, cte2 as 
(
select *,
case 
	when 	flight_duration_expected > flight_duration then 'shorter'
	when    flight_duration_expected < flight_duration then 'longer'
	when    flight_duration_expected = flight_duration then 'as_expected'
	else 'null'
end as actual_flight_duration
from cte1
)
select *,
'23-08-16 16:08:05' as run_time
from cte2
  );
  