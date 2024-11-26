use supermarket_sales;

select b.gender, b.product_line, count(*) as compras_por_producto_y_genero 
from product_line a
left outer join sales b using (id_product)
left outer join gender c using (id_gender)
group by b.gender, b.product_line;

select b.city, b.product_line, count(*) as compras_por_producto_y_ciudad
from product_line a
join sales b using (id_product)
join city c on id_city = branch
group by b.city, b.product_line;

select b.gender, b.product_line, round(avg(gross_income), 2) as beneficio_por_producto_y_genero 
from product_line a
left outer join sales b using (id_product)
left outer join gender c using (id_gender)
group by b.gender, b.product_line;

select b.city, b.product_line, round(avg(gross_income), 2) as beneficio_por_ciudad_y_producto
from product_line a
join sales b using (id_product)
join city c on id_city = branch
group by b.city, b.product_line
order by product_line;