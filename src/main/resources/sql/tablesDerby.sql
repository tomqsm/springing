drop table "USERS";
drop table prices;
CREATE TABLE USERS(
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1) CONSTRAINT users_pk PRIMARY KEY,
    fname VARCHAR(100) DEFAULT NULL,
    lname VARCHAR(100) DEFAULT NULL,
    inserted TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE prices(
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1) CONSTRAINT person_pk PRIMARY KEY,
    service VARCHAR(100) DEFAULT NULL,
    unit VARCHAR(100) DEFAULT NULL,
    priceMin double DEFAULT 0,
    priceMax double DEFAULT 0,
    inserted TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IPLOGS(
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1) CONSTRAINT iplogs_pk PRIMARY KEY,
    ip VARCHAR(100) DEFAULT NULL,
    url VARCHAR(100) DEFAULT NULL,
    inserted TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
insert into IPLOGS values (DEFAULT, '1.2.3.4', '/lukasfloor', DEFAULT);
insert into USERS values (DEFAULT, 'Łukasz', 'Dożak', DEFAULT);
insert into prices values (DEFAULT, 'Czyszczenie podłogi', 'metr^2',DEFAULT, 14, DEFAULT);
insert into prices values (DEFAULT, 'Szlifowanie, polerowanie, trzykrotne malowanie.', 'metr^2', DEFAULT, 30, DEFAULT);
insert into prices values (DEFAULT, 'Szlifowanie wylewki, gruntowanie ukladanie parkietu, cyklinowanie lakierowanie.', 'metr^2', 45, 55, DEFAULT);
insert into prices values (DEFAULT, 'Szlifowanie farby olejnej z desek parkietu.', 'metr^2', DEFAULT, 40, DEFAULT);
insert into prices values (DEFAULT, 'Układanie parkietu, mozaiki.', 'metr^2', DEFAULT, 20, DEFAULT);
insert into prices values (DEFAULT, 'Układanie parietu gotowego.', 'metr^2', 25, 35, DEFAULT);
insert into prices values (DEFAULT, 'Układanie deski barlineckiej.', 'metr^2', 20, 25, DEFAULT);
insert into prices values (DEFAULT, 'Szlifowanie parkietu bez lakierowania.', 'metr^2', 15, 17, DEFAULT);
insert into prices values (DEFAULT, 'Układanie paneli podlogowych.', 'metr^2', 15, 20, DEFAULT);
insert into prices values (DEFAULT, 'Układanie desek na legarach.', 'metr^2', 20, 25, DEFAULT);
insert into prices values (DEFAULT, 'Układanie płyt OSB na legarach.', 'metr^2', 10, 15, DEFAULT);
insert into prices values (DEFAULT, 'Montaż legarów.', 'metr^2', 7, 9, DEFAULT);
insert into prices values (DEFAULT, 'Montaż listew.', 'metr', DEFAULT, 5, DEFAULT);
insert into prices values (DEFAULT, 'Montaż cokołów.', 'metr', 7, 12, DEFAULT);
insert into prices values (DEFAULT, 'Montaż progów.', 'sztuka', 20, 30, DEFAULT);
insert into prices values (DEFAULT, 'Dokladane przycinanie parkietu mozaiki, paneli itp do korka, płytek.', 'metr', DEFAULT, 15, DEFAULT);
insert into prices values (DEFAULT, 'Dokladanie przycinanie parkietu mozaiki paneli itp po łuku.', 'metr', DEFAULT, 25, DEFAULT);
insert into prices values (DEFAULT, 'Podcinanie drzwi.', 'sztuka', 15, 25, DEFAULT);
insert into prices values (DEFAULT, 'Szpachlowanie ubytków w podłodze.', 'metr^2', DEFAULT, 5, DEFAULT);
insert into prices values (DEFAULT, 'Szlifowanie czyszczenie wylewki, gruntowanie wylewki pod parkiet mozaike.', 'metr^2', 4, 6, DEFAULT);
insert into prices values (DEFAULT, 'Dodatkowe malowanie.', 'metr^2', 3, 4, DEFAULT);
insert into prices values (DEFAULT, 'Pomiar wilgotnosci wylewki. Pierwszy punkt 40 PLN.', 'punkt', DEFAULT, 15, DEFAULT);
insert into prices values (DEFAULT, 'Konserwacjia podlogi olejowanej lub woskowanej.', 'metr^2', 8, 10, DEFAULT);
insert into prices values (DEFAULT, 'Zrywanie starej wykładziny.', 'metr^2', DEFAULT, 5, DEFAULT);
insert into prices values (DEFAULT, 'Zrywanie parkietu. Do uzgodnienia.', 'metr^2', DEFAULT, 7, DEFAULT);
