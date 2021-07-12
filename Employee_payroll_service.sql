/* Welcome to Employee_payroll_services */

/*UC-1 creation of database */
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

/*UC-2 Table creation for employee_payroll */

mysql> Create table employee_payroll (
    -> id int NOT NULL auto_increment,
    -> name varchar(100) NOT NULL,
    -> salary int NOT NULL,
    -> start date,
    -> primary key (id)
    -> );
Query OK, 0 rows affected (2.58 sec)

mysql> desc employee_payro
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| id     | int          | NO   | PRI | NULL    | auto_increment |
| name   | varchar(100) | NO   |     | NULL    |                |
| salary | int          | NO   |     | NULL    |                |
| start  | date         | YES  |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
4 rows in set (0.05 sec)

/*  UC-3- Inserting employee values */

mysql> INSERT INTO employee_payroll
    -> (name, salary, start) VALUES
    -> ('Anand',35000, '2021-07-06'),
    -> ('Harish',38000, '2021-07-07'),
    -> ('manu',29000, '2021-07-06');
Query OK, 3 rows affected (0.45 sec)
Records: 3  Duplicates: 0  Warnings: 0

/* UC-4-retrieving  data from Employee_Payroll */

mysql> SELECT * FROM employee_payroll;
+----+--------+--------+------------+
| id | name   | salary | start      |
+----+--------+--------+------------+
|  1 | Anand  |  35000 | 2021-07-06 |
|  2 | Harish |  38000 | 2021-07-07 |
|  3 | manu   |  29000 | 2021-07-06 |
+----+--------+--------+------------+
3 rows in set (0.01 sec)

mysql>mysql> SELECT * FROM employee_payroll;
      +----+--------+--------+------------+
      | id | name   | salary | start      |
      +----+--------+--------+------------+
      |  1 | Anand  |  35000 | 2021-07-06 |
      |  2 | Harish |  38000 | 2021-07-07 |
      |  3 | manu   |  29000 | 2021-07-06 |
      +----+--------+--------+------------+
      3 rows in set (0.01 sec)

/* UC-5- retrieving salary data as well as date range  using cast and now */

  mysql> SELECT salary FROM employee_payroll WHERE  name='bills';
  +--------+
  | salary |
  +--------+
  |  35000 |
  +--------+
  1 row in set (0.00 sec)

  /*using date range cast and now */

  mysql> SELECT * FROM employee_payroll WHERE start BETWEEN CAST('2021-07-06' AS DATE) AND DATE(NOW());
  +----+--------+--------+------------+
  | id | name   | salary | start      |
  +----+--------+--------+------------+
  |  1 | Anand  |  35000 | 2021-07-06 |
  |  2 | Harish |  38000 | 2021-07-07 |
  |  3 | manu   |  29000 | 2021-07-06 |
  |  4 | bills  |  35000 | 2021-07-06 |
  +----+--------+--------+------------+
  4 rows in set (0.00 sec)

 /* UC-6-altering the table to add Gender and updating the Gender for Employee_payroll_services */

  mysql> ALTER table employee_payroll
      ->  ADD gender CHAR(6);
  Query OK, 0 rows affected (1.67 sec)
  Records: 0  Duplicates: 0  Warnings: 0

  mysql> SELECT * FROM employee_payroll;
  +----+--------+--------+------------+--------+
  | id | name   | salary | start      | gender |
  +----+--------+--------+------------+--------+
  |  1 | Anand  |  35000 | 2021-07-06 | NULL   |
  |  2 | Harish |  38000 | 2021-07-07 | NULL   |
  |  3 | manu   |  29000 | 2021-07-06 | NULL   |
  |  4 | bills  |  35000 | 2021-07-06 | NULL   |
  +----+--------+--------+------------+--------+
  4 rows in set (0.00 sec)

  mysql> UPDATE employee_payroll set gender = 'M' WHERE name = 'Bills' or name = 'Anand' or name = 'Harish' or name = 'Manu';
  Query OK, 4 rows affected (0.11 sec)
  Rows matched: 4  Changed: 4  Warnings: 0

  mysql> SELECT * FROM employee_payroll;
  +----+--------+--------+------------+--------+
  | id | name   | salary | start      | gender |
  +----+--------+--------+------------+--------+
  |  1 | Anand  |  35000 | 2021-07-06 | M      |
  |  2 | Harish |  38000 | 2021-07-07 | M      |
  |  3 | manu   |  29000 | 2021-07-06 | M      |
  |  4 | bills  |  35000 | 2021-07-06 | M      |
  +----+--------+--------+------------+--------+
  4 rows in set (0.00 sec)

  mysql> UPDATE employee_payroll set gender = 'F' WHERE name = 'Anusha' or name = 'Banu';
  Query OK, 2 rows affected (0.12 sec)
  Rows matched: 2  Changed: 2  Warnings: 0

  mysql> SELECT * FROM employee_payroll;
  +----+--------+--------+------------+--------+
  | id | name   | salary | start      | gender |
  +----+--------+--------+------------+--------+
  |  1 | Anand  |  35000 | 2021-07-06 | M      |
  |  2 | Harish |  38000 | 2021-07-07 | M      |
  |  3 | manu   |  29000 | 2021-07-06 | M      |
  |  4 | bills  |  35000 | 2021-07-06 | M      |
  |  5 | Anusha |  38000 | 2021-07-08 | F      |
  |  6 | Banu   |  29000 | 2021-07-08 | F      |
  +----+--------+--------+------------+--------+
  6 rows in set (0.00 sec)

