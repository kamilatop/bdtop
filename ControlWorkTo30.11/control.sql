create table company_structure(
                                  id int primary key ,
                                  branch varchar(100),
                                  town varchar(100)
);

insert into company_structure (id,branch,town)
values ('1','bank_1','Kazan'),
       ('2','bank_2','Moscow'),
       ('3','bank_3','Ufa'),
       ('4','bank_4','Ryazan'),
       ('5','bank_5','Naberezhnye');


create table client(
                       id int primary key,
                       name varchar(100),
                       phone varchar(100),
                       document_number varchar(100),
                       address varchar(100)
);


insert into client(id, name, phone, document_number, address)
values ('1','Kamila Dmitrieva Timurovna','89503226768', '6436283811', 'Zorge, 47'),
       ('2','Mark Kirov Pavlovich','89361847284', '9282238929', 'Kuznecova, 19'),
       ('3','Adelya Moginova Aidarovna','89463856294', '2818328882', 'Dostoevskogo, 23'),
       ('4','Denis Stasuk Konstatinovich','89348463574', '8823293923', 'Popova, 17'),
       ('5','Airat Sokolov Markovich','89632578462', '7783897264', 'Titova, 109');


create table loans(
                      id int primary key,
                      client_id int,
                      company_id int,
                      quantity int,
                      constraint client_id_fk foreign key(client_id)
                          references client(id),
                      constraint company_id_fk foreign key(company_id)
                          references company_structure(id)

);

insert into loans (id,client_id,company_id,quantity)
values ('1','1','1','10000'),
       ('2','2','2','50000'),
       ('3','3','3','50060'),
       ('4','4','4','20000'),
       ('5','5','5','150000');




create table payment(
                        loan_id int ,
                        deadline date,
                        reg_date date,
                        loan_sum decimal,
                        paid_sum decimal,
                        constraint loan_id_fk foreign key(loan_id)
                            references loans(id)
);

insert into payment (loan_id,deadline,reg_date,loan_sum,paid_sum)
values ('1','10.04.2023','30.11.2022','10000','926'),
       ('2','11.04.2023','30.11.2021','50000','4600'),
       ('3','12.04.2023','30.11.2020','50060','50000'),
       ('4','13.04.2023','25.10.2022','20.000','100000'),
       ('5','14.04.2023','06.09.2022','150.000','1000000');

===============================
3)
select client.id,client.name,client.phone,client.address,loans.quantity,
       payment.deadline,payment.reg_date
from client join loans on client.id=loans.id
            join payment on loans.id = payment.loan_id;

4)
select company_structure.id,company_structure.branch,company_structure.town,
       payment.deadline,payment.reg_date,payment.loan_sum
from company_structure join loans on company_structure.id=loans.company_id
                       join payment on loans.id=payment.loan_id
where company_structure.id='5';

5)
select client.id,client.name,client.phone,client.address,loans.quantity,
       payment.deadline,payment.reg_date,payment.loan_sum
from client join loans on client.id=loans.client_id
            join payment on loans.id=payment.loan_id
where payment.loan_id='4';
