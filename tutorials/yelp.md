# Analyze Yelp Business Review JSON Data

### What you are going to learn

Analyzing JSON data by:

- Working with the list data type / nested (array) data
- Counting number of the values inside the list
- Extracting Nth value from the nested data
- Concatenate values from the nested data
- Finding text patterns inside the nested data
- Un-nesting (flatten) the nested data



## About Yelp business review sample JSON data

We're going to use Yelp business review sample data that was published by Yelp. You can download it from the link below.

- [Yelp business review data](https://www.dropbox.com/s/3h7vjgktoprheyg/yelp_academic_dataset_business.json?dl=0)

The data is about businesses on Yelp in the selected areas. You can find information about each business such as their opening hours, type of the business, location, average review star rating, etc. Here's a sample of the raw data for one business.

```
{
  "business_id": "SQ0j7bgSTazkVQlF5AnqyQ",
  "full_address": "214 E Main St\nCarnegie\nCarnegie, PA 15106",
  "hours": {
      "Monday": {
        "close": "22:00",
        "open": "11:00"
      },
      "Tuesday": {
        "close": "22:00",
        "open": "11:00"
      },
      "Friday": {
        "close": "23:00",
        "open": "11:00"
      },
      "Wednesday": {
        "close": "22:00",
        "open": "11:00"
      },
      "Thursday": {
        "close": "22:00",
        "open": "11:00"
      },
      "Sunday": {
        "close": "21:00",
        "open": "11:00"
      },
      "Saturday": {
        "close": "23:00",
        "open": "11:00"
      }
    },
  "open": true,
  "categories": [
    "Chinese",
    "Restaurants"
  ],
  "city": "Carnegie",
  "review_count": 8,
  "name": "Don Don Chinese Restaurant",
  "neighborhoods": [
    "Carnegie",
    "Homestead"
  ],
  "longitude": -80.084861,
  "state": "PA",
  "stars": 2.5,
  "latitude": 40.408343,
  "attributes": {
    "Take-out": true,
    "Alcohol": "none",
    "Noise Level": "quiet",
    "Parking": {
      "garage": false,
      "street": false,
      "validated": false,
      "lot": false,
      "valet": false
    },
    "Delivery": true,
    "Has TV": true,
    "Outdoor Seating": false,
    "Attire": "casual",
    "Waiter Service": false,
    "Good For Groups": false,
    "Price Range": 1
  },
  "type": "business"
}
```

As often with JSON data, the data is hierarchically structured. For example, 'hours' node has two levels, one is about the day of the week and another is about the opening hours within each day of the week. With Exploratory, these hierarchical structures will be flatten out at the data import time so that the lowest level of the element will have its own column. In this case, 'hours.Saturday.open' will have its own column, 'hours.Saturday.close' will have its own column, and so on.

Another common characteristic of JSON data you can observe with this data as well is something called 'Array'. You can see, for example, 'categories' and 'neighborhoods' have multiple values inside the square brackets. With Exploratory, the way these data is stored will be preserved after importing data, but they are registered as List data type and we call them 'Nested' data, which mean it contains multiple values in a single list or sometimes in a data frame. These 'Nested' data can be 'Un-Nested' with ```unnest()``` function later, which we'll talk about later in this tutorial.


## Create a new project  

After you open Exploratory app, create a new project.

![](images/flight-create-project.png)


## Import sample data

Inside the project, you can click a plus '+' icon next to 'Data Frame' text in the left side pane to import 'yelp_academic_dataset_business.json'.



After you select the file from the file picker dialog and hit OK, you'll see the first 10 rows of the data you're importing. Click 'Import' button leaving the default parameter setting.

![](images/yelp-data-import.png)



## Summary View

You can see a brief summary of the data in Summary view. It shows 105 columns and 61,184 rows at the top. The data has been automatically inspected behind the scene and each column is registered with an appropriate data type so that columns like 'name', 'city', etc, are 'character' type, columns like 'review_count' are 'integer', and so on.


You can also see some of the columns' sneak peak view. For example, you can see the most frequently appeared businesses like 'Starbucks', 'McDonald's', etc, in name column quickly.

![](images/yelp-summary.png)

## Select (or Drop) columns

Let's remove unnecessary columns for our analysis. You can use a minus '-' function to drop columns and use convenient functions like ```starts_with()``` to match the column names with certain characters so that you can drop them all together.

```
select(-starts_with("hours"), -starts_with("attribute"))
```

Once you run this command, you will get only 13 columns. Very simple. ;)

