{{config(materialized='table',unique_key='flight_id')}}

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
'{{run_started_at.strftime("%y-%m-%d %H:%M:%S")}}' as run_time
from cte2