drop table if exists orders;
create table orders
(
    id serial primary key,
    name_car char(20),
    number_car char(20),
    name_driver char(100),
    start_time  time,
    finish_time time
);

insert into orders (name_car, number_car, name_driver, finish_time, start_time)
values ('Lada', 'К567ОВ', 'Нурлан', '15:43', '15:30'),
       ('BMW', 'А567ОВ', 'Александр', '16:53', '16:20'),
       ('Audi', 'В987ОВ', 'Алексей', '12:03', '12:13'),
       ('Mazda', 'О489РП', 'Сергей', '20:24', '20:34');