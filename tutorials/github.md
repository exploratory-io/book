# Analyze project issues data from Github

How many open issues are ?
How are they trending ? (line chart)
What are the average of closing time ?
Are they improving ? - calculate the difftime and use the created_at as X-axis to show line chart?
Any trend/pattern by type of issues ? Critical issues, Regression issues - use boxplot and created_at as X-axis

Based on the information from the past, I want to see how we can manage to close all the issues, how can we improve the overall product development and quality control processes better. In another words, how long will it takes to close those issues, where the bottlenecks are for fixing those issues, what are the trend of the issues inflow and outflow. Being able to ask and answer these questions quickly we can not only anticipate in future but also correct the actions and prepare for the better outcome.


## Custom R Script Data Source  

```
library(httr)
library(jsonlite)
library(dplyr)

pages <- list()
for(i in 1:14){
  req <- GET("https://api.github.com/repos/hideaki/tam/issues",
             query = list(state = "all", per_page = 100, page = i),
             authenticate("kanaugust", Sys.getenv("GITHUB_PASS")))
  a <- fromJSON(content(req, type = "text"), flatten = TRUE)
  pages[[i]] <- a
}
issues <- bind_rows(pages)
issues
```

### Parameters

Github API for Github issues provides many parameters. You can see a full list here. <update url>
We are using only a few parameters here, we want to get all issues regardless of the status so setting 'all' to 'state' parameter. Also, the API doesn't give us all the data once instead it returns as a chunk (or page) so we need to call the api multiple times


### Passcode

Note that I'm using a system variable called 'GITHUB_PASS' inside 'authenticate' argument. You can of course type your passcode for Github here, but keep in mind you might share this project with others in future and typing a password directly here is not safe and recommended. Instead, you can create a system variable that is stored on your PC outside of Exploratory repository and access to the variable like above.

There are a few ways to create system variables but using '.Renviron' file would be the most straightforward and secure.

Create '.Renviron' text file at your home directory - "~" if you don't have one yet. You can do this either opening Terminal app (if you're on Mac) and open 'vi' or something like that. Or, you can use Finder app and click on 'Home' icon in the left hand sidebar.

And type the following.

```
GITHUB_PASS=<your password goes here>

```

Make sure you hit 'Return' key at the end of the line to create another line that is empty. Once that's done save the file, and you will need to restart Exploratory.

### JSON data

The returned data is in JSON format, so we're using 'fromJSON()' function from 'jsonlite' package. (update link) Remember Github api returns only a chunk of the data per request and we are calling the api multiple times, this means we need to keep each of the result into a List object 'pages'. The above example, after calling it 14 times and the operation with  'fromJSON()' function we end up having 14 data frames, and all of them are stored in 'page' object as a list. 





## Select and Drop Columns  

## Filter data

We want to show only the open issues that are targeted for our 1st release.

## Date Filter
now() - weeks(4)

## Calculate time interval between Created_At and Closed_At for each issue  
