# Release Note

## 6.5.0.14

Released on 4/20/2021

### Download Links

* [For New Install](https://exploratory-download.s3-us-west-2.amazonaws.com/collab-server/exploratory-collab-6.5.0.14.tar.gz)
* [For Upgrade](https://exploratory-download.s3-us-west-2.amazonaws.com/collab-server/exploratory-collab-images-6.5.0.14.tar.gz)

### Enhancements

* Insight: Now you can choose the "Owned by Team" scope on the Insight search page.
* Insight: Now you can receive email notifications by subscribing to Insights that are scheduled regularly.
* Insight: Now Script can be published along with Insights.
* General: Support for accessing data files on Google Drive.

### Bug Fixes

* Schedule: Running a Dashboard with many Charts or Analytics failed, and the spin icon on the Insight page kept spinning after the failure as if the scheduled job was going on.
* Server: When using relative date such as "today" as the default value of a Date or POSIXct parameter, if the relative date was outside of min and max, the Parameter was not properly rendered.
* Server: Download button was not enabled as expected after enabling Parameters.
* Server: When opening a list of values in the Parameter pane, the options were cut off at the bottom and not fully visible.
* Insight: The view stats dialog showed an error if the Insight was shared as a Team.
* Insight: The hover pop-up for the "Download" button became incorrect once you updated the share setting on the Insight page.
* Insight: Accessing the CSV API URL of the public data share returned a 500 error.
* Insight: Histogram data on the user stats page was incorrect.
* Insight: Thumbnails didn't show for Insights that were shared as a Team.
* Parameter: Turning Parameters on at an Insight page failed if a parameter with list of value that is dynamically fetched from another Data Frame had the list-of-value display name column that is same as the value column.
* Parameter: Updating the Parameter Option of a publicly shared Insight raised an error.
* Summary View: It showed 100% for NA values even if there was no NA value if you had a character column with text data starting with "NA".
* General: When the hostname or IP address of an on-premise Exploratory Server was changed, hostname/IP address of Data Catalog URL sent to Exploratory Desktop stayed old, causing error at importing data from Data Catalog.
* General: A URL link to Insight in an invitation email was incorrect if the Insight was shared as a Team.


## 6.4.5.2

Released on 2/25/2021

### Download Links

* [For New Install](https://exploratory-download.s3-us-west-2.amazonaws.com/collab-server/exploratory-collab-6.4.5.2.tar.gz)
* [For Upgrade](https://exploratory-download.s3-us-west-2.amazonaws.com/collab-server/exploratory-collab-images-6.4.5.2.tar.gz)

### Enhancements

* General: Now you can create a Team, assign members to the Team. Team members can collaboratively publish Insights as a Team.
* Admin: Now it shows Collaboration Server version Info at the bottom of the page.
* Admin: Now Collaboration Server Administrator can view the stats for all users from the Collaboration Server Administration page.
* Data Catalog: Now you can highlight a row in Super Table by clicking the row.

* Insight: Now you can download the CSV data by clicking the button or use an API to download the CSV data for Chart and Analytics.
* Insight: Now you can see the view/usage stats of your Insights from the "Stats" menu in the user dropdown menus.
* Parameter: Now you can click the "Download" button in the parameter pane to download the CSV data.

### Bug Fixes

* Admin: On Create User dialog, email validation message was not properly shown when the entered email address was in an incorrect format.
* Data Catalog: Super Table: When entering search text for a column, rows with NA values were not filtered out.
* General: "Re-auth" link didn't show up in the OAuth error messages.
* Insight: Buttons on the navigation area at the top overlapped the title text in the Insight page.
* Parameter: Analytics published from Exploratory Desktop older than 6.3 raised error when Parameter was turned on, because of lack of cached Analytics result data. With this release, such a case can be handled without resulting in an error.
* Parameter: Analytics View result was not properly updated when the Parameters it depends on were changed.
* Parameter: Changing the parameter value didn't make any changes on the Analytics chart after changing the parameter one or two times.
* Parameter: In some cases, a duplicated Run button was shown at the bottom of the parameter pane.
* Parameter: Prediction models created by Analytics View was rebuilt when Parameter was turned on. Now we make use of published cached models to avoid potentially computationally expensive model building.
* Parameter: With Dashboard, Note, or Slide, turning on the Parameters failed with a message "error code 3" if the value for a numeric text field parameter was set to an empty string.
* Parameter: Word Cloud chart didn't change even if you changed the parameter values.
* Schedule: After re-authorizing the OAuth access, it didn't return to the original Insight page where you started the re-authorization process.
* Schedule: Refreshing data did not work for the Weather Data.


## 6.3.4.0

Released on 12/30/2020

### Bug Fixes

* Analytics: Analytics that have been published with Exploratory Desktop 6.3 or older version raised errors when interacting with them with the Parameters or scheduling them.
* Analytics: The underlying logic for building the models under the Analytics View has been optimized to run it more efficiently.
* Analytics: Cached Analytics models were not properly invalidated when the Parameters it depends on were updated.
* Parameter: Existing RDS/Parquet data cache files were not cleaned up properly when they were republished.
* Insight: Invitation to an Insight using email address did not work if the specified email address had upper case letters.
* Insight: Insight Search by date range was not working.


## 6.3.1.10

Released on 12/10/2020

### Enhancements

* Parameter: Supporting the prediction feature with models created by the Analytics View in the Interactive mode.
* Scheduler: Notification emails will be sent when the scheduling jobs failed. (SMTP server configuration is required.)
* Server: Users can now set their locale related setting from the server UI (locale, first day of week). This information is used for the Scheduling and the Interactive mode.
* Insight: Supporting "Last 7 days" and "Last 30 days" options in Date Range parameter in Insight Search.

### Bug Fixes

* Parameter: When opening the Parameters pane, it was showing the "hidden" parameters.
* Parameter: Interactive Session with the database data source type published by previous versions of Exploratory Desktop raised an error.
* Server: Deletion of published Data/Chart/Analytics did not correctly recover the disk space.


## 6.2

Released on 10/16/2020

### Enhancements

* Parameter: Before this release, even when the list of values for a categorical parameter was based on unique values of a data frame column, the list of values were fetched only at the creation of the parameter, and it had fixed options of values after that. With this release, list of values for such a parameter is dynamically updated when the data frame it depends on is updated.
* Summary View: We now show percentages for character and factor columns.

### Bug Fixes

* Parameter: Display name was not used for the the 'List of Values' type parameters.
* Parameter: List of Values did not work when the referenced column name contained special characters.
* Parameter: Starting the Interactive Session failed with error "could not find function '%>%'".
* Scheduler: Refreshing the Dashboards with Wordcloud charts was not working.
* Server: The Map was shown over the parameter pane.

## 6.1

Released on 9/20/2020


### Enhancements

* Data Catalog: Support "History" tab next to the "Metadata" tab in published Data Shares.
* Insight: Data Range search option improvement to show the most viewed Insights based on the last N period in Insight view.
* Insight: Tile view support in Insight view
* Insight: Insight Search: Page loading performance improvement.
* Parameter: Partial chart refreshing support for markdown reports (Dashboard, Slides, Note)
* Parameter: Improved Parameter usability by uptaking new widgets.
* Parameter: At the begining of an Interactive Session, Collaboration Server loads the data to be used in the Insight from the Parquet or RDS files. Before this release, Collaboration Server just loaded all the data for data source steps and recalculated necessary steps from there, regardless of steps cached on the Exploratory Desktop. Now we honor steps cached on the Exploratory Desktop, and calculation on the Collaboration Server also starts from the cached step data, instead of from the data source step data, if it is available.
* Parameter: Scheduler: Data loading time performance improvement.
* Parameter: Set "Autorun" off by default.
* Parameter: Scheduler: Connection initialization performance improvement.
* Scheduler: Publish history on a shared item includes updates by the scheduler.
* General: Before this release, connection information for Data Sources, such as host name for a database server, was kept in each one of the Data Source Steps uploaded to the Collaboration Server. This meant that if a connection information changed, you had to re-upload all the Insights that used the data sources with the connection information. With this release, we store the connection information as a centralized metadata on the server. This means you need to upload only one of the Insights that uses the changed connection informatoin, and the rest of the Insights start using the new connection information uploaded with the one Insight you uploaded.

### Bug Fixes

* Data Catalog: Scheduling a shared Data, Chart or Analytics broke the connection information defined on the server.
* Data Catalog: Invalid API key is set in CSV API URL if you are not logged in.
* Data Catalog: If the Super Table has a list data type column, it failed to render the table when typing search keywords in search input field.
* Data Catalog: Super Table didn't load properly when network speed was slow.
* Parameter: When numbers were used for parameter display names, single select pulldown for Numeric column did not work.
* Parameter: Before this release, if Rserve child process, which is the R execution environment for Collaboration Server, crashed while executing, Interactive Session or Scheduled Data Refresh was kept waiting indefinitely. Now we handle such cases better, and the error is properly reported to the user.
* Scheduler: Scheduler failed at .save_remote_rds and threw "file.exists(path) is not TRUE" error.
* Scheduler: If you modified the title and description online and schedule it, it reset the modification on the title and description.
* General: Download page should not show download button for Viewer users.
* General: Empty LOV showed up if you clicked a '...' button on a Data share page that you didn't own.

## 6.0

Released on 6/12/2020

### Enhancements

* Japanese translations for more UIs including Share, Schedule, and Parameter.
* Added the Parameter support for Chart and Analytics.
* You can write a message and send it when you share the published contents with others.
* You can add a comment when you publish or republish. The comments can be viewed as 'History' by others.
* Support SMTP for sending out notification emails.

### Bug Fixes

* Changes made to a user's properties were not immediately reflected on the Admin UI.
* Set "Shared with me" as a default scope if Viewer selects "My insight" menu from the user dropdown menu.
* Schedule: After a long-running job, other jobs stayed in the queue and did not get processed.
* Certified with Exploratory Desktop 6.0.1.

## 5.5.5

Released on 3/26/2020

### Download Links

* [For New Install](https://exploratory-download.s3-us-west-2.amazonaws.com/collab-server/exploratory-collab-5.5.5.0.tar.gz)
* [For Upgrade](https://exploratory-download.s3-us-west-2.amazonaws.com/collab-server/exploratory-collab-images-5.5.5.0.tar.gz)

### Bug Fixes

* The Share dialog now shows the sharing URL once the URL share is enabled.
* Bundle/host all the 3rd party libraries inside the Collaboration Server.
* Updated the link for the Getting Started guide.

## 5.5.4.2

Released on 3/11/2020

### Bug Fixes

* Added a support for the OAuth data sources including Google Sheet, Google Analytics, Google BigQuery, etc.
* Added a support for MS SQL Server data sources for scheduling and the interactive mode.
* Each author can now enable the Parameter for his/her Dashboards and other contents to those who are not logged in.
* Schedule: You can now re-authorize the expired OAuth tokens from the server UI.
* Admin UI: The User table shows the user type, either Author or Viewer for each user.
* Header menu is now translated for Japanese.
* Admin UI is also now translated for Japanese.

* The user type was shown as "Public" where it should be "Viewer" at the server UI.
* Admin UI: "Scheduler" user type was shown in the user table.
* Deleted users were displayed on the Users Administration page.


## 5.5.1.1

Released on 2/3/2020

### Bug Fixes

* Admin UI: Type of user accounts (Author/Viewer) displayed on the Users Administration page was not correct.
* Parameter: Run button flickered unnecessarily, when parameter values were changed.

## 5.5.1

Released on 1/31/2020

### Enhancements

* Certified with Exploratory Desktop 5.5.1.

### Bug Fixes

* Parameter: Minimum/maximum limit on text field numeric parameter was not correctly enforced.
* Improved response time for opening Share Dialog.

## 5.4.1

Released on 12/1/2019

### Enhancements

* The data download REST API now supports the private data access.  Also, users can directly download the privately shared data directly in Exploratory Desktop.
* Added "Liked by Me" search scope for the Insight Page.
* Partial word matching support for the Tag search for the Insight View.

### Bug Fixes

* Now "Scope" search criteria doesn't show up for the guest users (users without logging in).
* Dashboard view didn't resize properly when a user resize the browser window.
* Super Table didn't get refreshed after the Data was refreshed.

## 5.3.2

Released on 9/10/2019

### Enhancements

* Certified with Exploratory Desktop 5.3.2.

### Bug Fixes

* Timezones used for timestamps displayed in shared Dashboard/Note/Slide page was inconsistent.
