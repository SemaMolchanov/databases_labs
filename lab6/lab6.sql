create database lab6_db;

create table dealer (
    id integer primary key ,
    name varchar(255),
    location varchar(255),
    charge float
);

INSERT INTO dealer (id, name, location, charge) VALUES (101, 'Ерлан', 'Алматы', 0.15);
INSERT INTO dealer (id, name, location, charge) VALUES (102, 'Жасмин', 'Караганда', 0.13);
INSERT INTO dealer (id, name, location, charge) VALUES (105, 'Азамат', 'Нур-Султан', 0.11);
INSERT INTO dealer (id, name, location, charge) VALUES (106, 'Канат', 'Караганда', 0.14);
INSERT INTO dealer (id, name, location, charge) VALUES (107, 'Евгений', 'Атырау', 0.13);
INSERT INTO dealer (id, name, location, charge) VALUES (103, 'Жулдыз', 'Актобе', 0.12);

create table client (
    id integer primary key ,
    name varchar(255),
    city varchar(255),
    priority integer,
    dealer_id integer references dealer(id)
);

INSERT INTO client (id, name, city, priority, dealer_id) VALUES (802, 'Айша', 'Алматы', 100, 101);
INSERT INTO client (id, name, city, priority, dealer_id) VALUES (807, 'Даулет', 'Алматы', 200, 101);
INSERT INTO client (id, name, city, priority, dealer_id) VALUES (805, 'Али', 'Кокшетау', 200, 102);
INSERT INTO client (id, name, city, priority, dealer_id) VALUES (808, 'Ильяс', 'Нур-Султан', 300, 102);
INSERT INTO client (id, name, city, priority, dealer_id) VALUES (804, 'Алия', 'Караганда', 300, 106);
INSERT INTO client (id, name, city, priority, dealer_id) VALUES (809, 'Саша', 'Шымкент', 100, 103);
INSERT INTO client (id, name, city, priority, dealer_id) VALUES (803, 'Маша', 'Семей', 200, 107);
INSERT INTO client (id, name, city, priority, dealer_id) VALUES (801, 'Максат', 'Нур-Султан', null, 105);

create table sell (
    id integer primary key,
    amount float,
    date timestamp,
    client_id integer references client(id),
    dealer_id integer references dealer(id)
);

INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (201, 150.5, '2012-10-05 00:00:00.000000', 805, 102);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (209, 270.65, '2012-09-10 00:00:00.000000', 801, 105);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (202, 65.26, '2012-10-05 00:00:00.000000', 802, 101);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (204, 110.5, '2012-08-17 00:00:00.000000', 809, 103);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (207, 948.5, '2012-09-10 00:00:00.000000', 805, 102);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (205, 2400.6, '2012-07-27 00:00:00.000000', 807, 101);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (208, 5760, '2012-09-10 00:00:00.000000', 802, 101);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (210, 1983.43, '2012-10-10 00:00:00.000000', 804, 106);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (203, 2480.4, '2012-10-10 00:00:00.000000', 809, 103);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (212, 250.45, '2012-06-27 00:00:00.000000', 808, 102);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (211, 75.29, '2012-08-17 00:00:00.000000', 803, 107);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (213, 3045.6, '2012-04-25 00:00:00.000000', 802, 101);

-- drop table client cascade ;
-- drop table dealer cascade;
-- drop table sell cascade;

-- 1) write an SQL query using joins

-- a)
select *
from dealer, client;

-- b)
select d.name, c.name, c.city, s.id, c.priority, s.date, s.amount
from dealer as d, client as c, sell as s
where d.id = s.dealer_id and c.id = s.client_id;

-- c)
select d.name, c.name
from dealer as d inner join client as c on d.location = c.city;

-- d)
select s.id, s.amount, c.name, c.city
from sell as s inner join client as c on s.client_id = c.id
where s.amount > 100 and s.amount < 500;

-- e)


-- f)
select c.name, c.city, d.name, d.charge
from dealer as d inner join client as c on d.id = c.dealer_id;

-- g)
select c.name, c.city, d.name, d.charge
from dealer as d inner join client as c on d.id = c.dealer_id
where d.charge > 0.12;

-- h)

-- i)

-- 2)Create the following views

-- a)
create view task_a as
select date, count(client_id) as number_of_clients,
       sum(amount) as total_purchases_amount,
       avg(amount) as average_purchases_amount
from sell
group by date;

select * from task_a;

-- b)
select date, total_purchases_amount
from task_a
order by total_purchases_amount desc
limit  5;

-- c)
create view task_c as
select dealer_id, count(id) as number_of_sells,
       sum(amount) as total_purchases_amount,
       avg(amount) as average_purchases_amount
from sell
group by dealer_id;

select d.name, number_of_sells,
total_purchases_amount, average_purchases_amount
from dealer as d inner join task_c as c on d.id = c.dealer_id;

-- d)
create view task_d as
select d.location, (sum(s.amount*d.charge)) as earned
from dealer as d inner join sell as s on d.id = s.dealer_id
group by location;

select * from task_d;

-- e)
create view task_e as
select location, count(s.id) as number_of_sells,
       sum(amount) as total_purchases_amount,
       avg(amount) as average_purchases_amount
from sell as s inner join dealer as d on d.id = s.dealer_id
group by location;

select * from task_e;

-- f)

-- g)



