# MariaDB (MySQL) Data Import

You can quickly import data from your MySQL Database into Exploratory.

## 1. Create a Connection to use

Create a connection following [this instruction](https://docs.exploratory.io/data_import/database-data/connection).

* Whether the connection is SSL or not is automatically detected.

## 2. Open MariaDB (MySQL) Import dialog

Click '+' button next to 'Data Frames' and select 'Import Database Data'.

![](images/import-db.png)

Click MySQL.

![](images/mysql.png)

## 3. Import


1. Select connection from left dialog box.

2. Write a query in the input field.

3. Click "Preview" button. Then you will see the preview of the data.

4. Click "Import" button.

![](images/mysql-import.png)


## 4. Using Parameters in SQL

First, click Parameter link on the SQL Data Import Dialog.

![](images/add_parameter.png)

Second, define a parameter and click Save button.

![](images/define_parameter.png)

Finally, you can use @{} to surround a variable name inside the query like below.

  ```
  select *
  from airline_2016_01
  where carrier = @{carrier}
  ```
  
  If you type @ then it suggests parameters like below.
  
  ![](images/insert_param_in_query.png)


Here's a [blog post](https://exploratory.io/note/kanaugust/An-Introduction-to-Parameter-in-Exploratory-WCO4Vgn7HJ) for more detail.

## 5. AWS Security Group Setup (Only for Amazon RDS)

![](images/aws-security-group.png)

If you are using Amazon RDS as your MySQL database, and encounter a database connection error, please go to AWS console and make sure you added your client PC's IP address to an inbound rule for your DB Security Group associated with the MySQL database instance.

## 6. Number of rows

From performance point of view, we no longer show actual number of rows which can be only fetched by executing whole query again.

![](images/sql_number_of_rows.png)

If you still want to show the actual number of query for your query, you can do so by setting System Configuration.

![](images/num_of_rows_config_menu.png)

Then set "Yes" For "Show Actual Number of Rows on SQL Data Import Dialog"

![](images/num_of_rows_config.png)

This will show you Actual Number of Rows like below.

![](images/actual_num_of_rows.png)
