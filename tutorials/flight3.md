# Analyze Flight Data Part 3 - Data Join / Blending

### What you are going to learn

- Scraping data from web pages
- Joining (Blending) with other data frames - left join, anti join, inner join
- Set operation - Union / Merge

## Import sample data

We are going to create a new data frame by importing the following CSV file below.

- [airline_delay_2015_01](https://www.dropbox.com/s/fpmqzjan5us91yg/airline_delay_2015_01.csv?dl=0)

Inside the same project or a new project, you can click a plus '+' icon next to 'Data Frame' text in the left side pane and select 'Import Local Data' menu.

![](images/flight-add-data-frame.png)

Select 'airline_delay_2015_01.csv' in the file picker dialog to import and hit 'OK' button. You will see the first 10 rows of the data you're importing.

![](images/flight-data-import2.png)

Keep the parameters as default and click 'Import' button.

You can see a brief summary of the data in Summary view. It shows 26 columns and 469,968 rows at the top.

![](images/flight-summary2.png)


Now, there is a column called 'CARRIER' that has airline carrier codes.

![](images/flight-carrier-column.png)

But these two abbreviation codes are not really clear to most of us. Fortunately, there is a bunch of the code and actual airline carrier name mapping data that is just one click away with google search. For example, there is one at this [web site](http://aspmhelp.faa.gov/index.php/ASQP:_Carrier_Codes_and_Names) from Federal Aviation Administration's official site.

![](images/faa-website.png)

You can see the two letters code and the carrier name mapping. Instead of manually copying and pasting these information, we can actually directly scrape the data from this page.


## Scrape and import Airline Carrier lookup code from Web Site

### Scrape and Import

To scrape the data and import, you can create a new data frame by selecting 'Write custom R script' from the dropdown menu under '+' sign right next to 'Data Frames' text in lefthand side pane.

![](images/flight-data-import-menu.png)

In the dialog, give it a name like 'carrier_lookup' and type the following R script.

```
## Load 'rvest' package for web scraping
library(rvest)

## Read the web page and store into faa_mapping_html object.
faa_mapping_html <- read_html("http://aspmhelp.faa.gov/index.php/ASQP:_Carrier_Codes_and_Names")

## Set "table" element name as a node that we're interested inside the html, and load the content of the table with html_table() function. ''%>%'' is a chain operator that pass the data from the one before to the one after. '<-' is an assignment operator that store the result from the one after to the one before.
faa_mapping <- faa_mapping_html %>%
  html_node("table") %>%
  html_table()

## Return 'faa_mapping' object that stores the result above.
faa_mapping
```

The web page we're dealing with is pretty simple this time, hence the script above is also pretty simple. But 'rvest' package is much more capable than this. If you're interested in more here's an [official document](https://cran.r-project.org/web/packages/rvest/rvest.pdf).

Let's hit 'Preview' button and see the result.

![](images/flight-custom-data-carrier.png)

The result looks exactly what we wanted, so hit 'Import' button.

You can see 14 rows of the data that has just been imported.

![](images/flight-custom-carrier.png)

### Clean up

Let's do a few clean up. First, let's rename the column names to be something that is easy for later use like below.

```
rename(code = `IATA Carrier Code`, name = `Carrier Name`)
```

We don't really need a column that holds three letters abbreviation for this exercise, so let's drop that.

```
select(-`ICAO Carrier Code`)
```

That's it, let's go back to the main data frame 'airline_delay_2015_1'.

## Join the lookup data

Let's join with the lookup data that we just prepared in the previous steps. We can use ```left_join()``` command to do a type of join called 'Left Join', which would try to find any matching data from the target data (right side) for the original data rows (left side) and leave any rows that can't find the matching data from the target with NA values.

Probably, it's easier to see it rather than reading it, so let's run the command below.  

```
left_join(carrier_lookup, by=c("CARRIER" = "code"))
```

Using ```by``` argument you can assign the columns from each data frame you want to use to match the two data frames. Make sure you need to use ```c()``` to set that information as above. If you happen to have the data frames that you need to use two pairs of columns to match, you can have those two pairs inside the ```c()``` and have them separated by ',' (comma).

Once you hit 'Run' you see the lookup table is successfully joined by adding a new column 'name' at the end.  

![](images/flight-join1.png)

However, you would notice that there is a small fraction of the data that didn't get mapped to any carrier name and ended up having NAs. You can find what those are quickly by switching from ```left_join``` command to ```anti_join``` command like below. You don't need to change the argument inside the command.  

```
anti_join(carrier_lookup, by=c("CARRIER" = "code"))
```

The ```anti_join()``` operation finds and keeps the rows from the original data frame that don't match with anything from the target data frame. You can see 'VX' is the carrier that doesn't have a match in the lookup data.

![](images/flight-join2.png)

Now, when we google-ed again, we have found the following web site.

http://www.airfarewatchdog.com/pages/3799702/airline-letter-codes/

![](images/flight-airlinewatchdog.png)

The data table on this page has 'VX', which is 'Virgin Airline' so we can use this. Let's scrape that and import so that we can add this data frame to our 'carrier_lookup' data frame.

Before, going to the next step, let's make sure we change the join back to 'left_join' instead of 'anti_join'

```
left_join(carrier_lookup, by=c("CARRIER" = "code"))
```

If you're interested in other types of Join, take a look at our [Join document page](dplyr/join.md)

## Scrape another data from Web

To scrape the data and import, you want to do basically the same thing as you did before. Create a new data frame by selecting 'Write custom R script' from the dropdown menu under '+' sign right next to 'Data Frames' text in lefthand side pane.

![](images/flight-data-import-menu.png)

In the dialog, give it a name like 'carrier_lookup2' and type the following R script.

```
library(rvest)

airline_code_html <- read_html("http://www.airfarewatchdog.com/pages/3799702/airline-letter-codes/")

airline_code <- airline_code_html %>%
  html_node("table") %>%
  html_table()
```

Hit 'Preview' button to preview the data.

![](images/flight-carrier-lookup2.png)

And, hit 'Import' button.


### Clean up the data

Let's do a few clean ups with this data like we did before.

First, let's rename the column names to make them easier to recognize.

```
rename(code = X1, name = X2)
```

And, this time we care about only 'VX' from this data frame, so let's filter to keep only 'VX' data. This way, we can later use ```union()``` command to add this lookup data to the other lookup data.

```
filter(code  == "VX")
```

![](images/flight-carrier-lookup-vx.png)

## Combine the two lookup data frames with Union operation

Now, let's combine the two lookup data frames. Go back to the original 'carrier_lookup' data frame. We can use ```union()``` command to combine the two lookup data frames.

```
union(carrier_lookup2)
```

Once you hit 'Run', you can see the one row of the data from 'carrier_lookup2' has been added and the number of the rows are 15 now.

![](images/flight-lookup-union.png)

## Review the main data

Go back to 'airline_delay_2015_1' data frame. If you haven't already changed the join type back to 'left_join', make sure you update that now.

```
left_join(carrier_lookup, by=c("CARRIER" = "code"))
```

If you had already done that, then the moment you click on the 'left_join' step the data will get refreshed automatically.

![](images/flight-join-update.png)

This is because Exploratory keeps track the underlying change on all the related data and the steps, and any change on any step will automatically invalidates the data cache and refresh the data on-the-fly.

Now there is no NA value under 'name' column, which means that all the carriers are mapped and they have corresponding names.

![](images/flight-carrier-mapped.png)


## Find what could have been missing if we used only the 2nd lookup ?

Now, you might be wondering why didn't we use just the 2nd lookup data instead of having the 1st one merged with a part of the 2nd lookup data. The reason we didn't do it is because we knew even the 2nd data alone was not enough. We can take a look at the data to quickly prove this. Basically, we can compare the carrier codes from the two lookup data frames.

First, go to the 2nd lookup 'carrier_lookup2' data frame and select only the 'code' column.

```
select(code)
```

There are 95 carriers.

![](images/flight-lookup2-code-column.png)

Then, go to the 1st look up 'carrier_lookup' data frame and select only the 'code' column.

```
select(code)
```

![](images/flight-lookup1-code-column.png)

Now, use ```setdiff()``` command to find what's in the 1st lookup data but not in the 2nd lookup data.

```
setdiff(carrier_lookup2)
```

Once you hit 'Run' button, you can see that there are three carriers, 'EV', 'MQ', and 'OO' that exist only in this 1st lookup data, but not in the 2nd lookup data.

![](images/flight-setdiff.png)

That means, either of the data frames is not complete by itself to satisfy the 'airline_delay_2015_1' data, and this is why we were better off combining the two data frames with ```union()``` command before the join.
