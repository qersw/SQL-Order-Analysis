select distinct user_id
from (select user_id,count(user_id) as C
      from order_info
      where day(date)>15 and status='completed' and (product_name='C++' or product_name='Java' or product_name='Python')
      group by user_id) A
where C>1
order by user_id;