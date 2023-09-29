

select bp.ticket_no,bp.flight_id,bp.boarding_no,bp.seat_no,
tf.fare_conditions,tf.amount,bp.last_update as bp_last_update,tf.last_update as tf_last_update
,'23-08-16 16:08:05' as run_time
from stg.boarding_passes bp
join stg.ticket_flights tf on bp.ticket_no=tf.ticket_no and bp.flight_id =tf.flight_id