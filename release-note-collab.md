# Release Note

## 6.0

Released on 6/12/2020

### Download Links

* [For New Install](https://exploratory-download.s3-us-west-2.amazonaws.com/collab-server/exploratory-collab-6.0.1.1.tar.gz)
* [For Upgrade](https://exploratory-download.s3-us-west-2.amazonaws.com/collab-server/exploratory-collab-images-6.0.1.1.tar.gz)


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
