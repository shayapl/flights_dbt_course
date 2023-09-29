{{config(materialized='table',unique_key='ticket_no,flight_id')}}

select bp.ticket_no,bp.flight_id,bp.boarding_no,bp.seat_no,
tf.fare_conditions,tf.amount,bp.last_update as bp_last_update,tf.last_update as tf_last_update
,'{{run_started_at.strftime("%y-%m-%d %H:%M:%S")}}' as run_time
from stg.boarding_passes bp
join stg.ticket_flights tf on bp.ticket_no=tf.ticket_no and bp.flight_id =tf.flight_id  
