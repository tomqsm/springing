DROP SEQUENCE IF EXISTS lf.users_seq;
DROP TABLE IF EXISTS lf.users CASCADE;

CREATE SEQUENCE lf.users_seq START 1;
CREATE TABLE lf.users(
	id integer constraint users_primary PRIMARY KEY DEFAULT nextval('lf.users_seq'),
	fname varchar(40)
);
INSERT INTO lf.users VALUES(default,'Tomasz');
INSERT INTO lf.users VALUES(default,'Józef');
INSERT INTO lf.users VALUES(default,'Andrzej');
INSERT INTO lf.users VALUES(default,'Jarek');