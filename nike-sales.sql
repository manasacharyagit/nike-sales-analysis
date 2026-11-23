-- 1. Total revenue, total profit, and profit margin %

select sum(revenue) as "Total revenue", 
round(sum(profit),2) as "Total profit",
concat(round(sum(Profit) * 100.0 / sum(Revenue), 2),'%') as "Profit Margin %"
from nike_sales

-- 2. Revenue and profit by Product_Line
select 
Product_Line,
round(sum(revenue),2) as "Total revenue", 
round(sum(profit),2) as "Total profit",
concat(round(sum(Profit) * 100.0 / sum(Revenue), 2),'%') as "Profit Margin %"
from nike_sales

group by Product_Line
order by round(sum(revenue),2)

-- 3. Top 10 products by revenue

select Product_name, 
round(sum(revenue),2) as "Total revenue"
from nike_sales
group by Product_name
order by round(sum(revenue),2) desc limit 10 

-- 4. Revenue, Profit by Region and Sales_Channel

select Region, Sales_Channel,
sum(revenue) as "Total revenue", 
round(sum(profit),2) as "Total profit"
from nike_sales

group by Region, Sales_Channel
order by sum(revenue) desc

-- 5. Monthly revenue trend
select
  strftime(try_strptime(order_date, '%m/%d/%Y'), '%Y-%m') as "month",
  round(sum(revenue), 2) as "total revenue",
  round(sum(profit), 2) as "total profit"
from nike_sales
where order_date is not null
group by 1
order by 1;

-- 6. Average profit per dscount band

select
case
when Discount_Applied >0 and Discount_Applied <=0.25 then '0-25'
when Discount_Applied >0.25 and Discount_Applied <=0.50 then '26-50'
when Discount_Applied >0.50 and Discount_Applied <=0.75 then '51-75'
when Discount_Applied >0.75 and Discount_Applied <= 1 then '76-100'
end as "Discount band",
round(avg(profit),2) as "Average profit"
from nike_sales
where "Discount band" is not null
group by "Discount band"
order by "Discount band"

-- 7. Gender_Category share of revenue
with helper as (
select Gender_Category,
round(sum(revenue),2) as Revenue
from nike_sales
group by Gender_Category
)

select Gender_Category, Revenue,
round(sum(Revenue) over (),2) as Total_Revenue,
concat(round(Revenue/Total_Revenue * 100, 2), '%') as "% share in revenue"
from helper


-- 8. Best-selling size per product line
with helper as (
select product_line, size, sum(revenue) as total_revenue
from nike_sales
group by product_line, size
),
ranked as (
select product_line, size, total_revenue,
rank() over (partition by product_line order by total_revenue desc) as rnk
from helper
)
select product_line, size, total_revenue
from ranked
where rnk = 1 and total_revenue != 0 and size is not null


-- 9. Month-over-month revenue growth

with monthly as (
select strftime(try_strptime(order_date, '%m/%d/%Y'), '%Y-%m') as month,
sum(revenue) as revenue
from nike_sales
where order_date is not null
group by 1
)
select month, revenue,
lag(revenue, 1) over (order by month) as prev_revenue,
round((revenue - lag(revenue, 1) over (order by month)) * 100.0 / lag(revenue, 1) over (order by month), 2) as growth_pct
from monthly
order by month













