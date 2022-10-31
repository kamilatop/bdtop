drop table if exists driver;
create table driver
(
    id serial primary key,
    name_driver char(20),
    rating integer check( rating >= 0 and rating <= 5)
);

insert into driver (name_driver, rating)
values ('Islam', '5'),
       ('Нурлан', '4'),
       ('Алексей', '4'),
       ('Сергей', '3');