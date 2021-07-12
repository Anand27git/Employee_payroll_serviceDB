/* Welcome to Employee_payroll_services */

/*UC-1*/
mysql> CREATE database employee_payroll_service;
Query OK, 1 row affected (0.18 sec)

mysql> show databases;
+--------------------------+
| Database                 |
+--------------------------+
| address_book             |
| classicmodels            |
| employee_payroll_service |
| information_schema       |
| mysql                    |
| payroll_service          |
| performance_schema       |
| sys                      |
+--------------------------+
8 rows in set (0.03 sec)

mysql> use employee_payroll_service;
Database changed

/*UC-2*/
mysql> Create table employee_payroll (
    -> id int NOT NULL auto_increment,
    -> name varchar(100) NOT NULL,
    -> salary int NOT NULL,
    -> start date,
    -> primary key (id)
    -> );
Query OK, 0 rows affected (2.58 sec)

mysql> desc employee_payroll;
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| id     | int          | NO   | PRI | NULL    | auto_increment |
| name   | varchar(100) | NO   |     | NULL    |                |
| salary | int          | NO   |     | NULL    |                |
| start  | date         | YES  |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
4 rows in set (0.05 sec)

mysql>
