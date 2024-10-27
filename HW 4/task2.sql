Last login: Sun Oct 27 14:46:23 on ttys000
(base) hassan@Hassans-MBP ~ % mysql -u root -p
Enter password: 
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)
(base) hassan@Hassans-MBP ~ % mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 18
Server version: 9.1.0 MySQL Community Server - GPL

Copyright (c) 2000, 2018, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> SHOW TABLES;
ERROR 1046 (3D000): No database selected
mysql> USE pet_database;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> SHOW TABLES;
+------------------------+
| Tables_in_pet_database |
+------------------------+
| petEvent               |
| petPet                 |
+------------------------+
2 rows in set (0.01 sec)

mysql> DESCRIBE petPet;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| petname | varchar(20) | NO   | PRI | NULL    |       |
| owner   | varchar(45) | YES  |     | NULL    |       |
| species | char(1)     | YES  |     | NULL    |       |
| gender  | char(1)     | YES  |     | NULL    |       |
| birth   | date        | YES  |     | NULL    |       |
| death   | date        | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
6 rows in set (0.05 sec)

mysql> DESCRIBE petEvent;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| petname   | varchar(20)  | NO   | PRI | NULL    |       |
| eventdate | date         | NO   | PRI | NULL    |       |
| eventtype | varchar(15)  | YES  |     | NULL    |       |
| remark    | varchar(255) | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

mysql> INSERT INTO petPet 
    -> VALUES
    ->     ("Fluffy", "Harold", "cat", "F", "1993-02-04", NULL),
    ->     ("Claws", "Gwen", "cat", "M", "1994-03-17", NULL),
    ->     ("Buffy", "Harold", "dog", "F", "1989-05-13", NULL),
    ->     ("Fang", "Benny", "dog", "M", "1990-08-27", NULL),
    ->     ("Bowser", "Diane", "dog", "M", "1979-08-31", "1995-07-29"),
    ->     ("Chirpy", "Gwen", "bird", "F", "1998-09-11", NULL),
    ->     ("Whistler", "Gwen", "bird", NULL, "1997-12-09", NULL),
    ->     ("Slim", "Benny", "snake", "M", "1996-04-29", NULL),
    ->     ('Puffball', 'Diane', 'hamster', 'F', '1999-03-30', NULL);
