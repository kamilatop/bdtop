EXPLAIN ANALYZE select orders.name_driver, Max(scores.value)
                from driver
                         join orders on orders.id = driver.id
                         join scores on scores.driver_id = driver.id
                where driver.rating = 5
                group by orders.name_driver;



EXPLAIN ANALYZE select orders.name_driver, Max(scores.value)
                from driver
                         join orders on orders.id = driver.id
                         join scores on scores.driver_id = driver.id
                group by orders.name_driver;

CREATE INDEX INDEX_table ON orders USING HASH (number_car);


CREATE EXTENSION INDEX_table2;
CREATE INDEX INDEX_table3 ON driver USING gin (name_driver);