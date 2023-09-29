
  create view "flights_dbt_course"."flights_wh"."dim__dbt_tmp"
    
    
  as (
    

select *
from stg.airports_data
  );