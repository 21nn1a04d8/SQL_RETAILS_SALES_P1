-- SQL RETAIL SALES ANALYSISN--
CREATE DATABASE sql_project1;
-- create table--
DROP TABLE IF exists Retail_Sales;
CREATE TABLE  Retail_Sales(
    transactions_id	 INT PRIMARY KEY,
    sale_date       DATE,
	sale_time	TIME,
    customer_id	 INT,
    gender     VARCHAR(15),
	age	INT,
    category	VARCHAR(15),
    quantiy	INT,
    price_per_unit	FLOAT,
    cogs	FLOAT,
    total_sale float
    );
SELECT *FROM  salesRetails;
-- Q.1 write a sql query to retrieve all columns for sales made on '2022-11-05
select*from salesRetails
where sale_date ='05-11-2022';
-- Q.2 Write a sql query to retrieve all transaction where the category is 'clothing'and quantity sold is more than 10 in 
-- the month of nov-2022
select * from salesRetails
where category='clothing'
and quantiy>=4
and sale_date between '01-11-2022' and '30-11-2022';
-- Q.3 write a sql query  to calculate the total sales (total_sales) for each category
select category,sum(total_sale) as total_sales,count(*) from salesretails
group by category;
-- Q.4 write a sql query to find the average age of customers who purchased items from the 'beauty' category
select Round(avg(age),2) from salesRetails
where category='Beauty';
-- Q.5 write a sql query to find all transactions where the totel_sale is greater than 1000
select * from salesRetails
where total_sale>1000;
-- Q.6 Write a sql query to find total number of tansactions(transaction_id) made y each gender in each category
select category,gender, count(ï»¿transactions_id) as no_transactions
from salesRetails
group by category,gender;
-- Q.7 write a sql query to calculate the avg sale for each month.find out est selling month in each year
select  EXTRACT(YEAR FROM STR_TO_DATE(sale_date,'%d-%m-%y') )as year,
EXTRACT(MONTH FROM STR_TO_DATE(sale_date,'%d-%m-%y')) as month,
round(avg(total_sale),2) as avg_sale
from  salesRetails
group by year,month
order by avg_sale ;
-- Q.8 Write a sql query to find top 5 customers based on the highest total sales
select customer_id,sum(total_sale) as total_sales
 from  salesRetails
 group by customer_id
 order by total_sales desc
 limit 5;
 -- Q.9 write a sql query to find the number of unique customers who purchased items free each category
 select category,count(distinct(customer_id)) as no_customers
 from salesRetails
 group by category;
 -- Q.10 Write a sql query to create each shift and numer of orders(exampl morning<=12,afternoon between 12 and 17,evening>17
 with hourly_sale
as
 (
 select *,
 case
    when EXTRACT(HOUR FROM SALE_TIME) < 12 THEN 'Morning'
    when EXTRACT(HOUR FROM SALE_TIME) BETWEEN 12 AND 17 THEN 'Afternoon'
    else 'Evening'
    end as Shifts
from salesRetails)
select shifts,count(*)
from hourly_sale
group by shifts;




-- END OF PROJECT--




