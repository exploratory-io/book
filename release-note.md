# Release Note

## v 3.4.5.1

### Bug Fixes

- Error about 'zoo' package when running Time Series Forecast.
- Error about 'growth' parameter when running Time Series Forecast.

## v 3.4.5

### New Features

- Pivot Data Export - Now you can export the data presented in the Pivot Table view as CSV.  

### Enhancements

- Google Sheets Data Export - Now you can overwrite the existing sheet data instead of creating a new sheet.
- Data Re-Import - Now you can reload the data for all the data frames, which are referenced from the current data frames, from the corresponding data sources.
- Added new aggregation function menus for 'na_count' and 'na_pct'.
- Added a link on the embedded Viz in Note so that you can navigate to the Viz in data frame directly.
- Filter - Now you can also type the (filter dialog) honor user entered value even if it does not match LOV
Note export code refactoring
- Updated the wording around 'Create Bucket'. Now we call it 'Category' to simplify.
- Add additional functions (min/max/mean/median) for Window Calculation of  “Difference from”/“% Difference from” for the column header menu and chart.

### Bug Fixes

- Showing a blank chart area when opening a data frame whose default view is set to non-first chart tabs.
- Logical data values (TRUE/FALSE) are not sorted correctly inside the legend for Charts.
- Viz title footer is not shown correctly for Pivot Table in Note.


## v 3.4.4.1

Released on 5/7/2017

### Enhancements

- Added "Convert to Local Timezone" menu to POSIXct columns.

### Bug Fixes

- Transform Step - bind_cols: Fix issue that Error Dialog popups when a bind_cols transform step is clicked on right hand side list.
- Transform Step - custom command: Fix issue that unwanted data source file path info is displayed for a custom command step.

## v 3.4.4

Released on 5/6/2017

### Enhancements