/* UC -7- finding sum ,max,min,avg, and number of male and female employees */

mysql> SELECT SUM(salary) FROM employee_payroll WHERE gender = 'F' GROUP BY gender;
+-------------+
| SUM(salary) |
+-------------+
|       67000 |
+-------------+
1 row in set (0.05 sec)

mysql> SELECT MAX(salary) FROM employee_payroll WHERE gender = 'F' GROUP BY gender;
+-------------+
| MAX(salary) |
+-------------+
|       38000 |
+-------------+
1 row in set (0.06 sec)

mysql> SELECT MIN(salary) FROM employee_payroll WHERE gender = 'F' GROUP BY gender;
+-------------+
| MIN(salary) |
+-------------+
|       29000 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT AVG(salary) FROM employee_payroll WHERE gender = 'F' GROUP BY gender;
+-------------+
| AVG(salary) |
+-------------+
|  33500.0000 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT gender, count(gender) FROM employee_payroll GROUP BY gender;
+--------+---------------+
| gender | count(gender) |
+--------+---------------+
| M      |             4 |
| F      |             2 |
+--------+---------------+
2 rows in set (0.04 sec)

/* UC-8-employee information like phone_number address department */

mysql>  ALTER TABLE employee_payroll ADD phone_number VARCHAR(10);
Query OK, 0 rows affected (2.72 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE employee_payroll ADD address VARCHAR(100) AFTER name;
Query OK, 0 rows affected (4.36 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>  ALTER TABLE employee_payroll ADD department VARCHAR(30) NOT NULL AFTER address;
Query OK, 0 rows affected (4.24 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc employee_payroll;
+--------------+--------------+------+-----+---------+----------------+
| Field        | Type         | Null | Key | Default | Extra          |
+--------------+--------------+------+-----+---------+----------------+
| id           | int          | NO   | PRI | NULL    | auto_increment |
| name         | varchar(100) | NO   |     | NULL    |                |
| address      | varchar(100) | YES  |     | NULL    |                |
| department   | varchar(30)  | NO   |     | NULL    |                |
| salary       | int          | NO   |     | NULL    |                |
| start        | date         | YES  |     | NULL    |                |
| gender       | char(6)      | YES  |     | NULL    |                |
| phone_number | varchar(10)  | YES  |     | NULL    |                |
+--------------+--------------+------+-----+---------+----------------+
8 rows in set (0.05 sec)

/* UC-9- adding basic_pay, deductions,taxable_pay,tax,net_pay for employee_payroll */

mysql> ALTER TABLE employee_payroll RENAME COLUMN salary TO basic_pay;
Query OK, 0 rows affected (0.19 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>  ALTER TABLE employee_payroll ADD deductions Double NOT NULL AFTER basic_pay;
Query OK, 0 rows affected (2.43 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>  ALTER TABLE employee_payroll ADD taxable_pay Double NOT NULL AFTER deductions;
Query OK, 0 rows affected (2.29 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>  ALTER TABLE employee_payroll ADD tax Double NOT NULL AFTER taxable_pay;
Query OK, 0 rows affected (1.64 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE employee_payroll ADD net_pay Double NOT NULL AFTER tax;
Query OK, 0 rows affected (2.46 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM employee_payroll;
+----+--------+---------+------------+-----------+------------+-------------+-----+---------+------------+--------+--------------+
| id | name   | address | department | basic_pay | deductions | taxable_pay | tax | net_pay | start      | gender | phone_number |
+----+--------+---------+------------+-----------+------------+-------------+-----+---------+------------+--------+--------------+
|  1 | Anand  | NULL    |            |     35000 |          0 |           0 |   0 |       0 | 2021-07-06 | M      | NULL         |
|  2 | Harish | NULL    |            |     38000 |          0 |           0 |   0 |       0 | 2021-07-07 | M      | NULL         |
|  3 | manu   | NULL    |            |     29000 |          0 |           0 |   0 |       0 | 2021-07-06 | M      | NULL         |
|  4 | bills  | NULL    |            |     35000 |          0 |           0 |   0 |       0 | 2021-07-06 | M      | NULL         |
|  5 | Anusha | NULL    |            |     38000 |          0 |           0 |   0 |       0 | 2021-07-08 | F      | NULL         |
|  6 | Banu   | NULL    |            |     29000 |          0 |           0 |   0 |       0 | 2021-07-08 | F      | NULL         |
+----+--------+---------+------------+-----------+------------+-------------+-----+---------+------------+--------+--------------+
6 rows in set (0.00 sec)





