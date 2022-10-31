drop table if exists client;
create table client
(
    id bigserial primary key,
    first_name char(20),
    last_name  char(20),
    age integer check ( age > 7 and age < 120),
    cur_location char(20)
);
insert into client (first_name, last_name, age, cur_location)
values ('Карина', 'Новикова', '23', 'Kazan'),
       ('Дмитрий', 'Новиков', '25', 'Иркутск'),
       ('Вероника', 'Сколкова', '25', 'Екатеринбург');