- Document overhaul - We have updated the documents (https://docs.exploratory.io/) to cover all the features of Exploratory Desktop. Some of the pages are still going through updates, but you can see what's there at the high level including Data Import, Data Wrangling Commands, Visualization, and Machine Learning / Statistics. Also, you can search the document to find your interested topics easily.
- Summary View - We have brought Summary View back as the default view for the data frames again!
- Each Data Frame now remembers the last-opened view of either Summary, Table, or Viz view so that it will show you the last opened view when you open the same data frames.
- Chart: Set larger png/svg export default size for the chart export.
- Chart: add show title properties.
- Performance improvement of Table View when there are many columns.
- Performance improvement when deleting a Data Frame.

### Bug Fixes

- In MongoDB data source dialog, the logical values (true/false) are not matching. MongoDB uses them in lowercase but the table is showing them in uppercase.
- Chart: Fix for the small multiple scroll issue
- Chart: Fix issue with no data. (check nrow before running query)


## v 3.4.3

Released on 5/4/2017

### Enhancements

- Added “Anonymize Text” column menu
- Added “Concatenate Text” column menu
- Added property checkboxes to show/hide title text on a chart

### Bug Fixes

- You get an error message dialog showing up when there is no data from the previous step.


## v 3.4.2.1

Released on 5/2/2017

### Bug Fixes

- In Time Series Forecasting, forecast result degrades to linear trend line without seasonality taken into account.

## v 3.4.2

Released on 5/1/2017

### Enhancements

- Show ‘%’ on value text such as axis tick label, balloon text, and value text on plot area if chart is based on percentage.

### Bug Fixes

- SQL errors on database data sources are not properly shown and following error is displayed. `Error in if (conn) {: argument is not interpretable as logical`
- Factor values on Summary View overflows.
- Variable replacement in SQL by `@{<expression>}` is not working.
- In Time Series Forecasting, meaningless weekly seasonality is returned even when aggregation level is larger than week.
- Number of bars is incorrect for date data in Summary View
- Bar order should be 'TRUE', 'FALSE', 'NA' for logical data in Summary View.

## v 3.4.1

Released on 4/29/2017

### Bug Fixes

- Chart - Character data type has become Date automatically for Boxplot X-Axis
- Excel Data Source - Not all rows are imported after clicking Save button.
- Export to Clipboard - Exported character data is quoted by double quote when pasted to Numbers on Mac.
- Summary View - Bars for Factor columns are not sorted appropriately by the factor level when there are more than 300 levels.
- Time Series Forecasting - Specifying Strength of Holiday Effect results in an error.

## v 3.4

Released on 4/27/2017

### New Features

- Export to Google Sheet - You can directly export data into Google Sheet.
- Export to Clipboard - You can copy the data to the clipboard so that you can paste it to other applications like Excel, Numbers, Email, Text Editor, etc.

### Enhancements

- Improved stability of the database connections by checking validity of the connection.
- Introduced Export and Publish buttons at the top level. You can export data or save charts from Export button. And you can publish your data or charts to share or schedule.
- Moved 'Reload' button to the top, next to the data frame name, and renamed it to 'Re-import'. It's also showing the last imported time.
- MongoDB - Upgraded the underlying library of 'mongolite' to 1.2 for a better performance.
- MongoDB - Introduced a connection pool. This will make your query performance a bit faster since it won't need to create a connection every time you run the query while you are in the MongoDB data import dialog.
- MongoDB - Introduced 'Big Integer as Character' option to bring the data values as character instead of as double.
- MailChimp - Added "Date Range" options to get last N days/weeks/months/years
- MailChimp - Added “Members” and “Subscriber Activities” for "Data Type"
- Stripe - Added "Date Range" options to get last N days/weeks/months/years
- Chart - Introduced 'Layout' button which will open the layout configuration dialog. This used to be accessed from 'More' button.
- Chart: Table Viz - URL link support in Table
- Chart: Map now remembers zoom level and location on each move/zoom action
- Chart: "more" tab: now even if there are many vizs, tabs do not wrap to next line.
- Model: XGBoost: Added 'na.action' parameter for model training.
- Model: XGBoost: Added sparse model support. Sparse model is used when it’s indicated by a parameter or when there are categorical variables.
- Project Search - Added the chart names and data source names to the search index.


### Bug Fixes

- MongoDB - Typing 'null' was ignored or showing error sometimes.
- Twitter: non-ASCII characters in Search was not returning appropriate results.
- PostgreSQL / Redshift - Database connections were not accessible due to the connection pool timeout.


## v 3.3.0.2

Released on 4/14/2017

### Bug Fixes

- Fixed issue that SPARQL data source extension fails loading data with error : "Error: package 'RCurl' could not be loaded"

## v 3.3

Released on 4/12/2017

### New Features

- Scheduling Insights at Exploratory.io
- My Insight Page - Single place for al your insights.
- Time Series Forecasting with Prophet
- GeoJSON Map Extensions UI
- Data Source Extensions UI
- Insight Template Extensions UI
- UI for Creating Buckets
- UI for Mapping Data
- Search Project and Data Frame at Project Page
- OAuth as Connection - Global OAuth Management - Now you don't need to see the OAuth screen for creating every new data frame with Google Analytics, Google Sheet, Twitter.
- Chat with Exploratory Support Team - Now you can ask questions within the desktop app.

### Enhancements

- Chart: Support Copy
- Chart: Histogram - Color Support
- Chart: Auto-detect column names in chart range setting
- Chart: Small Multiple: show title and title font size for y axis for small multiple case
- Chart: Added 'Y-axis : Include 0 or not' property for Line chart
- Chart: Error Bar: Support ‘Direction’ for Color like Bar chart
- Table view: Keep the current table position before / after running commands
- Pivot Table: Sorting support
- Build Model: Support Custom Entry for Formula
- XGBoost - Categorical column support
- XGBoost - More metrics for Summary view
- New function: K-means at a column level.
- New function: Impute NA
- Prediction: Now you can apply the machine learning model to another data frame other than the training and the test data sets.
- Support large document data for tokenize / count pair functions.
- Performance Improvements for Database Data Import Dialogs including ODBC, PostgreSQL, Amazon Redshift, MySQL.
- Introducing a way to configure the repository location.
- Support copying long text in a cell from table view. (Cell detail comes up by click instead of hover)

### Bug Fixes

- Getting an empty screen when launching the app.
- Didn't get any response or got an error for testing ODBC Connection for Oracle database.
- Viz Tab order was not honored in copied Data Frame
- ‘name of null’ error is raised while grouping by categorical variables in Viz view
- Google Analytics: Dimensions and Metrics List of Values disappears when try to grab scrollbar on Windows.
- Google Sheet: Worksheet Name is not automatically refreshed based on Sheet name selection
- When an edf was exported from branch, the branch was lost when imported
- Log File Import fails with Error : `guess_max` must be a positive integer
- Chart: Y-Axis Shouldn’t be able to be deleted when there is only one left
- chart: bars on chart edges are chopped in multi-y, small multiple case
- Chart: map doesn’t remember the zoom level
- chart: color order in the custom color palette is applied in an opposite way for the legend
- chart: show NA as one of categories in repeat by and color
- Chart: Error dialog shows up with bar chart with huge number of unique values at X-Axis
- The 21st rows in Table view is not shown up fully


## v 3.2.3

Released on 3/13/2017

### Enhancements

- Added Chat window to ask Questions to Team Exploratory directly.

### Bug Fixes

- countrycode function was showing an error when trying to produce 'country.name' as outputs.
- Couldn't import Statistic data files (SAS, SPSS, STATA).
- Branch names are not showing up in 'Merge (Set Operation)' dialog.
- Fixed R packages installation issues at setup time.
- Needed to pick up quanteda fix about library() error that is not yet released on CRAN.

## v 3.2.2

Released on 3/7/2017

### Bug Fixes

- Fixed issue that building XGBoost model fails with "R error: Error: invalid response (expecting SEXP).
- Fixed typo missclassification -> misclassification in xgboost functions.
- Modified time aggregation of do_anomaly_detection from round_date to floor_date.
- Not to show error dialog at Viz if it is coming from invalid DAG step.
- Added a support of taking care of a broken user configuration file.

## v 3.2.1

Released on 3/3/2017

### Enhancements

- Support 'Save as EDF' for Charts.
- Table view: Keep the current table position before / after running commands.
- Added 'Copy Chart'.
- Shows the thumbnail images when mouse over on the chart tabs.
- build_kmeans now returns cluster labels as factor instead of as integer.
- build_kmeans works now supports grouped data frames.


### Bug Fixes

- Fixed an issue that step command was executed when deleting an empty “Add New..” token.
- Fixed an issue that Pivot with Color By with 'Row' option was showing an empty screen.


## v 3.2

Released on 2/27/2017

- [Announcement blog post](https://blog.exploratory.io/exploratory-v3-2-released-da940b794043#.in318rz68)

### New Features  

- Added Anomaly Detection algorithm with 'AnomalyDetection' package.
- Added XGBoost (Extreme Gradient Boosting) model with 'xgboost' package.
- Added Random Forest model with 'RandomForest' package.
- Added Chi Squared Test.
- Added Simulation for Survival Model.
- Support Custom Color Palette with Color Picker.
- Custom Data Source Plugin - Users can create their own data source plugins with UIs.
- Added Heatmap on Map.
- Support Horizontal mode for Bar chart.
- Shows thumbnail images of the charts included in each data frame when users place the mouse over.
- Added a 'pivot' function - you can use this function to create 'two-way', 'contingency', or literally 'pivot' table.

### Enhancements

- Support Confidence Intervals for Trend Lines.
- Data Frame / Branch UI re-organization.
- Column header menu now adds an operation as an extra token within existing step if it's a same type of operation for Mutate, Summarize, Group By, Select, Rename, Arrange (Sort).
- Select UI dialog now inherits the previous selection of Include or Exclude.
- Google Spreadsheet - It shows a list of the worksheet names you can select from.
- Map: It memorizes the position/zoom where you left the map last time, and restores it when you view it inside Viz/Note.
- Duplicate as Data Frame - you can select a step in either main or branch data frame and promote it as a data frame with the steps.
- Duplicate Branch with Charts.
- Now you can install your favorite R packages from your local file system.  
- Export Data with Steps as EDF (Exploratory Data Format) and save it to the local file system.
- Generated R Script now supports cases where data frames are joined and / or merged.
- Pivot Table Viz: Support Text Wrap and Responsive Column Width.
- Pivot Table Viz: Support Show / Hide the value column.
- Support no username / password for ODBC connections.
- Disabled step should be skipped in reproducible script


### Bug Fixes

- Transform Input UI: Error message is not shown
- [EDF Import] Error Handle when importing EDF has error


## v 3.1

Released on 2/8/2017

### New Features  

- Added Survival Analysis with Survival Curve and Cox Regression Model.
- Added Multinomial Logistic Regression support.
- Scatter - Support showing 'circle' to show the range for the dots.
- Scatter - Support showing trend lines with lm, loess, and gam.
- Scatter - Support Error Bar.
- Line Chart - Support 'Range' to show confidence interval range.
- R Script Editor


### Enhancements

- Added anonymize function from 'anonymizer' package to anonymize given text.
- Added 'forcats' package to make it easier to work with factor data type.
- Column names in Data Transformation Steps are now highlighted.
- Support 'cancellation' for database connection testing.
- Pivot: Show an assigned column name at the top for Column.
- Scatter - support the circle size even when a column is not assigned.
- Performance improvements around Data Frames and Steps navigation.
- Added a command menu for converting 'difftime' data to numeric.

### Bug Fixes

- Added an error check to show error message at the app launch time.
- Added a recovery mechanism so that users will be able to open their projects even when the chart definition files have been broken.
- 'statecode' function now supports DC - District of Columbia mapping.
- Insert Step menu is not available on branch.
- Column selection in Logistic Regression form is partially hidden.
- Error Dialog popups when there is an error on a new step (and step is not saved yet) and try to move to different tab.
- Changing pinned step status from disable to enable did not refresh viz.
- Bar chart was not respecting the levels set in Factor columns.
- Chart: Fill with NA and Same Column assigned to Color and Repeat By produces a blank
- Chart: Un-sync is not working with Line and Scatter Charts with Small Multiple.
- Chart: Table Viz doesn’t show up when there is a list column
- Disabling / enabling step did not fresh pinned Chart.


## v 3.0.2

Released on 1/26/2017

### Bug Fixes

- Couldn't assign a new connection after importing projects from another environment.
- Data Frame list is not up-to-date when opening Join dialog for the first time.

## v 3.0.1

Released on 1/25/2017

### Bug Fixes

- Multi-byte characters (including Japanese) were not handled properly in Import by Writing R Script dialog UI.
- Getting error pop-up dialog consistently in Viz view after updating or deleting existing steps.


## v 3.0

Released on 1/24/2017

### New Features  

- Added Model Building and Evaluation for Linear Regression, GLM, Logistic Regression.
- Added 'Multiple Columns Selection' for both Table and Summary views, which will show context sensitive data wrangling commands menus.
- Added 'ODBC' data source type.
- Added Error Bar as a new visualization type.
- Added Table as a new visualization type. You can sort a column and show bars to help comparing the values easier.

### Enhancements

#### Chart ####

- Chart Color - Added New Color Palettes
- Chart Color - Default color switch - Users can now choose different color palettes even when a columns is not assigned to Color.
- Chart - Added support for font size for X / Y Axis tick labels and Legend.
- Chart - Added support for show / hide grid lines and zero lines.
- Chart - Save as PNG / SVG with transparent background color.
- Chart - Performance improvements for Chart rendering at exploratory.io cloud server and collaboration server.
- Chart - Added 'Ordered Factor' Support for Color - Map / Scatterplot.
- Chart - Log Axis scale support for Bar and Scatter charts.

#### Pivot ####

- Pivot Table - Added '% of Total' support. Users can set a direction for calculating the percentage.
- Pivot Table - Switched the Color formatting logic from 'equal group' to 'equal length'.
- Pivot Table - Added Column based color formatting along with the existing Row and All.


#### Map ####

- Show sample values from GeoJSON file's properties in GeoJSON setup dialog UI.
- Added '# of Rows' for Color.


#### Data Wrangling ####

- Added new data wrangling operations with the column header menu. - Move to, Gather, Unite, Analytics, etc.
- Added 'Ungroup' command shortcut under '# of Groups' indicator dropdown.
- Stop words - Support Multiple languages.
  * Danish
  * Dutch
  * English
  * Finnish
  * French
  * German
  * Hungarian
  * Italian
  * Japanese
  * Norwegian
  * Portuguese
  * Russian
  * Spanish
  * Swedish
- Added 'convert_to_NA' function as UI command.
- Added 'excel_numeric_to_date' and 'unixtime_to_date' functions to convert numerical values to date / time.
- Added 'row_as_header' function to make one of the rows as column header.
- Added 'normalize' function, which is a wrapper for 'scales' function but returns a numeric vector, not a matrix.

## Note ##

- Note: Improved the experience around the chart embedding in Note.
- Note: Improved the performance for creating new Note or opening existing one.
- Note: Support renaming Note name.

## Others ##

- Support renaming Data Frame name.
- Added a better handling of 'space' or other special characters for data frame names. It now replaces them with underscore '\_'.
- Added a support for 'space' for new column names with data wrangling.
- Added 'Duplicate' support for Note.
- Thumbnail image generation support for Map. You can see the Thumbnail images for Map when Note is saved locally and also published at exploratory.io.
- CSV Data Import - Made UTF-8 a fallback encoding for ASCII. This will make the data loading with CSV better.
- Added 'Update' button to upgrade user installed R packages.
- Show Scrollbar always (Mac). Also, users can choose whether showing the scroll bar or not in the configuration dialog.
- Improved the text formatting in 'Import by Writing R Script' dialog.
- Added Proxy Server configuration through UI
- Windows Installation failed to download git and/or R if install path contains space in it.
- Windows build is now signed with an appropriate certificate.
- R package install - Use backup CRAN clone when installing additional R package fails.

### Bug Fixes

- Unfinished token was not removed when a user clicks OK button on Command UI Dialog
- Updating source step does not refresh pinned viz.
- There is a lag between refresh icon click and actual spin icon shows up timing
- UI freeze was caused by GeoJSON Map
- Fixed for Delete First Viz causes Empty Screen
- 0 was not showing up in Column of Pivot.
- Logical column values (TRUE / FALSE / NA) were not correctly sorted.
- Can't select a column inside Filter dialog for Existing one in Branch
- Command Line Mode: Flickering after executing the command
- Chart: Not refreshed when clicking on Refresh button and when it's pinned
- Strip semicolon at the end of SQL to avoid syntax error (Released as 2.5.1.5)
- Avoid parsing and recomposing of SQL to work around replacing of double quoted column name with single quoted string on PostgreSQL (Released as 2.5.1.5)
- do_tokenize regex option was not saved
- Reorder the sections inside the generated R scripts.
- Note: Pivot Table column headers were not showing up.
- Fixed Viz not rendered with “Adding New Transformation” card selected case.



## v 2.5

Released on 12/1/2016

### New Features

- Data Source: Remote Files - You can point to remote files (e.g. CSV, Excel, etc.) and import the data. This makes it easier to refresh the data by simply clicking on 'Refresh' button at the top of the data transformation steps (right hand side).
- Data Source: Presto - You can now query against your Big Data with Presto.
- Map: GeoJSON Support - You can bring your own GeoJSON and visualize your geospatial semantic data easily and flexibly.
- MongoDB - Aggregate support - You can build the stage based aggregation pipeline in MongoDB Data Import dialog.

### Enhancements

- MongoDB: Support MongoDB Shell format - Now you can write your queries in MongoDB Shell's JS format as well as in the original strict JSON format.
- Google BigQuery: Standard SQL support
- Support both Auto Run vs. Manual Run modes - You can choose whether you want to run the command automatically or manually in each dialog.
- We have added new R functions, statecode and countycode, to make the US States and Counties data mapping easier.
- UI support for 'get_dupes' function from 'janitor' R package.
- Note: We have introduced a dropdown list for Data Frames in Chart Selection dialog in Note, to make the chart selection easier and faster.
- Redesigned UI for Analytics (Correlation, Distance, K-means Clustering, Cosine Similarity) and Text Analysis commands.


### Bug Fixes

- Fixed an issue that the command editor behaves incorrectly when you copied a command with multiple lines into the command editor.
- Fixed google analytics View ID update issue.
- Fixed overflow issue on error icon on transform list
- Fixed an issue that when you change existing "select" command while "Add New" token exists it fails
- MongoDB: Changed to show error when no collection is selected.
- Fixed unwanted viz refresh issue when a viz, data share button is clicked.


## v 2.4

Released on 11/10/2016

### New Features

- Analysis Step Persistent Data Cache - You can set a particular step(s) to keep the data cache across the sessions so that it won’t run the operation unless you explicitly request. This would be useful when you have a step that would take a long time to complete.
- Saving Note in HTML - Now you can save it in HTML format.
- Sharing with URL - You can generate an unique URL to allow anyone with the URL to open Data, Chart, or Note you have published regardless whether he / she has an account at Exploratory or not.

### Enhancements

- Note - You can publish and share your Note in a private mode.
- Twitter Search / Timeline - Added a Text Sentiment Score option.
- Google Analytics - Hour of Day column is now automatically converted to POSIXct as default.
- Opening Chart dialog in Note is much faster now.
- Chart - The order in Legend is not synced with the order in the plot area.

### Bug Fixes

- DB connection information was not reflected in the generated R script.
- Bar chart didn't show up with Repeat By when the data size was large.
- Chart - Removed unnecessary zero values displayed on the plot area when showing the values.
- Small Multiple Chart - Bar chart with '% of Total' window calculation was broken.

## v 2.3

Released on 10/26/2016

### New Features

- Data Wrangling Steps - You can now copy, cut, delete, and disable one or multiple steps together. This would be useful when you want to move steps within the same data wrangling chain or move between data frames and branches. Also, by disabling one or multiple steps you can temporally ignore the steps while you can still keep them just in case you might need them later.

### Enhancements

- Small Multiple - Added Date Aggregation level support
- Small Multiple - Now you can have Boxplot in Small Multiple.
- Small Multiple - Added a parameter whether synchronize the values on X-Axis among the charts or not.
- Bar / Line / Area Charts - You can now show the values in the plot area.
- CSV Export: Added an option to select the separators.
- Performance improvements - Chart / Pivot - Sampling data
- Performance improvements - Data Import Dialog - It queries only 100 rows as default, which makes the iteration for testing out various queries much faster and more interactive.
- Performance improvements - Google BigQuery - Now you can download the data via Google Cloud Storage. We have observed the performance improved from 40 minutes to 6 minutes or so for importing 1.5 GB data with our typical internet speed.
- Data Import Dialog - You can now select which columns to import.
- New Data Source: HP Vertica, Google Trend, Twitter Timeine.
- MongoDB - Added a support for Fields (Projection), Sorting. Skip, and Limit (number of documents).
- Data Wrangling Commands - Added remove_empty_rows, remove_empty_columns, clean_names (clean column names) functions from 'janitor' package.
- Chart: Support configuring the number of decimal digits inside the chart.
- Bar, Line, Area Charts: Showing Y values on Chart.
- Line chart: fill blank as NA, 0, Previous, or Next values.
- Chart: Added a property to show/hide function names (e.g. SUM) in Legend.
- Share: You can now download csv data file on the chart / data shared pages.
- OAuth Data Sources: You can cancel when you happen to close the OAuth web browser window without authorizing.  


### Bug Fixes

- Small Multiple - Chart size didn't fit into a window
- Small Multiple - The charts were not sorted when it was Scatterplot.
- Small Multiple - Scatter used to start from 0 for X/Y, now it's automatically scaled.
- Line chart - it was drawing lines even including the points where there is no data.
- Line chart - it was not starting from 0.
- Cholopleth - For US State map, changed the default to ISO2 letters.
- Scatterplot - Use a random seed when needing to sample data.
- Chart: Respect Ordered Factor's level for sorting even when the data is numeric.
- Note: Small Multiple was overflowing.
- Table: Header and body were misaligned when adding a new transformation step on Windows.
- Share dialog didn't show up correctly from desktop's 'Add or remove user' link


## v 2.2

Released on 10/10/2016

### New Features

- Small Multiples - It is a series of charts each of which shows only a slice of the entire data with the same scale and axes. You can create Small Multiple by assigning a column to 'Repeat By'.
- Neo4J Graph Database support with Data Import Dialog. Now you can write Cypher query to extract data from Neo4j database.

### Enhancements

- Chart: Expanded View - You can now expand the chart view area by clicking an expand button at the right hand side top.
- Copying Data Frame - You can copy an existing data frame along with the branches and the visualizations.
- MongoDB - Authentication DB support - Added authSource parameter support.
- Filter operation - Added “is stopword” and “is alphabet” to the operator.
- Changed the icon for Showing/Hiding the left hand side tree. (List of data frames area.)
- Added 'list_concat' function to either merge multiple list columns or concatenate multiple rows with 'collapse' argument. If you want to convert the list values as text then you can use 'list_to_text' function.

### Bug Fixes

- Fixed the command UI style for Windows.


## v 2.1

Released on 9/29/2016

### Enhancements

- Database Tables List in Data Import Editor: You can see a list of database tables for Amazon Redshift, PostgreSQL, MySQL, Amazon Aurora database, and click to paste the table name into SQL Editor.
- Chart: You can now pick from wide range of the color palettes even for Scatter, Cholopleth, Map, Heatmap, and Contour. Also, you can customize the color palette when it's categorical (text column).
- Chart: When you assign a numeric column to Color for Scatter and Map, you can set it to 'As Numeric' for treating as Continuous or 'As Text' for treating it as Categorical.
- UI update for Association Rules (Market Basket Analysis).
Add Include and Exclude option for slice
- Add "not start with" and “not end with” in filter for character columns
- Uptaken lubridate 1.6.0
   * add yq function
   * add parse_date_time in reference
   * add as_datetime function
   * remove parse_datetime and parse_date in readr package from reference
   * bimonth and halfyear support for unit argument
   * add quarter function
   * add as_datetime
- “Cmd+ Enter” shortcut key support for running command when you are in Expression Editor (e.g. Mutate). You can always click "Enter" key in any dialog though.

### Bug Fixes

- Non-Latin1 characters are now handled correctly on Windows. Also, you can enter Non-Latin1 characters in commands like Mutate, Filter, etc, as well.
- Duration type is now supported in Summary view.
- In slice command, start and end wasn’t with braces correctly (ex. 2 as start and n()-1 as end, it was 2:n()-1 which was equal to 1:(n()-1) but now, it generates 2:(n()-1))
- In command builder “Day, Month, Year, Hour, Minute, Second” should have generated “dmy_hms” but it generated “ymd_hms” function
- In command builder “Concatenate items" is now “Convert to text” and generates “list_to_text”, not “list_concat”


## v 2.0

Released on 9/21/2016

## New Features

- UI Assistant for dplyr - grammar based data wrangling and analysis commands
- Support sharing of Chart and Data in a private mode.
- Association Rules (arules) - using 'arules' package to calculate the association rules.

### Enhancements

- Pivot Table - Support of switching between Text / Numeric for Row - this will make the sorting better.
- Chart: Multiple Y-Axis support - You can now add more than one column to Y-Axis.
- Chart: Sorting for Bar chart - You can now control which Y-Axis column to use for the sorting and the order of the sorting between Ascending and Descending.
- Note: Pivot support - Now you can embed Pivot Table inside Note.
- URL related functions - Standardize the interface for URL text data wrangling related functions.


### Bug fixes

- Google BigQuery - Show more than 50 data tables


## v 1.10.1

Released on 8/29/2016

### Enhancements

- Support SSL for MongoDB connection

### Bug fixes

- You don't need to enter username/password for MongoDB when they are not set, typical for the local MongoDB setup scenario.

## v 1.10

Released on 8/26/2016

### New Features

- The following window calculations are quickly accessible as part of Bar, Line, Area charts.
  - Running Total / Cumulative
  - % of Total
  - Difference from
  - % Difference from
  - Moving (Rolling) calculations)

### Enhancements

- Chart - Now all the layout related configurations (e.g. Title, Margin, Legend position, etc.) are managed in a single place, which can be invoked by clicking on 'Layout' button.  
- Chart - You can set the Legend position (right, left, top, bottom)
- Chart - Area chart is stacked as default, which would give you a much better visual representation of the data.
- Pivot Table - You can click on the column header to sort the data. This sorting also work on the shared Pivot Table at exploratory.io as well.

### Bug fixes

- Data in Legend was not respecting the sorting order that is set as Factor column. (Ordered Factor)


## v 1.9.0

Released on 8/16/2016

### New Features

- Pivot Table - You can now use Pivot Table to summarize data quickly and spot patterns and trends by using color. Here is a [blog post](https://blog.exploratory.io/introducing-pivot-table-1c9c949fd2d6#.z8dwtwbx9) introducing Pivot Table.

### Enhancements

- Google Analytics - Goal Data Support - Now you can bring Goals related data by selecting the related dimensions and measures. This is useful to understand and analyze 'conversion funnel'. [Blog post](https://blog.exploratory.io/analyzing-user-conversion-funnel-with-google-analytics-data-ddeed14ce26f#.y5buhtbz0)
- Highlight data frame names, which are joined to the currently selected data frame, in the left hand side pane.
- Chart - it supports multiple color palettes when categorical columns (e.g. character) are assigned to Color. Also, you can customize the color palette using hex codes.
- It shows the number of the returned data rows in Data Import dialog.

### Bug fixes

- Now you can import large data file even for Windows. Before this fix, it was throwing an error when trying to import large size data that was bigger than 2 GB, only for Windows.
- Error validation for Branch name conflict used to close Branch name entry pop-up. Now it shows the error but you can still update the name in the same dialog.

## v 1.8.0

Released on 7/29/2016

### New Features

- Support for Google Big Query [Introduction](https://blog.exploratory.io/clustering-r-packages-based-on-github-data-in-google-bigquery-1cadba62eb8d#.u9gdj46tr)
- Support for Amazon Aurora Database

### Enhancements

- do_ngram function now takes sentence id and document id, both of which are always generated by do_tfidf function. This means you don't need to run 'group_by' before building the ngram step. Also, it produces the ngram text in columns so you will need to use 'gather' command to make them into a single column. [Detail](https://exploratory.io/reference/#do_ngram)
- do_tfidf function now supports 'norm' argument that can be used to normalize the TF-IDF values. The default is L2. [Detail](https://exploratory.io/reference/#do_tfidf)
- You can now use Cmd+Enter (Mac) or Control+Enter (Windows) to run the sql queries in Data Import dialog.
MongoDB: Added help text for query

### Bug fixes

- Deleting a data frame with the mouse over delete icon deleted a transformation steps in the currently selected branch. -> Fixed.
- You can download EDF (Exploratory Data File) with Multibyte characters now.
- Now the data frame names are sorted by mix case (upper and lower cases) in the left hand side.

## v 1.7.0

Released on 7/18/2016

### New Features

- Chart sharing with Data - You can publish and share your chart with Data Wrangling Steps now. This will make it easier for others to see how the data for the chart was prepared.
- Chart sharing on Medium - You can copy and paste an URL of the shared chart into Medium blog post to embed an interactive chart.
- Remote database connection - You can create 'connections', which has a set of the connection parameters, for your databases on the project list page and use them for multiple data frames. You no longer need to type the databases information for every single data frame!
- Custom R functions and variables with R Script - You can register your own R scripts where you can define your R functions and attach them to your projects so that you can call the functions when you work with data. This can be used for defining your own variables as well.
- Selective R package loading per project - You can select which R packages to load at the project level.
- Custom Variable support for SQL query - You can use your own variables, which can be defined in R scripts, as part of your SQL queries.

### Enhancements

- Histogram - number of buckets parameter support - You can change the number of the buckets (bin) for Histogram chart.
- Google Analytics - Page-nation support - You can extract more than 10K rows when there are more data.
- Re-design for Data Import dialog - We have re-designed the data import dialogs. This is especially better for SQL query based data with much bigger text input area for writing SQL query.
- Encoding support for Web Scraping - It will automatically detect an appropriate encoding, but this is heuristic, you can always override this by selecting the right one from the list.
- Select R packages loading - You can select which R packages to load per project now.

### Bug fixes



## v 1.6.1

Released on 7/5/2016

### Enhancements

- Syntax suggestion supports new functions from dplyr 0.5 now.

### Bug fixes

- libPaths command in the generated R script is correctly escaped for Windows.
- User added R packages will be added into the generated R script with library command.

## v 1.6.0

Released on 7/1/2016

### New Features

- Data Share - Now you can publish and share your data at any step of the data transformation pipeline (right hand side) with a click of a button through Exploratory.io. The published data can be downloaded and imported into your project along with the data transformation steps so that others can understand how the data was prepared, can reproduce the data with all the steps, and can modify or add their own steps. This would make it easier for you to collaborate with your team members through data.  

- New remote data support - Redshift, PostgreSQL - Now you can write SQL queries to extract data from these two data sources, much like existing MySQL / MongoDB options.

- Custom R package installation - Finally, you can install your preferred R packages inside Exploratory Desktop. In this release, the installed packages will be automatically loaded when you open the projects. In future release. you will be able to control this at each project level. Also, only CRAN repository is supported for this release, but Github support will be coming shortly.


### Enhancements

- 'get_sentiment' function has been refactored so that now it can return the sentiment for sentences, not just per word. The old version of 'get_sentiment' functionality is now provided through 'word_to_sentiment' function. The new 'get_sentiment' function uses [sentimentr](https://github.com/trinker/sentimentr) package internally, which provides a super fast sentiment scoring capability at the sentence level.

- tidyr is upgraded to v0.5.1. The biggest new addition with this upgrade is 'separate_rows' function, which would separate delimited words into rows. [Detail](https://github.com/hadley/tidyr/releases)

- dplyr is upgraded to v0.5.0. There are many enhancements and new functions with this release. Here's the [detail](https://github.com/hadley/dplyr/releases). Note that 'distinct' function has been updated to keep only the specified columns and this might break your transformation steps. You can bring those dropped columns back with '.keep_all=TRUE' argument. Also, now column names with multibyte characters is supported in 'mutate' command. Great news for users in East Asia!

- Reproducible! with R script generation - Now the generated R script contains all the core R packages with 'library' commands and '.libPaths' command to set the library path to Exploratory repository. This will make it a lot easier to reproduce the transformation steps outside of Exploratory Desktop, such as R console, RStudio, etc.


### Bug fixes

- Chart - Now you can open Chart view even when an referenced column is not available after some updates in the previous steps.
- Column names with Multibyte characters can be processed correctly with mutate / summarize commands now.
- Now it shows up to 300 columns and 1000 rows in Table view correctly even when there are a lot more columns in the data frame.

## v 1.5.2

Released on 6/20/2016

### Enhancements

- Updated all the machine learning functions spec, including text mining, statistical functions, to make them consistent.

### Bug fixes

- It was not showing an appropriate errors in Table / Chart views when invalid functions are used in the steps.
- 'build_kmeans.kv' command was not augmenting the cluster IDs appropriately on top of the original data.

## v 1.5.1

Released on 6/19/2016

### Enhancements

- Added a support of showing Text label on Scatterplot.

### Bug fixes

- JSON files are not showing up appropriately in the file picker for Windows.
- Chart sharing is not fully working on Facebook.
- Chart embedding's iframe code doesn't have appropriate height and width attribute setting.


## v 1.5.0

Released on 6/16/2016

### New Features

- Chart Sharing and Embedding - Now you can publish charts directly from inside the data frame without creating a note. The hosted chart will have an unique URL and can be shared with the URL or embedded into your web pages or blog (e.g. Wordpress) with the automatically generated code. Also, you can share the chart URL on other mediums like Twitter, Facebook, Slack, etc, and the chart images will be automatically shown up. [Blog post](https://blog.exploratory.io/introducing-interactive-chart-sharing-and-embedding-4cfb801c063e#.7it0wsko0)
- Branch - You can create one or more branches inside the data frame to quickly experiment different analysis paths. All the branches inside a single data frame can share the common data transformation and analysis path in a main branch while they can have their own different analysis paths. Being able to run multiple experiments by creating multiple branches inside the data frames will enhance the flexibility and efficiency of your exploratory data analysis. Data dependency among the branches and among the transformation steps are managed by Exploratory's DAG engine to keep all the data cache intact. [Blog post](https://blog.exploratory.io/introducing-branch-for-running-multiple-experiments-quickly-84352ce245b6#.150aissqr)
- Text Analytics - We have added a set of the text mining related functions that are designed to work better with 'tidy' data form. By employing these functions, you can quickly tokenize text, remove stop words, stem words, construct n-grams, calculate TF-IDF and document similarity, reduce dimensions with SVD, and building document clustering models.
- Added [Short Cut Keys](http://docs.exploratory.io/shortcut.html) for the command input.

### Enhancements

- Chart: Support custom text entry for Title, X-Axis, and Y-Axis.
- Windows: you can now scroll Table view vertically and horizontally by using the scroll bar as well as using touch pad.
- Added %nin% (Not IN) operator so that you can use it in a condition (e.g. filter).


### Bug fixes

- Couldn't tokenize data from Twitter by the sentence level. do_tokenize(text, token="sentences”).
- Had an error for publishing Note with many charts or Heatmap.


## v 1.4.6

Released on 6/6/2016

### Enhancements

- Support 'Refresh' feature for local data types. Now you can click 'Refresh' link text at the top of Step to refresh even for the local file data type.
- Support a custom install location for R and Git for Windows
- Command builder for Tokenize Text, Get Sentiment. Now you can build commands for tokenizing the text data or score sentiments for the tokenized text from the column header dropdown menu.
- Local Mongo db support without username and password

### Bug fixes

- Deleted projects don't disappear untile restarting the app

## v 1.4.5

Released on 6/2/2016

### Enhancements

- Support a dropdown selection to select a data frame for RDS data import.
- Added 'Get Data' button for JSON data import dialog so that you can reload the file easily.


### Bug fixes

- The data doesn't get refreshed even after re-selecting the local data file with a same name.
- Chart: Data Popup - the color values are shown duplicated.

## v 1.4.4

Released on 5/30/2016

### Bug fixes

- The download of R and Git didn't start for Windows 7.


## v 1.4.3

Released on 5/26/2016

### Enhancements

- Support a custom folder location for installing R packages other than the default of the Exploratory Desktop's repository.
- Proxy server support for authentication, downloading required software, and R connections. It now detects it automatically. When it requires username / password, users can add them into a configuration file. See [FAQ](https://exploratory.io/faq) for the detail.
- CSV / Delimited Files Import: Supports non-American number formatted data with the new parameter setting for decimal and thousand marks.

### Bug fixes

- Get stuck with white screen or loading UI after the initial launch of the app.
- Can't open a project when my home directory path had a space.
- Chart: Can't assign non-ASCII characters in the column names to X/Y-Axis, Color.
- Chart: Boxplot doesn't render when the column assinged to X-Axis has NAs.


## v 1.4.2

Released on 5/26/2016

### New Features

- Text data wrangling with the tidytext package, which makes it easy to work with text data in a tidy format.

  With this tidytext package introduction, we are introducing unnest_tokens and pair_counts functions from the tidytext package as data frame level functions and get_sentiment and get_stopwords functions from the exploratory package as mutate / filter level functions.

- Introducing 'ip_to_country' function from the rgeolocate package to convert from IP addresses to country names.
- Introducing 'countrycode' function from the countrycode package to map among all the combinations of country names and country codes including ISO2 and ISO3 letters and numbers.
- Introducing 'calc_cor_cat' function from the exploratory package to calculate correlations between all the combinations of category column values based on a tidy data. There is also another function 'calc_cor_var', which calculate correlations between all the combinations of a given set of columns (variables).
- Introducing a new chart type 'Choropleth - Map' which would visualize the data based on either US State names or World country names.


### Enhancements

- Chart: Support continuous values (numeric data type) for Color for Scatterplot chart.
- Now the generated R script include R script when the data is 'R Script as Data'
- Table: Now it can show all the columns even when there are more than 100 columns.
- Support the syntax suggestion for building formula for lm() and glm() functions.

### Bug fixes

- REST API Data Source: Now it can bring all the elements even when there are more than 50 items.


## v 1.4.1

Released on 5/16/2016

### New Features

- Introducing the broom package's tidy / glance / augment functions as data wrangling grammar
- Support 'model' and 'source data' type columns so that you can build models with functions like do_lm, do_glm, do_kmeans, and store them inside the data frame. This makes it possible to call broom's tidy functions to access the models' statistical summary information or augment their scored data with the original data columns.

### Enhancements

- Installer: It checks if Git is installed under /usr/bin and /usr/local/bin. Unless it's older than 2.0 it won't try to install or upgrade. Please check FAQ page for the detail on the version check logic and requirements for both R and Git.
- Installer: It will install required R packages into Exploratory's repository location, instead of into the R's system location.
- Chart: Heatmap / Contour - introducing an option to choose whether NA as NA or zero.
- Chart: You can add margin (space) at X-axis and Y-axis so that text label can be showing up better.
- Improvements for model building and inspection for Linear Regression (lm), K-means clustering (kmeans), and Generalized Linear Regression (glm).
- Table: You can select # of rows to display in the table. The options are 200 (default), 500, 1000.
- Excel Data: It shows a dropdown list so that you can select a sheet name instead of needing to type the name.
- Text File (Delimited / CSV) Data: You can select ".csv", ".text", ".txt", ".tsv", ".tab" file types in File picker now.

### Bug fixes

- R Script Data - couldn't click Enter key to add a new line.
- Table: Row highlight (gray color band) was staying even refreshing table view - Done
- Syntax Suggestion: Instead of select minus '-' from the suggested list, when you typed minus ‘-’ in select() command it didn't show a suggested list of the columns.


## v 1.4.0

Released on 5/9/2016

### New Features

- Support Correlation calculation with Base R (stats pkg) cor() function.

   ```
   calc_cor(ARR_DELAY, DPE_DELAY, DISTANCE)

   > This will produce correlation values for each pair.
   ```

- Text Matching function - str_count_all  
  Note that this is not from 'stringr' package.

   ```
   str_count_all("I ate banana, apple, and peach yesterday, and banana, peach today.", patterns=c("apple", "banana"), remove.zero=TRUE)   

   > Returns a list column of data frames with 'apple' and 'banana' columns.
   ```

- Twitter Search Data Support
- Added Heatmap and Contour chart types


### Enhancements

- Clustering function improvement  
  Now you can specify which columns to use for building the clustering with Base R (stats pkg) kmeans() function.

   ```
   do_kmeans(ARR_DELAY, DEP_DELAY, DISTANCE, groups = 5)
   ```
- Scatter plot: the circle sizes are now scaled better based on the values assigned to Size shelf
- Local data types are organized and presented better in Data Import Dialog
- Syntax Suggestion: Now it supports mutate_each / summarize_each functions with funs() for the syntax suggestion and help.
- Syntax Help: the help text and table are formatted much better now.
- Command builder menu for the following data types are supported. : difftime, interval, time, period
- Hot Key support - 'Return (Enter)' key can be used instead of clicking on OK button (e.g. Login UI, Create a new project dialog, etc)
- Table: You can click rows to highlight now.
- Chart: Line chart used to be starting from the minimal value on Y-axis, but now it starts from 0 just like Bar chart.

### Bug fixes

- Can't create a new project or open an existing project in some conditions.
- Can't create a new project when Microsoft R Open is installed.
- Throwing an error when importing data after having a problem creating projects.
- Couldn't start the app on some Mac PCs.
- Selecting text in Command Input Area was unstable, now it’s much better.
- Column names with backticks were not highlight-ed in Command Input Area.
- 'Get Data' button will show Table view instead of Raw data for Text files.
- Suggestion list doesn't show up after manually typing minus '-'.


## v 1.3.0

Released on 5/2/2016

### New Features

- Data Wrangling Command Auto Builder
- MySQL database support
- Fast Data Parsing functions (readr) support
- Time data type support with parse_time (readr) function
- Text clean up function - str_clean - support

### Enhancements

- Google Analytics: View ID dropdown menu picker support
- Google Analytics: Switch Account support
- Google Spreadsheet: Switch Account support
- Google Spreadsheet: Added File import parameters
- Google Spreadsheet: Spreadsheet name dropdown menu picker support
- Chart: Text Label field support for Map and Scatterplot

### Bug fixes
- JSON import: Updating with a different file doesn't replace the original one in Preview UI


## v 1.2.2

Released on 4/26/2016

### New Features

- Remote JSON - REST API Basic

### Enhancements

- Google Analytics - Dynamic LOV for View ID

### Bug fixes

- Issue: Clicking on a project is opening a wrong project
- Web Data Scraping: Clicking on some tables from some web pages causes the dialog to hang
- Support login to Exploratory Desktop with Email address, not just username
- Map: Taking color assignment off causes no data to be displayed in Map.

## v 1.2.1

Released on 4/18/2016

### New Features

- Web Scraping Data
- Remote JSON - REST API Basic
- Remote Data - MongoDB

### Enhancements

- Google Analytics Enhancements - Dimensions and Metrics List
- Chart Rename / Delete support

### Bug fixes



## v 1.2.0

Released on 4/11/2016

### New Features

- Refresh remote data
- Data Wrangling script download (dplyr)
- Function list dialog
- Data Source Plugins

### Enhancements

- Show space and special characters for Table view

### Bug fixes
