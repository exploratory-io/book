# Random Survival Forest

Builds Random Survival Forest Model, which predicts survival curves of subjects based on the specified predictor variables.

## Input Data
Input data should be a survival data. Each row should represent one observation (e.g. one user of a subscription service). It should have following columns.

* Start Time - A Date or POSIXct column with the beginning of the observation of the subject.
* End Time - A Date or POSIXct column with the end of the observation of the subject.
* Period By - Time unit used for survival curves.
* Event Status - A boolean or binary numeric value (can take value of 1 or 0) column with whether the event of interest (death) happened. When this column is true or 1, it means the event of interest happened to the subject at the End Time. If it is false or 0, it means we know that the event had not happened to the subject at least until the End Time, but we don't know what happened or will happen to the subject after that point.
* Predictor Variables - Variables that are used as the basis of the prediction of survival curves.

## Analytics Properties
  * Prediction
    * Survival Time for Prediction - Time for the survival rate plotted on the "Prediction" View.
    * Max # of Variables - Maximum number of variables to plot on the "Prediction" View or "Survival Curves" View.
  * Data Preprocessing
    * Sample Data Size - Number of rows to sample before building Cox regression model.
    * Random Seed - Seed used to generate random numbers. Specify this value to always reproduce the same result.
    * Max # of Categories for Predictor Vars - If categorical predictor column has more categories than this number, less frequent categories are combined into 'Other' category.
    * Fill NA in End Time - How to fill NA in End Time column. One of the following.
      * Use Latest Date/Time - Use the latest date/time that appear in the data.
      * Use Today - Use today to fill NA.
      * Enter Manually  - Use manually entered value
    * Date to Fill NA in End Time - Date to fill NA in End Time column. This value takes effect when "Enter Manually" is selected for "Fill NA in End Time".
    * Remove Outliers from Predictor Variable(s) - If TRUE is selected, rows with predictor variables values that are outliers are removed in the preprocessing.
    * Type of Outlier Detection - IQR (1.5 IQR rule), Percentile, or Standard Deviation
    * Threshold - Threshold value to identify outliers. Default is 0.95 for Percentile, and 2 for Standard Deviation.


## How to Use This Feature
1. Click Analytics View tab.
2. If necessary, click "+" button on the left of existing Analytics tabs, to create a new Analytics.
3. Select Start Time column with "Start Time" column selector.
4. Select End Time column with "End Time" column selector.
5. Select Event Status column with "Event Status" column selector.
6. Select unit of time (Day, Week...) with "Period By" dropdown.
7. Select Predictor Variable Columns with Column Selector Dialog.

![](images/var_importance_with_time_column_select.png)

8. Select Predictor Variables.
9. Click Run button to run the analytics.
10. Select view type (explained below) by clicking view type link to see each type of generated visualization.

### "Prediction" View
"Prediction" View plots how the predicted event occurrence rate (1 - survival rate) varies as each variable changes. The event occurrence rates are predicted at the period specified in the properties. This is so called partial dependence plot.

### "Importance" View
"Importance" View displays importances of variables for the prediction of survival. Importances are calculated by permutation importance with Efron approximation as the cost function.

### "Survival Curves" View
"Survival Curves" View displays how the predicted survival curve varies as each variable changes.

### "Data" View
"Data" View displays prediction results on each subject in the data.

- Survival Time - Survival time of the subject.
- Survival Time for Prediction - Survival time used for the prediction below. 
- Predicted Survival Rate - Predicted survival rate at the point of time above.

## R Package

This Analytics View uses [`survival`](https://cran.r-project.org/web/packages/survival/index.html) R Package under the hood.

## Exploratory R Package

For details about `survival` usage in Exploratory R Package, please refer to the [github repository](https://github.com/exploratory-io/exploratory_func/blob/master/R/survival_forest.R)
