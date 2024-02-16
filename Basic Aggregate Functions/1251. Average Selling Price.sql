# Write your MySQL query statement below

select Prices.product_id, ifnull(round(sum(UnitsSold.units*Prices.price)/sum(UnitsSold.units),2),0) as Average_price

from Prices

left join UnitsSold on Prices.product_id = UnitsSold.product_id and UnitsSold.purchase_date between Prices.start_date and Prices.end_date

group by product_id;
