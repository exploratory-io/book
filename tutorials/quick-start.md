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

## Visualize data

You can go to Chart view, and assign FL_DATE column to X-Axis and switch the aggregation level to Day.

![](images/quick-start28.png)

And, you can assign 'ARR_DELAY' column to Y-Axis and switch the aggregation function to Average instead of Sum.

![](images/quick-start29.png)

You can also switch the chart type to Boxplot or others to explore data visually.

![](images/quick-start30.png)


## Remove NA values

Going back to Summary view and scrolling down the page you will notice that ARR_DELAY column has NA values.

![](images/quick-start6.png)

You can remove NAs by selecting 'Remove NA' from the column dropdown menu.

![](images/quick-start7.png)

This would produce one of the dplyr commands 'filter'. 'is.na' function inside the 'filter' command evaluates if a given value is NA or not. '!' (exclamation) mark reverses the effect of the function after. Combining all of them together, it will keep only the rows whose 'ARR_DELAY' column values are not NA. (If you are not R user, this could be your first R command, congrats!)

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

You can quickly visualize the data again by going back to Chart view.

Assign the new column 'FL_DATE_wday' to X-Axis and 'ARR_DELAY' to Y-Axis, and switch the aggregation function to 'Average.'

![](images/quick-start32.png)

The default is showing each of the week day in the week day order. You can also sort based on the Y-Axis values by clicking on 'Sort' check box.

![](images/quick-start33.png)

You can switch the chart type to Heatmap and assign 'CARRIER' to Y-Axis, 'ARR_DELAY' to Color, and switch the aggregation function to 'Average'

![](images/quick-start34.png)

## Share Chart

Now, you can share the chart quickly. Click on 'Share' button.

![](images/quick-start31.png)

Type for Title and click 'Share' button.

![](images/quick-start35.png)

Once it's published, click 'View Shared Chart'

![](images/quick-start36.png)

You can see your chart is shared at exploratory.io.

![](images/quick-start37.png)

You can also click on Data tab and see how the data was prepared.

![](images/quick-start38.png)
