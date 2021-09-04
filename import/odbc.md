# ODBC Database Data Import

You can quickly import data from your ODBC Database Connection into Exploratory.

## 1. Install ODBC Drivers and Set Up Data Source Name (DSN)

First, install ODBC Drivers and set up Data Source Name (DSN) for the database you want to connect Exploratory to. Following are instructions to create ODBC DSN for some of the types of databases we verified that they work.

* [Snowflake](https://exploratory.io/note/2ac8ae888097/How-to-import-data-from-Snowflake-nhP3FTm5ZM) (for Mac/Windows)
* [Oracle](https://exploratory.io/note/exploratory/Connecting-to-Oracle-Database-through-ODBC-from-Windows-with-Oracle-Instance-Client-LmR8nHr3) (for Windows)
* [Oracle](https://exploratory.io/note/exploratory/Connecting-to-Oracle-Database-through-ODBC-from-Mac-uvi2DuT5) (for Mac)
* [Oracle (Japanese)](https://exploratory.io/note/BWz1Bar4JF/Oracle-Instance-Client-Windows-ODBC-Oracle-Database-AGi5wIz7QG) (for Windows)
* [Oracle (Japanese)](https://exploratory.io/note/BWz1Bar4JF/ODBC-Mac-Oracle-Database-baR1tUK7KO) (for Mac)
* [Microsoft SQL Server](https://community.exploratory.io/t/connecting-to-ms-sql-server-through-odbc-from-windows/341) (for Windows)
* [Microsoft SQL Server](https://community.exploratory.io/t/connecting-to-ms-sql-server-through-odbc-from-mac/339) (for Mac)

## 2. Create a Connection to use

Select the "Data Connection" menu from the menu right next to the project name.

![](images/odbc-connection1.png)

Click the "Add" button.

![](images/odbc-connection2.png)

Select the "ODBC" icon.

![](images/odbc-connection3.png)

Select the DSN created at Step 1 and click the Test and make sure it works.
For Mac, we support both [iODBC](http://www.iodbc.org/dataspace/doc/iodbc/wiki/iodbcWiki/ODBCMacOSX) based and [unixODBC](http://www.unixodbc.org/drivers.html) based ODBC Drivers and DSN.

![](images/odbc-connection4.png)

Click the "Add" button to save the connection.


## 3. Open ODBC Import dialog

Click '+' button next to 'Data Frames' and select 'Database Data'.

![](images/import-database.png)

Click ODBC to select.

![](images/select_odbc_datasource.png)


## 4. Preview and Import

Click Preview button to see the data from your ODBC database connection.

![](images/odbc_preview.png)

If it looks ok, then you can click 'Import' to import the data into Exploratory.

## 5. Using Parameters in SQL

First, click a parameter link on the SQL Data Import Dialog.

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

## 6. Number of rows

From performance point of view, we no longer show actual number of rows which can be only fetched by executing whole query again.

![](images/sql_number_of_rows.png)

If you still want to show the actual number of query for your query, you can do so by setting System Configuration.

![](images/num_of_rows_config_menu.png)

Then set "Yes" For "Show Actual Number of Rows on SQL Data Import Dialog"

![](images/num_of_rows_config.png)

This will show you Actual Number of Rows like below.

![](images/actual_num_of_rows.png)

## 7. Known Issues

- [Importing multi-byte characters from Teradata Aster fails](https://exploratory.io/note/exploratory/How-to-workaround-known-issues-when-connectiong-to-Teradata-Aster-with-ODBC-BTG0Tmz9)

- [Schema and Tables are not shown for Kintone](https://exploratory.io/note/exploratory/How-to-workaround-known-issues-when-connecting-to-Kintone-with-ODBC-hjq9Deg4)
