select user_id,min(date) as first_buy_date,cnt
from (select user_id,date,
      count(*)over(partition by user_id) as cnt
      from order_info
      where day(date)>15 and status='completed' and (product_name='C++' or product_name='Java' or product_name='Python')) A
where cnt>=2
group by user_id
order by user_id;