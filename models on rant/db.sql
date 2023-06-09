create database model_rants;

use model_rants;

create table users
(
   user_id int primary key auto_increment not null,
   name varchar(45) not null, 
   email  varchar(255) not null,
   password varchar(20) not null,
   status int , 
   constraint fk_users_status foreign key(status) references status (status_id)
);

create table categories 
(
  category_id int primary key auto_increment  not null,
  category_name varchar (255) not null
);

select * from users;


create table products
(
  product_id int primary key auto_increment not null,
  prod_quantity int default(0) not null,
  prod_name varchar(255) not null,
  prod_price int not null,
  category_id int,
  constraint fk_categories_products foreign key(category_id) references categories(category_id)
  
);

create table review 
(

review_id int primary key auto_increment not null,
feedback  varchar(255) ,
product_id int,
user_id int,
constraint fk_review_products foreign key(product_id) references products(product_id),
constraint fk_review_users foreign key(user_id) references users(user_id) 
);



create table status 
(
   status_id int primary key ,
   status varchar(20) 

);


create table images
(
    image_id int primary key auto_increment,
    image_name varchar(255)
);


create table Orders
(
  Order_id int primary key auto_increment not null,
  name varchar(50) not null,
  address varchar(255) not null,
  email varchar(255) not null,
  phone_no varchar(12) not null,
  city varchar(50) not null,
  state varchar(100) not null,
  user_id int , 
  constraint fk_orders_users foreign key (user_id) references users(user_id)

);

alter table Orders 
drop foreign key fk_orders_users;


alter table products 
drop foreign key fk_categories_products;

create table Admins
(
   admin_id int primary key auto_increment not null,
   name varchar(45) not null, 
   email  varchar(255) not null,
   password varchar(20) not null

);

insert into products (prod_quantity , prod_name, prod_price) values (1, 'watch', 25);