# Salesforce Data Import

You can quickly import data from your Salesforce into Exploratory.

## 1. Create a connection for Salesforce 

First, you want to create a connection for Salesforce.

![](images/salesforce-connection.png)

After filling the below database information:

- Server - Salesforce login server
- Username - Username of the Salesforce
- Password - Password of the Salesforce
- Security Token - (Optional) Security token of the Salesforce


Click ‘Test Connection’ button to make sure the information is correct, before you save it.


## 2. Open Salesforce Import dialog

Select 'Cloud Apps Data' from Add New Data Frame menu.

![](images/import-cloudapps.png)

Click Snowflake to select.

![](images/salesforce-picker.png)


## 3. Preview and Import

Click "Run" button to see the data back from Salesforce. You can add filters to limit your query results.

![](images/salesforce-import.png)

## 4. Using Parameters inside Filters.

First, click the Add Filter Button.

![](images/add_salesforce_filter.png)

Click the Create Parameter button.

![](images/add_salesforce_parameter.png)

Then define a parameter and click Save button.

![](images/create_salesforce_parameter.png)

Finally, you can select the parameter for the filter like below.

![](images/select_salesforce_parameter.png)

Click the Parameter link to open the parameter pane.

![](images/open_salesforce_parameter.png)

Select the parameter value and click the Run button, then you can previewed the data filtered by the parameter.

![](images/preview_salesforce_filtered_data.png)


If it looks ok, then you can click 'Save' to import the data into Exploratory.

## 4. Known Restrictions

If the selected columns don't have any values, they are not included in the result.
