create database project_db;

create table store(
    ID varchar(3) not null unique primary key,
    city text not null,
    street text not null,
    building_number text not null,
    opening_time time not null,
    closing_time time not null
);

create table customer(
    ID varchar(5) not null unique primary key,
    first_name text not null,
    last_name text not null,
    email text not null,
    phone_number varchar(12) not null,
    store_ID varchar(3) not null references store(ID)
);

create table product(
    ID varchar(7) not null unique primary key,
    product_full_name text not null,
    brand_ID varchar(5) not null references product_brand(ID),
    size text not null,
    price integer not null,
    hierarchy_ID varchar(5) not null references product_hierarchy(ID)
);

create table product_brand(
    ID varchar(5) not null unique primary key,
    brand_name text not null,
    vendor_ID varchar(5) not null references vendor(ID)
);

create table product_available(
    product_ID varchar(7) unique not null references product(ID),
    store_ID varchar(3) unique not null  references store(ID),
    amount integer not null check( amount > 0 ),
    primary key (product_ID, store_ID)
);


create table product_hierarchy(
    ID varchar(5) not null unique primary key,
    narrow_subcategory text not null,
    subcategory text not null,
    category text not null
);


create table vendor(
    ID varchar(5) not null unique primary key,
    company_name text not null,
    store_ID varchar(3) not null references store(ID)
);

create table orders(
    ID varchar(10) not null unique primary key,
    customer_ID varchar(5) not null references customer(ID),
    store_ID varchar(3) not null references product_available(store_ID),
    product_ID varchar(7) not null references product_available(product_ID),
    amount integer not null check(amount > 0)
);