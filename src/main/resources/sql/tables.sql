DROP TABLE activityassociation;
DROP TABLE activityproperty; -- must go before activity table to which has a foreign key
DROP TABLE activity;
CREATE TABLE activity (
    activityid int generated always as identity (start with 1, increment by 1),
    name varchar(100),
    created TIMESTAMP,
    constraint activityidpk primary key (activityid)
);
CREATE TABLE activityproperty (
    activitypropertyid int generated always as identity (start with 1, increment by 1),
    activityid int,
    name varchar(100),
    value varchar(255),
    created TIMESTAMP,
    constraint activitypropertyidpk primary key (activitypropertyid),
    constraint activityfk foreign key (activityid) references activity(activityid)
);
CREATE TABLE activityassociation (
    activityassociationid int generated always as identity (start with 1, increment by 1),
    activity1id int,
    activity2id int,
    created TIMESTAMP,
    constraint activityassociationidpk primary key (activityassociationid),
    constraint activity1fk foreign key (activity1id) references activity(activityid),
    constraint activity2fk foreign key (activity2id) references activity(activityid)
);
insert into activity values (default, 'project', current_timestamp);
insert into activity values (default, 'story', current_timestamp);
insert into activity values (default, 'task', current_timestamp);
insert into activity values (default, 'problem', current_timestamp);
insert into activity values (default, 'pause', current_timestamp);


insert into activityproperty values (default, 1, 'name', 'esg04',current_timestamp);
insert into activityproperty values (default, 1, 'description', 'projekt SOA Oracle, BPEL',current_timestamp);
insert into activityproperty values (default, 1, 'start', '25/03/2014',current_timestamp);
insert into activityproperty values (default, 1, 'end', null, current_timestamp);
insert into activityproperty values (default, 3, 'name', 'Bug fix: 138520', current_timestamp);
insert into activityproperty values (default, 3, 'description', ' - Cash Out refund return error', current_timestamp);
insert into activityproperty values (default, 4, 'connectivity', 'Something goes wrong with server connection.', current_timestamp);
insert into activityproperty values (default, 4, 'placek fault fixed', 'Sławek fixed that.', current_timestamp);

insert into ACTIVITYASSOCIATION values (default, 1, 2, current_timestamp);
insert into ACTIVITYASSOCIATION values (default, 2, 3, current_timestamp);
insert into ACTIVITYASSOCIATION values (default, 3, 4, current_timestamp);

select * from activity o join activityproperty op on op.activityid=o.activityid;

select * from ACTIVITYPROPERTY where "VALUE" like 'es%';
