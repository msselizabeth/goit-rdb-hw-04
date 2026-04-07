## HW 4

### 1. Create DB, tables
![Create SQL-1](./p1_part_1.png)
![Create SQL-2](./p1_part_2.png)

**Logs on screnshoots confirm the db and tables were successfully created.**

### 2. Insert fake values

- SQL
![Insert SQL](./p2_insert_values.png)

- Outut example (books)
![Books example](./p2_books_example.png)

### 3. INNER JOIN all tables
![Inner Join](./p3_inner_join.png)

### 4. 
* 4.1
![Count All](./p4_1.png)

* 4.2 При заміні INNER JOIN на LEFT JOIN кількість рядків у вибірці може збільшитися, але не в данному випадку. INNER JOIN діє як перетин множин і відкидає записи, якщо для них немає відповідності між таблицями. А LEFT JOIN зберігає всі без винятку записи з лівої таблиці. Якщо в базі існують неповні дані, LEFT JOIN залишить цей рядок у результаті, заповнивши відсутні поля значеннями NULL.
![LEFT JOIN](./p4_2.png)

* 4.3
![WHERE](./p4_3.png)

* 4.4
![Categories](./p4_4.png)

* 4.5
![HAVING](./p4_5.png)

* 4.6
![GROUP BY](./p4_6.png)

* 4.7
![LIMIT OFFSET](./p4_7.png) 
