# MySQL Data Import

You can quickly import data from your MySQL Database into Exploratory.

## 1. Create a Connection to use

Create a connection following [this instruction](connection.html).

## 2. Open MySQL Import dialog

Select 'Import Remote Data' from Add New Data Frame menu.

![](images/import-remote-data.png)

Click MySQL.

![](images/mysql.png)

## 3. Choose connection

1. Put data frame name.

2. Select connection from left dialog box.

3. Write a query in the input field.

4. Click "Get Data" button. Then you will see the preview of the data.

5. Click "Save" button to import.

![](images/mysql-connection.png)


## 4. Using Variables in SQL

First, define a variable in R script file.

```
cutoff_date <- "\'2016-01-15\'"
```

Note that the ‘\’ (backslash) symbols are used to escape the single quotes, which are required to be used for characters in SQL queries.

Second, load the R script file.

![](images/variable-1.png)

![](images/variable-2.png)

Finally, you can use @{} to surround a variable name inside the query like below.

```
select *
from airline_2016_01
where fl_date > @{cutoff_date}
```


## 5. AWS Security Group Setup (Only for Amazon RDS)

![](images/aws-security-group.png)

If you are using Amazon RDS as your MySQL database, and encounter a database connection error, please go to AWS console and make sure you added your client PC's IP address to your DB Security Group associated with the MySQL database instance.
