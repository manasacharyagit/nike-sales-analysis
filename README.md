# Nike Sales Analysis

An analysis of Nike sales data using SQL (MotherDuck) to find business problems and suggest solutions.

## Tools Used
- MotherDuck (SQL)
- Power BI / Tableau (dashboard)

## Dataset
Nike sales data with these columns: Order_ID, Gender_Category, Product_Line, Product_Name, Size, Units_Sold, MRP, Discount_Applied, Revenue, Order_Date, Sales_Channel, Region, Profit.

## SQL Queries
[View all SQL queries](nike-sales.sql)

## Questions Answered
1. Total revenue, total profit and profit margin %
2. Revenue and profit by product line
3. Top 10 products by revenue
4. Revenue and profit by region and sales channel
5. Monthly revenue and profit trend
6. Average profit by discount band
7. Gender category share of revenue
8. Best-selling size in each product line
9. Month-over-month revenue growth

## Dashboard
Add your dashboard link or screenshot here.

## Business Problems and Solutions

**Problem** - We see profit falling after the discount band of 0-25
**Solution** - Cap discounts at 25% and use bigger discounts only to clear slow stock.

**Problem** - Pune and Bangalore Online is doing good business
**Solution** - Putting more stock and marketing in these cities to increase the profit

**Problem** - Women make up 61.19% of revenue and Kids 35.17%, while Men make up only 3.64%
**Solution** - Grow men's line by more variety of products and good marketing

**Problem** - Size M tops Basketball and Lifestyle, and L tops Training

![Dashboard](dashboard.png)
**Solution** - Stock more of those sizes in each line to avoid stock-outs on best sellers

## Files in this Repo
- `nike-sales.sql`: all SQL queries
- `README.md`: project summary
