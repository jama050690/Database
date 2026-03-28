Create Table users(id Serial Not Null Primary Key,
email Varchar (25)Not Null Unique,
crested_at timestamptz default current_timestamp);

Create Table todos(id Serial Not Null Primary Key,
nane Text,
is_completed Boolean default false,
CREATED_AT timestamptz default current_timestamp,
user_id Integer References users(id) On Delete Cascade);

Alter Table todos ALTER Column name Set Not Null;

---mOCK DATA 
Insert Into users (email) Values ('john.doe@example.com'),('jane.smith@example.com'),('sarah@example.com ');
Insert Into todos (name,user_id)Values ('A1', 1), ('A2', 2), ('A3', 3),('A4',4);
Insert Into todos (name,user_id)Values ('B1', 1), ('B2', 2), ('B3', 3),('B4',4);
Insert Into  todos(name,user_id) Values ('A1',111);

Select t.id todo_id,u.id user_id,t.name,u.email from todos t join users u on t.user_id = u.id;
 
 SELECT t.id AS todo_id, u.id AS user_id, t.name, u.email
FROM todos t
JOIN users u ON t.user_id = u.id
ORDER BY t.name DESC;

Select u.email, 1 as one from users u;
Select count (id) from todos where user_id=1;

Select u.mail,(Select count (id) from todos t where() t.user_id=u.id) as count_of_todos from user u where(Select count (id) from todos t where() t.user_id=u.id) count_of_todos >0 order by couunt_of_todos desc;

Select u.mail,(Select count (id) from todos t where() t.user_id=u.id and t.is_completed=false) as count_of_todos from user u where(Select count (id) from todos t where() t.user_id=u.id) count_of_todos >0 order by couunt_of_todos desc;