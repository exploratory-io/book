# Release Note

## R 1.4.3

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


## R 1.4.2

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


## R 1.4.1

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


## R 1.4.0

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


## R 1.3.0

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


## R 1.2.2

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

## R 1.2.1

Released on 4/18/2016

### New Features

- Web Scraping Data
- Remote JSON - REST API Basic
- Remote Data - MongoDB

### Enhancements

- Google Analytics Enhancements - Dimensions and Metrics List
- Chart Rename / Delete support

### Bug fixes



## R 1.2.0

Released on 4/11/2016

### New Features

- Refresh remote data
- Data Wrangling script download (dplyr)
- Function list dialog
- Data Source Plugins

### Enhancements

- Show space and special characters for Table view

### Bug fixes
