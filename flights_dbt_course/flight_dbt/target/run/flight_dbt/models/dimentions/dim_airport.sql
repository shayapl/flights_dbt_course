
      
        
            delete from "flights_dbt_course"."flights_wh"."dim_airport"
            where (
                airport_code) in (
                select (airport_code)
                from "dim_airport__dbt_tmp190806998759"
            );

        
    

    insert into "flights_dbt_course"."flights_wh"."dim_airport" ("airport_code", "airport_name", "city", "coordinates", "timezone", "last_update", "english_airport_name", "russian_airport_name", "english_city_name", "russian_city_name", "run_time")
    (
        select "airport_code", "airport_name", "city", "coordinates", "timezone", "last_update", "english_airport_name", "russian_airport_name", "english_city_name", "russian_city_name", "run_time"
        from "dim_airport__dbt_tmp190806998759"
    )
  