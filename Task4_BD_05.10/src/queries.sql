drop table if exists car1;
drop table if exists dr_top;
drop table if exists clt;
drop table if exists driver_to_delete;


with car1 as (
    select name_car,
           (case
             when id = 1
               then 'FIRST CAR'
             else 'OTHER'
            end) queue_or
    from orders)
select name_car, queue_or
from car1;

with dr_top as (
    select name_driver,
           (case
                when rating = '5'
                    then 'top driver'
                 else 'other'
            end) rating
    from driver)
select name_driver, rating from dr_top;

with clt as (
    update client set cur_location = 'city' ||  cur_location
           returning *
           )
select * from clt;

with driver_to_delete as (
    select id, name_driver
    from driver
    where name_driver = 'Ислам'
    )
delete from driver
       where id in (select id from driver_to_delete);




