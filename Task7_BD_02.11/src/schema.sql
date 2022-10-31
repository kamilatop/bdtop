drop table if exists client;
drop table if exists orders;
drop table if exists car;
drop table if exists driver;


create table client
(
    id bigserial primary key,
    driver_id integer,
    first_name char(20),
    last_name  char(20),
    age integer check ( age > 7 and age < 120),
    cur_location char(50),
    foreign key (driver_id) references driver(driver_id)
);

insert into client (first_name, last_name, age, cur_location, driver_id)
values ('Карина', 'Новикова', '23', 'Kazan', '1'),
       ('Дмитрий', 'Новиков', '25', 'Иркутск', '3'),
       ('Вероника', 'Сколкова', '25', 'Екатеринбург', '2');

create table driver
(
    driver_id serial primary key,
    name_driver char(20),
    rating integer check( rating >= 0 and rating <= 5)
);

insert into driver (name_driver, rating)
values ('Ислам', '5'),
       ('Нурлан', '4'),
       ('Алексей', '4'),
       ('Сергей', '3'),
       ('Сережа', '4'),
       ('Александра', '3');

create table orders
(
    id serial primary key,
    name_car char(20),
    number_car char(20),
    name_driver char(100),
    start_time  time,
    finish_time time,
    queue_or integer check( queue_or >=0 and queue_or <=300),
    driver_id integer,
    foreign key (driver_id) references driver(driver_id)
);

insert into orders (name_car, number_car, name_driver, finish_time, start_time, queue_or,driver_id)
values ('Lada', 'К567ОВ', 'Нурлан', '15:43', '15:30', '1', '2'),
       ('BMW', 'А567ОВ', 'Александр', '16:53', '16:20', '2', '3'),
       ('Audi', 'В987ОВ', 'Алексей', '12:03', '12:13', '3', '4'),
       ('Mazda', 'О489РП', 'Сергей', '20:24', '20:34', '4', '11');

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