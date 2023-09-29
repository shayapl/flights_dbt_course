{{config(materialized='incremental',unique_key='airport_code',post_hook="insert into {{this}}(airport_code) VALUES (-1)")}}


select *
,airport_name  ->'en' as english_airport_name
,airport_name  ->'ru' as russian_airport_name
,city  ->'en' as english_city_name
,city  ->'ru' as russian_city_name
,'{{run_started_at.strftime("%y-%m-%d %H:%M:%S")}}' as run_time
from stg.airports_data 