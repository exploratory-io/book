How many restaurants are there ?
What are the most common business categories ? - Top10
Where those restaurants are ?
Any trend/patten based on the type of busienss by state ?
What are the top most frequent categories within Restaurant ? Is that sandwich or Italian ?
Can we use that data to see the difference between the states ?

Explain the auto data type mapping

- drop hours, attribute columns

## Text operation - String Detect

- mutate with str_detect - restaurants

## Unnest  

- unnest(categories)
- filter - != restaurant

-> at this point, you can see what are the common type of restaurants. Let’s find out what type of the restaurants are common for each states

- group by - state, categories
- summarize - count, average(stars)

-> show a chart - stack bar - assigning category to the color, but there are too many category. So let’s get only the top 10 for each state.

- group by - state
- top_n - count or top_n - average(stars)

-> How about ‘shopping’ instead of ‘restaurants’ ?

- Go to the step 2 and change that to ‘Shopping'
- Go to the step 4 and change that to ‘Shopping'

-> now you can go to the step 6 or 8 and see the detail for Shopping
