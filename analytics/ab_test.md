# A/B Test - Bayesian 
Analyzes A/B test result data based on Bayesian algorithm.

## Input Data
Input data should be a A/B test result data. Each row should represent a period of time for a page (A or B) with access count and conversion rate during the period. (e.g. total number of view and total number of sign up for a day for page A). It should have following columns.

* A/B Identifier - A column that indicates the row is for group A or B. The data type can be either logical, numeric or text. It should have only 2 unique values.
* Conversion Rate (CR) - Ratio of the converted access count out of the total access count.
* Total Population - A numeric column that contains the total access count.

## How to Use This Feature
1. Click Analytics View tab.
1. If necessary, click "+" button on the left of existing Analytics tabs, to create a new Analytics.
1. Select "A/B Test - Bayesian" for Analytics Type.
1. Select Conversion Rate column with "Conversion Rate (CR)" column selector.
1. Select Total Population column with "Total Population" column selector.
1. (Optional) Enter an expected average of CR value from empirical estimation or historical data. 
1. (Optional) Enter an expected Standard Deviation of CR value from empirical estimation or historical data.  
1. (Optional) Select a column to group subjects with "Repeat By" column selector. For each group, a separate small chart will be displayed.
1. Click Run button to run the analytics.
1. Select view type (explained below) by clicking view type link to see each type of generated visualization.

### "Summary" View
"Summary" View displays the summary of the Bayesian A/B test analysis result in a table format.
![](images/ab_summary.png)

This example is with Repeat By. 
![](images/ab_summary_repeatby.png)

#### Output Data
Following is the list of columns in the raw data displayed in the "Summary" View.
* Group Columns - If Repeat By is specified, the columns appears in the output data frame. 
* Group - Group name. Either A or B.
* AB Identifier - The actual A/B Identifier value. 
* Total Population - Total Population value. 
* Converted - Number of population converted. 
* Conversion Rate - A number column that conatins the ratio of the converted numbers against the total numbers.
* Chance of Being Better - Probability of being better. Between 0 and 1. 
* Expected Improvement Rate - Expected improvement rate of conversion rate. 
* Credible Interval Low - Lower bound of credible interval of the expected improvement rate.
* Credible Interval High - Upper bound of Credible interval of the expected improvement rate. 
* Expected Loss Rate - Average loss rate of conversion rate by choosing A, assuming A was actually worse. 


### "Improvement Rate" View
"Improvement Rate" View displays the estimated distribution of the performance improvement rate. 
![](images/ab_improvement_rate.png)

This example is with Repeat By. 
![](images/ab_improvement_rate_repeatby.png)

### "Posteriors" View
"Posteriors" View displays posteriors of the conversion rate. 
![](images/ab_post.png)

This example is with Repeat By. 
![](images/ab_post_repeatby.png)

### "Prior" View
"Prior" View displays prior beta distribution derived from Expected Average of CR and Expected SD of CR. 
![](images/ab_prior.png)

This example is with Repeat By. 
![](images/ab_prior_repeatby.png)

## R Package

The "A/B Test - Bayesian" Analysis uses [`bayesAB`](https://cran.r-project.org/web/packages/bayesAB/index.html) R Package under the hood.

## Exploratory R Package

For details about `bayesAB` usage in Exploratory R Package, please refer to the [github repository](https://github.com/exploratory-io/exploratory_func/blob/master/R/do_bayes_ab.R)
