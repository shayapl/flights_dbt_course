


select *
,airport_name  ->'en' as english_airport_name
,airport_name  ->'ru' as russian_airport_name
,city  ->'en' as english_city_name
,city  ->'ru' as russian_city_name
,'23-08-16 16:08:05' as run_time
from stg.airports_data