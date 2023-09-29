

select ad.aircraft_code,ad.model,ad."range",ad.last_update as a_data_last_update,s.seat_no,s.fare_conditions 
,s.last_update as seats_last_update
,case 
	when ad."range" >5600 then 'high'
	when ad."range" <5600 then 'low'
	when ad."range" = 5600 then 'exactly_5600'
	else 'null'
end as range_desc
,ad.model -> 'en' as model_english
,ad.model -> 'ru' as model_russian
,'23-08-16 16:08:05' as run_time
from stg.aircrafts_data ad 
join stg.seats s on ad.aircraft_code = s.aircraft_code