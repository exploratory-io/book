# Quick Start Guide

## Download Flight Delay sample data

We're going to use the following file for this tutorial. You can download it from [here](http://download.exploratory.io/data/airline_delay_2016_01.csv).

- [Flight delay 2016 January data](http://download.exploratory.io/data/airline_delay_2016_01.csv)

## Create a new project

Once you start Exploratory app, create a new project to start.

![](images/getting-started1.png)

Type a project name and click 'Create' button.

![](images/quick-start2.png)

## Import sample data

Inside the project, you can click a plus '+' button next to 'Data Frame' text in the left side pane to import 'airline_delay_part1.csv'.

![](images/quick-start3.png)

Select 'Import Local Data'.

![](images/quick-start4.png)

After you select the file from the file picker dialog and hit OK, you'll see the first 10 rows of the data you're importing.

![](images/flight-data-import.png)


Since the data is showing up ok, you can keep the parameters as default and click 'Import' button.

## Summary data view

Once the data is imported you can see a brief summary of the data in Summary view. It shows 26 columns and 445,827 rows at the top, and you can also see some of the columns' sneak peak view. For example, you can see the most frequently appeared airline carriers in CARRIER column.

![](images/quick-start5.png)



## Remove NA values

When you scroll down you can see ARR_DELAY column having NA values and its data range quickly.

![](images/quick-start6.png)

You can remove NAs by selecting 'Remove NA' from the column dropdown menu.

![](images/quick-start7.png)

What you see in the command input box is one of the Data Wrangling Grammar - dplyr - based R commands, that is automatically generated. (This could be your first R command if you are not R user, congrats!)

![](images/quick-start8.png)

You can update the command or simply click Run button as is.

Once you run it, you see NA values from ARR_DELAY column are gone.
![](images/quick-start9.png)

## Extract Weekday information from Date data

There is 'FL_DATE' column that is date data type.

![](images/quick-start10.png)

You can extract week day information out of this column so that you can compare between the week days.

Click the dropdown menu from FL_DATE column header area, select 'Extract' and 'Day of week' from the sub-menu.

![](images/quick-start11.png)

Once you click 'Run' button you will see that a new column is create at the end and it has week days.

![](images/quick-start12.png)

You can always see Syntax Help by having the cursor inside the function if you are interested in.

![](images/quick-start13.png)

## Visualize data

You can quickly visualize the data by going to Chart view by clicking Chart menu.

![](images/quick-start16.png)

You can assign the new column 'FL_DATE_wday' to X-Axis.

![](images/quick-start14.png)

The default is showing each of the week day in the week day order. You can also sort based on the Y-Axis values by clicking on 'Sort' check box.

![](images/quick-start15.png)

Additionally you can assign CARRIER column to Color.

![](images/quick-start17.png)

## Create a Note and Publish

Click '+' icon next to 'Notes'.

![](images/quick-start18.png)

Type a name for the note.

![](images/quick-start19.png)

Start writing your notes. You can format the text by selecting the sentence or words.

![](images/quick-start20.png)

Every time you click on a new line you will see '+' button showing up at the left side.

![](images/quick-start21.png)

You can click on it and click 'Chart' icon.

![](images/quick-start22.png)

Select a chart you want to include in your note, and click 'OK' button.

![](images/quick-start23.png)

You can see the chart being added to the note.

![](images/quick-start24.png)

Once you are ready, you can publish your note to share by clicking on 'Publish' button.

![](images/quick-start25.png)

Click 'Publish' button inside the dialog.

You can either copy and paste the URL or simply click 'View Published note' to open a web browser to see the published note.

![](images/quick-start26.png)

Now you will see your published note in a web browser.

![](images/quick-start27.png)
