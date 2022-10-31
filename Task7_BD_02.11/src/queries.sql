create table car
(
    id serial primary key ,
    name_car char(20),
    number char(20),
    color char(20),
    tariff char(20)
       constraint correct_number check (char_length(number) = 6)
);

create table orders
(
    id serial primary key ,
    sum_order integer
        constraint correct_sum check(sum_order > 0)
);

create table driver
(
    id serial primary key ,
    name_driver char(20),
    rating integer,
        constraint positive_rating check(rating >= 0 and rating <= 5)
);

create table client
(
    id bigserial primary key,
    driver_id integer,
    first_name char(20),
    last_name  char(20),
    cur_location char(50),
    foreign key (driver_id) references driver(id),
    age integer,
         constraint correct_age check(age > 7 and age < 120)
);

create table orders
(
    id serial primary key ,
    name_car text not null,
    sum_order numeric check(sum_order > 0),
    discounted_sum numeric not null check(discounted_sum > 0),
    check(sum_order > orders.discounted_sum)
);
insert into orders(name_car, sum_order, discounted_sum)
values ('Lada', 550000,450000);

create table driver
(
    name_driver text NOT NULL,
    price_driver numeric NOT NULL
);

create table order(
    sum_order integer,
    discounted_sum integer,
    queue_or integer,
    UNIQUE (sum_order,queue_or)
);
create table order(
    sum_order integer,
    discounted_sum integer,
    queue_or integer,
    PRIMARY KEY (sum_order,queue_or)
);

create table orders
(
    id serial primary key,
    name_car char(20),
    number_car char(20),
    name_driver char(100),
    start_time  time,
    finish_time time,
    queue_or integer check( queue_or >=0 and queue_or <=300),
    driver_id integer references driver(id)
);

create table orders
(
    id serial primary key,
    name_car char(20),
    number_car char(20),
    name_driver char(100),
    start_time  time,
    finish_time time,
    queue_or integer check( queue_or >=0 and queue_or <=300),
    foreign key (name_car,number_car) references car(name_car,number)
);




