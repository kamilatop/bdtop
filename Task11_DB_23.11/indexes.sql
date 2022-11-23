create table client
(
    id bigserial primary key,
    first_name char(20),
    last_name  char(20),
    age integer check ( age > 7 and age < 120),
    cur_location char(20)
);

create table orders
(
    id serial primary key,
    name_car char(20),
    number_car char(20),
    name_driver char(100),
    start_time  time,
    finish_time time
);

create table car
(
    id serial primary key,
    name_car char(20),
    number char(20),
    color char(20),
    tariff char(20)
);

create table driver
(
    id serial primary key,
    name_driver char(20),
    rating integer check( rating >= 0 and rating <= 5)
);

create table scores
(
    driver_id serial,
    value integer,
    constraint driver_id_fk foreign key (driver_id)
        references driver(id)
);

insert into client (first_name, last_name, age, cur_location)
values ('Карина', 'Новикова', '23', 'Kazan'),
       ('Дмитрий', 'Новиков', '25', 'Иркутск'),
       ('Вероника', 'Сколкова', '25', 'Екатеринбург');

insert into orders (name_car, number_car, name_driver, finish_time, start_time)
values ('Lada', 'К567ОВ', 'Ислам', '15:43', '15:30'),
       ('BMW', 'А567ОВ', 'Александр', '16:53', '16:20'),
       ('Audi', 'В987ОВ', 'Алексей', '12:03', '12:13'),
       ('Mazda', 'О489РП', 'Сергей', '20:24', '20:34');

insert into car (name_car, number, color, tariff)
values ('Lada', 'К567ОВ', 'red', 'комфорт'),
       ('BMW', 'А567ОВ', 'white', 'эконом'),
       ('Audi', 'В987ОВ', 'red', 'премиум'),
       ('Lada', 'О489РП', 'black', 'доставка'),
       ('Audi', 'G456K', 'yellow', 'комфорт'),
       ('Lada', 'U789IK', 'red', 'эконом');


insert into driver (name_driver, rating)
values ('Ислам', '5'),
       ('Нурлан', '4'),
       ('Алексей', '4'),
       ('Сергей', '3'),
       ('Александр', '5');

insert into scores(value)
values('100'),
      ('200'),
      ('150');

=================================
--1


EXPLAIN ANALYZE select orders.name_driver, Max(scores.value)
                from driver
                         join orders on orders.id = driver.id
                         join scores on scores.driver_id = driver.id
                where driver.rating = 5
                group by orders.name_driver;


--2
EXPLAIN ANALYZE select orders.name_driver, Max(scores.value)
                from driver
                         join orders on orders.id = driver.id
                         join scores on scores.driver_id = driver.id
                group by orders.name_driver;

-- 3
CREATE INDEX INDEX_table ON orders USING HASH (number_car);

-- 4

CREATE EXTENSION INDEX_table2;
CREATE INDEX INDEX_table3 ON driver USING gin (name_driver);