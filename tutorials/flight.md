# Analyze Flight Data

Filtering Data Filtering data is one of the very basic operation when you work with data. There might be null or NA values that you want to get rid of or simply you’re not interested in certain part of the data. You can use filter() function from dplyr as you would expect. And with dplyr, you can do the kind of filtering that wouldn’t be so straightforward with tools like SQL.

Let’s begin with some simple ones. Again, I’ll use the flight data. (Link)

```
select(FL_DATE, CARRIER, ORIGIN, ORIGIN_CITY_NAME, ORIGIN_STATE_ABR, DEP_DELAY, DEP_TIME, ARR_DELAY, ARR_TIME)
```



Now, let’s say you want to see only United Airline (UA) data. You can run something like below.

```
filter(CARRIER == “UA”)
```

And now, you want to see the data only for the flights that are United Airline (UA) and left San Francisco airport (SFO).

```
filter(CARRIER == “UA” & ORIGIN == “SFO”)
```

Or, you might want to see only the data for the flights that left San Francisco airport (SFO) but not United Airline (UA).


Filtering with multiple values What if you want to see only the data for the flights that are either United Airline (UA) or American Airline (AA)? 

You can use ‘%in%’ for this, just like ‘in’ operator in SQL.

```
filter(CARRIER %in% c(“UA”, “AA”))
```

We can see only AA and UA as we expected. 

Now, what if you want to see the data other than United Airline (UA) and American Airline (AA) this time ? Here’s a magic one letter you can use with any condition, it’s ‘!’ (exclamation mark). So it goes like this. 

```
filter(!CARRIER %in% c(“UA”, “AA”))
```

Notice that there is the exclamation mark at the beginning of the condition inside the filter clause. This is a very handy ‘function’ that basically flips whatever the condition after. So the result above doesn’t include ‘UA’ nor ‘AA’.


## Filtering out NA values 

Now, let’s go back to the original data again. 


When you look closer you’d notice that there are some NA values in ARR_DELAY column. You can get rid of them easily with ‘is.na()’ function, which return TRUE if the value is NA and FALSE otherwise. 

```
filter(is.na(ARR_DELAY))
```


Oops, it looks like all the values in ARR_DELAY are NA, which is opposite of what I hoped. Well, as you saw already we can now try the ‘!’ (exclamation mark) function as below. 

```
filter(!is.na(ARR_DELAY))
```



This is how you can work with NA values in terms of filtering the data. So far so good, it’s pretty simple. 



## Filtering with Aggregate functions 

Now, let’s spice it up a little bit. 

What if you want to see only the flights whose arrival delay time (ARR_DELAY) is greater than the overall average ? First, let’s look at the average time.

```
 summarize(average = mean(ARR_DELAY, na.rm = TRUE))
```

It’s about 12.75 minutes. So we’re interested in seeing any flights whose arrival delay time is greater than 12.75 minutes. To do, you can actually directly do the average calculation inside the filter clause. 

```
filter(ARR_DELAY > mean(ARR_DELAY, na.rm = TRUE))
```

This to me used to look almost too good to be true, but then as I get more used to it this is how we ask questions, that is “What are the flights whose arrival delay times are greater than the overall average ?” 

By the way, ‘na.rm = TRUE’ inside ‘mean()’ function is an argument you can pass to the aggregate functions like ‘mean()’ so that it remove any NA values before doing the calculation. If this is not set TRUE then it will return NA when there is NA values in the data. 

Now, what if you want to see the flights whose arrival delay times are greater than the average of each airline carrier, instead of the overall average ? In this case, all you need to do is to add ‘group_by’ clause before the filter clause like below. 

```
filter(ARR_DELAY > mean(ARR_DELAY, na.rm = TRUE))
```


Yes, I’m serious. It’s this simple! Before we get too excited let’s make sure the result really reflects the command below by looking at each airline carrier’s average arrival delay time. 


```
summarize(average = mean(ARR_DELAY, na.rm = TRUE))
```


Average arrival delay time per carrierAs you see the average arrival delay time for carrier ‘EV’ is about 19.69 minutes. Now when you look at the previous result of the filtering, you can see that the arrival delay times are all greater than 19.69. 


## Filtering with Window functions

This is the last, but not the least because this is the coolest thing ever when filtering data. 

Let’s say you want to see the worst 10 flights in terms of the arrival delay time. Of course you can sort the data by ARR_DELAY column. But there is something more useful, it’s called ‘rank()’ function, which, as you would guess, gives a rank number to each row based on the specified column value. So it goes like this. 

```
filter(rank(ARR_DELAY) <= 10)
```



But looks like the result is actually the best 10, not the worst 10, because the less the arrival time means the earlier the flights actually had arrived in this context, so basically we want to flip the order. To do that, you can use ‘desc()’ function just like you’d do with SQL. 


```
filter(rank(desc(ARR_DELAY)) <= 10)
```


Now these are the worst 10 flights in January 2014. I see a lot of American Airlines there, interesting. 

But, what if you want to see the worst 10 flights for each airline carrier, instead of the overall worst 10 ? Yes, as you saw before, all you need to do is to add group_by clause before this filter clause. 

```
filter(rank(desc(ARR_DELAY)) <= 10)
```


To make it easier to see if the result really reflects the command, let’s try to see only the worst 1 for each carrier. 

```
filter(rank(desc(ARR_DELAY)) <= 1)
```

Looks like it’s doing what we would expect. And we can see American Airline is the worst of the worst. ;)

As you see, with dplyr not only can you filter the data with aggregate or window functions, but also you can assemble them flexibly to answer your analysis question without disturbing the way you would ask the question. Hope this post has demonstrated you the power of dplyr.