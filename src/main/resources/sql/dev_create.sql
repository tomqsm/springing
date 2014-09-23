DROP TABLE IF EXISTS activities_associations;
DROP TABLE IF EXISTS activities;
DROP TABLE IF EXISTS types;
DROP TABLE IF EXISTS running;
DROP TABLE IF EXISTS history;
DROP TRIGGER IF EXISTS triggername;

CREATE TABLE types (
id INTEGER PRIMARY KEY AUTOINCREMENT,
name VARCHAR(25)
);

CREATE TABLE activities (
id INTEGER PRIMARY KEY AUTOINCREMENT,
type_id INTEGER,
name VARCHAR(25),
FOREIGN KEY(type_id) REFERENCES types(id) ON DELETE NO ACTION
);

INSERT INTO types VALUES (null, 'project');
INSERT INTO types VALUES (null, 'stage');
INSERT INTO types VALUES (null, 'story');
INSERT INTO types VALUES (null, 'task');

-- adding projects
INSERT INTO activities VALUES (null, 1, 'tomtom');
INSERT INTO activities VALUES (null, 1, 'letsweb');

-- adding stages
INSERT INTO activities VALUES (null, 2, 'documentation');
INSERT INTO activities VALUES (null, 2, 'implementation');
INSERT INTO activities VALUES (null, 2, 'design');
INSERT INTO activities VALUES (null, 2, 'pause'); --6
SELECT a.id, a."name" FROM activities a WHERE a.type_id = (SELECT id FROM types WHERE name='stage');
SELECT a.id, a."name", t."name" AS 'type' FROM activities a JOIN types t ON a.type_id=t.id WHERE a.id=1;

-- adding stories
INSERT INTO activities VALUES (null, 3, 'story setting-up'); --7
INSERT INTO activities VALUES (null, 3, 'story fixing bug 123'); --8
INSERT INTO activities VALUES (null, 3, 'story fixing bug 456'); --9
SELECT a.id AS 'activity_id' FROM activities a WHERE a.type_id = (SELECT id FROM types WHERE name='story');

-- adding tasks
INSERT INTO activities VALUES (null, 4, 'task added try catch'); --10
INSERT INTO activities VALUES (null, 4, 'task replaced dependency'); --11
INSERT INTO activities VALUES (null, 4, 'task made a commit'); --12
SELECT a.id AS 'activity_id' FROM activities a WHERE a.type_id = (SELECT id FROM types WHERE name='task');


CREATE TABLE activities_associations (
id INTEGER PRIMARY KEY AUTOINCREMENT,
activity_id INTEGER,
sub_activity_id INTEGER,
FOREIGN KEY(activity_id) REFERENCES activities(id) ON DELETE CASCADE,
FOREIGN KEY(sub_activity_id) REFERENCES activities(id) ON DELETE CASCADE
);
-- findRecentByProjectId
-- findRecentProject
-- findPrevious
CREATE TABLE history (
id INTEGER PRIMARY KEY AUTOINCREMENT,
project_id INTEGER,
activities_associations_id INTEGER,
stage_id INTEGER,
time_stamp DATETIME DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY(stage_id) REFERENCES activities(id) ON DELETE CASCADE
FOREIGN KEY(project_id) REFERENCES activities(id) ON DELETE CASCADE
FOREIGN KEY(activities_associations_id) REFERENCES activities_associations(id) ON DELETE CASCADE
);

-- associating project has stage
INSERT INTO activities_associations VALUES (null, (SELECT id FROM activities WHERE name='tomtom'), (SELECT id FROM activities WHERE name='documentation'));
INSERT INTO activities_associations VALUES (null, (SELECT id FROM activities WHERE name='tomtom'), (SELECT id FROM activities WHERE name='design'));
INSERT INTO activities_associations VALUES (null, (SELECT id FROM activities WHERE name='tomtom'), (SELECT id FROM activities WHERE name='implementation'));
INSERT INTO activities_associations VALUES (null, (SELECT id FROM activities WHERE name='letsweb'), (SELECT id FROM activities WHERE name='implementation'));

-- associating project has story
INSERT INTO activities_associations VALUES (null, (SELECT id FROM activities WHERE name='tomtom'), 7);
INSERT INTO activities_associations VALUES (null, (SELECT id FROM activities WHERE name='tomtom'), 8);
INSERT INTO activities_associations VALUES (null, (SELECT id FROM activities WHERE name='tomtom'), 9);
INSERT INTO activities_associations VALUES (null, (SELECT id FROM activities WHERE name='letsweb'), 9);

-- associating story has task
INSERT INTO activities_associations VALUES (null, 7, 9);
INSERT INTO activities_associations VALUES (null, 7, 10);
INSERT INTO activities_associations VALUES (null, 9, 10);
INSERT INTO activities_associations VALUES (null, 7, 12);
INSERT INTO activities_associations VALUES (null, 8, 9);
INSERT INTO activities_associations VALUES (null, 12, 6);
INSERT INTO activities_associations VALUES (null, 10, 6);
INSERT INTO activities_associations VALUES (null, 10, 5);

-- associating story has stage
INSERT INTO activities_associations VALUES (null, 7, (SELECT id FROM activities WHERE name='documentation'));


-- make history id|project_id|activities_associations_is|time_stamp
INSERT INTO history VALUES(null, 1, 12, 5, datetime('now', 'localtime'));

