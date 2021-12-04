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

insert into store values ('001', 'LA', 'Roosevelt', '5', '8:00:00', '23:00:00');
insert into store values ('002', 'San Diego', 'Vespucci', '17', '8:00:00', '23:00:00');
insert into store values ('003', 'San Francisco', 'Crimson', '13', '8:00:00', '23:00:00');
insert into store values ('004', 'San Francisco', 'JFK', '77', '8:00:00', '23:00:00');
insert into store values ('005', 'LA', 'Johnson', '107', '8:00:00', '23:00:00');

insert into customer values('10001', 'Howard', 'Johnson', 'h.johnson@gmail.com', '88005553535', '001');
insert into customer values('20002', 'Nat', 'King', 'n.king@gmail.com', '88843695834', '001');
insert into customer values('30003', 'Fred', 'Ellison', 'f.ellsion@gmail.com', '88013456798', '001');
insert into customer values('40004', 'Larry', 'Garfield', 'l.garfield@gmail.com', '88888888888', '001');
insert into customer values('50005', 'Henry', 'Larryson', 'h.larryson@gmail.com', '12345678901', '002');
insert into customer values('60006', 'Clay', 'Robinson', 'c.robinson@gmail.com', '88004443434', '002');
insert into customer values('70007', 'Richard', 'Cooper', 'r.coooper@gmail.com', '87015343434', '002');
insert into customer values('80008', 'Phillip', 'Morris', 'p.morris@gmail.com', '87075073543', '002');
insert into customer values('90009', 'Christopher', 'Nolan', 'c.nolan@gmail.com', '09876543212', '003');
insert into customer values('10010', 'Dmitriy', 'Smirnoff', 'd.smirnof@gmail.com', '84953952030', '003');
insert into customer values('11011', 'Hailey', 'Williams', 'h.williams@gmail.com', '78980506432', '003');
insert into customer values('12012', 'Carly', 'Roberts', 'c.roberts@gmail.com', '87023344777', '003');
insert into customer values('13013', 'Andrew', 'Kurtzweil', 'a.kurtzweil@gmail.com', '01928374650', '004');
insert into customer values('14014', 'Jimmy', 'Kimmel', 'j.kimmel@gmail.com', '85078023682', '004');
insert into customer values('15015', 'Miron', 'Fyodorov', 'm.fyodorov@gmail.com', '87777777777', '004');
insert into customer values('16016', 'Lionel', 'Messi', 'l.messi@gmail.com', '88888888888', '004');
insert into customer values('17017', 'Johnny', 'Depp', 'j.depp@gmail.com', '12345098760', '005');
insert into customer values('18010', 'Katy', 'Cool', 'k.cool@gmail.com', '87070707070', '005');
insert into customer values('19019', 'Alex', 'Turner', 'a.turner@gmail.com', '80088008080', '005');
insert into customer values('20020', 'Boris', 'Johnson', 'b.johnson@gmail.com', '53535550088', '005');

alter table product alter column price type float;

alter table vendor add primary key (ID, store_ID);

insert into product_hierarchy values ('00001', 'carbonated beverages', 'non-alcoholic beverages', 'beverages');
insert into product_hierarchy values ('00002', 'beer', 'alcoholic beverages', 'beverages');
insert into product_hierarchy values ('00003', 'juices', 'non-alcoholic beverages', 'beverages');
insert into product_hierarchy values ('00004', 'milk', 'non-sour dairy', 'dairy');
insert into product_hierarchy values ('00005', 'sour cream', 'sour dairy', 'dairy');
insert into product_hierarchy values ('00006', 'cheese', 'sour dairy', 'dairy');
insert into product_hierarchy values ('00007', 'cigarettes with filter', 'cigarettes', 'tobacco');
insert into product_hierarchy values ('00008', 'cigarettes without filter', 'cigarettes', 'tobacco');
insert into product_hierarchy values ('00009', 'rye bread', 'bread', 'bakery');
insert into product_hierarchy values ('00010', 'wheat bread', 'bread', 'bakery');
insert into product_hierarchy values ('00011', 'bratwurst', 'bratwursts and sausages', 'meat product');
insert into product_hierarchy values ('00012', 'chocolate bar', 'chocolate', 'sweets');
insert into product_hierarchy values ('00013', 'spaghetti', 'macaroni', 'grocery');
insert into product_hierarchy values ('00014', 'bubblegum', 'candies and gums', 'sweets');



