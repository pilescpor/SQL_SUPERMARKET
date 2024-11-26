use supermarket_sales;

select *
from sales;

select payment, sum(total) as total
from sales
group by payment
order by total desc;

select `city`, count(*) as `num_city`
from sales
group by `city`;


select city, round(avg(gross_income), 2) as avg_gross_income
from sales
group by city
order by avg_gross_income desc;


select customer_type, round(avg(gross_income), 2) as avg_gross_income
from sales
group by customer_type
order by avg_gross_income desc;

select customer_type, product_line, round(avg(gross_income), 2) as avg_gross_income
from sales
group by customer_type, product_line
order by avg_gross_income desc;

select gender, round(avg(gross_income), 2) avg_income_per_gender
from sales
group by gender
order by avg_income_per_gender desc;

select gender, round(avg(total), 2) avg_total_per_gender
from sales
group by gender
order by avg_total_per_gender desc;


select product_line, round(sum(total), 2) as revenues_per_product_line
from sales
group by product_line
order by revenues_per_product_line desc;

select customer_type, round(avg(rating), 2) avg_rating
from sales
group by customer_type
order by avg_rating;

select product_line, round(sum(total), 2) as revenues_per_product
from sales
group by product_line
order by revenues_per_product desc;

-- Total Sales by Branch
SELECT branch, ROUND(SUM(total),2) AS total_sales
FROM sales
GROUP BY branch
ORDER BY total_sales DESC;

-- Average Rating by Product Line
SELECT product_line, ROUND(AVG(Rating),2) AS average_rating
FROM sales
GROUP BY product_line
ORDER BY average_rating DESC;

-- Sales by Payment Method 
SELECT payment, ROUND(SUM(total),2) AS total_sales
FROM sales
GROUP BY payment
ORDER BY total_sales DESC;

-- Money spent by Customer Type
SELECT customer_type, ROUND(SUM(total),2) AS total_spent
FROM sales
GROUP BY customer_type;

select *
from sales;


-- Tabla resumen franja horaria
SELECT SUM(quantity) AS 'Cantidad de ventas por franja horaria', COUNT(*) AS 'Número de ventas por franja horaria', FORMAT(SUM(`gross_income`), 2) AS 'Ganancias por franja horaria', 
	CASE
		WHEN Time < '06:00' THEN 'NOCHE'
		WHEN Time <'14:00' THEN 'MAÑANA'
		ELSE 'TARDE'
	END AS franja_horaria
FROM sales
GROUP BY franja_horaria;
-- Tabla resumen dias de la semana
SELECT SUM(quantity) AS `Cantidad de ventas por día`, COUNT(*) AS `Número de ventas por día`, SUM(`gross_income`) AS `Ganancias por día`,  DAYNAME(STR_TO_DATE(Date,'%m/%d/%Y')) AS weekday
FROM sales
GROUP BY weekday
ORDER BY `Cantidad de ventas por día` DESC
;
-- Tabla resumen por meses
SELECT SUM(quantity) AS `Cantidad de ventas por mes`, COUNT(*) AS `Número de ventas por mes`, FORMAT(SUM(`gross_income`), 2) AS `Ganancias por mes`,  MONTHNAME(STR_TO_DATE(Date,'%m/%d/%Y')) AS month
FROM sales
GROUP BY month
ORDER BY `Cantidad de ventas por mes` DESC





