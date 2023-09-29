
  create view "flights_dbt_course"."flights_wh"."dim_airport__dbt_tmp"
    
    
  as (
    

select *
from stg.airports_data
  );