insert into vendor values('00001', 'The Coca Cola Company', '001');
insert into vendor values('00001', 'The Coca Cola Company', '002');
insert into vendor values('00001', 'The Coca Cola Company', '003');
insert into vendor values('00001', 'The Coca Cola Company', '004');
insert into vendor values('00001', 'The Coca Cola Company', '005');
insert into vendor values('00002', 'Pepsico', '001');
insert into vendor values('00002', 'Pepsico', '002');
insert into vendor values('00002', 'Pepsico', '003');
insert into vendor values('00002', 'Pepsico', '004');
insert into vendor values('00002', 'Pepsico', '005');
insert into vendor values('00003', 'Mars', '001');
insert into vendor values('00003', 'Mars', '002');
insert into vendor values('00003', 'Mars', '003');
insert into vendor values('00003', 'Mars', '004');
insert into vendor values('00003', 'Mars', '005');
insert into vendor values('00004', 'Unilever', '001');
insert into vendor values('00004', 'Unilever', '002');
insert into vendor values('00004', 'Unilever', '003');
insert into vendor values('00004', 'Unilever', '004');
insert into vendor values('00004', 'Unilever', '005');
insert into vendor values('00005', 'Philip Moris', '001');
insert into vendor values('00005', 'Philip Moris', '002');
insert into vendor values('00005', 'Philip Moris', '003');
insert into vendor values('00005', 'Philip Moris', '004');
insert into vendor values('00005', 'Philip Moris', '005');
insert into vendor values('00006', 'Anheuser Busch InBev', '001');
insert into vendor values('00006', 'Anheuser Busch InBev', '002');
insert into vendor values('00006', 'Anheuser Busch InBev', '003');
insert into vendor values('00006', 'Anheuser Busch InBev', '004');
insert into vendor values('00006', 'Anheuser Busch InBev', '005');

insert into product_brand values('00001', 'Coca Cola', '00001');
insert into product_brand values('00002', 'Sprite', '00001');
insert into product_brand values('00003', 'Fanta', '00001');
insert into product_brand values('00004', 'Pepsi', '00002');
insert into product_brand values('00005', '7UP', '00002');
insert into product_brand values('00006', 'Parlament', '00005');
insert into product_brand values('00007', 'Marlboro', '00005');
insert into product_brand values('00008', 'Bond', '00005');
insert into product_brand values('00009', 'Budweiser', '00006');
insert into product_brand values('00010', 'Corona', '00006');
insert into product_brand values('00011', 'Stella Artois', '00006');
insert into product_brand values('00012', 'Mars', '00003');
insert into product_brand values('00013', 'Snickers', '00003');
insert into product_brand values('00014', 'Twix', '00003');
insert into product_brand values('00015', 'Dirol', '00003');
insert into product_brand values('00016', 'Orbit', '00003');
insert into product_brand values('00017', 'Super Sausage', '00004');
insert into product_brand values('00018', 'Bread Pitt', '00004');
insert into product_brand values('00019', 'Capri Sun', '00004');
insert into product_brand values('00020', 'Daily Dairy', '00004');
insert into product_brand values('00021', 'Finita La Comedia', '00004');

