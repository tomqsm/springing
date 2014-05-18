DROP TABLE IF EXISTS lf.users CASCADE;
DROP SEQUENCE IF EXISTS lf.users_seq;

CREATE SEQUENCE lf.users_seq START 1;
CREATE TABLE lf.users(
	id integer constraint users_primary PRIMARY KEY DEFAULT nextval('lf.users_seq'),
	fname varchar(40),
        lname varchar(40),
        inserted timestamp
);
-- http://stackoverflow.com/questions/15530899/insert-statement-in-postgres-for-data-type-timestamp-without-time-zone-not-null
ALTER TABLE lf.users ALTER inserted set default now();

INSERT INTO lf.users VALUES(default,'Tomasz', 'Jarzębski');
INSERT INTO lf.users VALUES(default,'Józef', 'Żabiński');
INSERT INTO lf.users VALUES(default,'Andrzej', 'Stefański');
INSERT INTO lf.users VALUES(default,'Jarek', 'Kuźmiński');
-- user may change their name and you want to keep history of those changes