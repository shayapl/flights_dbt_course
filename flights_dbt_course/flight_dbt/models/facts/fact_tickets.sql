{{config(materialized='table',unique_key='book_ref')}}

select t.*,b.book_date,b.total_amount 
,t.contact_data  -> 'phone' as phone_num
,t.contact_data  -> 'email' as email
,'{{run_started_at.strftime("%y-%m-%d %H:%M:%S")}}' as run_time
from stg.bookings b
join stg.tickets t on b.book_ref =t.book_ref 