insert into product values('0000001', 'Coca Cola Standard', '00001', '0.5l', 0.45, '00001');
insert into product values('0000002', 'Coca Cola Standard', '00001', '1l', 0.65, '00001');
insert into product values('0000003', 'Coca Cola Standard', '00001', '1.5l', 0.85, '00001');
insert into product values('0000004', 'Sprite Lime', '00002', '0.5l', 0.45, '00001');
insert into product values('0000005', 'Sprite Lime', '00002', '1l', 0.65, '00001');
insert into product values('0000006', 'Sprite Lime', '00002', '1.5l', 0.85, '00001');
insert into product values('0000007', 'Fanta Orange', '00003', '0.5l', 0.45, '00001');
insert into product values('0000008', 'Fanta Orange', '00003', '1l', 0.65, '00001');
insert into product values('0000009', 'Fanta Orange', '00003', '1.5l', 0.85, '00001');
insert into product values('0000010', 'Diet Pepsi', '00004', '0.5l', 0.45, '00001');
insert into product values('0000011', 'Diet Pepsi', '00004', '1l', 0.65, '00001');
insert into product values('0000012', 'Diet Pepsi', '00004', '1.5l', 0.85, '00001');
insert into product values('0000013', '7UP lime', '00005', '0.5l', 0.45, '00001');
insert into product values('0000014', '7UP Lime', '00005', '1l', 0.65, '00001');
insert into product values('0000015', '7UP Lime', '00005', '1.5l', 0.85, '00001');
insert into product values('0000016', 'wheat baguette', '00018', 'standard', 0.25, '00010' );
insert into product values('0000017', 'bran baguette', '00018', 'standard', 0.25, '00010' );
insert into product values('0000018', 'wheat loaf', '00018', 'standard', 0.25, '00010' );
insert into product values('0000019', 'rye loaf', '00018', 'standard', 0.25, '00009' );
insert into product values('0000020', 'Capri Sun Orange', '00019', '0.3l', 0.5, '00003' );
insert into product values('0000021', 'Capri Sun Apple', '00019', '0.3l', 0.5, '00003' );
insert into product values('0000022', 'Capri Sun Multivitamin', '00019', '0.3l', 0.5, '00003' );
insert into product values('0000023', 'Snickers', '00013', 'Standard', 0.4, '00012' );
insert into product values('0000024', 'Snickers', '00013', 'Super', 0.6, '00012' );
insert into product values('0000025', 'Mars', '00012', 'Standard', 0.4, '00012' );
insert into product values('0000026', 'Mars', '00012', 'Super', 0.6, '00012' );
insert into product values('0000027', 'Twix', '00014', 'Standard', 0.4, '00012' );
insert into product values('0000028', 'Twix', '00014', 'Super', 0.6, '00012' );
insert into product values('0000029', 'Orbit Mint', '00016', 'Standard', 0.3, '00014' );
insert into product values('0000030', 'Orbit Mint', '00016', 'Super', 0.5, '00014' );
insert into product values('0000031', 'Dirol Mint', '00015', 'Standard', 0.3, '00014' );
insert into product values('0000032', 'Dirol Mint', '00015', 'Super', 0.5, '00014' );
insert into product values('0000033', 'Corona Extra', '00010', '0.5', 1.2, '00002' );
insert into product values('0000034', 'Corona Light', '00010', '0.5', 1.2, '00002' );
insert into product values('0000035', 'Stella Artois Classic', '00011', '0.5', 1.2, '00002' );
insert into product values('0000036', 'Stella Artois light', '00011', '0.5', 1.2, '00002' );
insert into product values('0000037', 'Bud Classic', '00010', '0.5', 1.2, '00002' );
insert into product values('0000038', 'Bud Artois light', '00010', '0.5', 1.2, '00002' );
insert into product values('0000039', 'Parlament Mentol', '00006', 'Classic', 1.5, '00007' );
insert into product values('0000040', 'Parlament Classic', '00006', 'Classic', 1.5, '00007' );
insert into product values('0000041', 'Parlament Aqua Blue', '00006', 'Classic', 1.5, '00007' );
insert into product values('0000042', 'Bond Classic', '00008', 'Classic', 1.5, '00007' );
insert into product values('0000043', 'Bond Capsule', '00008', 'Classic', 1.5, '00007' );
insert into product values('0000044', 'Marlboro Standard', '00007', 'Classic', 1.5, '00008' );
insert into product values('0000045', 'Long spaghetti', '00021', 'Classic', 0.8, '00013' );
insert into product values('0000046', 'Milk 2.3%', '00020', '1l', 1, '00004' );
insert into product values('0000047', 'Milk 3.2%', '00020', '1l', 1, '00004' );
insert into product values('0000048', 'Milk 6%', '00020', '1l', 1, '00004' );
insert into product values('0000049', 'Sour Cream 10%', '00020', '400g', 1, '00005' );
insert into product values('0000050', 'Sour Cream 15%', '00020', '400g', 1, '00005' );
insert into product values('0000051', 'Sour Cream 20%', '00020', '400g', 1, '00005' );
insert into product values('0000052', 'Sandwich Cheese', '00020', '300g', 3, '00006' );
insert into product values('0000053', 'Wine Cheese', '00020', '300g', 5, '00006' );

