select Client.id, Client.age, Driver.driver_id,Driver.rating
from Client
         join Driver on Driver.driver_id = Client.driver_id
order by Driver.driver_id;


select Orders.name_car, Orders.number_car, Driver.rating
from Orders
         join Driver on Driver.driver_id = Orders.driver_id
order by Driver.driver_id;

select Client.first_name, Client.cur_location, Driver.driver_id,Client.driver_id
from Driver
    left outer join Client on Driver.driver_id = Client.driver_id
order by Driver.driver_id;

select Driver.name_driver, Orders.id, Orders.driver_id, Driver.driver_id
from Driver
    right outer join Orders on Orders.driver_id = Driver.driver_id
order by Orders.driver_id;

select Car.name_car, Car.id, Client.id, Client.cur_location
from Car
    full outer join Client on Car.id = Client.id
order by Client.id;

select * from Car
    cross join Client;

select Client.id, Car.id, Car.name_car,Car.color, Client.first_name
from Client
         natural join Car;

select Car.color, Driver.name_driver
from Car
      join Driver on Car.id = Driver.driver_id
order by Driver;


select  Client.age
from Client where exists(select 1
    from Driver where Driver.driver_id = Client.driver_id);

select  Client.age
from Client where not exists(select 1
                         from Driver where Driver.driver_id = Client.driver_id);




