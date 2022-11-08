
create table taxicab(
                        driver_id int,
                        first_name_driver varchar(128) not null,
                        last_name_driver varchar(128)not null,
                        birthdate_driver date,
                        phone_driver varchar(15),
                        experince_driver int,
                        driving_licence_number varchar(128),
                        constraint driver_id primary key (driver_id)
);
INSERT INTO taxicab(driver_id,first_name_driver,last_name_driver,birthdate_driver,phone_driver,experince_driver,driving_licence_number)
VALUES('1', 'Камила','Дмитриева','09.06.2002','+7988825500','10','h4870762'),
      ('2', 'АНна','Дмитриева','09.06.2002','+7988825500','10','h4870762'),
      ('3', 'Ира','Дмитриева','09.06.2002','+7988825500','10','k4870762'),
      ('4', 'Мила','Дмитриева','09.06.2002','+7988825500','10','g4870762'),
      ('5', 'Ралина','Дмитриева','09.06.2002','+7988825500','9','f4870762'),
      ('6', 'Валерия','Дмитриева','09.06.2002','+7988825500','2','hb4870762'),
      ('7', 'Алина','Дмитриева','09.06.2002','+7988825500','4','h4870762'),
      ('8', 'Людмила','Дмитриева','09.06.2002','+7988825500','3','hv4870762'),
      ('9', 'Настасья','Дмитриева','09.06.2002','+7988825500','7','fh4870762'),
      ('10', 'Гульназ','Дмитриева','09.06.2002','+7988825500','8','hb4870762');

CREATE MATERIALIZED VIEW taxicab_mv AS SELECT * FROM taxicab;
SELECT * from taxicab_mv

CREATE MATERIALIZED VIEW experince_driver_mv AS SELECT driver_id,first_name_driver,last_name_driver,experince_driver,driving_licence_number FROM taxicab WHERE experince_driver = '10';
SELECT * from experince_driver_mv

CREATE MATERIALIZED VIEW first_name_driver_mv AS SELECT driver_id,first_name_driver,last_name_driver,birthdate_driver FROM taxicab WHERE first_name_driver = 'Камила';
SELECT * from first_name_driver_mv
    ========================
## Заметки
--1
REFRESH MATERIALIZED VIEW taxicab_mv;
--2
REFRESH MATERIALIZED VIEW experince_driver_mv;
=============
--3
REFRESH MATERIALIZED VIEW first_name_driver_mv;