insert into product_available values('0000001', '001', 50);
insert into product_available values('0000002', '001', 50);
insert into product_available values('0000003', '001', 50);
insert into product_available values('0000004', '001', 50);
insert into product_available values('0000005', '001', 50);
insert into product_available values('0000006', '001', 50);
insert into product_available values('0000007', '001', 50);
insert into product_available values('0000008', '001', 50);
insert into product_available values('0000009', '001', 50);
insert into product_available values('0000010', '001', 50);
insert into product_available values('0000011', '001', 50);
insert into product_available values('0000012', '001', 50);
insert into product_available values('0000013', '001', 50);
insert into product_available values('0000014', '001', 50);
insert into product_available values('0000015', '001', 50);
insert into product_available values('0000016', '001', 50);
insert into product_available values('0000017', '001', 50);
insert into product_available values('0000018', '001', 50);
insert into product_available values('0000019', '001', 50);
insert into product_available values('0000020', '001', 50);
insert into product_available values('0000021', '001', 50);
insert into product_available values('0000022', '001', 50);
insert into product_available values('0000023', '001', 50);
insert into product_available values('0000024', '001', 50);
insert into product_available values('0000025', '001', 50);
insert into product_available values('0000026', '001', 50);
insert into product_available values('0000027', '001', 50);
insert into product_available values('0000028', '001', 50);
insert into product_available values('0000029', '001', 50);
insert into product_available values('0000030', '001', 50);
insert into product_available values('0000031', '001', 50);
insert into product_available values('0000032', '001', 50);
insert into product_available values('0000033', '001', 50);
insert into product_available values('0000034', '001', 50);
insert into product_available values('0000035', '001', 50);
insert into product_available values('0000036', '001', 50);
insert into product_available values('0000037', '001', 50);
insert into product_available values('0000038', '001', 50);
insert into product_available values('0000039', '001', 50);
insert into product_available values('0000040', '001', 50);
insert into product_available values('0000041', '001', 50);
insert into product_available values('0000042', '001', 50);
insert into product_available values('0000043', '001', 50);
insert into product_available values('0000044', '001', 50);
insert into product_available values('0000045', '001', 50);
insert into product_available values('0000046', '001', 50);
insert into product_available values('0000047', '001', 50);
insert into product_available values('0000048', '001', 50);
insert into product_available values('0000049', '001', 50);
insert into product_available values('0000050', '001', 50);
insert into product_available values('0000051', '001', 50);
insert into product_available values('0000052', '001', 50);
insert into product_available values('0000053', '001', 50);


