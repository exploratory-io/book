# Google Analytics Data

You need to have a few information before you start adding Google Analytics data in Exploratory.

- View ID
- Dimensions
- Metrics

## Obtain information for Google Analytics parameters


### 1. Get Table ID (View ID)

You need this information to identify which of your Google Analytics monitoring web sites you want to use. You can get this information from Google Analytics page.

Go to [Google Analytics web page](https://analytics.google.com), and go to Admin page.

![](images/google-analytics-tableid2.png)

Go to View Setting for the view (web site) you're interested in.

![](images/google-analytics-tableid3.png)

Now you can find View ID.
![](images/google-analytics-tableid4.png)



### 2. Decide which Dimensions and Measures you need for Google Analytics data

You can use [Google Analytics Query Explorer tool](https://ga-dev-tools.appspot.com/query-explorer/) to find the dimensions and measures you would be interested.

They are something like this.

**Dimensions**  
ga:dateHour, ga:pagePath, ga:pageTitle, ga:source, ga:country, ga:operatingSystem, ga:referralPath

**Metrics**  
ga:users, ga:uniquePageviews,ga:pageviews  

Google Analytics Query Explorer

![](images/google-query-explorer.png)

![](images/google-query-explorer2.png)

Take a look at [Query Parameter reference page](https://developers.google.com/analytics/devguides/reporting/core/v3/reference) for the detail about the query parameters.

## Import Google Analytics data

Select 'Import Remote Data' from Add New Data Frame menu.

![](images/import-remote-data.png)

Click Google Analytics

![](images/google-analytics-setting1.png)

Type Data Frame name, and type the following parameters.

- View ID
- Dimensions
- Metrics
- Last N days (Default is 30)

![](images/google-analytics-setting2.png)

Click Preview button to see the data back from Google Analytics. If it looks ok, then you can click 'Import' to import the data into Exploratory. 
