# Regression Analysis

Build Linear Regression Model

## Input Data
Input data should contain a numeric column for "Target Variable" and more than one categorical and/or numeric columns as Predictor Variable Columns.

  * Target Variable - Numeric column that you want to Predict.
  
  * Predictor Variable Columns - Numeric and/or Categorical columns. Prediction is made based on values of those columns.

## Analytics Properties
  * Coefficients
    * P Value Threshold to be Significant - P value must be smaller than this value for coefficients to be considered statistically significant.
    * Sort Variables by Coefficients - If set to TRUE, variables displayed in Coefficients View are sorted by coefficients.
  * Variable Importance
    * Enable Relative Importance - Enable/disable calculation of variable importance. 
    * Method - Method to calculate variable importance.
      * First Variable - Based on R Squared of the model that predicts with only the variable to estimate the importance of.
      * Last Variable - Based on R Squared of the model that predicts with all the variables except for the variable to estimate the importance of.
      * Lindeman, Merenda, and Gold - Based on average of contribution of the variable to estimate to R Squared in all possible order of adding variables to the model.
    * Confidence Interval - Level of confidence interval to estimate for variable importance of each variable.
    * Bootstrap Method - Bootstrap method to use to estimate confidence interval of variable importance.
    * Number of Bootstrap Iterations - Bootstrap iterations to perform to estimate confidence interval of variable importance.
  * Data Preprocessing
    * Sample Data Size - Number of rows to sample before building linear regression model.
    * Random Seed - Seed used to generate random numbers. Specify this value to always reproduce the same result.
    * Max # of Categories for Predictor Vars - If categorical predictor column has more categories than this number, less frequent categories are combined into 'Other' category.
  * Evaluation
    * Test Mode - Enable/disable Test Mode, where data is split into training data and test data for evaluation of the created linear regression model.
    * Ratio for Test Data - Ratio of test data to select from the entire data. Default is 0.3.
    * Data Splitting Method
      * Random - Test data is randomly sampled from the original data.
      * Reserve Order in Data - Data that shows up later in the original data is used as test data.

## How to Use This Feature
1. Click Analytics View tab.
2. If necessary, click "+" button on the left of existing Analytics tabs, to create a new Analytics.
3. Select "Regression Analysis" for Analytics Type.
4. Select What to Predict Column.
5. Click Variable Columns and open Column Selector Dialog.

![](images/var_importance_column_select.png)

6. Select Columns that you want to see importance.
7. Click Run button to run the analytics.
8. Select view type (explained below) by clicking view type link to see each type of generated visualization.

### "Summary" View
"Summary" View displays the summary of the model created for this Regression Analysis. Each column shows the model information like R Squared, Root Mean Square Error from where you can understand model performance.


- R Squared - A statistical measure of how close the data are to the fitted regression line. It is also known as the coefficient of determination, or the coefficient of multiple determination for multiple regression. 1 (100%) indicates that the model explains all the variability of the response data around its mean.

- Adjusted R Squared - The adjusted R-squared is a modified version of R-squared that has been adjusted for the number of predictors in the model. The adjusted R-squared increases only if the new term improves the model more than would be expected by chance. It decreases when a predictor improves the model by less than expected by chance. The adjusted R-squared can be negative, but it’s usually not.  It is always lower than the R-squared.

- Root Mean Square errors - The Root Mean Square Error (RMSE) (also called the root mean square deviation, RMSD) is a frequently used measure of the difference between values predicted by a model and the values actually observed from the environment that is being modeled.

- F Ratio - F Ratio gives you a measure of how much of the variation is explained by the model (per parameter) versus how much of the variation is unexplained (per remaining degrees of freedom). This unexplained variation is your error sums of squares. With this F Ratio, a higher ratio means that your model explains that much more of the variation per parameter than there is error per remaining degree of freedom.


![](images/regression_model_summary.png)


### "Prediction" View
"Prediction" View plots how the predicted value varies as each variable changes. This is so called partial dependence plot.

### "Importance" View
"Importance" View displays importances of variables for the prediction of the target value. Importances are calculated by permutation importance with residual sum of squares as the cost function.

### "Coefficients" View
"Coefficients" View displays coefficient estimates for all the predictor variables with Error Bars with P value as a color (i.e. If P Value < 0.05, the color is blue) 

![](images/regression_coeff.png)

### "Coefficients Table" View
"Coefficients Table" View displays more details for all the variables along with other metrics like Coefficient, Standard Error, t-Ratio, P-Value, etc. You can click on the column headers to sort the data with a help of bar visualization.

![](images/regression_coeff_table.png)

### "Collinearity" View
"Collinearity" View displays VIF (Variance Inflation Factor) of each predictor variables. VIF greater than 10 is commonly considered to be the indicator of problematic degree of multicollinearity.

### "Residuals" View
"Residuals" View compares the predicted values and the actual values to see how good or bad the model’s prediction capability is. If it is the perfect model, meaning it can predict with 100% accuracy, then all the dots should be lining up along with the gray line called ‘Perfect Fit’.

![](images/regression_prediction.png)

### "Residual Distribution" View
"Residual Distribution" View shows the residual which is difference between the predicted and the actual values. And visualizing the Residuals can reveal a lot of useful information that can guide you to decide what types of data transformations are needed to improve the model. (e.g. [Interpreting residual plots to improve your regression](http://docs.statwing.com/interpreting-residual-plots-to-improve-your-regression/))

![](images/regression_residual.png)

### "Data" View
"Data" View displays prediction results on each row in the data.

## R Package

The `Regression Analysis` uses [`build_lm.fast`](https://github.com/exploratory-io/exploratory_func/blob/master/R/build_lm.R) function from Exploratory R Package under the hood.
