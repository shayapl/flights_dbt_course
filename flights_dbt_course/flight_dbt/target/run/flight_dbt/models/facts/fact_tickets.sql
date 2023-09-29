
  
    

  create  table "flights_dbt_course"."flights_wh"."fact_tickets__dbt_tmp"
  
  
    as
  
  (
    

select t.*,b.book_date,b.total_amount 
,t.contact_data  -> 'phone' as phone_num
,t.contact_data  -> 'email' as email
,'23-08-16 16:08:05' as run_time
from stg.bookings b
join stg.tickets t on b.book_ref =t.book_ref
  );
  