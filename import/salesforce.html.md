# Salesforce Data Import

You can quickly import data from your Salesforce into Exploratory.


## 1. Open Salesforce Import dialog

Select 'Cloud Apps Data' from Add New Data Frame menu.

![](images/import-cloudapps.png)

Click Snowflake to select.

![](images/salesforce-picker.png)


If this is your first time to use Salesforce for the first time, below Dialog shows up.

![](images/salesforce-oauth.png)

## 2. Preview and Import

Click "Run" button to see the data back from Salesforce. You can add filters to limit your query results.

![](images/salesforce-import.png)

## 3. Using Parameters inside Filters.

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

## 4 Restriction

To use Salesforce Data Source, your Salesforce edition needs to be one of the followings:

- Enterprise Edition
- Unlimited Edition
- Developer Edition
- Performance Edition

[Salesforce editions with API access](https://help.salesforce.com/articleView?id=000326486&type=1&mode=1)

