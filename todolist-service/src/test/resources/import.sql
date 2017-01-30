-- TASKS STATUS
INSERT INTO tasks_status(name) VALUES ('STARTED');
INSERT INTO tasks_status(name) VALUES ('FINISHED');
INSERT INTO tasks_status(name) VALUES ('ARCHIVED');
INSERT INTO tasks_status(name) VALUES ('DELEGATION_PENDING');
INSERT INTO tasks_status(name) VALUES ('DELEGATED');

-- TASKS
INSERT INTO tasks(name, id_task_status, closedDate, beginDate) VALUES ('Sarah Connor', 1, NULL, DATE '2017-1-30');
INSERT INTO tasks(name, id_task_status, closedDate, beginDate) VALUES ('StartedTask', 1, NULL, DATE '2017-1-21');
INSERT INTO tasks(name, id_task_status, closedDate, beginDate) VALUES ('TerminatedTask', 2, DATE '2016-8-10', DATE '2017-1-21');

-- USERS
INSERT INTO users(name) VALUES('userTest');
INSERT INTO users(name) VALUES('delegateUser');

-- TASKS OWNERS
INSERT INTO tasks_owners(id_task, id_user, id_task_owner, creator) VALUES(1, 2, 2, 3);
INSERT INTO tasks_owners(id_task, id_user, id_task_owner, creator) VALUES(2, 3, 3, 3);
INSERT INTO tasks_owners(id_task, id_user, id_task_owner, creator) VALUES(3, 4, 4, 3);