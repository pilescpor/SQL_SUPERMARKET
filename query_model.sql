use supermarket_sales;


/*
ALTER TABLE city DROP INDEX unique_id_city;
ALTER TABLE customer DROP INDEX unique_id_customer;
ALTER TABLE gender DROP INDEX unique_id_gender;
ALTER TABLE payment_method DROP INDEX unique_id_payment;
ALTER TABLE product_line DROP INDEX unique_id_product;
*/

/*
ALTER TABLE city MODIFY id_city INT;
ALTER TABLE customer MODIFY id_customer INT;
ALTER TABLE gender MODIFY id_gender INT;
ALTER TABLE payment_method MODIFY id_payment INT;
ALTER TABLE product_type MODIFY id_product_type INT;*/

ALTER TABLE city 
ADD CONSTRAINT unique_id_city 
UNIQUE (id_city);

ALTER TABLE customer 
ADD CONSTRAINT unique_id_customer 
UNIQUE (id_customer);

ALTER TABLE gender 
ADD CONSTRAINT unique_id_gender 
UNIQUE (id_gender);

ALTER TABLE payment_method 
ADD CONSTRAINT unique_id_paymeny 
UNIQUE (id_payment);

ALTER TABLE product_line 
ADD CONSTRAINT unique_id_product 
UNIQUE (id_product);


alter table sales
add constraint fk_city
foreign key (branch) references city(id_city);

alter table sales
add constraint fk_customer
foreign key (id_customer_type) references customer(id_customer);

alter table sales
add constraint fk_gender
foreign key (id_gender) references gender(id_gender);

alter table sales
add constraint fk_product
foreign key (id_product) references product_line(id_product);

alter table sales
add constraint fk_payment
foreign key (id_payment) references payment_method(id_payment);