## Count number of the members inside List (Nested) data

There is a column called 'neighborhoods'. People on Yelp give (or tag) each business with the neighborhood names they think appropriate. It is a List data type, which means each row of the data contain more than one value. We call it 'Nested' data.



Let's find out how many neighborhoods people are tagging to each business. You can use ```list_n()``` function to count the members (values) inside this list data.

```
mutate(neighborhood_counts = list_n(neighborhoods))
```

When you run this command you can see the number of the neighborhoods tagged with businesses are varied between 0 and 3.

![](images/yelp-neighborhood-counts.png)

Let's find out what percentage does each number (0, 1, 2, 3) represent. Since the summary view gives you a histogram for each numeric and date data type column and a bar chart for each text data type column, the easiest way to do this is to convert the 'integer' data type to 'character' data type by wrapping the result of the ```list_n() ``` function with ```as.character()``` like below.  

```
mutate(neighborhood_counts = as.character(list_n(neighborhoods)))
```

 When you run this command you'll see 52 businesses have 3 tags, but most of the businesses are either no tag or 1 tag of the neighborhood name.

![](images/yelp-neighborhood-counts2.png)


## Extract an Nth value from List (Nested) data

Let's say you want to extract the Nth value in the nested data so that each row of the business will have one neighborhood data assigned. You can use ```list_extract()``` function to extract a value at Nth position inside the nested data like below.

```
mutate(neighborhood_name = list_extract(neighborhoods, 1))
```

When you run this command you can see the top neighborhood names

![](images/yelp-neighborhood-name.png)

You might want to go to Table view to see this result better by clicking on Table button.

![](images/yelp-neighborhood-name2.png)

## Extract all the values from List (Nested) data and concatenate

We know there are some businesses that have more than just one neighborhood assigned. Let's try to get all the values out and concatenate them by ',' by using ```list_concat()``` function.  

```
mutate(neighborhood_name = list_concat(neighborhoods))
```

The ```list_concat()``` function uses comma ',' as the separator as default. You can change this by adding ```sep``` argument if you like. You can go to Table view to see the result better.

Let's sort the data to list from the ones with the most neighborhoods using ```arrange()``` command.

```
arrange(desc(neighborhood_counts))
```

Now you can see all the neighborhood names are extracted and the column 'neighborhood_name' is 'character' data type.

![](images/yelp-neighborhood-name3.png)


## Find (Search) values inside List (Nested) column

Let's say you want to know how many restaurants there are in this data.

You would notice that 'categories' column is 'List' data type, which means each row of the data contain more than one value. In this case, each business has multiple categories assigned. For example, 'Verizon Wireless' business has categories like 'Shopping', 'Home Services', 'Internet Service Providers', etc.

![](images/yelp-business-category.png)

This type of the data structure (Array) is very common with JSON. With Exploratory, you can access to values inside of this nested data easily.

First, let's create a new column that would have TRUE if 'categories' values include 'Restaurant', otherwise FALSE, by using ```str_detect()``` function, which would return TRUE if it detects a given a text pattern.

```
mutate(is_restaurant = str_detect(categories, "Restaurant"))
```

Once you run the command you can find 21,892 (35.78%) of the businesses are restaurant related.

![](images/yelp-is-restaurant.png)

Now, if you wanted to filter only the restaurant related business you could have run the command like below.

```
filter(str_detect(categories, "Restaurant"))
```

After you run the command above, you'll notice that now 'Walgreen' is not showing up in the top 6 bars under name column.

![](images/yelp-only-restaurant.png)

## Un-nest Nested column data

