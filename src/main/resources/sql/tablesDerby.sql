CREATE TABLE person(
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1) CONSTRAINT person_pk PRIMARY KEY,
    firstName VARCHAR(100) DEFAULT NULL,
    lastName VARCHAR(100) DEFAULT NULL,
    create_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
insert into person values (DEFAULT, 'Tomasz', 'Kuśmierczyk', DEFAULT);
drop table person;
select * from person;