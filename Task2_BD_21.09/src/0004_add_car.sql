drop table if exists car;
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