-- find stages associated with tomtom
SELECT a.name FROM activities a JOIN activities_associations aa ON aa.sub_activity_id = a.id WHERE aa.sub_activity_id IN (SELECT ac.id FROM activities ac WHERE ac.type_id = (SELECT id FROM types WHERE name='stage')) AND aa.activity_id=(SELECT id FROM activities WHERE name='tomtom');

-- find stories associated with tomtom (story can belong to only one project)
SELECT a.id, a."name", t."name" AS 'type' FROM activities a JOIN activities_associations aa ON aa.sub_activity_id = a.id JOIN types t ON a.type_id = t.id WHERE aa.sub_activity_id IN (SELECT a.id FROM activities a WHERE a.type_id = (SELECT id FROM types WHERE name='story')) AND aa.activity_id=(SELECT id FROM activities WHERE name='tomtom');

-- find tasks associated with story 'setting-up' (nr 7)
SELECT a.name, a.id, t."name" AS 'type' FROM activities a JOIN activities_associations aa ON aa.sub_activity_id = a.id JOIN types t ON a.type_id = t.id WHERE aa.sub_activity_id IN (SELECT a.id FROM activities a WHERE a.type_id IN (SELECT id FROM types WHERE name IN ('task','stage'))) AND aa.activity_id=7;

-- find tasks associated with story nr 7, last 3 of them
SELECT a.id, a.name FROM activities a JOIN activities_associations aa ON aa.sub_activity_id = a.id WHERE aa.sub_activity_id IN (SELECT a.id FROM activities a WHERE a.type_id = (SELECT id FROM types WHERE name='task')) AND aa.activity_id=7 ORDER BY a.id DESC LIMIT 3;
SELECT * FROM activities_associations aa WHERE aa.sub_activity_id=6 AND aa.activity_id=12;

-- find project by task id = 10
    -- find story having this task id = 10
SELECT a."name", a.id, t."name" AS 'type' FROM activities a JOIN activities_associations aa ON a.id = aa.activity_id JOIN types t ON a.type_id = t.id WHERE aa.sub_activity_id = 10;
        -- find just story id
SELECT a.id FROM activities a JOIN activities_associations aa ON a.id = aa.activity_id JOIN types t ON a.type_id = t.id WHERE aa.sub_activity_id = 10;
            -- task should have type task boolean isTask()
            SELECT t."name" AS 'type' FROM types t JOIN activities a ON a.type_id = t.id WHERE a.id = 10;
            -- task should belong to just one story check: count < 1 boolean isSingular()
            SELECT COUNT(a.id) FROM activities a JOIN activities_associations aa ON a.id = aa.activity_id JOIN types t ON a.type_id = t.id WHERE aa.sub_activity_id = 10;
                -- debug: this task is present in: String debugTaskSingularityFailure()
                SELECT a.id FROM activities a JOIN activities_associations aa ON a.id = aa.activity_id JOIN types t ON a.type_id = t.id WHERE aa.sub_activity_id = 10;
    -- find project having this story
SELECT a."name", a.id, t."name" AS 'type' FROM activities a JOIN activities_associations aa ON a.id = aa.activity_id JOIN types t ON a.type_id = t.id WHERE aa.sub_activity_id = (SELECT a.id FROM activities a JOIN activities_associations aa ON a.id = aa.activity_id JOIN types t ON a.type_id = t.id WHERE aa.sub_activity_id = 12);



-- findRecentByProjectId
SELECT aa.activity_id, aa.sub_activity_id FROM history h JOIN activities_associations aa ON h.activities_associations_id=aa.id WHERE h.time_stamp = (SELECT MAX(time_stamp) FROM history WHERE project_id=1);

-- findRecentSubActivity
SELECT * FROM activities WHERE id = (SELECT aa.sub_activity_id FROM history h JOIN activities_associations aa ON h.activities_associations_id=aa.id WHERE h.time_stamp = (SELECT MAX(time_stamp) FROM history));
-- findRecentActivity
SELECT * FROM activities WHERE id = (SELECT aa.activity_id FROM history h JOIN activities_associations aa ON h.activities_associations_id=aa.id WHERE h.time_stamp = (SELECT MAX(time_stamp) FROM history));

-- findRecentActivity
SELECT h.project_id AS 'project', aa.activity_id AS 'story', aa.sub_activity_id AS 'task', h.stage_id AS 'stage' FROM history h JOIN activities_associations aa ON h.activities_associations_id=aa.id WHERE h.time_stamp = (SELECT MAX(time_stamp) FROM history);
    -- recent toString
    SELECT (SELECT name FROM activities WHERE id=h.project_id) AS 'project', (SELECT a."name" WHERE a.id=aa.activity_id) AS 'story', (SELECT name from activities WHERE id=aa.sub_activity_id) AS 'task', (SELECT name from activities WHERE id=h.stage_id) AS 'stage' FROM history h JOIN activities_associations aa ON h.activities_associations_id=aa.id JOIN activities a ON a.id=aa.activity_id WHERE h.time_stamp = (SELECT MAX(time_stamp) FROM history);

INSERT INTO history VALUES(null, 1, 12, 6, datetime('now', 'localtime'));
-- addition of new association should trigger a record in history
-- perhaps history should be linked to association rather than activity ? //TODO
