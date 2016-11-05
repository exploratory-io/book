# Quick Start Guide

## Download Flight Delay sample data

We're going to use the following file for this tutorial. You can download it from the link below.

- [Flight delay 2016 January data](http://download.exploratory.io/data/airline_delay_2016_01.csv)

## Create a new project

Once you start Exploratory app, create a new project to start.

![](images/getting-started1.png)

Type a project name and click 'Create' button.

![](images/quick-start2.png)

## Import sample data

Inside the project, you can click a plus '+' button next to 'Data Frame' text in the left side pane to import 'airline_delay_2016_01.csv'.

![](images/quick-start3.png)

Select 'Import Local Data'.

![](images/quick-start4.png)

After you select the file from the file picker dialog and hit OK, you'll see the first 50 rows of the data you're importing.

![](images/flight-data-import.png)


Since the data is showing up ok, you can keep the parameters as default and click 'Save' button.

## Summary data view

Once the data is imported you can see a summary information of the data in Summary view. For example, you can see the most frequently appeared airline carriers in CARRIER column.

![](images/quick-start5.png)

## Visualize data

You can go to Chart view, and assign FL_DATE column to X-Axis and switch the aggregation level to Day.

![](images/quick-start28.png)

Now, you can assign 'ARR_DELAY' column to Y-Axis and switch the aggregation function to Average instead of Sum.

![](images/quick-start29.png)

You can also switch the chart type to Boxplot or others to explore data visually.

![](images/quick-start30.png)


## Remove NA values

Going back to Summary view and scrolling down the page you will notice that ARR_DELAY column has NA values.

![](images/quick-start6.png)

You can remove NAs by selecting 'Remove NA' from the column dropdown menu.

![](images/quick-start7.png)

You will notice that there is a pop-up dialog right underneath 'filter' token. This 'filter' is one of the data wrangling grammar operations (or command). Inside this dialog, 'ARR_DELAY' is selected for Columns and 'is not NA' is selected for Operator. You can simply click 'Run' button to submit the operation. This will keep only the rows whose 'ARR_DELAY' column values are not NA. (If you are not R user, this could be your first R command, congrats!)

![](images/quick-start8.png)

Now, you would see NA values from ARR_DELAY column are gone.

![](images/quick-start9.png)



## Extract Weekday information from Date data

There is 'FL_DATE' column that is date data type.

![](images/quick-start10.png)

You can extract week day information out of these date values so that you can compare among the week days.

Click the dropdown menu from FL_DATE column header area, select 'Extract' and 'Day of week' from the sub-menu.

![](images/quick-start11.png)

Type FL_DATE_wday in New Column Name.

![](images/quick-start12.png)

Once you click 'Run' button you will see that a new column is create at the end and it has the day of week values.

![](images/quick-start12.5.png)

You can always see the function document by clicking 'Show Doc' link. Make sure your mouse cursor is inside the function you want to know more about.

![](images/quick-start13.png)

## Visualize data

You can quickly visualize the data again by going back to Viz view.

Assign the newly created column 'FL_DATE_wday' to X-Axis and 'ARR_DELAY' to Y-Axis, and switch the aggregation function to 'Average.'

![](images/quick-start32.png)

It is showing the days of the week in an appropriate order starting from Sunday as default. You can also sort based on the Y-Axis values by selecting Y-Axis in 'Sort' dropdown.

![](images/quick-start33.png)

There are many chart types, we would encourage you try them out by yourself. For example, you can try out Heatmap chart, and assign 'FL_DATE_wday' to X-Axis, 'CARRIER' to Y-Axis, 'ARR_DELAY' to Color, and switch the aggregation function to 'Average' for 'ARR_DELAY'.

![](images/quick-start34.png)

## Cluster (Segment) Data

You can cluster the data into a set of groups by using 'K-means' algorithm, which is one of the most popular clustering algorithm.

First, let's visualize the departure delay and arrival delay times by using Scatterplot.

![](images/quick-start40.png)

Now, we can cluster the data based on the two column values.

Select 'Build K-means Clustering model' menu under 'Others' button.

![](images/quick-start41.png)

In the dialog, select 'Variable Columns' tab so that you can select the columns that you want to build the clustering model based on.

![](images/quick-start42.png)

And, scroll down to find 'Number of Clusters' parameter and set it to 5. You can set it to any number to experiment.

![](images/quick-start44.png)

Once you hit 'Run' button, then it applies 'K-means' algorithm and score the clustering id for each row with a column name called 'cluster'. You can assign this newly generated column to Color for the chart.

![](images/quick-start45.png)

Since the clustering values are discrete, you can change the data attribute from Numeric to Text.

![](images/quick-start46.png)

Now you can see the data is clustered into 5 groups clearly.

![](images/quick-start47.png)


## Share Chart

Once you find an interesting insight you might want to share it with others. Or, you might want to collaborate with others to transform analyze the data better. This is when you want to share your Chart or Data. You can simply click 'Share' button.

![](images/quick-start31.png)

Type for Title and click 'Share' button.

![](images/quick-start35.png)

Once it's published, click 'View Shared Chart'

![](images/quick-start36.png)

You can see your chart at exploratory.io.

![](images/quick-start37.png)

You can also click on Data tab and see how the data was prepared.

![](images/quick-start38.png)

Now, your co-workers or friends can download this chart and data in a format of EDF (Exploratory Data Format). You can try it for yourself. Once it's downloaded then you can import from ''

![](images/quick-start39.png)

## Create Note

Finally, you can create your analysis report by creating Note.

Click 'Plus' button next to 'Note'.

![](images/quick-start48.png)

Type a name in the pop-up and click 'Create' button.

This is a Rich Text Editor, so you can write anything you like.

![](images/quick-start49.png)

Highlighting the text will prompt you a formatting menu.

![](images/quick-start52.png)

Every time you hit Enter key you will find 'Plus' button at the beginning of each line. By clicking on this 'Plus' button you will see a chart icon.

![](images/quick-start50.png)

You can click this to get a Chart picker dialog. You can simply select one of them and hit 'OK' button to insert the chart into the note.

![](images/quick-start51.png)

Once you finish writing the report, you can either publish it so that you can share by URL or save it in a HTML or PDF document.