insert into product_available values('0000001', '002', 50);
insert into product_available values('0000002', '002', 50);
insert into product_available values('0000003', '002', 50);
insert into product_available values('0000004', '002', 50);
insert into product_available values('0000005', '002', 50);
insert into product_available values('0000006', '002', 50);
insert into product_available values('0000007', '002', 50);
insert into product_available values('0000008', '002', 50);
insert into product_available values('0000009', '002', 50);
insert into product_available values('0000010', '002', 50);
insert into product_available values('0000011', '002', 50);
insert into product_available values('0000012', '002', 50);
insert into product_available values('0000013', '002', 50);
insert into product_available values('0000014', '002', 50);
insert into product_available values('0000015', '002', 50);
insert into product_available values('0000016', '002', 50);
insert into product_available values('0000017', '002', 50);
insert into product_available values('0000018', '002', 50);
insert into product_available values('0000019', '002', 50);
insert into product_available values('0000020', '002', 50);
insert into product_available values('0000021', '002', 50);
insert into product_available values('0000022', '002', 50);
insert into product_available values('0000023', '002', 50);
insert into product_available values('0000024', '002', 50);
insert into product_available values('0000025', '002', 50);
insert into product_available values('0000026', '002', 50);
insert into product_available values('0000027', '002', 50);
insert into product_available values('0000028', '002', 50);
insert into product_available values('0000029', '002', 50);
insert into product_available values('0000030', '002', 50);
insert into product_available values('0000031', '002', 50);
insert into product_available values('0000032', '002', 50);
insert into product_available values('0000033', '002', 50);
insert into product_available values('0000034', '002', 50);
insert into product_available values('0000035', '002', 50);
insert into product_available values('0000036', '002', 50);
insert into product_available values('0000037', '002', 50);
insert into product_available values('0000038', '002', 50);
insert into product_available values('0000039', '002', 50);
insert into product_available values('0000040', '002', 50);
insert into product_available values('0000041', '002', 50);
insert into product_available values('0000042', '002', 50);
insert into product_available values('0000043', '002', 50);
insert into product_available values('0000044', '002', 50);
insert into product_available values('0000045', '002', 50);
insert into product_available values('0000046', '002', 50);
insert into product_available values('0000047', '002', 50);
insert into product_available values('0000048', '002', 50);
insert into product_available values('0000049', '002', 50);
insert into product_available values('0000050', '002', 50);
insert into product_available values('0000051', '002', 50);
insert into product_available values('0000052', '002', 50);
insert into product_available values('0000053', '002', 50);


insert into product_available values('0000001', '003', 50);
insert into product_available values('0000002', '003', 50);
insert into product_available values('0000003', '003', 50);
insert into product_available values('0000004', '003', 50);
insert into product_available values('0000005', '003', 50);
insert into product_available values('0000006', '003', 50);
insert into product_available values('0000007', '003', 50);
insert into product_available values('0000008', '003', 50);
insert into product_available values('0000009', '003', 50);
insert into product_available values('0000010', '003', 50);
insert into product_available values('0000011', '003', 50);
insert into product_available values('0000012', '003', 50);
insert into product_available values('0000013', '003', 50);
insert into product_available values('0000014', '003', 50);
insert into product_available values('0000015', '003', 50);
insert into product_available values('0000016', '003', 50);
insert into product_available values('0000017', '003', 50);
insert into product_available values('0000018', '003', 50);
insert into product_available values('0000019', '003', 50);
insert into product_available values('0000020', '003', 50);
insert into product_available values('0000021', '003', 50);
insert into product_available values('0000022', '003', 50);
insert into product_available values('0000023', '003', 50);
insert into product_available values('0000024', '003', 50);
insert into product_available values('0000025', '003', 50);
insert into product_available values('0000026', '003', 50);
insert into product_available values('0000027', '003', 50);
insert into product_available values('0000028', '003', 50);
insert into product_available values('0000029', '003', 50);
insert into product_available values('0000030', '003', 50);
insert into product_available values('0000031', '003', 50);
insert into product_available values('0000032', '003', 50);
insert into product_available values('0000033', '003', 50);
insert into product_available values('0000034', '003', 50);
insert into product_available values('0000035', '003', 50);
insert into product_available values('0000036', '003', 50);
insert into product_available values('0000037', '003', 50);
insert into product_available values('0000038', '003', 50);
insert into product_available values('0000039', '003', 50);
insert into product_available values('0000040', '003', 50);
insert into product_available values('0000041', '003', 50);
insert into product_available values('0000042', '003', 50);
insert into product_available values('0000043', '003', 50);
insert into product_available values('0000044', '003', 50);
insert into product_available values('0000045', '003', 50);
insert into product_available values('0000046', '003', 50);
insert into product_available values('0000047', '003', 50);
insert into product_available values('0000048', '003', 50);
insert into product_available values('0000049', '003', 50);
insert into product_available values('0000050', '003', 50);
insert into product_available values('0000051', '003', 50);
insert into product_available values('0000052', '003', 50);
insert into product_available values('0000053', '003', 50);


