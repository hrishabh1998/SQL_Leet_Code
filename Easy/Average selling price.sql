with calculate_table as (select t1.product_id,t1.price,t2.units from prices t1 join unitssold t2 on t1.product_id=t2.product_id where t2.purchase_date between t1.start_date and t1.end_date)

select calculate_table.product_id,round((sum(calculate_table.units*calculate_table.price)+0.00)/(sum(calculate_table.units)+0.00),2) as average_price 
from calculate_table group by product_id