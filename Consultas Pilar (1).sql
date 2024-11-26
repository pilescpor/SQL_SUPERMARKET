USE supermarket_sales;
SELECT `customer_type`, SUM(quantity) AS quantity_sale
FROM sales
GROUP BY `customer_type`;


SELECT *, MONTH(STR_TO_DATE(Date,'%m/%d/%Y')) AS month, WEEKDAY(STR_TO_DATE(Date,'%m/%d/%Y')) AS weekday
FROM sales
;
-- Cantidad de ventas por mes
SELECT SUM(quantity) AS `cantidad de ventas`, MONTH(STR_TO_DATE(Date,'%m/%d/%Y')) AS month
FROM sales
GROUP BY month
ORDER BY `cantidad de ventas` DESC
;
-- Número de ventas por mes
SELECT COUNT(*) AS `número de ventas`, MONTH(STR_TO_DATE(Date,'%m/%d/%Y')) AS month
FROM sales
GROUP BY month
ORDER BY `número de ventas` DESC
;
-- Ganancias por mes
SELECT SUM(`gross_income`) AS `ganancias por mes`, MONTH(STR_TO_DATE(Date,'%m/%d/%Y')) AS month
FROM sales
GROUP BY month
ORDER BY `ganancias por mes` DESC
;

-- Cantidad de ventas por día
SELECT SUM(quantity) AS `Cantidad de ventas por día`, DAYNAME(STR_TO_DATE(Date,'%m/%d/%Y')) AS weekday
FROM sales
GROUP BY weekday
ORDER BY `Cantidad de ventas por día` DESC
;
-- Número de ventas por día
SELECT COUNT(*) AS `Número de ventas por día`, DAYNAME(STR_TO_DATE(Date,'%m/%d/%Y')) AS weekday
FROM sales
GROUP BY weekday
ORDER BY `Número de ventas por día` DESC
;
-- Ganancias por día
SELECT SUM(`gross_income`) AS `Ganancias por día`, DAYNAME(STR_TO_DATE(Date,'%m/%d/%Y')) AS weekday
FROM sales
GROUP BY weekday
ORDER BY `Ganancias por día` DESC
;
-- Tabla resumen dias de la semana
SELECT SUM(quantity) AS `Cantidad de ventas por día`, COUNT(*) AS `Número de ventas por día`, FORMAT(SUM(`gross_income`), 2) AS `Ganancias por día`,  DAYNAME(STR_TO_DATE(Date,'%m/%d/%Y')) AS weekday
FROM sales
GROUP BY weekday
ORDER BY `Cantidad de ventas por día` DESC
;

-- Tabla resumen por meses
SELECT SUM(quantity) AS `Cantidad de ventas por mes`, COUNT(*) AS `Número de ventas por mes`, FORMAT(SUM(`gross_income`), 2) AS `Ganancias por mes`,  MONTHNAME(STR_TO_DATE(Date,'%m/%d/%Y')) AS month
FROM sales
GROUP BY month
ORDER BY `Cantidad de ventas por mes` DESC
;
-- Tabla resumen franja horaria
SELECT SUM(quantity) AS 'Cantidad de ventas por franja horaria', COUNT(*) AS 'Número de ventas por franja horaria', FORMAT(SUM(`gross_income`), 2) AS 'Ganancias por franja horaria', 
	CASE
		WHEN Time < '06:00' THEN 'NOCHE'
		WHEN Time <'14:00' THEN 'MAÑANA'
		ELSE 'TARDE'
	END AS franja_horaria
FROM sales
GROUP BY franja_horaria;

select `product_line`, gender, COUNT(*) AS Cantidad_de_producto_por_género
from sales
group by Gender, `product_line`
order by `product_line` desc;

select gender, ROUND(avg(`gross_income`), 2) avg_income_per_gender
from sales
group by gender
order by avg_income_per_gender desc;