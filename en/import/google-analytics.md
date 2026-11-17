# Google Analytics Data

## 1. Select Google Analytics Data Menu

Click '+' button next to 'Data Frames' and select 'Cloud Apps Data'.

![](images/import-cloudapps.png)

Click Google Analytics

![](images/google-analytics-select.png)

## 2. OAuth Setting

Create a connection following [this instruction](https://blog.exploratory.io/how-to-setup-oauth-cloud-apps-connections-in-exploratory-a5c20d18e7c7).

## 3. Set Parameters

- Select Account, Property, and View from the dropdown menu.
- Set Period. You can select either of the followings:

  - From This Date
  - Today
  - Yesterday
  - This Week to Yesterday
  - This Month to Yesterday
  - This Year to Yesterday
  - Last Week to Yesterday
  - Last Month to Yesterday
  - Last Year to Yesterday
  - Last N Days
  - Last N Days (Exclude Today)
  - Last N Weeks
  - Last N Weeks (Exclude This Week)
  - Last N Months
  - Last N Months (Exclude This Month)
  - Last N Months (Exclude This Week)
  - Last N Months (Exclude Today)
  - Last N Quarters
  - Last N Quarters (Exclude This Quarter)
  - Last N Quarters (Exclude This Month)
  - Last N Quarters (Exclude This Week)
  - Last N Quarters (Exclude Today)
  - Last N Years
  - Last N Years (Exclude This Year)
  - Last N Years (Exclude This Quarter)
  - Last N Years (Exclude This Month)
  - Last N Years (Exclude This Week)
  - Last N Years (Exclude Today)

  

- Select Dimensions and Metrics from the List. You might want to take a look at [Query Parameter reference page](https://developers.google.com/analytics/devguides/reporting/core/v3/reference) for more detail on Dimension and Measures. Also, [Google Analytics Query Explorer tool page](https://ga-dev-tools.appspot.com/query-explorer/) is helpful for you to explore different parameters that Google Analytics support.

- Segments: You can select both Custom segments as well as predefined segments from list of values. For segments details, please refer[About Segments](https://support.google.com/analytics/answer/3123951) and [Core Reporting API - Segments](https://developers.google.com/analytics/devguides/reporting/core/v3/segments)

![](images/google-analytics-setting.png)

## 4. Preview and Import

Click 'Run' button to preview the data from Google Analytics. If it looks ok, then you can click 'Save' button to import the data into Exploratory.