ERROR 1406 (22001): Data too long for column 'species' at row 1
mysql> ALTER TABLE petPet MODIFY species VARCHAR(20);
Query OK, 0 rows affected (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> INSERT INTO petPet 
    ->     -> VALUES
    ->     ->     ("Fluffy", "Harold", "cat", "F", "1993-02-04", NULL),
    ->     ->     ("Claws", "Gwen", "cat", "M", "1994-03-17", NULL),
    ->     ->     ("Buffy", "Harold", "dog", "F", "1989-05-13", NULL),
    ->     ->     ("Fang", "Benny", "dog", "M", "1990-08-27", NULL),
    ->     ->     ("Bowser", "Diane", "dog", "M", "1979-08-31", "1995-07-29"),
    ->     ->     ("Chirpy", "Gwen", "bird", "F", "1998-09-11", NULL),
    ->     ->     ("Whistler", "Gwen", "bird", NULL, "1997-12-09", NULL),
    ->     ->     ("Slim", "Benny", "snake", "M", "1996-04-29", NULL),
    ->     ->     ('Puffball', 'Diane', 'hamster', 'F', '1999-03-30', NULL);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '-> VALUES
    ->     ("Fluffy", "Harold", "cat", "F", "1993-02-04", NULL),
    -' at line 2
mysql> INSERT INTO petPet 
    -> VALUES
    ->     ("Fluffy", "Harold", "cat", "F", "1993-02-04", NULL),
    ->     ("Claws", "Gwen", "cat", "M", "1994-03-17", NULL),
    ->     ("Buffy", "Harold", "dog", "F", "1989-05-13", NULL),
    ->     ("Fang", "Benny", "dog", "M", "1990-08-27", NULL),
    ->     ("Bowser", "Diane", "dog", "M", "1979-08-31", "1995-07-29"),
    ->     ("Chirpy", "Gwen", "bird", "F", "1998-09-11", NULL),
    ->     ("Whistler", "Gwen", "bird", NULL, "1997-12-09", NULL),
    ->     ("Slim", "Benny", "snake", "M", "1996-04-29", NULL),
    ->     ("Puffball", "Diane", "hamster", "F", "1999-03-30", NULL);
ERROR 3819 (HY000): Check constraint 'petpet_chk_1' is violated.
mysql> INSERT INTO petPet 
    -> VALUES
    ->     ("Fluffy", "Harold", "cat", "F", "1993-02-04", NULL),  -- Valid
    ->     ("Claws", "Gwen", "cat", "M", "1994-03-17", NULL),    -- Valid
    ->     ("Buffy", "Harold", "dog", "F", "1989-05-13", NULL),  -- Valid
    ->     ("Fang", "Benny", "dog", "M", "1990-08-27", NULL),    -- Valid
    ->     ("Bowser", "Diane", "dog", "M", "1979-08-31", "1995-07-29"),  -- Valid
    ->     ("Chirpy", "Gwen", "bird", "F", "1998-09-11", NULL),  -- Valid
    ->     ("Whistler", "Gwen", "bird", "M", "1997-12-09", NULL),  -- Changed NULL to 'M'
    ->     ("Slim", "Benny", "snake", "M", "1996-04-29", NULL),   -- Valid
    ->     ("Puffball", "Diane", "hamster", "F", "1999-03-30", NULL); -- Valid
ERROR 3819 (HY000): Check constraint 'petpet_chk_1' is violated.
mysql> INSERT INTO petPet VALUES
    ->     ("Fluffy", "Harold", "cat", "F", "1993-02-04", NULL),
    ->     ("Claws", "Gwen", "cat", "M", "1994-03-17", NULL),
    ->     ("Buffy", "Harold", "dog", "F", "1989-05-13", NULL),
    ->     ("Fang", "Benny", "dog", "M", "1990-08-27", NULL),
    ->     ("Bowser", "Diane", "dog", "M", "1979-08-31", "1995-07-29"),
    ->     ("Chirpy", "Gwen", "bird", "F", "1998-09-11", NULL),
    ->     ("Whistler", "Gwen", "bird", NULL, "1997-12-09", NULL),
    ->     ("Slim", "Benny", "snake", "M", "1996-04-29", NULL),
    ->     ('Puffball','Diane','hamster','F','1999-03-30',NULL);
ERROR 3819 (HY000): Check constraint 'petpet_chk_1' is violated.
mysql> SHOW CREATE TABLE petPet;
+--------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table  | Create Table                                                                                                                                                                                                                                                                                                                                                                                              |
+--------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| petPet | CREATE TABLE `petPet` (
  `petname` varchar(20) NOT NULL,
  `owner` varchar(45) DEFAULT NULL,
  `species` varchar(20) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `death` date DEFAULT NULL,
  PRIMARY KEY (`petname`),
  CONSTRAINT `petpet_chk_1` CHECK ((`species` in (_utf8mb4'M',_utf8mb4'F')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+--------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> ALTER TABLE petPet DROP CHECK petpet_chk_1;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE petPet ADD CONSTRAINT petpet_gender_chk CHECK (gender IN ('M', 'F'));
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> INSERT INTO petPet (petname, owner, species, gender, birth, death) VALUES
    ->     ("Fluffy", "Harold", "cat", "F", "1993-02-04", NULL),
    ->     ("Claws", "Gwen", "cat", "M", "1994-03-17", NULL),
    ->     ("Buffy", "Harold", "dog", "F", "1989-05-13", NULL),
    ->     ("Fang", "Benny", "dog", "M", "1990-08-27", NULL),
    ->     ("Bowser", "Diane", "dog", "M", "1979-08-31", "1995-07-29"),
    ->     ("Chirpy", "Gwen", "bird", "F", "1998-09-11", NULL),
    ->     ("Whistler", "Gwen", "bird", "M", "1997-12-09", NULL),
    ->     ("Slim", "Benny", "snake", "M", "1996-04-29", NULL),
    ->     ("Puffball", "Diane", "hamster", "F", "1999-03-30", NULL);
Query OK, 9 rows affected (0.01 sec)
Records: 9  Duplicates: 0  Warnings: 0

mysql> INSERT INTO petEvent VALUES
    ->     ("Fluffy", "1995-05-15", "litter", "4 kittens, 3 female, 1 male"),
    ->     ("Buffy", "1993-06-23", "litter", "5 puppies, 2 female, 3 male"),
    ->     ("Buffy", "1994-06-19", "litter", "3 puppies, 3 female"),
    ->     ("Chirpy", "1999-03-21", "vet", "needed beak straightened"),
    ->     ("Slim", "1997-08-03", "vet", "broken rib"),
    ->     ("Slim", "1997-10-04", "vet", "broken tooth"),
    ->     ("Bowser", "1991-10-12", "kennel", NULL),
    ->     ("Fang", "1991-10-12", "kennel", NULL),
    ->     ("Fang", "1998-08-28", "birthday", "Gave him a new chew toy"),
    ->     ("Claws", "1998-03-17","birthday", "Gave him a new flea collar"),
    ->     ("Whistler", "1998-12-09", "birthday", "First birthday");
Query OK, 11 rows affected (0.00 sec)
Records: 11  Duplicates: 0  Warnings: 0

mysql> INSERT INTO events (petname, event_date, event_type, event_details) 
    -> VALUES ('Fluffy', '2020-10-15', 'vet', 'antibiotics');
ERROR 1146 (42S02): Table 'pet_database.events' doesn't exist
mysql> USE pet_database
Database changed
mysql> INSERT INTO events (petname, event_date, event_type, event_details) 
    -> VALUES ('Fluffy', '2020-10-15', 'vet', 'antibiotics');
ERROR 1146 (42S02): Table 'pet_database.events' doesn't exist
mysql> INSERT INTO PetEvent (petname, event_date, event_type, event_details) 
    -> VALUES ('Fluffy', '2020-10-15', 'vet', 'antibiotics');
ERROR 1054 (42S22): Unknown column 'event_date' in 'field list'
mysql> INSERT INTO PetEvent (petname, eventdate, eventtype, remark) 
    -> VALUES ('Fluffy', '2020-10-15', 'vet', 'antibiotics');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO petPet (petname, owner, species, gender, birth, death) 
    -> VALUES ('Hammy', 'Diane', 'hamster', 'M', '2010-10-30', NULL);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO PetEvent (petname, eventdate, eventtype, remark) 
    -> VALUES ('Hammy', '2020-10-15', 'vet', 'antibiotics');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO PetEvent (petname, eventdate, eventtype, remark) 
    -> VALUES ('Fluffy', '2020-10-15', 'litter', 'Had 5 kittens, 2 male and 3 female');
ERROR 1062 (23000): Duplicate entry 'Fluffy-2020-10-15' for key 'petevent.PRIMARY'
mysql> INSERT INTO PetEvent (petname, eventdate, eventtype, remark) 
    -> VALUES ('Claws', '1997-08-03', 'vet', 'Broke rib');
Query OK, 1 row affected (0.01 sec)

mysql> UPDATE petPet 
    -> SET death = '2020-09-01' 
    -> WHERE petname = 'Puffball';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> DELETE FROM PetEvent 
    -> WHERE petname = 'Buffy';
Query OK, 2 rows affected (0.01 sec)

mysql> DELETE FROM petPet 
    -> WHERE petname = 'Buffy';
Query OK, 1 row affected (0.01 sec)

mysql> describe petPet;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| petname | varchar(20) | NO   | PRI | NULL    |       |
| owner   | varchar(45) | YES  |     | NULL    |       |
| species | varchar(20) | YES  |     | NULL    |       |
| gender  | char(1)     | YES  |     | NULL    |       |
| birth   | date        | YES  |     | NULL    |       |
| death   | date        | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
6 rows in set (0.04 sec)

mysql> desrbibe PetEvent
    -> describe PetEvent;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'desrbibe PetEvent
describe PetEvent' at line 1
mysql> desribe PetEvent
    -> 
    -> 
    -> h
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'desribe PetEvent


h' at line 1
mysql> describe PetEvent;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| petname   | varchar(20)  | NO   | PRI | NULL    |       |
| eventdate | date         | NO   | PRI | NULL    |       |
| eventtype | varchar(15)  | YES  |     | NULL    |       |
| remark    | varchar(255) | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM petPet;
+----------+--------+---------+--------+------------+------------+
| petname  | owner  | species | gender | birth      | death      |
+----------+--------+---------+--------+------------+------------+
| Bowser   | Diane  | dog     | M      | 1979-08-31 | 1995-07-29 |
| Chirpy   | Gwen   | bird    | F      | 1998-09-11 | NULL       |
| Claws    | Gwen   | cat     | M      | 1994-03-17 | NULL       |
| Fang     | Benny  | dog     | M      | 1990-08-27 | NULL       |
| Fluffy   | Harold | cat     | F      | 1993-02-04 | NULL       |
| Hammy    | Diane  | hamster | M      | 2010-10-30 | NULL       |
| Puffball | Diane  | hamster | F      | 1999-03-30 | 2020-09-01 |
| Slim     | Benny  | snake   | M      | 1996-04-29 | NULL       |
| Whistler | Gwen   | bird    | M      | 1997-12-09 | NULL       |
+----------+--------+---------+--------+------------+------------+
9 rows in set (0.01 sec)

mysql> SELECT * FROM PetEvent;
+----------+------------+-----------+-----------------------------+
| petname  | eventdate  | eventtype | remark                      |
+----------+------------+-----------+-----------------------------+
| Bowser   | 1991-10-12 | kennel    | NULL                        |
| Chirpy   | 1999-03-21 | vet       | needed beak straightened    |
| Claws    | 1997-08-03 | vet       | Broke rib                   |
| Claws    | 1998-03-17 | birthday  | Gave him a new flea collar  |
| Fang     | 1991-10-12 | kennel    | NULL                        |
| Fang     | 1998-08-28 | birthday  | Gave him a new chew toy     |
| Fluffy   | 1995-05-15 | litter    | 4 kittens, 3 female, 1 male |
| Fluffy   | 2020-10-15 | vet       | antibiotics                 |
| Hammy    | 2020-10-15 | vet       | antibiotics                 |
| Slim     | 1997-08-03 | vet       | broken rib                  |
| Slim     | 1997-10-04 | vet       | broken tooth                |
| Whistler | 1998-12-09 | birthday  | First birthday              |
+----------+------------+-----------+-----------------------------+
12 rows in set (0.00 sec)

mysql> 