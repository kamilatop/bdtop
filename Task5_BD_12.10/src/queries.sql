
with recursive relation(taxipark_id, id, name_car, number, car_level) as
    (
    select id, taxipark_id, name_car, number, 0 as car_level
    from mycars
    where taxipark_id is null
    union all
    select e.taxipark_id, e.id, e.name_car, e.number, car_level + 1
    from mycars as e
    inner join relation as r
    on e.taxipark_id = r.id
    )
    select taxipark_id, id, name_car, number, car_level
    from relation
    order by taxipark_id;
