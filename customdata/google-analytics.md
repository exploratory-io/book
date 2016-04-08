# Google Analytics Data

For the detail, take a look at this page.
https://developers.google.com/analytics/solutions/r-google-analytics#query

## Get Client ID and Client Secrete

Go to [Google Developers Console](https://console.developers.google.com/project)

Create a New Project and Open it

![](images/google-analytics-api-setting.png)

![](images/google-analytics-api-setting2.png)

Make Analytics API enabled for your project

![](images/google-analytics-api-setting3.png)

![](images/google-analytics-api-setting4.png)

Go to Credentials

![](images/google-analytics-api-setting5.png)

Create OAuth Client ID

![](images/google-analytics-api-setting6.png)

Set a product name for Consent Screen

![](images/google-analytics-api-setting7.png)

![](images/google-analytics-api-setting7_1.png)

Select 'Other' for Application type and type any name for Name, and click 'Create' button

![](images/google-analytics-api-setting7_2.png)

Now, you get Client ID and Client Secret.

![](images/google-analytics-api-setting8.png)

## Get Table ID (View ID)

Go to [Google Analytics web page](https://analytics.google.com).

Go to Admin page.

![](images/google-analytics-tableid2.png)

Go to View Setting for the view (web site) you're interested in.

![](images/google-analytics-tableid3.png)

Now you can find View ID.
![](images/google-analytics-tableid4.png)

You'll need to use this id for 'Table ID' parameter.


## Decide which Dimensions and Measures you need for Google Analytics data

You can use [Google Analytics Query Explorer tool](https://ga-dev-tools.appspot.com/query-explorer/) to find the dimensions and measures you would be interesting.



![](images/google-query-explorer.png)

![](images/google-query-explorer2.png)

Take a look at [Query Parameter reference page](https://developers.google.com/analytics/devguides/reporting/core/v3/reference) for the detail about the query parameters.


## Write R custom script

```
require(RGoogleAnalytics)
  client.id <- <Your Client ID>
  client.secret <- <Your Client Secret>
  view.id <- <Your View ID>
  last.n.days <- 30

  token <- Auth(client.id, client.secret)
  # Save the token object for future sessions
  save(token,file="./token_file")
  ValidateToken(token)
  start_date <- as.character(today() - days(last.n.days))
  #end_date <- as.character(today() - days(1))
  end_date <- as.character(today())
  query.list <- Init(start.date = start_date,
                     end.date = end_date,
                     dimensions = "ga:date,ga:pagePath,ga:hour,ga:source, ga:country, ga:operatingSystem, ga:referralPath",
                     metrics = "ga:users, ga:uniquePageviews,ga:pageviews",
                     max.results = 10000,
                     sort = "-ga:date",
                     table.id = paste0("ga:", view.id))

  ga.query <- QueryBuilder(query.list)
  ga.data <- GetReportData(ga.query, token)
  ga.data

```
