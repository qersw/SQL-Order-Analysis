select id,user_id,product_name,status,client_id,date
from order_info
where day(date)>15 and status='completed' and (product_name='C++' or product_name='Java' or product_name='Python')
order by id;