insert into product_available values('0000001', '004', 50);
insert into product_available values('0000002', '004', 50);
insert into product_available values('0000003', '004', 50);
insert into product_available values('0000004', '004', 50);
insert into product_available values('0000005', '004', 50);
insert into product_available values('0000006', '004', 50);
insert into product_available values('0000007', '004', 50);
insert into product_available values('0000008', '004', 50);
insert into product_available values('0000009', '004', 50);
insert into product_available values('0000010', '004', 50);
insert into product_available values('0000011', '004', 50);
insert into product_available values('0000012', '004', 50);
insert into product_available values('0000013', '004', 50);
insert into product_available values('0000014', '004', 50);
insert into product_available values('0000015', '004', 50);
insert into product_available values('0000016', '004', 50);
insert into product_available values('0000017', '004', 50);
insert into product_available values('0000018', '004', 50);
insert into product_available values('0000019', '004', 50);
insert into product_available values('0000020', '004', 50);
insert into product_available values('0000021', '004', 50);
insert into product_available values('0000022', '004', 50);
insert into product_available values('0000023', '004', 50);
insert into product_available values('0000024', '004', 50);
insert into product_available values('0000025', '004', 50);
insert into product_available values('0000026', '004', 50);
insert into product_available values('0000027', '004', 50);
insert into product_available values('0000028', '004', 50);
insert into product_available values('0000029', '004', 50);
insert into product_available values('0000030', '004', 50);
insert into product_available values('0000031', '004', 50);
insert into product_available values('0000032', '004', 50);
insert into product_available values('0000033', '004', 50);
insert into product_available values('0000034', '004', 50);
insert into product_available values('0000035', '004', 50);
insert into product_available values('0000036', '004', 50);
insert into product_available values('0000037', '004', 50);
insert into product_available values('0000038', '004', 50);
insert into product_available values('0000039', '004', 50);
insert into product_available values('0000040', '004', 50);
insert into product_available values('0000041', '004', 50);
insert into product_available values('0000042', '004', 50);
insert into product_available values('0000043', '004', 50);
insert into product_available values('0000044', '004', 50);
insert into product_available values('0000045', '004', 50);
insert into product_available values('0000046', '004', 50);
insert into product_available values('0000047', '004', 50);
insert into product_available values('0000048', '004', 50);
insert into product_available values('0000049', '004', 50);
insert into product_available values('0000050', '004', 50);
insert into product_available values('0000051', '004', 50);
insert into product_available values('0000052', '004', 50);
insert into product_available values('0000053', '004', 50);



