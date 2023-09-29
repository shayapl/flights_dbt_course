
      
        
            delete from "flights_dbt_course"."flights_wh"."dim_aircraft"
            where (
                aircraft_code) in (
                select (aircraft_code)
                from "dim_aircraft__dbt_tmp190806497493"
            );

        
    

    insert into "flights_dbt_course"."flights_wh"."dim_aircraft" ("aircraft_code", "model", "range", "a_data_last_update", "seat_no", "fare_conditions", "seats_last_update", "range_desc", "model_english", "model_russian", "run_time")
    (
        select "aircraft_code", "model", "range", "a_data_last_update", "seat_no", "fare_conditions", "seats_last_update", "range_desc", "model_english", "model_russian", "run_time"
        from "dim_aircraft__dbt_tmp190806497493"
    )
  