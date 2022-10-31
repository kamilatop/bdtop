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


