CREATE TABLE users (user_id bigint(10), group_id bigint(10),
user_name varCHAR(100)
);

CREATE TABLE grp (group_id bigint(10),
group_name varCHAR(100)
);

drop table rooms;
CREATE TABLE rooms (room_id bigint(10), group_id bigint(10),
room_name varCHAR(100)
);

INSERT INTO users
VALUES (1,1,'Modesto');
INSERT INTO users
VALUES (2,1,'Ayine');
INSERT INTO users
VALUES (3,2,'Christopher');
INSERT INTO users
VALUES (4,2,'Cheong woo');
INSERT INTO users
VALUES (5,3,'Saulat');
INSERT INTO users
VALUES (6,null,'Heidy');

INSERT INTO grp
VALUES (1,'IT');
INSERT INTO grp
VALUES (2,'Sales');
INSERT INTO grp
VALUES (3,'Administration');
INSERT INTO grp
VALUES (4,'Operations');

INSERT INTO rooms
VALUES (1,1,'101');
INSERT INTO rooms
VALUES (2,1,'102');
INSERT INTO rooms
VALUES (2,2,'102');
INSERT INTO rooms
VALUES (3,2,'Auditorium A');
INSERT INTO rooms
VALUES (4,null,'Auditorium B');

#All groups, and the users in each group. A group should appear even if there are no users assigned to the group.

select grp.*, users.user_name from grp left join users on users.group_id = grp.group_id;

# All rooms, and the groups assigned to each room. The rooms should appear even if no groups have been
#assigned to them.

select rooms.*, group_name from rooms left join grp on rooms.group_id = grp.group_id;

#A list of users, the groups that they belong to, and the rooms to which they are assigned. This should be sorted
#alphabetically by user, then by group, then by room.


select users.*, grp.group_name, rooms.room_name 
from users 
left join grp on grp.group_id = users.group_id
left join rooms on rooms.group_id = grp.group_id
order by user_name asc, group_name asc, room_name asc;
