# Google Analytics Data

You need to have a few information before you start adding Google Analytics data in Exploratory.

- Client ID
- Client Secret
- View ID
- Dimensions
- Metrics

## Obtain information for Google Analytics parameters

### 1. Get Client ID and Client Secrete

Go to [Google Developers Console](https://console.developers.google.com/project)

Create a New Project and Open it

![](images/google-analytics-api-setting.png)

![](images/google-analytics-api-setting2.png)

Make Analytics API enabled for your project

![](images/google-analytics-api-setting3.png)

![](images/google-analytics-api-setting4.png)

Click 'Credentials' to go to Credentials setting page.

![](images/google-analytics-api-setting5.png)

Create OAuth Client ID

![](images/google-analytics-api-setting6.png)

You will be asked to setup 'consent screen' first, so click 'Configure consent screen' button to set that up.

![](images/google-analytics-api-setting7.png)

Set a product name for Consent Screen and click 'Save' button to save.

![](images/google-analytics-api-setting7_1.png)

 In Credentials setup UI, select 'Other' for Application type and type any name for Name, and click 'Create' button

![](images/google-analytics-api-setting7_2.png)

Now, you get Client ID and Client Secret.

![](images/google-analytics-api-setting8.png)

### 2. Get Table ID (View ID)

You need this information to identify which of your Google Analytics monitoring web sites you want to use. You can get this information from Google Analytics page.

Go to [Google Analytics web page](https://analytics.google.com), and go to Admin page.

![](images/google-analytics-tableid2.png)

Go to View Setting for the view (web site) you're interested in.

![](images/google-analytics-tableid3.png)

Now you can find View ID.
![](images/google-analytics-tableid4.png)



### 3. Decide which Dimensions and Measures you need for Google Analytics data

You can use [Google Analytics Query Explorer tool](https://ga-dev-tools.appspot.com/query-explorer/) to find the dimensions and measures you would be interesting.


![](images/google-query-explorer.png)

![](images/google-query-explorer2.png)

Take a look at [Query Parameter reference page](https://developers.google.com/analytics/devguides/reporting/core/v3/reference) for the detail about the query parameters.

## Import Google Analytics data

Select 'Import Remote Data' from Add New Data Frame menu.

![](images/import-remote-data.png)

Click Google Analytics

![](images/google-analytics-setting1.png)

Type Data Frame name, and type the following parameters.

- Client ID
- Client Secret
- View ID
- Last N days
- Dimensions
- Metrics

![](images/google-analytics-setting1.png)

Click Preview button to

Error: ignoring SIGPIPE signal
