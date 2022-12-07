select orders.name_driver, Max(scores.value)
from driver
         join orders on orders.id = driver.order_id
         join scores on scores.driver_id = driver.id
group by orders.name_driver;

select orders.name_driver, Max(scores.value)
from driver
         join orders on orders.id = driver.order_id
         join scores on scores.driver_id = driver.id
group by orders.name_driver;
order by 2 desc;

select orders.name_driver, Min(scores.value)
from driver
         join orders on orders.id = driver.order_id
         join scores on scores.driver_id = driver.id
group by orders.name_driver
having min(scores.value) > 1;

select orders.name_driver, AVG(scores.value)
from driver
         join orders on orders.id = driver.order_id
         join scores on scores.driver_id = driver.id
group by orders.name_driver;

select name_driver, rating
from driver
         join scores on scores.driver_id = driver.driver_id
         join orders on orders.id = driver.order_id
order by scores desc
    limit 5;

select name_driver, rating
from driver
         join scores on scores.driver_id = driver.driver_id
         join orders on orders.id = driver.order_id
order by scores desc
    limit 5 offset 10;
