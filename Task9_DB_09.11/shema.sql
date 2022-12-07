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
    rating integer check( rating >= 0 and rating <= 5),
    order_id integer REFERENCES orders (id)
);

create table scores
(
    driver_id integer REFERENCES driver(driver_id),
    value integer
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
