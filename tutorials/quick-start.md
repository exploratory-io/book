# Quick Start guide

## Create a project

First, create a new project by clicking on 'Create Project' button.

![](images/quick-start.png)

Type a project name and click 'Create' button.

![](images/quick-start2.png)

## Import data - CSV

Next, let's import a data. You can download a sample data 'US Presidential Election Campaign TV Advertisement Spending' from [here](https://www.dropbox.com/s/7fwtbqd9lejkhyv/us_election_campaign_tv_ad.csv?dl=0).

Import the sample CSV file.

Click '+' icon next to 'Data Frame'.

![](images/quick-start3.png)

Select 'Import Local Data'.

![](images/quick-start4.png)

Find the downloaded sample data file and click 'Open' button.

![](images/quick-start5.png)

The data is showing up in the preview table correctly. Click 'Import' button.

![](images/quick-start6.png)

The data is imported into Exploratory. You can see it in Summary view. Each column is showing horizontal bar chart or histogram depending on the data type along with some useful metrics.

![](images/quick-start7.png)

You can go to Table view by clicking on 'Table' button to see the raw data.

![](images/quick-start8.png)

You can also go to Chart view by clicking on 'Chart' button to visualize the data.

![](images/quick-start9.png)

Assign 'sponsor_affiliation' column to X-Axis.

![](images/quick-start10.png)

You can see Bernie Sanders and Hillary Clinton are the top 2 TV Ad sponsor affiliated candidates.

## Transform

Go back to Summary view.

There is a column called 'location', which includes City, State, and Country information.

![](images/quick-start11.png)

You can separate this column into three columns of 'city', 'state', and 'country' by using 'separate()' command.

Select 'Separate' from '+' button menu.

![](images/quick-start13.png)

Select 'location' column name from the 'suggested' list.

![](images/quick-start14.png)

Type ',' (comma) and ' ' (space), you'll be suggested a list of arguments (parameters) for 'separate' command. Select 'into' argument.

![](images/quick-start15.png)

Select 'c' function fro the suggested list.

![](images/quick-start16.png)

Type the new column names for City, State, and Country using double quotes.

```
"city", "state", "country"
```

![](images/quick-start17.png)

Type ',' (comma) and select 'sep' argument from the suggested list.

![](images/quick-start20.png)

Type ',' (comma) wrapped around with double quotes like below.

```
","
```

The final command looks like below.

```
separate(location, into=c("city", "state", "country"),sep=",")
```

![](images/quick-start21.png)


Hit 'Run' button.

![](images/quick-start22.png)

Now you can see three new columns being created.

![](images/quick-start23.png)

## Visualize

Go to Chart view and assign the new column 'state' to X-Axis.

![](images/quick-start24.png)

You can see Iowa (IA) has the most TV advertisements and has almost twice as much as the second (MA).

## Create a Note

Click '+' icon next to 'Notes'.

![](images/quick-start25.png)

Type a name for the note.

![](images/quick-start26.png)

Start writing your notes. You can format the text by selecting the sentence or words.

![](images/quick-start27.png)

Every time you click on a new line you will see '+' button showing up at the left side.

![](images/quick-start28.png)

You can click on it and click 'Chart' icon.

![](images/quick-start29.png)

Select a chart you want to include in your note, and click 'OK' button.

![](images/quick-start30.png)

You can see the chart being added to the note.

![](images/quick-start30_1.png)

Once you are ready, you can publish your note to share by clicking on 'Publish' button.

![](images/quick-start31.png)

Click 'Publish' button inside the dialog.

![](images/quick-start32.png)

You can either copy and paste the URL or simply click 'View Published note' to open a web browser to see the published note.

![](images/quick-start33.png)

Now you will see your published note in a web browser.

![](images/quick-start34.png)
