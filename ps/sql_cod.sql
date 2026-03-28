Create Table users(id Serial Not Null Primary Key,
email Varchar (25)Not Null Unique,
crested_at timestamptz default current_timestamp);

Create Table todos(id Serial Not Null Primary Key,
name Text,
is_completed Boolean default false,
CREATED_AT timestamptz default current_timestamp,
user_id Integer References users(id) On Delete Cascade);

Alter Table todos ALTER Column name Set Not Null;

---mOCK DATA 
Insert Into users (email) Values ('john.doe@example.com'),('jane.smith@example.com'),('sarah@example.com ');
Insert Into todos (name,user_id)Values ('A1', 1), ('A2', 2), ('A3', 3);
Insert Into todos (name,user_id)Values ('B1', 1), ('B2', 2), ('B3', 3);
Insert Into  todos(name,user_id) Values ('C1',111),('C2',112),('C3',113);

UPDATE todos
SET is_completed = true
WHERE id IN (1, 2, 3, 4);
Select u.email,(Select count (id) from todos t where() t.user_id=u.id and t.is_completed=false) as count_of_todos from user u where(Select count (id) from todos t where() t.user_id=u.id) count_of_todos >0 order by couunt_of_todos desc;

SELECT
    COUNT(*) AS jami_vazifa,
    COUNT(CASE WHEN is_completed = true THEN 1 END) AS bajarildi,
    COUNT(CASE WHEN is_completed = false THEN 1 END) AS bajarilmadi,
    ROUND(
        COUNT(CASE WHEN is_completed = true THEN 1 END) * 100.0 / COUNT(*),
        2
    ) AS bajarilgan_foiz
FROM todos;


SELECT
    u.id AS user_id,
    u.email,
    COUNT(t.id) AS jami_vazifa,
    COUNT(CASE WHEN t.is_completed = true THEN 1 END) AS bajarildi,
    COUNT(CASE WHEN t.is_completed = false THEN 1 END) AS bajarilmadi,
    ROUND(
        COUNT(CASE WHEN t.is_completed = true THEN 1 END) * 100.0 / COUNT(t.id),
        2
    ) AS bajarilgan_foiz
FROM users u
LEFT JOIN todos t ON t.user_id = u.id
GROUP BY u.id, u.email
ORDER BY bajarilgan_foiz DESC;
