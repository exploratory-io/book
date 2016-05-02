# Google Analytics Data

## 1. Select 'Import Remote Data' from Add New Data Frame menu.

![](images/import-remote-data.png)

Click Google Analytics

![](images/google-analytics-setting1.png)

## 2. OAuth Setting

Select an account you want to use for your Google Analytics data and click 'Allow' button to allow Exploratory to extract your Google Analytics data based on the parameters you are going to set up in the next step.

![](images/google-analytics-oauth.png)


## 3. Set Parameters

- Type a data frame name.
- Select View ID from the dropdown menu.
- Set Last N days
- Select Dimensions and Metrics from the dropdown menu.


![](images/google-analytics-setting.png)


The default is set to 30, which means it will extract the last 30 days. You can update this based on your needs.

## 4. Preview and Import

Click Preview button to see the data back from Google Analytics. If it looks ok, then you can click 'Import' to import the data into Exploratory.


## Appendix

### View ID

If you are not sure about the View ID you can find this information from Google Analytics page.

Go to [Google Analytics web page](https://analytics.google.com), and go to Admin page.

![](images/google-analytics-tableid2.png)

Go to View Setting for the view (web site) you're interested in.

![](images/google-analytics-tableid3.png)

Now you can find View ID.
![](images/google-analytics-tableid4.png)




You can select a list of Dimensions and Measures that you want to see data for from the dropdown list.

### Dimensions and Measures

You might want to take a look at [Query Parameter reference page](https://developers.google.com/analytics/devguides/reporting/core/v3/reference) for more detail on Dimension and Measures. Also, [Google Analytics Query Explorer tool page](https://ga-dev-tools.appspot.com/query-explorer/) is helpful for you to explore different parameters that Google Analytics support.
