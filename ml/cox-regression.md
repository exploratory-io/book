# Survival Analysis - Cox Regression / Proportional Hazard

With Cox Proportional Hazard Model, you can predict how particular type of subjects would survive as time goes by, based on the survival data from the past.

## Input Data
Input data should be a survival data. Each row should represent one observation (e.g. one user of a subscription service). It should have following columns.
  * Survival Time - A numeric column with survival time. Also called "time to event".
  * Survival Status - A boolean or binary numeric value (can take value of 1 or 0) column with survival status. When this column is true or 1, it means the event of interest happened to the subject at the end of survival time. If it is false or 0, it means we know that the event had not happened to the subject at least until the end of the survival time, but we don't know what happened to the subject after that point.

## How to Access This Feature
* Click "+" button and mouse over "Build Model ...", and select "Build Survival Model (Cox Regression)" submenu to open "Build Survival Model (Cox Regression)" dialog.
* You can also select "Analytics" from column menu of the survival time column, and then select "Build Survival Model (Cox Regression) for" submenu to open "Build Survival Model (Cox Regression)" dialog.

## Build Survival Model
After "Build Survival Model (Cox Regression)" dialog is opened, follow the steps below to build Survival Model.

![](images/coxph_dialog.png)

1. Select survival time column with "Survival Time (Time to Event)" dropdown.
2. Select survival status column with "Survival Status (Event)" dropdown.
3. Select Predictor Columns in "Predictor" section.
  * If you want to include all the columns in the input data other than Survival Time Column and Survival Status Column, choose "All" radio button.
  * If you want to specify particular columns in the input data as predictors, choose "Select" radio button, and select columns from the column selector that appears in this section.
4. Split test data from traininig data
  In the "Data Split" section, you can split the data into training and test to evaluate the performance of the model later.

  ![](images/train_test_split.png)

  * Test Data Set Ratio - Ratio of test data in the whole data.
  * Random Seed to Split Training/Test - You can change random seed to try other training and test data combination.
5. (Optional) Specify additional parameters in "Parameters" section.
  * A Vector to Subset Data
  * Weight Vector
  * How to treat NA?
  * Parameter to Start
  * How to Treat Ties
  * Allow Singular Fit
  * Return Model Object
  * Return Model Matrix X
  * Return Model Matrix Y
  * Time-Transform Function
  * Convergence Tolerance (Epsilon)
  * Tolerance for Singularity during Cholesky Decomposition (Epsilon)
  * Max Iterations
  * Tolerance for Infinite Coefficient Value
  * Max Iterations for Outer Loop
6. Click "Run" button.


## Reference
* [Introduction to Survival Analysis Part 2 — Survival Model (Cox Regression)](https://blog.exploratory.io/introduction-to-survival-analysis-part-2-survival-model-cox-regression-47a170eacf5d)
