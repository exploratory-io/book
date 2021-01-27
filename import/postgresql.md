# PostgreSQL Database Data Import

You can quickly import data from your PostgreSQL Database into Exploratory.

## 1. Create a Connection to use

Create a connection following [this instruction](./connection.html).

* Whether the connection is SSL or not is automatically detected.

## 2. Open PostgreSQL Import dialog

Click '+' button next to 'Data Frames' and select 'Database Data'.

![](images/import-database.png)

Click PostgreSQL to select.

![](images/postgres-dialog.png)


## 3. Preview and Import

Click Preview button to see the data back from your PostgreSQL db.

![](images/import-postgres-dialog.png)

If it looks ok, then you can click 'Import' to import the data into Exploratory.


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

## 5. Number of rows

From performance point of view, we no longer show actual number of rows which can be only fetched by executing whole query again.

![](images/sql_number_of_rows.png)

If you still want to show the actual number of query for your query, you can do so by setting System Configuration.

![](images/num_of_rows_config_menu.png)

Then set "Yes" For "Show Actual Number of Rows on SQL Data Import Dialog"

![](images/num_of_rows_config.png)

This will show you Actual Number of Rows like below.

![](images/actual_num_of_rows.png)