insert into product_available values('0000001', '005', 50);
insert into product_available values('0000002', '005', 50);
insert into product_available values('0000003', '005', 50);
insert into product_available values('0000004', '005', 50);
insert into product_available values('0000005', '005', 50);
insert into product_available values('0000006', '005', 50);
insert into product_available values('0000007', '005', 50);
insert into product_available values('0000008', '005', 50);
insert into product_available values('0000009', '005', 50);
insert into product_available values('0000010', '005', 50);
insert into product_available values('0000011', '005', 50);
insert into product_available values('0000012', '005', 50);
insert into product_available values('0000013', '005', 50);
insert into product_available values('0000014', '005', 50);
insert into product_available values('0000015', '005', 50);
insert into product_available values('0000016', '005', 50);
insert into product_available values('0000017', '005', 50);
insert into product_available values('0000018', '005', 50);
insert into product_available values('0000019', '005', 50);
insert into product_available values('0000020', '005', 50);
insert into product_available values('0000021', '005', 50);
insert into product_available values('0000022', '005', 50);
insert into product_available values('0000023', '005', 50);
insert into product_available values('0000024', '005', 50);
insert into product_available values('0000025', '005', 50);
insert into product_available values('0000026', '005', 50);
insert into product_available values('0000027', '005', 50);
insert into product_available values('0000028', '005', 50);
insert into product_available values('0000029', '005', 50);
insert into product_available values('0000030', '005', 50);
insert into product_available values('0000031', '005', 50);
insert into product_available values('0000032', '005', 50);
insert into product_available values('0000033', '005', 50);
insert into product_available values('0000034', '005', 50);
insert into product_available values('0000035', '005', 50);
insert into product_available values('0000036', '005', 50);
insert into product_available values('0000037', '005', 50);
insert into product_available values('0000038', '005', 50);
insert into product_available values('0000039', '005', 50);
insert into product_available values('0000040', '005', 50);
insert into product_available values('0000041', '005', 50);
insert into product_available values('0000042', '005', 50);
insert into product_available values('0000043', '005', 50);
insert into product_available values('0000044', '005', 50);
insert into product_available values('0000045', '005', 50);
insert into product_available values('0000046', '005', 50);
insert into product_available values('0000047', '005', 50);
insert into product_available values('0000048', '005', 50);
insert into product_available values('0000049', '005', 50);
insert into product_available values('0000050', '005', 50);
insert into product_available values('0000051', '005', 50);
insert into product_available values('0000052', '005', 50);
insert into product_available values('0000053', '005', 50);

insert into orders values('000001', '10001', '001', '0000034', 3);
insert into orders values('000001', '10001', '001', '0000001', 1);
insert into orders values('000002', '20002', '001', '0000014', 2);
insert into orders values('000002', '20002', '001', '0000013', 4);
insert into orders values('000003', '30003', '001', '0000011', 1);
insert into orders values('000003', '30003', '001', '0000045', 1);
insert into orders values('000004', '40004', '001', '0000022', 2);
insert into orders values('000004', '40004', '001', '0000052', 3);
insert into orders values('000005', '50005', '002', '0000016', 3);
insert into orders values('000005', '50005', '002', '0000012', 1);
insert into orders values('000006', '60006', '002', '0000007', 5);
insert into orders values('000006', '60006', '002', '0000008', 4);
insert into orders values('000007', '70007', '002', '0000009', 1);
insert into orders values('000007', '70007', '002', '0000032', 3);
insert into orders values('000008', '80008', '002', '0000037', 2);
insert into orders values('000008', '80008', '002', '0000039', 3);
insert into orders values('000009', '90009', '003', '0000051', 3);
insert into orders values('000009', '90009', '003', '0000023', 1);
insert into orders values('000010', '10010', '003', '0000023', 1);
insert into orders values('000010', '10010', '003', '0000024', 1);
insert into orders values('000011', '11011', '003', '0000027', 4);
insert into orders values('000011', '11011', '003', '0000052', 1);
insert into orders values('000012', '12012', '003', '0000012', 1);
insert into orders values('000012', '12012', '003', '0000006', 1);
insert into orders values('000013', '13013', '004', '0000001', 3);
insert into orders values('000013', '13013', '004', '0000003', 3);
insert into orders values('000014', '14014', '004', '0000004', 3);
insert into orders values('000014', '14014', '004', '0000042', 3);
insert into orders values('000015', '15015', '004', '0000011', 3);
insert into orders values('000015', '15015', '004', '0000014', 3);
insert into orders values('000016', '16016', '004', '0000025', 3);
insert into orders values('000016', '16016', '004', '0000026', 1);
insert into orders values('000017', '17017', '005', '0000006', 3);
insert into orders values('000017', '17017', '005', '0000007', 3);
insert into orders values('000018', '18018', '005', '0000034', 2);
insert into orders values('000018', '18018', '005', '0000023', 2);
insert into orders values('000019', '19019', '005', '0000010', 1);
insert into orders values('000019', '19019', '005', '0000021', 3);
insert into orders values('000020', '20020', '005', '0000038', 3);
insert into orders values('000020', '20020', '005', '0000044', 3);

update customer set ID = '18018' where ID = '18010';


alter table orders add primary key(ID, store_ID, customer_ID, product_ID);



select * from product_available;