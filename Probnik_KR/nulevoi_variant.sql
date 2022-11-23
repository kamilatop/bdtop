create table airport (
                         airport_id serial primary key,
                         airport_name varchar(40) check (char_length(airport_name) > 1)
);

insert into airport(airport_name)
values ('Airport_1');
insert into airport(airport_name)
values ('Airport_2');
insert into airport(airport_name)
values ('Airport_3');

create table airplane (
                          airplane_id serial primary key,
                          name varchar(40) check (char_length(name) > 1)
);

insert into airplane(name)
values ('Tupolev Ty-134');
insert into airplane(name)
values ('Tupolev Ty-58');
insert into airplane(name)
values ('Tupolev Ty-636');

create table passengers (
                            passenger_id serial primary key,
                            flight_id integer not null,
                            first_name varchar(100) check (char_length(first_name) > 1),
                            last_name varchar(100) check (char_length(last_name) > 1),
                            foreign key (flight_id) references flights (flight_id)
);

insert into passengers(flight_id, first_name, last_name)
values (1, 'Kamila', 'Dmitrieva');
insert into passengers(flight_id, first_name, last_name)
values (2, 'Sergei', 'Shamov');
insert into passengers(flight_id, first_name, last_name)
values (3, 'Adelya', 'Moginova');
insert into passengers(flight_id, first_name, last_name)
values (4, 'Denis', 'Stasuk');

create table flights (
                         flight_id serial primary key,
                         flight_number varchar(40) check (char_length(flight_number) > 1),
                         flight_time integer constraint time_length check (flight_time > 0),
                         date date not null,
                         airplane_id integer not null,
                         foreign key (airplane_id) references airplane (airplane_id),
                         departure_airport_id integer not null,
                         foreign key (departure_airport_id) references airport (airport_id),
                         city_departure varchar(40) check (char_length(city_departure) > 1),
                         city_arrival varchar(40) check (char_length(city_arrival) > 1)
);

insert into flights(flight_number, flight_time, date, airplane_id, departure_airport_id, city_departure, city_arrival)
values ('KA1234', '1', '22.11.2022', 1, 1, 'Kazan', 'New-York');
insert into flights(flight_number, flight_time, date, airplane_id, departure_airport_id, city_departure, city_arrival)
values ('KA4321', '2', '24.10.2022', 2, 1, 'Piter', 'Paris');
insert into flights(flight_number, flight_time, date, airplane_id, departure_airport_id, city_departure, city_arrival)
values ('KA3124', '3', '02.09.2022', 3, 2, 'Ekb', 'Milan');
insert into flights(flight_number, flight_time, date, airplane_id, departure_airport_id, city_departure, city_arrival)
values ('KA1553', '4', '09.06.2022', 1, 1, 'Saratov', 'Jakarta';
insert into flights(flight_number, flight_time, date, airplane_id, departure_airport_id, city_departure, city_arrival)
values ('KA8182', '5', '11.04.2022', 2, 1, 'Rostov', 'Izmir');
insert into flights(flight_number, flight_time, date, airplane_id, departure_airport_id, city_departure, city_arrival)
values ('KA1278', '6', '16.07.2022', 3, 2, 'Moscow', 'Kipr');
insert into flights(flight_number, flight_time, date, airplane_id, departure_airport_id, city_departure, city_arrival)
values ('KA1829', '7', '29.01.2022', 2, 3, 'Nalchik', 'Cairo');
insert into flights(flight_number, flight_time, date, airplane_id, departure_airport_id, city_departure, city_arrival)
values ('KA1291', '8', '08.09.2022', 3, 3, 'Omsk', 'Lisbon');
insert into flights(flight_number, flight_time, date, airplane_id, departure_airport_id, city_departure, city_arrival)
values ('KA1991', '9', '03.03.2022', 1, 1, 'Orenburg', 'Rigo');
insert into flights(flight_number, flight_time, date, airplane_id, departure_airport_id, city_departure, city_arrival)
values ('KA8281', '10', '19.09.2022', 1, 1, 'Samara', 'Rome');


create table crew (
                      crew_id serial primary key,
                      name varchar(255) check (char_length(name) > 1),
                      type_of_position varchar(100) check (char_length(type_of_position) > 1),
                      airplane_id integer not null,
                      foreign key (airplane_id) references airplane (airplane_id)
);

insert into crew (name, type_of_position, airplane_id)
values (' Kamila Dmitrieva', 'pilot', 1);
insert into crew (name, type_of_position, airplane_id)
values ('Sergei Shamov ', 'pilot', 1);
insert into crew (name, type_of_position, airplane_id)
values ('Valery Novikova', 'pilot', 1);
insert into crew (name, type_of_position, airplane_id)
values ('Danis Yarulin', 'stewardess', 1);
insert into crew (name, type_of_position, airplane_id)
values ('Ivan Ivanov', 'technician', 1);


select * from flights
where flights.flight_duration = (select max(flights.flight_duration) from flights);

select airport_name, count(distinct flight_id) as count_of_flights from flights, airport
where flights.departure_airport_id = airport.airport_id
  and flights.date = ?
group by airport.airport_name;

with t1 as (
    select first_name as firstName, last_name as lastName, sum(flight_duration) as total
    from passengers join flights f on passengers.flight_id = f.flight_id group by first_name, last_name
)
select firstName, lastName, total as hours from t1 where total = (select min(total) from t1)
UNION
select firstName, lastName, total as hours from t1 where total = (select max(total) from t1);

select crew.name, array_agg(flights.city_arrival order by flights.departure_airport_id asc) towndown
from crew
         right join airplane on crew.airplane_id = airplane.airplane_id
         right join flights on flights.airplane_id = airplane.airplane_id
         right join airport on flights.departure_airport_id = airport.airport_id
where type_of_position = 'pilot'
group by crew.name;