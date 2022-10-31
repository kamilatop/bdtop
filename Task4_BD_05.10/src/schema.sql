drop table if exists client;
drop table if exists orders;
drop table if exists car;
drop table if exists driver;


create table client
(
    id bigserial primary key,
    first_name char(20),
    last_name  char(20),
    age integer check ( age > 7 and age < 120),
    cur_location char(50)
);

insert into client (first_name, last_name, age, cur_location)
values ('Карина', 'Новикова', '23', 'Kazan'),
       ('Дмитрий', 'Новиков', '25', 'Иркутск'),
       ('Вероника', 'Сколкова', '25', 'Екатеринбург');

create table driver
(
    id serial primary key,
    name_driver char(20),
    rating integer check( rating >= 0 and rating <= 5)
);

insert into driver (name_driver, rating)
values ('Ислам', '5'),
       ('Нурлан', '4'),
       ('Алексей', '4',
       ('Сергей', '3');

create table orders
(
    id serial primary key,
    name_car char(20),
    number_car char(20),
    name_driver char(100),
    start_time  time,
    finish_time time,
    queue_or integer check( queue_or >=0 and queue_or <=300)
);

insert into orders (name_car, number_car, name_driver, finish_time, start_time, queue_or)
values ('Lada', 'К567ОВ', 'Нурлан', '15:43', '15:30', '1'),
       ('BMW', 'А567ОВ', 'Александр', '16:53', '16:20', '2'),
       ('Audi', 'В987ОВ', 'Алексей', '12:03', '12:13', '3'),
       ('Mazda', 'О489РП', 'Сергей', '20:24', '20:34', '4');

create table car
(
    id serial primary key,
    name_car char(20),
    number char(20),
    color char(20),
    tariff char(20)
);

insert into car (name_car, number, color, tariff)
values ('Lada', 'К567ОВ', 'черный', 'комфорт'),
       ('BMW', 'А567ОВ', 'синий', 'эконом'),
       ('Audi', 'В987ОВ', 'белый', 'премиум'),
       ('Mazda', 'О489РП', 'желтый', 'доставка');

