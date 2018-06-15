# Microsoft SQL Server Database Data Import

You can quickly import data from your Microsoft SQL Server Connection into Exploratory.

## 1. Set up ODBC Data Source Name (DSN) for Microsoft SQL Server

First, set up ODBC DSN for the database you want to connect Exploratory to. Following are instructions to create ODBC DSN for some of the types of databases we verified that they work.

* [Microsoft SQL Server](https://community.exploratory.io/t/connecting-to-ms-sql-server-through-odbc-from-windows/341) (from Exploratory for Windows)
* [Microsoft SQL Server](https://community.exploratory.io/t/connecting-to-ms-sql-server-through-odbc-from-mac/339) (from Exploratory for Mac)

## 2. Create a Connection to use

Create a connection following [this instruction](connection.html).

## 3. Open ODBC Import dialog

Click '+' button next to 'Data Frames' and select 'Import Database Data'.

![](images/import-db.png)

Click ODBC to select.

![](images/select_odbc_datasource.png)


## 4. Preview and Import

Click Preview button to see the data from your ODBC database connection.

![](images/odbc_preview.png)

If it looks ok, then you can click 'Import' to import the data into Exploratory.
