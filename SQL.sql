create database pizza1;
use pizza1;

CREATE TABLE customer(
cust_id smallint unsigned not null,
cust_name varchar(45) not null,
phone_no varchar(15) not null,
cust_email varchar(45) not null,
cust_age integer not null,
cust_gender varchar(45) not null,
cust_city varchar(45) not null,
PRIMARY KEY (cust_id));

create table employee(
emp_id smallint unsigned not null,
emp_name varchar(45) not null,
emp_phone varchar(15) not null,
emp_rating smallint unsigned not null,
job_title varchar(45) not null,
emp_type varchar(45) not null,
salary double not null,
emp_age integer not null,
emp_gender varchar(45) not null,
primary key(emp_id));

create table orders(
order_id smallint unsigned not null,
order_type varchar(45) not null,  -- online or offline
pizza_name varchar(45) not null,
pizza_size varchar(45) not null,
beverages varchar(45) not null,
order_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
amount double not null,
cust_id smallint unsigned not null,
emp_id smallint unsigned not null,
primary key(order_id),
foreign key (emp_id) REFERENCES employee(emp_id) 
on delete restrict on update cascade,
constraint `fk_customer_order` foreign key (cust_id) references
customer (cust_id) on delete restrict on update cascade);

create table payment(
payment_id smallint unsigned not null,
payment_type varchar(45) not null,
amount double not null,
payment_date DATETIME NOT NULL,
cust_id smallint unsigned not null,
order_id smallint unsigned not null,
foreign key (cust_id) REFERENCES customer(cust_id) 
on delete restrict on update cascade,
foreign key (order_id) REFERENCES orders(order_id) 
on delete restrict on update cascade,
primary key(payment_id));

create table shop(
shop_id smallint unsigned not null,
shop_name varchar(45) not null,
shop_latitude double not null, 
shop_longitude double not null,
daily_sales double not null, 
orders_per_day integer not null,
cust_id smallint unsigned not null,
order_id smallint unsigned not null,
emp_id smallint unsigned not null,
primary key(shop_id),
foreign key (order_id) REFERENCES orders(order_id) 
on delete restrict on update cascade,
foreign key (cust_id) REFERENCES customer(cust_id) 
on delete restrict on update cascade,
foreign key (emp_id) REFERENCES employee(emp_id) 
on delete restrict on update cascade);

create table delivery(
delivery_id smallint unsigned not null,
delivery_date DATETIME NOT NULL,
address varchar(100) not null,
delivery_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
order_id smallint unsigned not null,
payment_id smallint unsigned not null,
cust_id smallint unsigned not null,
primary key(delivery_id),
foreign key (order_id) REFERENCES orders(order_id) 
on delete restrict on update cascade,
foreign key (payment_id) REFERENCES payment(payment_id) 
on delete restrict on update cascade,
foreign key (cust_id) REFERENCES customer(cust_id) 
on delete restrict on update cascade);


select * from delivery;
select * from customer;
select * from orders;
select * from employee;
select * from payment;
select * from shop;



