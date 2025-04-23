
 #### Weekday Vs Weekend Payments ####
select case when dayofweek(str_to_date(o.order_purchase_timestamp, '%Y-%m-%D'))
in (1,7) then "Weekend" else "Weekday" end as Daytype ,
count(distinct o.order_id) as TotalOrders,
round(sum(p.payment_value)) as TotalPayments
from  orders o
join order_payments p on o.order_id=p.order_id
 group by Daytype;
 
 #####Number of Orders with review score 5 and payment type as credit card.###

 select count(distinct p.order_id ) as NumberofOrders
 from order_payments p 
 join order_reviews r on p.order_id=r.order_id
 where r.review_score= '5'
 and p.payment_type='credit_card';
 
 #####Average number of days taken for order_delivered_customer_date for pet_shop######
 
 select  round(avg(o.Deliverydays)) as AverageDays from orders o 
 join order_items i on o.order_id=i.order_id
 join productsdata p on i.product_id=p.product_id
 where p.product_category_name='pet_shop';
 
 ########Average price and payment values from customers of sao paulo city###############
 
 select round(avg(i.price)) as Average_price,
round(avg(p.payment_value)) as Average_payment
from 
customers_dataset c   
join orders o on c.customer_id=o.customer_id
join order_items i on o.order_id=i.order_id
join order_payments p on i.order_id=p.order_id
where
c.customer_city ='sao paulo';
 
 ##########Relationship between shipping days Vs review scores.#####
 
 select round(avg(o.Deliverydays)) as Average_shippingdays,
 r.review_score from orders o join order_reviews r
 on o.order_id=r.order_id
 group by r.review_score order by r.review_score;

                
 