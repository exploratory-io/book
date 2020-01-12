# Release Note

## 5.5

Released on 1/10/2019

### Bug Fixes

* Table View: The long text in the pop-up were not shown fully.

* Data Source: Google Sheet: Import Dialog: The long sheet names were not shown fully.
* Data Source: Google Sheet: The default data frame names are sanitized automatically.
* Data Source: Google Sheets: Changed default Data Frame Name from dataframe to GoogleSheet when the sheet name is non-ascii
* Data Source: Google Analytics: Supported Custom Dimensions and Custom Metrics.
* Data Source: Google Analytics: Popup, which showed the dimension/measure detail information, was showing at wrong positions.
* Data Source: Google Analytics: Dimension/Metrics names were not fully shown in the pop-up.
* Data Source: Google Analytics: Clicking 'x' icon to clear Dimension/Metrics search words removed focus from the search input field and couldn't start next search right away.
* Data Source: Google Analytics: Goal 1 Metrics were not properly sorted in the Metrics List.
* Data Source: Google Analytics: Couldn't delete the Last N Days parameter value with the Delete Key.
* Data Source: Google Analytics: Opening the Update Data Import Dialog was slow.
* Data Source: Google Analytics: Clicking Show Only Selected Icon didn't clear the search words automatically.

* Data Wrangling: It now keeps the current scroll position of the Preview table when adding new columns in the Column Selection dialog.
* Data Wrangling: Clicking the cahced step caused the previous step being executed.
* Data Wrangling: Multiclass classification evaluation menu is hidden when the window size is small.
* Data Wrangling: 'Use Row as Header' now automatically handles duplicate names or NA values by default.
* Data Wrangling: Filter: The filter operator and condition information was wiped out when chaning the column.
* Data Wrangling: Mutate: The syntax suggestion inside the Expression editor was not showing the proper values when updating the existing step.
* Data Wrangling: You can rename the newly created column names inside the 'Summarize' dialog.
* Data Wrangling: Now we have a new 'Text Data Wrangling' dialog for performing operations like extract text, replace text, remove text, etc.
* Data Wrangling: Summarize: The categorical columns are now assigned to Group By when opening the dialog from the column header menu.
* Data Wrangling: The text labels for 'Step Data Export' menu is overflowing in Japanese UI.
* Data Wrangling: Made 'Replace Values' as an independent step instead of mixing it with other Mutate step such as Create Bin.
* Data Wrangling: The Step UI dialogs are now shown underneath the column header of the table under Table view.

* Chart: Pivot Table threw an error if you selected "Ascending by Frequency" sort option against a row header column which was Numeric data type and categorized.
* Chart: 'Previous' and 'Next' options were missing for the '% of' Window Calculation.
* Chart: Couldn't change the chart name to something that is already used in different data frames.
* Chart: The data in Edit Display Name dialog and Hightlight dialog didn't reflect the "Other Group" setting.
* Chart: Now it captures the thumbnail images for Pivot Table and Table.
* Chart: Area Map failed to render and showed an error "Error in prettyNum invalid 'nsmall' argument" if you set a negative value at the decimal digit setting in the Chart Property dialog.
* Chart: Line Chart: When you assigned text column whose data containing "1", "2", "3", "4"  to the X-Axis it showed only "1", "2", "3".
* Chart: The space between the X-Axis text labels and the chart were not stable after you zoomed in.
* Chart: Table: It didn't save the column order information when the column names consist of only numbers such as '2018'.
* Chart: Pie: It threw an error "e.split is not a function" with a certain condition.
* Chart: Histogram: It now supports 'Cumulative Distribution'.
* Chart: Histogram: It now supports 'Ratio (% of Total)' calculation.
* Chart: Number: It now supports the Custom calculaiton.
* Chart: It now supports the Nth & Quantile functions.
* Chart: Pivot Table: It now supports 'drag-and-drop' to change the order of columns for Rows and Values.
* Chart: Limit Axis Value: The validation error message showed up at a wrong timing.

* Analytics: Time Series Forecast (Prophet): It now shows Variable Importance based on coefficients of the Prophet model.
* Analytics: K-Means clustering result was different on Mac and Windows.
* Analytics: When you run the analytics, any invalid data wrangling steps are now automatically removed.
* Analytics: K-means Clustering: The results were different between running it with the data wrangling step and running it inside the Analytics view.
* Analytics: You can select which components of Date/POSIXct data to be included as the predictors.
* Analytics: Time Series Forecast (Prophet): Couldn't run it due to an alert from Mac OS X Catalina's Gatekeeper.
* Analytics: Market Basket Analysis: The Lift values shown on mouseover balloons on the scatter plot was wrongly labeled "Lift (Color)", while Lift was actually expressed as Size of circles.
* Analytics: Linear Regression: Variable Importance bar chart is now colored based on statistical significance of the variables.
* Analytics: K-means: "subscript out of bounds" error was raised when only one variable column was selected
* Analytics: The text labels inside the chart pop-ups are now translated for Japanese UI.

* Dashboard: Empty rows should be automatically removed in Dashboard Config UI.
* Dashboard: Table showed an extra border line underneath the column header when you set a smaller font size.
* Dashboard: Table/Pivot should be expanded to fill the space when it shown in the dashboard.
* Dashboard: It now supports the Text Box for entering comment text and writing R script for custom visualizations.

* Parameter: When the Parameter Dialog is opened from the Filter Dialog, the Filter Dialog was closed when it should have remained opened.

## 5.4.2.4

Released on 12/23/2019

This release is only for Public Version for below bug fixes.

### Bug Fixes

* Public: Closing a project failed with an error (Command failed: git push --force) when the last login inside the desktop app was not done properly.

* Public: After restarting Exploratory Public, projects were not listed on the Project List.

## 5.4.2

Released on 12/12/2019

### New Features

