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
insert into USERS values (DEFAULT, 'Łukasz', 'Dożak', DEFAULT);
insert into prices values (DEFAULT, 'Czyszczenie podłogi', 'metr kwad.',DEFAULT, 14, DEFAULT);
insert into prices values (DEFAULT, 'Szlifowanie, polerowanie, trzykrotne malowanie', 'metr kwad.', DEFAULT, 30, DEFAULT);
insert into prices values (DEFAULT, 'Szlifowanie wylewki + gruntowanie ukladanie parkietu, cyklinowanie lakierowanie', 'metr kwad.', DEFAULT, 45, DEFAULT);
insert into prices values (DEFAULT, 'Szlifowanie farby olejnej z desek parkietu', 'metr kwad.', DEFAULT, 40, DEFAULT);
insert into prices values (DEFAULT, 'Ukladanie parkietu, mozaiki.', 'metr kwad.', DEFAULT, 20, DEFAULT);
insert into prices values (DEFAULT, 'Układanie parietu gotowego.', 'metr kwad.', DEFAULT, 25, DEFAULT);
insert into prices values (DEFAULT, 'Ukladanie deski barlineckiej.', 'metr kwad.', DEFAULT, 20, DEFAULT);
insert into prices values (DEFAULT, 'Szlifowanie parkietu bez lakierowania.', 'metr kwad.', DEFAULT, 15, DEFAULT);
insert into prices values (DEFAULT, 'Układanie paneli podlogowych.', 'metr kwad.', DEFAULT, 15, DEFAULT);
insert into prices values (DEFAULT, 'Ukladanie desek na legarach.', 'metr kwad.', DEFAULT, 20, DEFAULT);
insert into prices values (DEFAULT, 'Układanie płyt OSB na legarach.', 'metr kwad.', DEFAULT, 10, DEFAULT);
insert into prices values (DEFAULT, 'Montaż legarów.', 'metr kwad.', DEFAULT, 10, DEFAULT);
insert into prices values (DEFAULT, 'Montaż listew.', 'metr', DEFAULT, 5, DEFAULT);
insert into prices values (DEFAULT, 'Montaż cokołów.', 'metr', DEFAULT, 7, DEFAULT);
insert into prices values (DEFAULT, 'Montaż progów.', 'sztuka', DEFAULT, 20, DEFAULT);
insert into prices values (DEFAULT, 'Dokladane przycinanie parkietu mozaiki, paneli itp do korka, plytek.', 'metr', DEFAULT, 15, DEFAULT);
insert into prices values (DEFAULT, 'Dokladanie przycinanie parkietu mozaiki paneli itp po łuku.', 'metr bieżący', DEFAULT, 25, DEFAULT);
insert into prices values (DEFAULT, 'Podcinanie drzwi.', 'sztuka', DEFAULT, 15, DEFAULT);
insert into prices values (DEFAULT, 'Szpachlowanie ubytków w podłodze.', 'metr kwadr.', DEFAULT, 5, DEFAULT);
insert into prices values (DEFAULT, 'Szlifowanie czyszczenie wylewki, gruntowanie wylewki pod parkiet mozaike.', 'metr kwadr.', DEFAULT, 4, DEFAULT);
insert into prices values (DEFAULT, 'Dodatkowe malowanie.', 'metr kwadr.', DEFAULT, 3, DEFAULT);
insert into prices values (DEFAULT, 'Pomiar wilgotnosci wylewki. Pierwszy punkt 40 PLN.', 'punkt', DEFAULT, 15, DEFAULT);
insert into prices values (DEFAULT, 'Konserwacjia podlogi olejowanej lub woskowanej.', 'metr kwad.', DEFAULT, 8, DEFAULT);
insert into prices values (DEFAULT, 'Zrywanie starej wykladziny.', 'metr kwad.', DEFAULT, 5, DEFAULT);
insert into prices values (DEFAULT, 'Zrywanie parkietu. Do uzgodnienia.', 'metr kwad.', DEFAULT, 7, DEFAULT);
