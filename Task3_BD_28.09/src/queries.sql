create view red_car as
    select * from car
where color = 'red';

create view red_car_lada as
    select * from red_car
where name_car = 'Lada'
with local check option ;

create view red_ar_audi as
    select * from red_car
where name_car = 'Audi'
with cascaded check option ;

create view top_driver as
    select * from driver
where rating = '5';

create view top_driver_islam as
    select * from top_driver
where name_driver = 'Ислам'
with local check option ;

create view top_driver_islam as
select * from top_driver
where name_driver = 'Ислам'
with cascaded check option ;