Let's say you want to know what are the most common categories or types of restaurants, for example something like the top 10 most frequent restaurant types.

To find this out, we can un-nest or flatten the 'categories' list column so that we can count on every single categories that are mapped to all the businesses. And you can use ```unnest()``` function to do this very simply. Add a new step and type the following.

```
unnest(categories)
```

Once you run the command above, you will find the 'categories' column is now 'character' type instead of 'list', and it has the top categories listed in the summary view.

![](images/yelp-unnest-category.png)

Since we have filtered the data to have only the 'Restaurant' related businesses already at the previous step, we can remove the rows with 'Restaurant' category.

```
filter(categories  != "Restaurants")
```

You can see 'Fast Food', 'Pizza', 'Mexican', etc, are the most frequent restaurant categories.

![](images/yelp-top-categories.png)

Go to Chart view to see all the categories by assigning 'categories' to X-Axis.

![](images/yelp-restaurant-category-chart.png)

Now, what if you want to know if these common restaurant categories would vary among regions like States. To find this out, we can count the number of the categories for each State, by grouping by State and Category. To see this better, let's go to Table view first.

And, create grouping rules first with the command below.

```
group_by(state, categories)
```

Then, type the ```summarize()``` command below to count number of the restaurants for each state and category.

```
summarize(count = n())
```

![](images/yelp-state-category-count.png)

Let's go to Chart view to visualize this result, and assign 'state' to X-Axis, 'count' to Y-Axis, and 'categories' to Color.


![](images/yelp-state-category-chart.png)

But there are too many categories that it almost doesn't make much of the sense. Let’s get only the top 10 for each state by using ```top_n()``` function. To do this, first, we need to set the grouping level to 'state' with ```group_by()``` function like below.

```
group_by(state)
```

Then, type ```top_n()``` function like below.

```
top_n(10, count)
```

Once you run the command above, now you'll see much better views. You'll notice, for example, that Chinese restaurants are pretty common all across different states but not with Arizona (AZ).

![](images/yelp-state-category-top10.png)

But still, it's hard to see and compare among States because some bars are very tall but some bars are too small to see inside the bar. So let's get the percentage (ratio) of each category within each state so that we can compare the trend among States easier. To do this, you can use ```sum()``` function to calculate the total for each group (State) and divide each category count by this total number inside ```mutate()``` command.

```
mutate(ratio = count / sum(count))
```

Now you can see some sort of the trend. States from AZ to WI are showing some similar trend while States from BW to MLN are somewhat similar. Also, you can see some states are very diversified, but some others are not.

![](images/yelp-ratio-chart.png)


## Update a particular analysis step in the middle

We have seen what types of the restaurants are in the data and how they're different among the states. But how about other categories like 'Shopping' ? Let's say we want to know what type of the business tagged with 'Shopping' and how those are different among the states.

We can do this just by updating the step where we filtered to keep only 'Restaurant' related categories. Click 'Filter' at the third step and replace 'Restaurant' with 'Shopping'.

```
filter(str_detect(categories, "Shopping"))
```

Once you hit 'Run' button, you will see different set of the businesses like 'Walgreen', 'Walmart', 'Cvs', etc, under 'name' column.

![](images/yelp-shopping-category.png)

Now, you can just click 'Unnest' step to unnest all the categories.

![](images/yelp-shopping-unnest.png)

As you would imagine, the most frequent categories is 'Shopping', so let's update 'Filter' step right after the 'Unnest' step by replacing 'Restaurant' with 'Shopping'

```
filter(categories != "Shopping")
```

Once you hit 'Run' button you can see 'Fashion', 'Home & Garden', 'Woman's Clothing', etc, under 'categories' column

![](images/yelp-shopping-unnest2.png)

Finally, you can go to the last step by clicking on it, and go to Chart view and see the trend. For example, you can see that 'EDH, 'NV', 'PA' states have more 'Accessories' type businesses than the other states.

![](images/yelp-ratio-shopping.png)

With Exploratory, not only can you easily work with the nested structural nature of JSON data, but also you can flexibly assemble your analysis to answer your questions in a simple and intuitive way.
