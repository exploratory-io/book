# Amazon Redshift Database Data Import

You can quickly import data from your Amazon Redshift Database into Exploratory.

## 1. Open Redshift Import dialog

Select 'Import Remote Data' from Add New Data Frame menu.

![](images/import-remote-data.png)

Click Redshift to select.

![](images/redshift.png)

## 2. Set Parameters

Type your new data frame name

Type the following your Redshift DB connection related parameter values.

- Host name
- Port number
- Database name
- Username
- Password
- Number of Rows
- Query

![](images/redshift2.png)

## 3. Preview and Import

Click Preview button to see the data back from your Redshift db.

![](images/redshift3.png)

If it looks ok, then you can click 'Import' to import the data into Exploratory.

## 4. AWS Security Group Setup

![](images/redshift4.png)

If you encounter a database connection error, please go to AWS console and make sure you added your client PC's IP address to your Security Group (both Inbound and Outbound) associated with the Redshift cluster.