* Introduced an "Offline Mode" with 'Offline License Key'. ([Detail](https://exploratory.io/note/2ac8ae888097/How-to-enter-Exploratory-Desktop-Offline-License-Key-osX9Afe2CE))

### Bug Fixes

* Installation: On Mac OS X Catalina, automatic installation of R and/or Git failed.
* Installation: On Mac, opening downloaded dmg file failed with error message "no mountable file system".
* Improved error handling and guidance when Exploratory cannot connect to the internet.
* Opening project failed on machine with Avast antivirus software.
* Data Source: Data Catalog: It failed to import data if Exploratory was initially started without internet connection.
* Data Source: Google Analytics: Not able to switch View ID when there are multiple View IDs.

* Data Wrangling: Summarize step default output column names now always have function name as suffix, to avoid confusion between original column and aggregated column.


## 5.4.1.4

Released on 12/1/2019

### Bug Fixes

* Data Source: If you clicked an "Import" button in Data Catalog Import dialog, it showed an error message.

* Data Wrangling: Now NA is exported as an empty string instead of an "NA" string if you export data to CSV, Google Sheets or Clipboard from a data wrangling step, Chart or Analytics.
* Data Wrangling: On Windows, the cursor position didn't match with the text in the Calculation Editor of the Mutate dialog.



## 5.4.1

Released on 11/28/2019

### Enhancements

* Data Source: Google Analytics: Supported additional "Period" parameter options such as "Yesterday" for Google Analytics Data Import
* Data Source: On Data Connection Setup Dialog, now unnecessary trailing white space for input fields are automatically removed except for password
* Data Source: Now you can import data that is privately shared with you at the Data Catalog.

* Chart: Support hiding the reference line information shown inside the chart legend.
* Chart: Table: Support Date/Time formatting for Date/POSIXct columns inside the Table.
* Chart: Error Bar: Support more aggregation functions in addition to "Count" and "Unique Count" for Y-Axis in Error Bar when the calculation type is "Ratio (%)".
* Chart: Contour: Support the 'Repeat By' for Contour chart.
* Chart: You can set the output width and height for Wordcloud, which will make sure that the Wordcloud output will have exactly the same output regardless of where it was generated. (e.g. Chart view, Note, Slide and Dashboard.)
* Chart/Analytics/Wrangling: Added a "Week of Quarter" function for Date/POSIXcit columns. This is available through Column Header Menu, Chart and Analytics.


### Bug Fixes

* Data Source: Google Analytics: "Account", "Property", and "View" list of values were empty when reopening the Google Analytics Data Import Dialog.
* Data Source: Google Analytics: Now we don't move the selected Dimensions and Metrics to the top.

* Data Wrangling: The parse_number function didn't work for the factor type columns.
* Data Wrangling: Unfinished step in a Branch data frame showed up in the parent data frame.
* Data Wrangling: On Windows, filter operators such as "Starts With", "Ends With", "Contains" did not work if the column contains non-ascii data.

* Chart: When you used a Conditional Coloring for the Table, the opacity was set unintentionally.
* Chart/Analytics/Wrangling: On the Column Selection Dialog, clicking the "Clear All" link did not remove the selected columns.
* Chart/Analytics/Wrangling: The background color of the Column Selection Dialog was too dark when the column configuration dialog was opened.

* Analytics: The comment entered without being explicitly saved for the Analytics was cleared after closing the dialog.

* Note: If you click a URL link in a Note in the Side-by-Side view mode, it opened 2 web browser tabs.
* Note: Publishing a Note that was duplicated from another Note overwrote the original one at the Exploratory Cloud (exploratory.io).



## 5.4.0.12

Released on 11/16/2019

### Enhancements

* Chart: Updated Table under Chart view by supporting Conditional Formatting, Function, Column Rename, and Column Reorder functionalities.
* Chart: Now you can edit the values of the columns assigned to Color with 'Edit Display Name' menu.
* Chart: You can now manually set which values to keep or remove when creating 'Other' group under Chart view.
* Chart: Error Bar chart supports various 'Directions' for calculating the ratio.
* Chart: Support 'Number of TRUE/FALSE' functions for the logical columns assigned to Y-Axis of Error Bar.
* Chart: When you move the mouse over on the error bar it should show the actual values of the range along with the length of the range.
* Chart: Show a dropdown to select the range type (SD, 95% Confidence Interval, etc) dropdown below the Y Axis for Error Bar.

* Data Wrangling: You can now set the seed within the Sample step UI.

* Analytics: We have added a Collinearity tab for Linear Regression, Logistic Regression, and GLM, which will help you diagnosis the multicollinearity.
* Analytics: We have added a Effect tab for Linear Regression, Logistic Regression, GLM, and Decision Tree, which is basically the same as the one for Random Forest and helps you understand how the change in the predictor variables would effect the target variable.  
* Analytics: ANOVA/T-Test: Added weekend function option to categorize Date data.
* Analytics: Coefficients plot for regression analysis now has base level for categorical variable in mouse-over popup.
* Analytics: Support "Week of Month" function for the date/time columns assigned to Repeat By and Color By.
* Analytics: Regression Analysis/T-Test/ANOVA: Now you can apply functions like normalization or log to the input data as part of the data pre-processing.
* Analytics: Regression Analysis/T-Test/ANOVA: Now you can filter outliers as part of the data pre-processing.
* Analytics: Random Forest, Decision Tree: The actual data is displayed as a gray line along with the blue line representing the predicted values under Effects by Variable tab.

* Public: Added R Script and Cloud App data sources for the Public edition.

### Bug Fixes

* Data Source: Google BigQuery failed to import data via Google Cloud Storage.
* Data Source: Google Analytics: Re-designed the data import dialog to improve the usability.

* Summary: the bars for NA were always showing 0 for the logical data type columns.

* Chart: Number should be able to show 0 instead of NA.
* Chart: 'Show Detail' button failed to show data when a numeric column at X-axis is setup with int10 function.
* Chart: 'Show Values on Plot' is not working correctly when X-Axis is categorized on grouped bar chart.
* Chart: the Chart Control area was not showing up after moving between Table View and Chart View.
* Chart: Reference line was not shown when you used the 'Limit' feature (e.g. Top 10) with Bar chart.
* Chart: Reference Line was not shown when you used the 'Categorize' feature at X-Axis of Bar chart.
* Chart: Comment Dialog should keep the text entry during the same session even when you didn't save it and closed the dialog.
* Chart:A broken chart thumbnail was displayed when you duplicated an existing chart and entered the comment.
* Chart: Selected values for "is in" operator inside the Filter dialog were lost when you navigated to another chart and came back.
* Chart: Text was chopped in the middle in Number.
* Chart: 'Show Detail' didn't show any data of the lowest edge bar of the histogram chart.

* Data Wrangling: "equal to" option was not available for the logical data type columns inside the Filter menu.
* Data Wrangling: When converting POSIXct column to Date Column, timezone information was lost.

* Data Wrangling: 'Go back to project list' button should not be clickable when there is another R process running.

* Analytics: When you changed the font size for the biplot chart under PCA the color setting was lost.
* Analytics: You couldn't read the whole message when it was too long.
* Analytics: Time Series Forecasting: Default value of test period was not set correctly.

* Parameter: Using parameter in custom function for Summarize step did not work.

* Installation: When you create a directory under C:\\Users\\ and use it for Custom Repository, Exploratory didn't start up and show an empty screen.
* Installation: The required R packages were not installed when switching the repository.
* General: When you clicked an URL link inside the chat window it opened an Exploratory Window instead of a web browser.

* Public: 'Quote exceed' message was shown incorrectly when there is a problem in the network connection.


## 5.4.0

Released on 10/23/2019

Unlike other major version upgrades (e.g. 5.2.0, 5.3.0, etc.), this release (5.4.0) is a 'merge' release that brings all the recent enhancements that we have made for 5.3.4 patch set. Also, we have made the below listed enhancements and bug fixes.

We're going to release an 'official' v5.4, which is going to be as 5.4.1, in early November, and add new features and enhancements we're currently working on.

### Enhancements

* Data Wrangling: Added an option for ignoring NA when uniting columns.
* Chart: You can use the columns as part of the URL link even when they are not selected for the table.
* Note: It now shows the TOC expanded by default. You can change this setting in the property.
* Note: Changed the font style for Note and Chart.
* It now always ignores .Rprofile file so that it can start with more stability.
* We have upgraded the system R packages.

Beta Features:

These are not official features, but we have exposed them as beta features. We'll support these as official features in the next release (5.4.1).

* Beta: Analytics: We have added a Collinearity tab for Linear Regression, Logistic Regression, and GLM, which will help you diagnosis the multicollinearity.
* Beta: Analytics: We have added a Effect tab for Linear Regression, Logistic Regression, GLM, and Decision Tree, which is basically the same as the one for Random Forest and helps you understand how the change in the predictor variables would effect the target variable.  

### Bug Fixes

* Data Wrangling: 'Convert from Hexadecimal to Numeric' menu was missing for the the column header menu.
* Data Wrangling: Custom Filter condition needed to be surrounded by parenthesis.
* Chart: After duplicating a chart and renaming the chart name, thumbnail was corrupted on the chart tab.
* Chart: 'Number' was returning a number value even when a Date/POSIXct column is assigned.
* Chart: Pin was removed after Note is refreshed.
* Analytics: Improved support for multibyte column names, especially with Time Series Forecasting and Logistic Regression.
* Analytics: Time Series Forecasting: When the change point dates are not double-quoted, it errored out.
* Note: It overflows on iPhone when it contains the code blocks.
* Note: When you copy image into Note, it was showing a wrong project folder path.
* Note: Even after removing all the text from the editor the Preview was still showing the same result.

Public Version Only:

* Could not setup Web Proxy when Public Version was not able to connect to the Internet.
* There was an error about git when the password includes the special characters like '@'.
* Project git clone dialog should validate the project URL.


## 5.3.4

Released on 10/8/2019

### Enhancements

* Data Source: Added 'Data Catalog' from where users can download published data on Exploratory Cloud Server

### Bug Fixes

* Data Source: MySQL: On Windows, Japanese characters used in the column names and data were garbled.

* Data Wrangling: Mutate All dialog had a wrong function name for "log1p".
* Data Wrangling: On Summarize dialog, it shows "? ordered" as dat type on preview table when choosing weekdays() as an aggregation function for Date Column
* Data Wrangling: It now shows the 'last imported' date/time at the data source step.

* Chart: Added 'Apply' button for the number of bucket control in Histogram.
* Chart: when you delete a parameter that is assign to a chart, the chart hangs when viewed

* Analytics: Time Series Forecasting: Supported Japan as Country for Holidays
* Analytics: Time Series Forecasting: Prophet: Multiple countries for holidays were not honored

* Publish: The description/title/tags for shared contents (e.g. Note, Dashboard, Chart, Data) can be editted at the server.
* Publish: Keep original url when stop publishing and republishing contents (e.g. Note, Slide, Dashboard, Chart,  Data, etc.)

* Installation: On Windows, an installed R is not detected if it is installed with non-privileged user who has not activated OneDrive.


## 5.3.3

Released on 9/23/2019

### Bug Fixes

* Data Source: Web Scraping: The Run button became disabled once it was clicked.
* Data Wrangling: On Expression Editor, stop auto suggest when new line feed is entered.
* Data Wrangling: Filter: Supported aggregated function for Date and POSIXct data type columns.
* Data Wrangling: When you clicked ‘Create New’ in an existing Mutate step, the column name and the expression were copied from the one above.
* Data Wrangling: Column names were not suggested for some commands when the Mutate Dialog was opened from column header menu.
* Data Wrangling: Could not type in  "[ ]"  on Custom Function Editor of Summarize Dialog.
* Data Wrangling: Error messages were showing the step id instead of the step name.
* Data Wrangling: Google Sheets Export: Existing sheets names were not listed.
* Chart: Show detail didn't show any rows for "(NA)" color in Bar chart.
* Chart: Show appropriate date functions at Contour X/Y.
* Chart: Pie chart failed to render and showed an error with "e.split is not a function".
* Chart: Last visited Tab was not remembered when creating a new Analytics.
* Chart: Highlight dialog showed empty/incorrect values in column value dropdown.
* Chart: Shows details Dialog did not show data when category (binning) is applied to a color column.
* Chart: Histogram X-Axis bucket range was incorrect if you applied the log function to X-Axis.
* Chart: Deleting a data frame that is used by a chart after modifying the chart threw an "TypeError: Cannot read property 'getName' of undefined" error
* Chart: Sample size became 5000 (default) if you set the sample size more than the number of rows in Scatter chart.
* Analytics: Linear Regression/Logistic Regression/GLM: In Summary Tables, "Deviance" was relabeled to "Residual Deviance"
* Analytics: PCA, K-Means: Sampling was not done by default as part of preprocessing.
* Analytics: 'Other' group information was showed even there were only 2 unique values after an analytics level filter was applied.
* Analytics: PCA: The numbers in X/Y titles were not updated accordingly.
* Analytics: Failed to render Survival Curve with Cohort and showed an error "Invalid argument was passed to returnsNumericValue".
* Note/Slide/Dashboard: Switching the view mode from 'Side-by-Side' to 'Single' should be disabled while preview process is still running.
* Parameter: Could not save Number Text field parameter because of an incorrect data type validation.


## 5.3.2.6

Released on 9/4/2019

### Bug Fixes

* Chart: Support an option to show/hide unused factor levels in Pivot Table.
* Chart: Sample size became the default size (5,000) if you set a sample size more than the number of rows in Scatter chart.
* Chart: Histogram failed to render and showed the error "Cannot read property 'name' of null".
* Chart: Category setting dialog didn't open by clicking the green text in Boxplot.
* Analytics: Failed to render Survival curve chart with Repeat By and without Cohort, and showed an error "Invalid argument was passed to returnsNumericValue".


## 5.3.2

Released on 9/3/2019

### Enhancements

* Installation: Added "Reset" Button to reset the System R packages to originally installed versions (a.k.a. factory setting).

* Performance: Improve the performance for opening Note/Slides/Dashboard editor.
* Performance: Improved SQL Query performance in general.

* Chart: Support 'Auto-Binning' for numeric columns when they are assigned to Color with functions such as LOG/ABS/INT10.
* Chart: Support the Trend Line even when categorical columns are assigend to X Axis.
* Chart: Support "Show Details" even when the X-Axis Columns are categorized.
* Chart: Support for creating Custom functions inside Pivot Table.
* Chart: Support Auto-Binning of X Axis for Line and Area charts.
* Chart: Support Auto-Binning for Repeat By and Group By in Chart.
* Chart: Support Auto-Binning for Coloumn/Row Headers of Pivot Table.
* Chart: Support Vertical Reference Line for Line chart.
Chart/Analytics: Now "Save Chart/Analytics data as Data Frame" will add the data frame name as part of the name.
* Chart: Support 'Limit Values' for Y Axis in Bubble chart.
* Chart: Support 'Export as Data Frame' option.
* Chart: The "Show Details" dialog now shows 'Number of Rows' information and use the same filter conditions as shown in Chart Hover Popup.
* Chart: It now dynamically change the scale of the colors depends on the unique values. Currently, we support only up to 10.

* Data Wrangling: Extended the Case Insensitive text matching for character related filter operations such as 'Start with...'
* Data Wrangling: It now shows the comment icon in an always visible way when there is a comment at any data wrangling step.

* Analytics: Support for multibyte/special characters in column names.
* Analytics: Now it shows the number of rows for each Repeat-By group under Summary tabs.
* Analytics: For binary classification models under Analytics Views, we have added a "Probability" tab to show a histogram of the probability.
* Analytics: Support 'Reserve Order in Data' method for splitting Training/Testing data under Analytics view.
* Analytics: Bayesian A/B Test: Added option to flip A and B
* Analytics: Time Series Forecasting: Support the External Predictors even when the Target Value is Number of Rows.
* Analytics: Time Series Forecasting: Support for External Predictors created from same column but with different aggregate functions.
* Analytics: Random Forest: Effect by Variable tab now shows only the significant variables based on Boruta's result.
* Analytics: Decision Tree: Added more properties for finer control of branching in decision tree.

* Dashboard/Note/Slides: It now always opens Dashboard/Note/Slides in a separate window.

* Parameter: Supported Tab key for move between input fields for the manual input values option.


### Bug Fixes

* Installation: On Windows, "No admin privilege" error was shown when user actually had admin privilege.
* Installation: Already installed Git was not detected.

* Project: Opening a project after creating a parameter with name that includes "-"  shows "Error 127" and could not open the project.
* Project: When Importing a project with offline mode, it showed an error that says unable to connect exploratory.io and could not import it.

* Generic: Clicking an URL link inside the Chat window opened a blank page.
* Generic: Error "parseJsonSafe raises Unexpected token \ in JSON" was raised when data had SJIS's problematic characters. (So called "damemoji")

* R Package: Success message was not displayed on Manage R Package Dialog after R Package installation
* R Package: Custom R package installed in a project was not automatically checked as used in the project 

* Data Source: a proper default encoding was not assigned for CSV file data import.
* Data Source: SQL Data Source: Comments inside SQL query caused invalid syntax error

* Summary View: When hovering a mouse over Column Name on Summary View, it broke word in the middle if the column name was long.
* Summary View: Histogram chart in the Summary View panel was gone after clicking the chart icon to create a new chart and came back to the Summary View.

* Chart: Drag and Drop the Chart Pin button sometimes didn't highlight the target step while it's moving.
* Chart: Decision Tree picture size was too small when it's embedded inside Note.
* Chart: A previous Chart tab selection was not preserved when moving between Summary and Chart views.
* Chart: Scatter chart failed to render if you set a numeric column at Color and enabled the circle option.
* Chart: On Windows, vertical scrollbar overlaps with the chart legend of the Line chart.
* Chart: Pivot sort by clicking the column header didn't work properly if there were empty rows.
* Chart: Heatmap was not showing NA at X/Y Axis.
* Chart: It no longer shows the warning dialog when you assign a column with too many unique values to Color.
* Chart: Renaming an inactive Chart name didn't reflect the change immediately.
* Chart: "Show Details" dialog didn't show the data for "Others" or "NA" group.
* Chart: The sample data size number was not reflecting the data size after the Chart level filter being applied.
* Chart: Sorting of Bar chart with % of Total Window Calculation was not correct.
* Chart: LongLat Map showed unexpected lines if you assigned a column to Label with the "Connect Data Points by Lines" option enabled.
* Chart: Pivot Table didn't show factor levels that didn't have any values.
* Chart: NA values in row/column header should show something like "(NA)" instead of being empty in Pivot Table
* Chart: Trend Line property dialog now shows a reason why Loess trend line type is sometimes disabled.
* Chart: Support 'Other Group' for Group By of Bubble and LongLat Map charts.
* Chart: Renaming a Chart Tab Name didn't update the Number's caption immediately
* Chart: Character and Logical columns in Bubble chart should show the column functions.
* Chart: It should show '%' in the balloon and legend if "% of TRUE" is assigned to Color.
* Chart: Charts created by "Create a chart" from the Summary view shouldn't have an index number in the chart name unless the name conflicts.
* Chart: 'Limit Values' was not effective if "% of Total" Window Calculation was applied.
* Chart: Highlight showed only 1 value in the LOV in Area Map.
* Chart: Pivot Table failed to render if a column with double quotes was assigned to Value.
* Chart: Exclude/Keep Only generated an invalid chart filter on a Pie/Ring chart without Color By/Repeat By.
* Chart: Chart Level Filter should not be created if the filter syntax entered in expression editor was invalid.
* Chart: Pie/Ring chart didn't show the pop-over by clicking a slice.
* Chart: Numeric value on X-Axis with Discrete option didn't sort even the sorting option was set in Bubble Chart.
* Chart: "Show Details" Dialog ignored Chart Filter condition for Histogram.
* Chart: Failed to show the Show Detail dialog and opened an error dialog with "error code 3" on Scatter chart.

* Data Wrangling: Unnecessary column suggestions were shown when the Mutate Dialog was opened from the column header menu.
* Data Wrangling: When a step failed to execute, an error message incorrectly mentioned that the error is from the currently selected step even if the error is coming from other step.
* Data Wrangling: Adding or updating a Mutate Step sometimes did not update the result on the Table View
* Data Wrangling: Selecting a column value from the suggestion was adding extra double quotes in Mutate Expression editor.
* Data Wrangling: Summarize: Newly created column should have aggregation suffix as part of the name only when there are multiple entries with the same column with various aggregation functions.
* Data Wrangling: Column names were not suggested inside ifelse function.
* Data Wrangling: unnecessary column suggestion happened on a Mutate Dialog for excel time to date conversion.
* Data Wrangling: When an invalid token exists in the middle of Mutate Step tokens, it should be automatically removed.
* Data Wrangling: When a data frame is grouped by group_by function in the Custom R Script Data Source, the grouping status was not shown in the UI.
* Data Wrangling: End Date could not be entered for between filter with POSIXct Date columns in Japanese UI.
* Data Wrangling: Moving Branch root should change Chart/Analytics Pin Point if the Chart/Analytics points to the branch root.
* Data Wrangling: %in% operator was not suggested in Mutate command dialog.
* Data Wrangling: The last digit of 64 bit integer is displayed with wrong value in Table View.


* Analytics: Deleting an analytics level filter showed an error - Cannot read property 'getAnalysisType' of undefined.
* Analytics: Data tab in Time Series Forecast Analytics showed an error with Japanese column name on Windows.
* Analytics: Should not show 'Sample Size is set to 50,000' message when the data is less than 50,000 in Analytics view.
* Analytics: When exporting Random Forest prediction result from Analytics View, Logical columns were turned into Factor. It should be Logical.
* Analytics: Poisson Regression / Negative Binomial Regression: Stopped using Incident Rate Ratio as metric of coefficients when link function is not log.  
* Analytics: Anomaly Detection: Error “object ‘negative_anomalies’ not found” showed up when Direction of Anomaly is set to Positive
* Analytics: Now it shows both training data is and test data for the prediction matrix when Test Mode is enabled.
* Analytics: Message text for Other Group disappeared after changing the Analytics configuration.
* Analytics: On Build Random Forest Dialog, logical column should not be selectable for numeric regression.
* Analytics: Hitting enter key didn't refresh a chart at the input field in the Analytics Chart Property dialog.

* Dashboard/Note/Slides: When a note is opened, the related Data Frames were not highlighted in the data frame list (at the left hand side).
* Dashboard: Dashboard failed when there are double quotes in the Dashboard name.
* Dashboard/Note/Slide: Publishing raised error "Local NTFS volumes are required to complete the operation." when the repository is on a remote file system such as Google Drive File Stream.


* Parameter: When updating a parameter value, "Select Values" text was shown over the values in the dropdown.
* Parameter: Could not create a new parameter on a Note opened with a separate window
* Parameter: Could not edit a parameter that references a deleted data frame or step.
* Parameter: Data type validation on Numeric parameter was missing at parameter creation.
* Parameter: Input field of Slider Parameter didn't work.


## 5.3.1

Released on 8/11/2019

### Bug Fixes

* Failed to import data from BigQuery. - There was an issue that some of our users had a problem for importing data from Google BigQuery due to the underlying Google BigQuery API change. We have updated all the related places to use the officially supported APIs.

## 5.3

Released on 8/7/2019

### New Features

Here is the v5.3 release announcement blog post where you can find the details for all the new features.

* [Introduction to Exploratory v5.3](https://blog.exploratory.io/exploratory-v5-3-released-e3fbe3dd9910)


### Enhancements

* Data Source: CSV: Supported  "None" for Quote Parameter
* Data Wrangling: Supported 'Branch' icon at the step header
* Chart: Histogram: You can enter any numbers for the Number of bars parameter.
* Chart: "Line + Cirlce" marker type support on Bar/Line/Scatter
* Chart: Supported up to 30 Values in Pivot Table
* Chart: Color: Support Reversing the Order of the Legend Values
* Analytics: Time Series Forecasting: Now you can configure the Change Point Range.
* Analytics: Chi-Square: Repeat-by support has been added.


### Bug Fixes

* Generic: 'Hide Sidebar' icon didn't show up after hiding it and re-opening a project
* Generic: It now use the current OS locale for the R connection if locale is not defined in case of Mac.
* Generic: Another R Process running error shows Re-Run button so that users can clear the process without restarting the R session.
* Installation: It threw an error complaining about existing Rserve process when switching the repository location.
* Installation: When you did not have admin privilege, installed Git/R was not recognized by Exploratory
* Project: Create Project failed with git init due to missing email and username

* Data Source: MailChimp: Date parameter did not work and gave Unsupported value type for form field 'since' error Customer
* Data Source: Redshift: Integer64 columns are forced to be converetd as Numeric columns since Integer64 is not fully supported yet.
* Data Source: Google BigQuery: Adding comments inside SQL editor caused an error.
* Data Source: Google BigQuery: Opening Data Import Dialog from Source Step ended up with empty Table List under schema section on the Import Dialog.
* Data Source: CSV: Support a mode for importing the data as character data type.
* Data Source: MailChimp: Date parameter was not working properly.
* Data Source: GoogleBigQuery: Support UTF8 data properly.
* Data Source: Could not open an SPSS file.
* Data Source: PostgreSQL: Upgraded the underlying R package for better quality.
* Data Source: SQL: Optimize for data re-fetching logic when importing the data into a data frame.

* Data Wrangling: Shortcuts Hint button now show "Control+Enter" for Windows.
* Data Wrangling: Filter: Is Not Alphabet condition did not work
* Data Wrangling: The calculation text was copied from the existing one even when creating a new calculation in the same Mutate step.
* Data Wrangling: Recode: ’Equal Frequency Option' now shows the numeric ranges as the category names.  
* Data Wrangling: Build Random Forest step has switched to use Ranger for better performance.
* Data Wrangling: is_alphabet function to support non-ascii characters properly.

* Chart: Heatmap: Now Y axis direction starts from the bottom to the top.
* Chart: After creating a chart from Summary View by clicking Quick Chart Icon, the column search box remained.
* Chart: Property dialog overflowed if the screen size is small on Windows
* Chart: Pie chart failed to render if you switch the chart type from Bubble
* Chart: Enter key did not refresh the chart when a value was changed in Chart Property Dialog
* Chart: Show Details should show a user friendly filter condition information.
* Chart: Multiple LOV dropdowns opened at a time in the chart property dialog.
* Chart: Reference line was not showing when the bar chart in the horizontal mode.
* Chart: Area Map failed to render when I changed the data type from number to logical.
* Chart: When drag and drop a Chart Pin, unwanted pin image was shown at the left hand side top.
* Chart: The dropdown list for Highlight was empty when a numeric column was assigned to Color and the data function was changed to Text/Int/Int10.
* Chart: The mouse over pop-up always showed the 1st measure information even when there are multiple measures.
* Chart: Pivot: Support Post Calculation for the Grand Total
* Chart: The order of the Repeat By was corrupted if you assigned a numeric column that contained positive and negative values.
* Chart: Comment: In the Comment Dialog, Enter key didn't work.
* Chart: The DAY aggregation function was reset to YEAR when you switch columns.
* Chart: Violin Plot: Sorting is now supported.
* Chart: Column value dropdown was sometimes empty inside Highlight dialog.
* Chart: "Number" chart thumbnail didn't get updated when it was duplicated.
* Chart: Word Cloud thumbnail didn't get updated when moving between Table view and Chart View.
* Chart: Number chart failed to render when the chart type was changed to Number from Pivot
* Chart: Pivot: Grand Total was not reflecting the current sorting order.

* Analytics: Prophet: Error 'argument "n.changepoints" matched by multiple actual arguments' was raised when number of changepoints was specified
* Analytics: Decision Tree: Multiclass Tree was displayed without color
* Analytics: Decision Tree did't use the full available space for the first time rendering
* Analytics: PCA: NA was showing up when there was no NA
* Analytics: On the Delete Confirmation Dialog, Hitting Enter Key did not work.
* Analytics: Prophet: Support Logical data type columsn for Holiday variable.
* Analytics: K-Means Clustering: It was producing a wrong result.

* Parameter: On Dashboard, a default value was not populated on single LOV
* Note: The Markdown table text now uses bigger font size.
* Note: Set "dpi=300" in the default R code block template to avoid blurred graphical output from R.
* Dashboard/Note/Slide: It should not show Parameter button when not necessary


## 5.2.1

Released on 6/3/2019

This release is to certify R 3.6. The installation of v5.2.1 will automatically install R 3.6, and this will make all the R packages you have installed in the past invalid and you will be asked to re-install them so that they will be compatible with R 3.6.

### Bug Fixes

* Windows: Creating the repository on a drive other than C: drive failed.
* The trend line option was not available for Bubble chart when a date column is assigned to X-Axis.
* Summary View was not displayed if a data frame had a column whose name was "msg".
* Could not open the CSV Import Dialog for a data source created prior to version 5.2.0.
* For PostgreSQL Data Source, now it automatically adds double quotes for the table name part of the SQL query when clicking on the table name.
* When adding a new parameter, a validation message was not shown when you entered duplicated parameter name
* On the Step Menu, 'Convert to Custom R Command' was not working.
* TOC was missing in the exported html if you exported a Note in side-by-side mode.
* Wordcloud was not rendered when you assigned a column whose values are all NAs or all 0.
* Timeseries Forcasting Analytics showed dotted line for Yearly Trend.
* Chart level Filter was not working for Wordcloud chart.
* Chart failed after canceling the long-running process by clicking the cancel button.

## 5.2

Released on 5/17/2019

### Enhancements

* Chart Highlight Support
* Support Sorting for Boxplot and Bubble chart.
* Adding a Comment feature for Chart and Analytics.
* Support reverse color order when a categorical column is assigned to the Color of Chart
* Support more than 100 buckets for Histogram
* Treasure Data Support

### Bug Fixes

* Exploratory hanged at start up with splash screen on Windows on some machines.
* On Separate Dialog, the separator character was not updated and always changed back to Comma for Date columns
* Trend line didn't show if you set numeric column at color and chose "Data Range for Each Group"
* Database import failed with error code 3 when database password includes quote characters.
* Unsync X axis option for Repeat By feature didn't work in Line chart.
* When updating Proxy Configuration on System Configuration Dialog, the Re-login button did not respond if authentication for the proxy server fails
* Trendline support when Color is Numeric in Scatter/Bubble charts.
* Chart legend didn't show all values in Scatter if the sync x axis option was off.
* Pie chart failed with "Error: error code 3" error if the column name contained backticks.
* Error "C stack usage is too close to the limit” was raised when running 'Correlation by Column' Analytics  originally created with Exploratory v4.x.
* Error 'All "x" values are identical' was raised when running 'Normality Test' Analytics View with a column with a same value.
* On Custom R Command Dialog, target columns for join command was not suggested when the target data frame name had special characters
Support "Do not auto-detect the data type" option for CSV Import
* Summarize step was not created when the Summarize Dialog was opened from a column header menu
* On Filter dialog, Summarize function always went back to Mean where it should keep the previously selected function
* When re-open a data frame, it didn't open the previously opened chart when the chart was duplicated from other chart
* With the column name search, selecting a column by Enter key did not set the selected Column
* PCA Analytics didn't show NA in the legend.
* Boxplots got very skinny when Color and Repeat By are assigned.
* Exporintg Note to Word format failed when it had a pivot table with only measures.
* Missing Value Handling's 'None' option didn't work as expected in Line chart.
* Adding a new chart did not add the new chart tab right after the the current chart tab.
* Incorrect default value was set for Color Opacity on Area Chart.
* The Correlation information was not shown inside the Trendline pop-up in Bubble chart.
* Performance Improvement when navigating among Data Frames, Steps, Chart tabs, and Analytics tabs
* Y-Axis values should be the last in the Chart pop-up.
* Publishing a Note with reference to an already removed Chart/Analytics failed with error message "Cannot read property 'dependencies' of undefined".


## 5.1.5

Released on 4/12/2019

### Bug Fixes

* General: Parameter Dialog did not show LOV for Step Selection for parameter values.
* Data Source: Could not open Data Import Dialog for Databases.
* Installation: Mac: Repository Selection Dialog was not displayed with Japanese even with Japanese MacOS.
* Data Wrangling: When a Data Frame was selected, error was raised with message "TypeError: Cannot read property 'getName' of undefined".
* Chart: Scatter Plot: Trend line did not show up when Date column was assigned to color with function that returns number, such as Year, Quarter, Month, Day function.


## 5.1.4

Released on 4/10/2019

### Bug Fixes

* Wrangling: Summarize step with n_distinct function (Number of Unique Values) hanged.
* Chart: Pivot UI disappeared when you remove the 2nd of 3 value columns.
* Analytics: Correlation Analytics View: Axis and actual values were not matching in scatter matrix.


## 5.1.3

Released on 4/6/2019

### Bug Fixes

* Installation: Creating a new project failed with error message "cannot run gpg: No such file or directory".
* Wrangling: Labels on steps shown in the right-hand side wrangling step pane were missings for model summary/prediction related steps.
* Wrangling: When selecting a data frame that has a build model step, an error with following message was raised. - "Cannot read property 'getNRow' of undefined"


## 5.1

Released on 4/2/2019

Check out all the new features in the following v5.1 introduction announcement blog posts!

- [An Introduction to Exploratory v5.1!](https://blog.exploratory.io/an-introduction-to-exploratory-v5-1-fb11e153398d)

And here is a list of the other enhancements and bug fixes.

### Enhancements

* Installation: Support Exploratory Repository Location Switch from System Configuration UI

* Chart: Support "Include Outlier" in Histogram/Scatter/Violin/Density charts.
* Chart: Order support in Rank Window function.
* Chart: Duplicating a Chart now place the copied chart right next to the original chart.
* Chart: Pivot/Table to remember the last sort position and direction.
* Chart: Show/hide row header option support in Pivot.
* Chart: Categorical column support on X/Y Axis in Bubble chart.
* Chart: Support categorical colors on Pivot text measure.
* Chart: Property key value shouldn't show if the 1st label is set as a title in Area Map.

* Analytics: "Normalize Data" parameter is now supported in K-Means Clustering command dialog.
* Analytics: Correlation Analytics View: Group By is supported.
* Analytics: Correlation Analytics View: Scatter Matrix is added.
* Analytics: Re-designed "Adjust Imbalanced Data" feature inside Analytics View and the command dialog.
* Analytics: Chi-Square: Supported grouping functions for numeric variables
* Analytics: T-Test: Properties such as "Paired" are supported.
* Analytics: Support 'Return' key on Analytics Property Dialog to execute Analytics.

* Wrangling: Single Select Column List now automatically selects the first item if a user types in to find a match
* Wrangling: Introduce 'Add a new step' at the end of the right-hand side steps list
* Wrangling: Mutate Dialog now shows a warning message when it detects non-ASCII numbers and special characters in an expression without quotes.
* Wrangling: Support Aggregate Filter options on Filter Dialog
* Wrangling: Support additional str functions (str_trunc, str_normalize, etc) for Column Header Menu
* Wrangling: Slice command did not set n() as end argument by default.
* Wrangling: Add column menu for Excel numeric date/time to POSIXct
* Wrangling: Join command now supports 'Case Insensitive' mode.
* Wrangling: Added Ascending and Descending Options to Rank Column Header Menu

* Reports: When creating a Note, Data Frame was not searchable on Chart and Analytics Pickers.
* Reports: Note: Improved the plain table style in Note.
* Reports: Dashboard: You can set a Dashboard name when creating a new Dashboard with "Add to New Dashboard" menu inside Chart view.

* Data Source: Support Account Switch for OAuth Data Sources (Google Sheet, Google Analytics, Google BigQuery, Stripe, MailChimp, Twitter Search)
* Data Source: Enhance EDF import so that you can import a Report EDF from Data Frame Menu (and a Data Frame EDF from Report menu)

* R Package: Support R Package Installation from inside a Project

* Schedule: Data refresh on server is supported even when local file data sources, such as local CSV files, are joined.



### Bug Fixes

* Installation: when there is a .Rprofile sometimes it caused an error when opening the projects.
* Installation: When upgrading Exploratory on Windows, 'Switch Repository Location' dialog was displayed even if the repository already existed.
* Installation: OS locale was not automatically picked up on Windows.
* Installation: An empty screen was shown after the fresh installation.
* Installation: On Windows, sometimes Exploratory Desktop doesn't start and stuck with the Starting-up Screen.

* Summary: NA value shouldn't ben shown as a bar Summary view.
* Summary: Summary view failed when the data frame had only one column and that is POSIXct.

* Chart: Histogram didn't show all the factor levels in legend.
* Chart: Legend showed weird items if you assigned a numeric column with NA to Color in Boxplot.
* Chart: Property Menu showed up far from the chart property icon
* Chart: Other Group info didn't show up when you assigned a numeric column to Color.
* Chart: Pivot sort icon was hidden if the text on the column header was long.
* Chart: The bucket range was incorrect in Histogram when a column is assigned to Color.
* Chart: Couldn't rename the locally installed GeoJSON maps.
* Chart: Clicking on 'Show Details' menu inside Chart showed a loading icon forever with Histogram.
* Chart: Clicking on 'Show Details' menu inside Chart did not show data when POSIXct/Date columns are assgined to X-Axis.
* Chart: 'Show Detail' doesn't show the data with floating numbers in scatter.
* Chart: Scatter chart with the range data din't work properly with % (Percent) Number Formatting for Y-Axis.
* Chart: Order of chart thumbnails displayed by mouse hovering on data frame didn't reflect the order of the actual chart tabs.
* Chart: % (Percent) number format should be done automatically if the % based aggregation function is used for Number.
* Chart: Creating a new chart caused an error - "Cannot read property 'top' of undefined".

* Analytics: PCA biplot chart showed NA in the chart legend.
* Analytics: In Property dialog, hitting the "Enter" key for IME(Input Method Editor) selection caused the Analytics to be executed.
* Analytics: Heatmap color palette option didn't work in Correlation analytics view.
* Analytics: The order inside the chart legend in Survival Analysis was wrong when a logical column is assigned.
* Analytics: Decision tree didn't show Japanese characters correctly.
* Analytics: Canceling Analytics View raised error "Cannot read property 'evaluate' of null".
* Analytics: Survival Curve: The green message text about Others group was not displayed when coming back from Table View
* Analytics: Chart was sometimes not displayed even when it was generated before.
* Analytics: Market Basket Analysis: Color was not utilized for indicating confidence of rules.
* Analytics: Numbers in scientific notation was not shown correctly in Linear Regression.
* Analytics: After the PC wakes up from the sleep mode, adding a new analytics caused an error.
* Analytics: a chart from a different Analytics in a different data frame was displayed.
* Analytics: Setting a random seed by default for Analytics View to be able to reproduce the same result.
* Analytics: Exploratory process did not go away even after shutting down the app after using Time Series Forecasting.

* Wrangling: In Create Bin dialog, Chart was not displayed when the previous step was disabled.
* Wrangling: In Column Selection Dialog, selecting columns sometimes caused an incorrect column order.
* Wrangling: Multi-Step Selection did not work when the Source step is also selected along with other steps.
* Wrangling: 'Clean Column Names' did not handle non-ASCII characters well.
* Wrangling: In Create Bin dialog, description text was cut off by chart bottom
* Wrangling: In Custom R Command dialog, join target columns were not suggested when typing join command.
* Wrangling: In Filter Dialog, the list of values did not show all the values from a given column.
* Wrangling: In mutate step, another token was created after empty token
* Wrangling: In Table View, 'Rows to show' dropdown didn't work if there were less than 500 rows.
* Wrangling: 'Change Data Type to Character' ended up converting the columns to Factor data type when selecting multiple columns.
* Wrangling: Creating a new step didn't work when Auto-Run mode is set to 'Off'.
* Wrangling: 'New Token' button inside Mutate step was sometimes disabled.
* Wrangling: 'Convert Excel Numeric to Date' menu was not available when multiple columns are selected.

* Reports: Clicking URL link opened another application window instead of opening an external browser in Note.
* Reports: Position of an embedded chart with full width option was off in Note when TOC was enabled.
* Reports: Restoring Dashboard from the history didn't work.
* Reports: Dashboard rendering failed and showed an error: "Error at running Dashboard - Error in file(con, "w") : cannot open the connection".
* Reports: Dashboard: Unnecessary padding showed between rows when Numbers are inserted in Dashboard.

* Data Source: Data import failed with data which contains date data type columns whose date range is too small.
* Data Source: In Data Source dialog, after account is switched, viewID (for GA) and Sheet (for Google Sheets) didn't get updated automatically.
* Data Source: Dremio Data Source didn't handle Data type correctly.
* Data Source: Google BigQuery Data Source raised "Response Too Large To Return" error and could not import data.
* Data Source: Enhance ODBC Database Connection to detect ODBC drivers and change to timeout in 30 sec for getting a connection.

* R Script: Copied and pasted script on R Script Data Source didn't work on Windows because of the wrong new line feed character handling


## v5.0.3.0

Released on 2/14/2019

### Bug Fixes

- Google BigQuery Data Import fails with Response Too Large To Return.


## v5.0.1.0 (Installer version, Windows Only)

Released on 2/13/2019

Repackaged 5.0.1.0 release with the Installer. You can double click the downloaded EXE file to start the installer. Once you finish the installation, you will have shortcuts on Desktop and Program Menu. You can also uninstall Exploratory from the Windows Control Panel.

The product functionality is the same as 5.0.1.0 release.

## v5.0.2.0 (Mac Only)

Released on 2/04/2019

### Bug Fixes

- Decision Tree and Market Basket Analysis don't show Japanese characters correctly.


## v5.0.1.0

Released on 1/02/2019

### Bug Fixes

- Google BigQuery Data Import Dialog does not show tables under schema tree.

## v5.0.0.9 (Windows Only)

Released on 12/10/2018

### Bug Fixes

- Windows Defender SmartScreen raises Warning at the first startup.
- Exploratory crashes at login.




## v5.0

Released on 10/31/2018

Check out all the new features at the following v5.0 introduction announcement blog posts!

- [English](https://exploratory.io/note/kanaugust/5-0-New-Features-Draft-HdA6wAp9ta)
- [Japanese](https://exploratory.io/note/kanaugust/Exploratory-v5-0-QSm0Uuk9Wn)

And here is a list of the other enhancements and bug fixes.

### Enhancements

**General**

- Provided a way to access Proxy configuration UI while installation

**Data Source**

- CSV Import: Shows more user friendly message when the encoding setting is invalid.
- Custom R Script: Shows more helpful errors when there is an R error.

**Data Wrangling**

- Merge UI now supports 'union_all' option.
- Redesigned Mutate dialog to give more space to Expression Editor
- 'quantile' is added under Summarize in Column Header menu
- Mutate dialog should suggest locales for month() function
- Introduce Full Name for 'Day of Week' and 'Month' functions
- Changed the generated calculation to not include * 100' for Ratio
- Syntax help should suggest "=="" as one of the operators in mutate()

**Viz / Chart**

- Added Number formatting support on X-Axes in Chart.
- Support line style when the marker is set Line via configuration dialog
- Added 'All' for the direction options along with X-Axis and Color for the Window Calculation in Chart and Pivot.
- You can set the default font size for each Pivot Table from the property.
- You can set First or Last N Rows for Table
- Trendline: Shows the Coefficient based on the date / time interval that is set to the chart X-axis.
- Added 'Opposite' direction option for Cumulative Sum Ratio Window Calculation in Pivot Table.
- You can set different Window Calculations to each value for Pivot Table.
- Bar chart is sorted by default when you click on the instant chart icon at the Summary view.
- Show "Create Other Group" info under Color and Repeat By control in Chart view.
- Added "Hide Other Group" option for Color and Repeat By.
- Added the second Label field in Map - Long/Lat.
Fix for Chart: Day of Week Should Support 'Full Name'

**Analytics**

- Linear / Logistic / Cox Regression: You can select whether to order the variables based on the coefficients via property.
- Chi-Square Test : You can select whether to show actual count or percentage in the pivot table via property.
- Sample data size is now shown at the top when data is sampled
- Support an EDF export and publish support
- Anomaly Detection supports parameter setting via Properties now.

### Bug Fixes

**General**

- Renaming a Data Frame name by changing only upper/lower case removed the Data Frame itself.
- Tool menu didn't show up in Desktop.

**Data Source**

- Remote File: Changing URL and click get data does not get a data from new URL

**Data Wrangling**

- Table View: 'Rows to Display' option is automatically reset when there are less than the specified rows.
- List data type columns were not refreshed in Table after a data wrangling operation.
- Exported R script has duplicated setTokenInfo calls when there are multiple googlesheet data sources
- "Generate R Script" did not work when Connection was available after importing the data frame.
- Mutate Dialog: Should be able to turn off the column suggestion


**Viz / Chart**

- Table: Exporting data for Table exported all the available columns at the step even when there were only a few columns selected for the Table.
- Couldn't enable trend lines when a Character data type column was assigned to Y axis with 'Unique Count' function.
- Opening Show Detail Dialog when Bar Chart doesn't have any column assigned to X-axis threw an error (error code 3).
- Grouped Bar chart with multiple Y columns using Y2 axis with no X column assigned threw an error.
- Bar chart with Circle Marker type failed with X, Y and Repeat by columns assigned.
- Show Details Dialog errors when selected columns are all numeric columns
- Hitting 'Enter' key event in the property should not refresh the chart. Hitting 'Enter' key is often used for finalizing a Japanese phrase.
- It showed unnecessary data points when X-Axis was Month Name and Color By was assigned.
- Got an empty screen after switching Display Language in Chart/Summary
- Keeping the plus button in a fixed position even after you scroll chart/analytics tabs
- Bar chart fails if you set Y2 axis at 'sort by' and remove the Y2 axis
- It shows all the levels of a factor column in Chart legend.
- "Show Detail" was ignoring the color condition if numeric column assigned to Color in Bar chart.
- Custom Color Palette Menu is broken in Japanese UI

**Analytics**

- The min and max ranges for Y1 and Y2 Axis were not matching for PCA Analytics.


**Dashboard/Note/Slides**

- Section Title was not maintained when replacing the charts in Dashboard.
- Note: When you created an empty note and moved between other notes, the empty note showed contents from other notes
- Clicking a link in Table in a Note opened another application window.
- Some of the charts in Note didn't show up or showed up in an unexpected order.
- Chart was broken in the Word export
- Note: Refresh output before publish if note, side-by-side, TOC is on.





## v4.4.0.5

Released on 8/13/2018

### Bug Fix

#### General

- Cancel button, which is shown during the data processing, is now formatted as a button instead of a link text to improve the visibility.
- Couldn't change the data frame names when changing between upper/lower cases.
- 'API - CSV Data' menu is added so that you can import the published data at exploratory.io from other tools.

#### Data Wrangling

- Step Menu: Moved "Create New Data Frame" to the action menu for each data wrangling step.
- "Last N years" filter now returns data of the last year.
- Column Header Menu: Convert to Number -> Minutes was producing a wrong attribute values.
- In Mutate Multiple Columns (Mutate At) dialog, the columns could not be deleted when they no longer available after re-importing the data.

#### Chart / Pivot / Map

- Added Percentage and Currency Formatting support for Charts/Pivot/Map. You can find this in the property dialog now.
- 'Show Details' was not working when the numeric column is assigned to X-Axis.
- Chart: Non existent month names were showing up when 'Month Name' was used for X-Axis and a column is assigned to Color By.
- Month Name labels on X-Axis were not matching with what each bar represents.
- Table Properties were not matching with the Table specific functionalities.
- Chart was refreshed every time hitting the enter key event to finalize Japanese words in the property.
- Grand totals for Row and Column are now showing up by default. You can turn them off in the property.
- First chart should not be deleted or need to add new one right after deleting first one.

#### Analytics

- Now you can export the charts as PNG.
- Survival Table is now showing % symbol in the pivot table.

#### Reporting - Dashboard/Notes/Slides

- The order of Charts was messed up after swapping the charts.
- Some charts were not showing up in the output while showing the loading message forever.
- Charts did't show up right after importing Dashboard/Note/Slides EDF.
- Disabled Enter key in Publish Dialog so that it won't mistakenly publish it.
- Note: R button in the toolbar is now populating 'echo' and 'cache' attributes by default.

#### Data Source

- Data Source: Import JSON local file only imported first 200 rows


## v4.4.0.4

Released on 7/31/2018

### Bug Fix

- Performance improvements for opening the projects.
- Introducing a 'memory efficient' mode for importing Excel XLSX data type.
- Couldn't type and search Google Sheet names.
- OAuth redirect for Twitter data connection was not working properly.
- Remove an underscore "(\_)" letter at the beginning of the data frame names that were added after sanitizing non-ASCII characters from the data frame names.
- Join Dialog: Target data frame list shows data frames from previously opened project when this step was invalid.
- CSV download for the published data was not working when the data frame name was ending with "data"
- Variable Importance under Analytics View error-ed when the predictor column names starting with full-width number.
- Window Calculation (% Difference) with Multiple Column Headers Menu didn't set the appropriate properties in the 'Mutate At' dialog.
- Viz table failed to show when one of the columns was Interval data type.

## v4.4.0.3

Released on 7/15/2018

### Bug Fix

#### Data Wrangling

- Couldn't rename the data frame names to the ones that were used before.
- We have moved 'Copy As New Data Frame' menu to under Export button. This used to be under the action menu of each step (right hand side).
- Selecting Window Calculation menus from the column header men didn't populate the correct parameters when multiple columns were selected.
- In Custom Command Input mode, various internal data frame names were suggested when typing a part of the data frame names.
- do_tokenize function was throwing an error when giving a column with space.
- 'Remove Empty Rows / Columns' menu was missing from the Plus button menu.

#### Chart

- Chart: Error Bar was showing an error out if only Y-Axis is assigned a column.

#### Analytics

- Adding new Analytics tabs made the tab order broken, which caused some of the tabs not accessible.
- Analytics level Filter area was too small regardless of the currently available area size.
- Prophet: range of x-axis of Yearly Seasonality was too short when the time unit was hour
- Weekly Seasonality was wrongly disabled with sub-daily time unit like hour was used.


#### Notes

- Clicking on Refresh button was saving the changes when editing in the Separate Window with Side by Side mode.
- Publishing Note is not generating the latest output after editing in the Separate Window with Side by Side mode.

#### Dashboard  

- Clicking 'Open Viz' button didn't open the corresponding Viz.
- Clicking on Re-import Data button broke the underlying data frames when the source data files were not accessible.
- Wrong Dashboard names were showing up in the projects.
- Dashboard Editor becomes disabled even after closing the Separate Window
- Title text didn't change when switching to another Dashboard.



## v4.4.0.2

Released on 6/22/2018

### Enhancements

#### Data Source
- Support event related dimensions and measures for Google Analytics.

#### Chart
- Support a property for the max number of rows in Pivot Table.

### Bug Fix

#### Chart
- Spin icon stayed forever after clicking show detail.
- Tab disappeared after drag and drop.

#### Analytics View
- Analytics Tab order switched unexpectedly.
- Tab disappeared after drag and drop.

#### Data Source
- Database Data Source Icons were disabled when offline.

#### Data Wrangling

- Aggregate function list should align with that of Viz.
- Clean Names created different cleaned column names from previous versions.
- Could not create a Select step for Japanese column name on Windows.

## v4.4.0.1

Released on 6/19/2018

### Bug Fix

#### Dashboard/Notes/Slides

- Document was broken after re-ordering chart/analytics Tabs on Viz/Analytics views.

## v4.4.0.0

Released on 6/12/2018

### Enhancements

#### Dashboard/Notes/Slides

- Width/height ratio is kept when width is set to full.
- Dashboard: Path shows more meaningful text rather than index id.
- Dashboard: Single Value uses a display name for caption.
- Support human readable object id.
- Support Text wrap in the table.
- Support Note EDF export and import.
- Support opening Markdown Editor/Viewer in a new window.

#### Chart

- Support Tab re-order by drag and drop.
- Support auto margin.
- Support option for chart export image size.
- Show NA value in gray color on Number.
- Support  % format for Number.
- Support columns selection in Table.
- Support One Click Chart Creation from Summary View.
- Support One Click Chart Insert to Dashboard.
- Support "Other Group" for Repeat By.
- Support "Other Group" for Color

#### Analytics View

- Support Tab re-order by drag and drop.
- AB test inputs fields are aligned with Chi-square test.
- Chi-square Test pivot table shows values in percentage.
- Add "Normalize Measures" option to Distance by Category.
- Time Series Forecasting: Support sub-daily time units (hour, minute, and second).
- Time Series Forecasting: Change points and their slope changes are displayed on Trend view.
- Time Series Forecasting: Test Mode, where model performance is measured with test data, is added.

#### Data Source

- Twitter Data Source shows more query results and include/exclude retweets parameter is added.
- Support all 20 goals for Google Analytics.
- Support executing Google BigQuery query without needing a data set and introduce "Standard SQL Mode" parameter in Import Dialog.
- Support CSV data export encoding as a part of the user configuration.
- Support Mongo js query evaluation in R.
- Support scheduling chart/data/note with custom R script data source(s).

#### Data Wrangling

- Support pagination in Table view.
- Suggest windows specific locale values on syntax prediction on windows.
- Support "% of ..." column menu.
- Support separate/separate_rows by @.
- Support an option to save resulting columns as factor columns on Create Bin Dialog.
- Update clean_names and add remove_empty from the latest janitor package.
- Support showing column/groups with color for Group-by step on Summary View and Table View.
- Introduce a plus button on Table Header for Table View and a new column can be added to the summarize step by clicking the button.

#### Others
- R 3.5 support.

### Bug Fix

#### Reporting

- Number: style was corrupted in a mobile view.
- Right hand side preview content was not refreshed when opening a different note.
- Republish note created a duplicate entry on the server side.
- Note Editor was scrolled down when screenshot is pasted.
- Opening Document on new Window took times.
- Note Editor scroll position was reset after refreshing the preview

#### Chart

- Move to another data frame and opening Viz under more showed wrong pin step.
- Setting constant reference line on y2 axis with bar marker in line chart gave error.
- Line Y axis range didn't work if the y column is logical.
- Z-axis missed the axis scale property.
- Scatter repeated the same data if categorical on y axis.
- Line chart didn't render correctly with Month Name on x.
- Cumulative sum was incorrectly shown in stack bar chart.
- There was no way to know the column names when they are long.
- Histogram: Need a better handling for Hours/Minutes/Days.
- Number of TRUE was not the default function for Logical Data Type.
- Table didn't show true/false in uppercase.
- TypeError: Cannot read property 'isNumeric' of null was raised.
- fct_lump failed if numeric column with numeric data types specified.
- Map Install took forever on windows.
- Bar raised error if you switch it from Map - Area.
- Histogram raised error because of the invalid validation.
- Pivot raised error with multi measure and within group color by option
- Repeat-by order was incorrect

#### Analytics View
- Exported data from Analytics View did not match with what was displayed in some cases.
- "Saving Thumbnail" message shows up where it shouldn’t.

#### Data Source
- Updating Data Source executed redundant query.
- Detailed error message was not displayed on connection dialog.
- PostgreSQL: List data could not be imported


#### Data Wrangling
- Sequence of backslashes was not handled well when parsing result safely from RServe.
- Object validation was missing when you rename a data frame.
- On K-means dialog non-numeric columns were not disabled
- On Mutate Dialog, Function List position was incorrect.

#### Others

## v 4.3.0.2 (Windows Only)

Released on 4/18/2018

### Bug Fix
- Installation of additional maps hanged.


## v 4.3.0.1 (Windows Only)

Released on 4/8/2018

### Bug Fix
- Install failed if the path specified in EXPLORATORY_HOME environment variable had multibyte characters in it.


## v 4.3

Released on 3/25/2018

### Enhancements

#### Communication/Reporting
- Dashboard Configuration by Drag and Drop

#### Chart
- Correlation/Coefficient information is added in the trend line hover tooltip.
- Scatter Plot / Bubble Chart : Now legend for color is shown when the column is numeric as well as when it is categorical.
- Single Value: Supported custom message for no record case.
- Supported Range (Confidence Interval, Standard Deviation, etc.) for Reference Line .
- Added "Set 0 to Center" option to continuous color option.
- Scatter Plot: Added date functions on X/Y Axis.
- Added integer conversion functions (As Integer, As integer by 10) to the numeric functions in Charts.
- Added First / Last options to Reference Line.
- Supported line width in Trend Line.
- Row ID column support in Long-Lat Map and Bubble chart.
- Ratio type support in Error Bar chart.
- Aggregate function name is now shown as part of column name in Pivot table.
- Added a column sorting option to ignore/honor row groups in Pivot table
- Pivot Table: Supported row total.
- Added 2000 and 3000 rows options to viz table
- Supported column search by name on Column Selectors.

#### Analytics View
- Added Chi-Square Test Analytics View.
- Added T-test Analytics View.
- Added ANOVA Analytics View.
- Added Normality Test Analytics View.
- Added "Dinstance by Column" Analytics View.
- Added Analytics property dialog for finer control on how each analytics is run.
- Linear Regression : Y=0 reference line in Coefficients chart.
- Distance : Exposed a property for color circle on/off to Similarity Map
- Made P-Value thresholds adjustable.
- Correlation/Distance : Exposed a property for whether to show full matrix or only the lower triangle.
- Added "High Confidence" tab to Linear/Logistic/Cox Regression Analytics View.
- Survival Analysis : Log Rank Test is added.
- Supported Filters in Analytics View.
- Time Series Forecast : Yearly/Weekly Seasonality Tabs are added.
- Supported logical columns for Correlation/Distance by Column Analytics Views.
- Now, random seed can be set in Variable Importance (Random Forest), Linear/Logistic Regression, Cox Regression Analytics View.
- Supported column search by name on Column Selectors.

#### Data Source
- Supported connection to multiple mongodb hosts of a replica set.

#### Data Wrangling
- On Summary View and Table View, column names which are used in the right hand-side step that is currently selected are now highlighted.
- Supported Binary (Two Classes) in Create Bins (Category) Dialog
- Supported "Remove Text" and "Remove Text (All)" as Text Column Operation
- Supported column search by name on Column Selectors.

#### Others
- Supported multiple steps selection without explicity changing to edit mode
- Project can be duplicated now.
- Summary View: Added Standard Deviation as a metric on numeric column.


### Bug Fixes

#### Communication/Reporting
- Chart did not show in the center of the slide in 16:9 mode.
- Markdown metadata json file could become very large in size.
- Exported html file name for dashboard and slides were "note.html". Now it is renamed to "dashboard.html" or "slides.html".
- Short Cut Key for inserting a link on RMarkdown Note was setting text range in the wrong place

#### Chart
- Show detail showed nothing in Scatter chart.
- Showing the trend line hover tooltip was hard.
- "Number of unique values" warning were shown where it should not, if the current data frame was grouped.
- Table title was not aligned to the center of the table.
- Reference line was showing partially.
- Reference line did not show in the first chart if you use color from repeat by in some cases.
- Reference line was not bound to y2 axis.
- Extra spaces were there on both side of the Bar chart in Repeat By case.
- Legend did not show if multiple y axes have same configuration in Bar chart.
- Histogram errored out if you use a column including Inf/-Inf and custom bucket.
- Sample size was not shown in Bubble chart.
- Circles in legend were not even in Scatter and Bubble charts.
- Reference line support in Histogram.
- Bar chart reference line broke if you assign TXT function on the numeric column assigned to X Axis.
- Bundled popular geojson maps.
- X/Y axis order was broken if categorical columns were assigned to x/y in Scatter chart.
- Trend Line data range for all group should be calculated within each repeatby.
- Handle a column assigned to color as a group by column in Bubble chart.
- Sort did not work on logical column in Table.
- y2 axis did not show correctly on horizontal Dual-Y Bar chart.
- Chart legend did not honor the factor order.
- Circles did not show correctly in Scatter chart.
- Viz "Show detail" dialog showed empty or not filtered data for some cases
- Chart filter showed internal function names.
- Unwanted space pushed viz down even after error message for step cleared.
- Longer column name pushed value to the right on Viz Show Details Dialog.
- Incorrect Unique value warning was raised on Viz View even if the number of unique value is very low.

#### Analytics View
- Anomaly Detection Analytics View: With Repeat By, titles for each facet was missing.
- Maximum row numbers of tables in Analytics View was too small. (The maximum is changed to 1000.)
- Allow only logical for survival event status column
- Hitting "Enter" key on Multi Column Selection Dialog does not work
- Analytics View does not work properly when "Adding New Step" exists on right hand side step list
- On Analytics View, not all the variable names are visible unless you open the Multi Column Dialog
- On Analytics View, Multi Column Selection Dialog shows empty data
- On Analytics View, Multi Column Selection Dialog does not allow users to select more than 300 columns
- Regression Analysis : Error was thrown when there were no significant coefficient
- Clicking Non-existent Yearly/Weekly tab triggered unnecessary spin icon rendering on Prophet Analytics
- Label did not show up on Similarity Map on Distance by Category under certain conditions.
- Thumbnail for last opened tab was not captured.
- Thumbnail for other viz was not displayed when a last selected viz is pivot or table.
- Distance by Category: Error was thrown when Category column name had space in it.
- Analytics View: Coefficents Scatter plots in Linear/Logistic/Cox Regression Analytics was not correctly sorted by the values of coefficients.

#### Data Source
- Column Data Type guessing was skipped when updating existing Data Frame
- For MongoDB, default data frame name should be collection name instead of "dataframe"
- Switching connection on Update Dialog does not work
- Cannot get schema info from Amazon Redshift
- On CSV Import Dialog, default value for Trim White Space parameter was not "Yes"

#### Data Wrangling
- Inf/-Inf was shown as NA on Table view
- Error was raised for filter command when there was incomplete token
- On filter dialog, it was not possible to select values from list of values when window height was small
- Unwanted default name "dataframe" was automatically set when data frame name was not specified on Create Data Frame Dialog
- List Of Values were not reflecting the previous operation inside the same Mutate
- Max width was not set dynamically for a token inside data wrangling step.
- stem_word function threw error.
- SIGPIPE error was occasionally thrown.
- Reset button was not working as expected on Command UI
- Error was not displayed even if a custom command uses invalid statement
- Drag and drop Branch Lists caused corrupted transformation steps
- Expression generated by Column Header menus for operations like "% Difference from" was missing * 100 to make the result in percent.

#### Others
- Process remained after shutdown on windows7
- Non-ascii user first/last name was not shown on desktop.
- When copying a dataframe, Analytics was not copied along with it
- Data Refresh on Server : Error "error code 3" was thrown when dataframe name started with _
- Edf export did not work after cancelling R
- Exploratory Desktop did not start up when there is existing Rserve process


## v 4.2.0.6 (Windows Only)

Released on 2/19/2018

### Bug Fix
- Exploratory did not start up for the second time inside a firewall that silently ignores outgoing connection.


## v 4.2.0.2.1 (Mac Only)

Released on 2/19/2018

### Bug Fix
- Exploratory did not start up for the second time inside a firewall that silently ignores outgoing connection.


## v 4.2.0.5 (Windows Only)

Released on 2/3/2018

### Bug Fixes

- R temporary Directories that look like %HOME%/AppData/Local/Temp/RtmpXXXX (XXXX are alphabets or numbers.) were left without cleaned up, consuming disk space.
- NW.js temporary Directories that look like %HOME%/AppData/Local/Temp/nwXXXX_XXXX (XXXX are numbers.) were left without cleaned up, consuming disk space. (In this relase, the directories are still left, but they are empty so that it will not consume disk space. We will keep looking into solutions to remove those directories cleanly.)


## v 4.2.0.4 (Windows Only)

Released on 1/30/2018

### Bug Fixes

- PostgreSQL connection with SSL was not working.
- Blank screen was shown at start up on Windows 7, when .NET framework was not installed.


## v 4.2.0.3 (Windows Only)

Released on 1/28/2018

### Bug Fixes

- When updating imported data from PostgreSQL/Redshift, multibyte characters were garbled on Windows.


## v 4.2.0.2

Released on 1/23/2018

### Bug Fixes

- It was possible to overwrite catalog data for existing data source step with newly created data source step. It would later cause errors with message "Error: It looks like the data frame file is broken and cannot open it.".


## v 4.2.0.1

Released on 1/23/2018

### Bug Fixes

#### Installer

- Making use of existing R was not working.
- Installer now detects old .NET Framework on Windows 7, which would cause login to fail.

#### Chart

- When month extracted from Date column was set to x-axis, and Repeat By was applied, chart was broken with wrong x-axis values.
- Bar Chart: Applying "% of Total" function on y-axis showed wrong values when drawing a chart with single bar by means of not specifying x-axis column.
- Line Chart: X-axis range became wider than necessary, when Repeat By column was specified.
- Scatter Plot: When the column for the first y-axis of multiple y-axes was unset, an error was raised with message "Cannot read property 'isNumeric' of null at eval".
- Single Value: When the number to show is 0, an error was raised with message "Cannot read property 'slice' of undefined".
- Pivot Table: When one of existing multiple value columns was unset, an error was raised with message "Error at : VizView.generateViz  : TypeError: Cannot read property 'func' of null".
- GeoJSON data download was not cancelable.

#### Data Wrangling

- It was possible to drag/drop a branch step into among main branch steps, which should have been disallowed.

#### Data Source

- ODBC connection without user name did not work.


## v 4.2

Released on 1/3/2018

[Release announcement blog post](https://blog.exploratory.io/exploratory-v4-2-released-dashboard-new-analytics-new-charts-and-more-ee5d8aab1adc)

### Enhancements

#### Communication/Reporting
- Introduced Dashboard
- Change History dialog with capability to revert Note/Slides/Dashboard to any one of older status.
- Note/Slide: Added Information Dialog from where you can see list of Vizs and Analytics used in the Note/Slides.
- Note/Slide: Chart Selection Dialog now remembers the lastly selected Data Frame.

#### Chart
- Added Pie/Ring chart.
- Added Bubble chart.
- Added Single Value as a chart so that it can be displayed on Dashboard.
- Show Detail menus on charts, with which you can take a deeper look at the portion of the data the part of the chart represents.
- Keep Only / Exclude menu on charts, with which you can create a viz filter.
- Added new Window Function (cumulative sum ratio, % of max, % of min, % of first, % of last, % of mean, and % of median)
- Dual y-axis for Bar, Scatter, and Line Chart.
- Viz Filter with custom command.
- Reference Line for Bar, Line, and Scatter Chart.
- Added "% of TRUE" and "% of FALSE" to Column Menu for logical data type columns.
- Pivot Table: Supported Sorting within Group.
- Line Chart: Made data range and incremental value configurable for y Axis.
- Line Chart: Trend Line Support.

#### Analytics View
- Added Analytics View for Princepal Component Analysis.
- Variable Importance: Added Effects Viz. It visualizes how the important parameters affect the target value making use of edarf package.
- Variable Importance: Added "Fix Imbalanced Data" option to binary classification case. It balances data with majority class and minority class with SMOTE algorithm, for better binary classification result.
- Variable Importance: Made sample size adjustable
- Variable Importance: For classification, model prediction quality as a whole as well is shown as per-class quality.
- Variable Importance: AUC is shown as additional model metrics in case of binary classification.
- Variable Importance with Time: Made sample size adjustable
- Regression Analysis: Added Logistic Regression support.
- Regression Analysis: Added "Fix Imbalanced Data" option to Logistic Regression. It balances data with majority class and minority class with SMOTE algorithm, for better binary classification result.
- Regression Analysis: Made sample size adjustable
- Anomaly Detection: Added support for more aggregation functions such as number of unique values within each time period.
- Anomaly Detection: Added "Anomaly with Expected" view, where expected values are shown alongside the anomalies.
- Time Series Forecast Analytics View: Added support for more aggregation functions such as number of unique values within each time period.
- Overall robustness improvement on all Analytics Views.

#### Data Source:
- Added Raw Lines Data Source to read entire line as one column.
- Added a slide switch to switch between Sample Data mode, which is for faster calculation in Exploratory Data Analysis phase, and regular mode.
- Google BigQuery: Now you can schedule processing of data from Big Query at exploratory.io server.
- Added Enter-key shortcut for saving data.

#### Data Wrangling:
- Added fill command, which fills NA data with previous/next non-NA value.
- Added exp_balance command, which fixes imbalanced data with SMOTE algorithm.
- Custom Label Field for Manual Method in Create Bin (Categories) Dialog
- Added "Convert to Integer" menu to Column Header Menu for numeric columns.
- Added Multi Column Operations (mutate_at/mutate_if) to Multi-select Column Header Menu.
- Now you can reorder Transformation Steps by Drag-and-Drop.
- New Date Filter options, such as half-year, bi-month, previous period, etc.
- Supported in, and not-in operator in Filter Step for numeric columns.
- Now we save custom command even when it results in error, so that you can keep editing it to iteratively fix it.
- Now we save a step that returns no data as a valid step.


### Bug Fixes

#### Chart
- Clicking window function link opened a wrong dialog.
- Error Bar: Window Calculation type stayed "none", even if it is applied.
- The bubble (pop-over) is not showing up when mouse over.
- Window Calculation was not applied if result was sorted.
- Scatter Plot raised errors with following message. : "Error at : VizView.updateViz  : Error: Error in mutate_impl(.data, dots)"
- Pivot Table: Unique values estimation was incorrect and showed false alarm.
- Histogram: When with facets, bucketing was not done for each facet.
- Stacked Bar Chart with Repeat By without X-axis column was broken
- Map - Long/lat: Error when trying to add "Size" parameter.
- GeoJSON Map raised error if you used "sum".
- Histogram: When used on difftime column, error is raised.
- Viz Filter: If Column Data Type was changed from Character to Factor filter became disabled.
- Mouse over bubble tip was showing the wrong values
- Scatter: disable text sort on x and y if scatter lines by label case

#### Data Source
- RScript Data Source: Last line in the editor was not fully visible.
- Dremio: Default port and server (localhost) was not set in the form.
- Dremio: After Test Connection is canceled R process was remaining, preventing other operations.

#### Data Wrangling
- mutate command string was truncated if the same number was repeatedly entered.
- Step message was not showing when moving from a data content tab to another tab
- After re-import data, table Data did not get refreshed
- Syntax suggestion: Column name was suggested inappropirately when cursor was in a quoted position.
- Table/Summary/Viz View: When error happened, previous data was shown. We now show a blank pane in such cases.
- Summary View: Content inside was not automatically resized.
- Branch root link did not get updated right after deleting the step.
- Refresh All was not refreshing all Data Sources when the Viz to refresh was pinned on a step.
- Disabled step was not distinguishable when in branch
- Rename command: Tab character inadvertetly added at the end of new column caused error.
- Duplicated Data Frame, Note, Script was not highlighted correctly.
- R Script Editor: Cursor position shifted incorrectly.
- R Script Data Source: Not very helpful "error code 3" error was raised when there was syntax error.
- Filter Command: Delete icon disappeared when changing the operator.
- Create Bin Dialog: Infinite loading icon remains, when the dialog was opened.

#### Analytics View
- Analytics Viz display was broken when left-hand-side object tree pane was collapsed/expanded.
- Anomaly Detection with time unit of minute or second raised error.

#### Communication/Reporting
- Vizs in Note was not calculating data from the last step of data frames correctly.
- Trying to share data which was originally imported via edf raised error.

#### Others
- Installation screen did not fit in the default window size. (Windows Only)
- Supported Cancel for local package install on Windows


## v 4.1.0.4 (Mac Only)

Released on 12/15/2017

### Bug fixes
- Could not connect to Dremio after installing Dremio ODBC Driver 1.3.14.1043. (Mac Only)


## v 4.1.0.3 (Windows Only)

Released on 12/13/2017

### Bug fixes
- Installation failed when R 3.4.3 is selected as the version of R for Exploratory to work with. (Windows Only)
- Custom R package install with local package file did not work for some packages. (Windows Only)


## v 4.1.0.2

Released on 10/28/2017

### Enhancements

- Added "Convert to Logical" menu to numeric column menu.
- CSV File Data Source: You can now specify column data type when automatic guess is not correct.
- Scatter Plot: Now calculation of trend line uses actually displayed sampled data for its calculation for better performance.

### Bug fixes

- Cursor position in Custom Command text area became inaccurate as the command got longer.
- Tiles on Summary View became unselectable under certain conditions.
- Result of subtraction was displayed with sequence of 9s, as in 0.999999999999.
- Create Bins Dialog was broken when displayed under certain conditions.
- MathJax expression was not displayed.
- Regression Analysis View threw error when variable name had spaces in it.
- Rmarkdown Note: Viz was not displayed when the dataframe it is on has a name with special characters.
- Viz Filter on a Date column did not work.
- Viz Filter on a difftime column raised error when filtering result had zero rows.
- Regression Analysis now pre-filters Inf/-Inf instead of throwing error.
- Variable Importance View: Confusion Matrix with a logical prediction target column was shown with FALSE row/column before TRUE row/column.
- Tables in Regression Analysis View showed numbers with only 4 digits precision. Now we show numbers in 10 digits precision.
- Plus button menu was cut off when left-hand side object tree was hidden.
- Survival Analysis View: Parts of Survival Curve was missing when displayed with both Colors and Repeat By.
- A/B Test View: Parts of Posterior Curves were missing when displayed with both Colors and Repeat By.
- Line Chart: Parts of lines were missing when both Color and Repeat By columns were specified.
- Scatter Chart: Trend line was not drawn at all when data included infinite values. Now infinite values are pre-filtered as outliers and then trendline is drawn.
- Timeline Forecast View: Yearly seasonality was applied for data shorter than one year by default, resulting in unreasonable forecast.
- Exported R script for File Data Sources such as CSV Data Source wrongly had type_convert step in it.
- Pivot Table: Right-hand side control column disappeared under certain conditions.


## v 4.1.0.1

Released on 10/22/2017

### Bug fixes
- Creating a new GeoJSON map raised error.  


## v 4.1

Released on 10/21/2017

### Enhancements

#### Rmarkdown Note

- Presentation Slide
- TOC support
- Remote Image support
- Image file drag and drop.
- Image embedded inside Table
- Embedding Youtube Video.
- Embedding Twitter Card.
- Performance improvement.
- Rmarkdown Note now remembers previous cursor position when reopened.
- Support for Code Folding.
- Shows more granular messages on what Exploratory is working on while processing Rmarkdown Note.
- Support for description text for published Note.

#### Chart

- Filtering Data is supported inside Charts.
- Chart Data is now exportable as CSV, Excel, JSON, and to the clipboard.
- "Number of Not NA" and "% of Not NA" are added to the list of Chart Column Functions.
- Scatter: Support for connecting dots with line.
- Length of Trend Line is now adjusted for actually plotted sampled data points for better visualization, while the Trend Line itself is calculated from entire data for accuracy.

#### Analytics View

- Regression Analytics View is added.
- Analytics View data is now exportable as CSV, Excel, JSON, and to the clipboard.
- Time Series Forecast: "Data" view, where data is exportable, is added.
- More granular messages on what Exploratory is working on is shown while Analytics View is running.

#### Data Source

- Connection to Dremio
- Connection to SQL Server
- Renewed SQL Editor UI.
- Renewed R Script Data Source Editor UI.
- Google Analytics: Support for E-Commerse dimensions/metrics.
- Stripe: Support for Query String to filter query with specific conditions.
- More detailed schema information is visible for Amazon Redshift, PostgreSQL, and MySQL.

#### Data Wrangling

- Step Data is now exportable as Excel file, in addition to previously supported CSV, Excel, JSON.

#### Collaboration

- Tag support at publishing Note, Chart, and Data to exploratory.io.

#### Others

- Project Search now looks at note/script names while finding projects.
- Script Editor: Indent Guides is added.
- We now use Hack font for code editors.


### Bug fixes
- Data export from pivot table did not work if a column was assigned to multiple places in the pivot table.
- Custom R package install did not have Cancel link while running.
- OAuth Connection disappeared from UI when it was expired or revoked.
- Project List: Sort by Name did not work.
- Test data ratio was not correct when a model was created by custom command.
- Specifying numeric NA String (for example -9999) for Excel did not work.
- Adding remote image link in Rmarkdown Note raised error : "pandoc document conversion failed with error 67"
- Export or project with a name that starts with multibyte character failed.
- Exported R script did not have type_convert() function unlike how it is treated inside Exploratory, which in some cases caused errors when the exported script is run.
- Data exported from Pivot Table was filtered and not complete.
- Command UI did not show list of columns when previous step was disabled.
- SQL suggested in PostgreSQL data source dialog did not have necessary double quotes.
- "Predict on Test Data" menu was disabled for a Custom Model.
- Long-Lat Map: Legend was not showing up when there was NA in the data.
- Errors were raised sporacically : "Bounds are not valid"
- Having a missing local image file link stopped whole Rmarkdown Note rendering.
- Analytics: Chart setting was not saved when showing/hiding left-hand side Data Frame tree area.
- Thumbnail image was not added/updated when sharing a Chart.
- Adding new entry with + (Plus) button failed on "Replace Existing with New Values" dialog.
- No spin icon was shown when switching between Analytics Viz tab was taking time.
- Last Import timestamp was not updated when "All Referenced Data Frames" option was selected on a branch.
- Order of Small Multiple was not respecting the factor order of Repeat By column.
- Error was raised when importing an Excel file with sheets with multibyte names.
- Windows: Installation failed when home directory name included multibyte characters.
- Coping image from Safari or Edge to Rmarkdown Note generated invalid markdown image link syntax.
- Clicking link in Note in Run mode opened a window with the link content, but did not open a web browser. Now we open a web browser.
- Copied viz did not have thumbnail image when published
- When an empty Data Frame was fed to Pivot Table, error about "euc2utf8" function was shown.
- Histogram: Feeding data with Inf (infinity) or -Inf (negative infinity) raised error about "summarize_impl" function.
- Building Random Forest model with training data that has NAs raised error.
- Making prediction on new data failed with some models including Random Forest.


## v 4.0.3

Released on 9/16/2017

### Bug fixes

- R installed on a drive other than C was not recognized at installation of Exploratory. (Windows Only)
- Switching between multiple RMarkdown Notes sometimes mixed up the note contents.

## v 4.0.2

Released on 8/27/2017

### Enhancements

#### Analytics View

- Support Repeat-By with A/B Test Analytics View.
- Renewed Viz Property Dialog for finer control of viz.
- Added Survival Table View to Survival Analysis
- End Time of Survival Analysis View and Feature Importance with Time View now defaults to today, if not specified.
- Japanese Translation on some Analytics Views. (Cohort Analysis, Survival Analysis, and Feature Importance with Time.)

#### Rmarkdown Note

- Mobile support for RMarkdown Note shared on server, and exported as HTML.
- Charts in RMarkdown exported as HTML now loads incrementally.
- Support ggplot out.width="full"
- Added R code block tool button.
- Added "Open in Browser" button
- Now table to display data frame in R code block is with pages.

#### Others

- Support Google Analytics Content Experiment dimensions
- Scatter/Map: Now you can specify data sample size to plot.
- Added add_row Command Menu
- Annotation text is now embedded as comment in generated R Script.

### Bug fixes

- Improved error message when there was non-existent local image file link in RMarkdown Note.
- After restarting R, chart rendering in RMarkdown failed.
- SIGPIPE error occasionally happened when rendeting RMarkdown Note.
- Rendering of Analytics Chart embedded in RMarkdown occasionally failed.
- Embedded R script in RMarkdown Note referencing Exploratory Data Frame occasionally failed rendering.
- Change made in Analytics View was not immediately reflected to Chart embedded in RMarkdown Note.
- Markdown Note: Viz table with single column railsed error: "TypeError: data[1].forEach is not a function"
- Heatmap-Map was broken in markdown note exported as HTML.
- When new Analytics is created along with existing Analytics, changes in existing Analytics was not saved.
- In Excel Data Source Dialog, long file path name overflowed in the screen.
- Correlation Analytics View: Diagonal pixels in heatmap was wrongly displayed with value 0.
- When JSON data import is canceled, spin icon did not stop correctly.
- Analytics View: "Underlying data has changed" message was not correctly displayed after pin, unpin and adding new step.
- Variable Importance Analytics View: Improved performance especially when there are many rows and many categorical predictors.
- Heatmap: If categorical data for X/Y axis happens to consist of only number characters, heatmap is not displayed.
- Adding and then removing all Analytics or Rmarkdown on a project created before version 4.0 caused inability to add new Analytics/Rmarkdown again.
- When data for analytics viz which was embeded in Rmarkdown was updated and updated viz was displayed on Rmarkdown, viz on original analytics view page was not updated accordingly.
- Dialog for renaming a script did not show up when menu is clicked.
- Pivot Table: Could not specify Number of Rows as a 2nd measure of a Pivot Table.
- GeoJson Map: Color was not displayed when GeoJson key property was automatically selected by default.
- Scatter Plot: When X axis is a categorical data, its order was not honored when Color By column was specified.


## v 4.0.1

Released on 8/8/2017

### Bug Fixes

- Markdown Note: Analytics Chart insertion button did not work.
- Markdown Note: Fonts used were not consistent.
- Markdown Note: Preview was broken occasionally after inserting Chart from Analytics page.
- Markdown Note: When a Note is exported as Word document, table in it was broken.
- Cohort Analysis Vew: Y-axis value of Retention Rate chart was wrong.
- Cohort Analysis View: Time aggregation level of By-Time Chart was always set to Month regardless of configuration.
- Time Series Forecasting View: Time aggregation level of Forcasted Chart was wrong when it was set to Month or Quarter.

## v 4.0

Released on 8/7/2017

[Release announcement blog post](https://blog.exploratory.io/exploratory-v4-0-released-8abfb1afdb07)

### New Features

- Analytics UI
- Markdown Editor for Note
- A/B Testing with Bayesian Statistics
- New Source Step Editing
- Data Source Extension Updates - Weather, Stock

### Enhancements

#### Chart
- Supported "Sync Scale" options for X and Y separately.
- Added "Month Name", "Week Day" functions for Date data type.
- Pivot: Supported Grand Total calculation.
- Pivot: Added property configurations for Column/Row header labels.
- Pivot: Supported column header sorting.

#### Data Source
- Google Analytics: Supported Goal Metrics on from Goal 1 to Goal 5.
- Excel Data Source Dialog: Added "Guess Data Type" parameter

#### Analytics Functions
- do_t.test function: Means columns in the output data frame was ambiguous about which column was for which input group. Now output is with columns named after the input group it is associated to.
- do_anomaly_detect function: "longterm" argument is now automatically picked for best result without the need to set it explicitly.

### Bug Fixes

#### Chart
- If you assign factor to color in geoJSON, the default metrics was "count", but changed it to more appropriate "first".
- Histogram color was not in TRUE, FALSE order if logical was assigned.
- Added easy-to-understand warning or description at chart pin.
- Scatter Plot errored out if column assigned to color becomes unavailable.
- Margin option was not showing in Heatmap/Contour.
- Window function label was incorrectly shown on Scatter Plot
- X axis tick labels did not show in Boxplot with Repeat By.
- Map: Legend was missing in the exported PNG file.
- Pivot: Exported pivot data did not support multiple measures.
- Chart configuration was lost when it fails to refresh joined data frame.

#### Note
- Note refresh did not refresh chart data.
- When exported to HTML(svg), Chart did not show scrollbar, and was truncated instead.

#### Data Wrangling
- Join Dialog: "no variable to join" error was shown when it should not.
- Command Dialog: UI was broken after toggling Auto Run checkbox.
- Command Dialog: Duplicated green token was showing up when Auto Run checkbox was off.
- group_by with Japanese column name did not work.
- impute_na function did not work with factor.
- row_as_header applied to factor column did not work.

#### Data Source
- MongoDB: Connection failed if password contained special characters.
- Database Data Source Dialog: "Another R process running" error was raised when "Update" button was clicked.
- Data Connection Dialog: For OAuth connections, Connection Dialog was wrongly closed when coming back from browser after giving permissions.
- Database Data Source Dialog: Columns were not listed under the left hand side tree if the table did not have data.

#### Analytics
- Anomaly detection with non-UTC time zone data did not work.

#### Project Export
- Project export on windows did not work when user’s home directory name contained space character.


## v 3.5.0.2

Released on 6/9/2017

### Bug Fixes

- Transformation Step - "Copy as Data Frame" menu is not visible when on a Branch.
- Heatmap/Contour - Margin options do not show up.
- Boxplot - X axis labels do not show up with "Repeat by".
- Market Impact Analysis fails with various errors such as "Error in parse(test = x, keep.source = FALSE)", when market column has values with special characters or starts with number.

## v 3.5.0.1

Released on 6/6/2017

### Bug Fixes
- Typos in UI labels.

## v 3.5

Released on 6/5/2017

[Release announcement blog post](https://blog.exploratory.io/exploratory-v3-5-released-ac37f05b89a)

### New Features

- Annotation for Steps
- Causal Impact Analysis
- UI translation - Japanese

### Enhancements

- Performance improvements - Overall
- Separate command - Fixed width position support
- Pivot Table - Row with Group Level support for Color Scale and ''% of Total' calculation
- Pivot Table - Multiple Measures support - You can add multiple columns to Value.
- Line Chart - You can control the line width and circle size now.
- Chart: Error Bar - Standard Deviation support.
- Map GeoJSON - Extra label column support
- Chart Tab - Larger thumbnail images on hover
- SVD UI refresh
- Pivot Data Export: Support setting delimiters.
- Export Data: JSON output support
- Installer improvements
- Chart: show '%' on axis labels, in balloons, values on plot area for % based chart
- Google Sheet Export: Support Overriding Existing Sheet
- Data Import Dialog Preview Table - It now shows the number of the columns along with rows.
- Recode UI - It now supports numeric data type columns.
- Arrange (Sorting) - You can select multiple columns and select 'Arrange' from the column header menu.

### Bug Fixes

- Map GeoJSON - The min number in the legend was not reflecting the actual data.
- Tokenize Text - Regular Expression as the separator was not producing appropriate results.
- Target data frame is not showing up in the list in Join dialog when the last step is not selected.
- Pivot should return a better message when the result of previous step is empty
- Summary: POSIXct shows only 1 bar in histogram
- Projects are not displayed in project list when there is an underlying error with the package validation.
- Table View - Floating point numbers are not showing up correctly
- Transform Step - When a branch is deleted, it was not removed from the branch list of the Transform Step from which the deleted branch was starting.
- When a join target data frame was renamed, steps after the join step kept old data before rename, and was not automatically refreshed by further updates in the join target data frame.
- Cannot build a Survival Model with an error message "object 'Ccoxmart' not found". (Windows Only)
- Note - Exported chart image is blurry


## v 3.4.6.0

### Bug Fixes

Released on 5/20/2017

- Install fails with an error message "Failed to install R packages. This happens sometimes due to 'Real Time Virus Scan' or other reasons.". (Windows only)
- Displaying Summary View fails with an error message "Error in hist.default(x, plot = FALSE) : invalid number of 'breaks'".


## v 3.4.5.2

Released on 5/18/2017

### Bug Fixes

Released on 5/11/2017

- Cannot open projects on Windows with an error message "Retry failed...". (Windows Only)
- Cannot create a new project on Windows with loading icon. (Windows Only)
- Cannot open the custom color picker dialog. (Mac only)


## v 3.4.5.1


Released on 5/16/2017

### Bug Fixes

- Failed to run Time Series Forecast due to the 'zoo' package not installed.
- Failed to run Time Series Forecast when the existing command with 'growth' parameter.

## v 3.4.5


Released on 5/14/2017

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
- Logical data values (TRUE/FALSE) are not sorted correctly inside the legend for Map-GeoJSON.
- Viz title footer is not shown correctly for Pivot Table in Note.


## v 3.4.4.1

Released on 5/7/2017

### Enhancements

- Added "Convert to Local Timezone" menu to POSIXct columns.

### Bug Fixes

- Transformation Step - bind_cols: Error Dialog popups when a bind_cols transform step is clicked on right hand side list.
- Transformation Step - Custom command: Data source file path info is displayed for custom command steps.

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
- Chart: Cannot scroll Small Multiple chart when it overflows.
- Chart: It throws an error when the previous step of the transformation has no data.


## v 3.4.3

Released on 5/4/2017

### Enhancements

- Added “Anonymize Text” column menu
- Added “Concatenate Text” column menu
- Added property checkboxes to show/hide title text on a chart


## v 3.4.2.1

Released on 5/2/2017

### Bug Fixes

- In Time Series Forecasting, forecast result degrades to linear trend line without seasonality taken into account.

## v 3.4.2

Released on 5/1/2017

### Enhancements

- Show ‘%’ on value text such as axis tick label, balloon text, and value text on plot area if chart is based on percentage.

### Bug Fixes

- Irrelevant error message "Error in if (conn) {: argument is not interpretable as logical" is showing up when there is an error in SQL query.
- Factor values on Summary View overflows outside of the tile area.
- Variable replacement in SQL by `@{<expression>}` is not working.
- In Time Series Forecasting, meaningless weekly seasonality is returned even when aggregation level is larger than week.
- Only one bar is showing up for Date/POSIXct data in Summary View
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
