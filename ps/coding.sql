Create Table users(id Serial Not Null Primary Key,
email Varchar (25)Not Null Unique,
crested_at timestamptz default current_timestamp);

Create Table todos(id Serial Not Null Primary Key,
nane Text,
is_completed Boolean default false,
CREATED_AT timestamptz default current_timestamp,
user_id Integer References users(id) On Delete Cascade);