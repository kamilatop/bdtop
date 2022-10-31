drop table if exists client;
drop table if exists orders;
drop table if exists mycars;
drop table if exists driver;
drop table if exists taxiparks;


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
       ('Алексей', '4'),
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

create table taxiparks
(
    id serial primary key ,
    name_taxipark char(20)
);

insert into taxiparks(id, name_taxipark)
values ('0', 'null'),
       ('1', 'yandex'),
       ('2','maya'),
       ('3', 'city'),
       ('4', 'yandex'),
       ('5','maya');


create table mycars
(
    id serial primary key,
    taxipark_id integer ,
    name_car char(20),
    number char(20),
    color char(20),
    tariff char(20),
    foreign key (taxipark_id) references taxiparks(id)
);

insert into mycars (taxipark_id, name_car, number, color, tariff)
values ('0', 'Lada', 'К567ОВ', 'черный', 'комфорт'),
       ('1', 'BMW', 'А567ОВ', 'синий', 'эконом'),
       ('2', 'Audi', 'В987ОВ', 'белый', 'премиум'),
       ('2', 'Mazda', 'О489РП', 'желтый', 'доставка'),
       ('3', 'BMW', 'А567ОВ', 'синий', 'эконом'),
       ('3', 'Audi', 'В987ОВ', 'белый', 'премиум'),
       ('1', 'Mazda', 'О489РП', 'желтый', 'доставка');


