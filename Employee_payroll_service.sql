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

  mysql>