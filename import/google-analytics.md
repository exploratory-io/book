# Google Analytics Data

## 1. Select Google Analytics Data Menu

Click '+' button next to 'Data Frames' and select 'Import Cloud Apps Data'.

![](images/import-cloudapps.png)

Click Google Analytics

![](images/google-analytics-select.png)

## 2. OAuth Setting

Create a connection following [this instruction](https://blog.exploratory.io/how-to-setup-oauth-cloud-apps-connections-in-exploratory-a5c20d18e7c7).

## 3. Set Parameters

- Type a data frame name.
- Select View ID from the dropdown menu.
- Set Last N days. The default is set to 30, which means it will extract the last 30 days. You can update this based on your needs.
- Select Dimensions and Metrics from the dropdown menu.
- Set Paginate Query to Yes if the result is supposed to have more than 10000 rows (max for one api access).

![](images/google-analytics-setting.png)

## 4. Preview and Import

Click 'Get Data' button to preview the data from Google Analytics. If it looks ok, then you can click 'Import' button to import the data into Exploratory.


## Appendix

### Dimensions and Measures

You can select a list of Dimensions and Measures that you want to see data for from the dropdown list.

You might want to take a look at [Query Parameter reference page](https://developers.google.com/analytics/devguides/reporting/core/v3/reference) for more detail on Dimension and Measures. Also, [Google Analytics Query Explorer tool page](https://ga-dev-tools.appspot.com/query-explorer/) is helpful for you to explore different parameters that Google Analytics support.
