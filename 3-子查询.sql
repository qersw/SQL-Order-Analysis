select id,user_id,product_name,status,client_id,date
from (select id,user_id,product_name,status,client_id,date,count(user_id) over(partition by user_id)as C
      from order_info
      where day(date)>15 and status='completed' and (product_name='C++' or product_name='Java' or product_name='Python')
      ) A
where C>=2
order by id;