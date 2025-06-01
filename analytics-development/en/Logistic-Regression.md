const template =
`

A logistic regression model has been created to predict <%= target %> based on the selected predictor variables.

<% if (predictorColumns.length > 1) { %>
# Multicollinearity

<% if (has_perfect_collinearity) { %>
In this model, <%= perfect_collinearity_variables %> creates a problem of [perfect multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (a state where values can be perfectly calculated by a formula using other predictor variables), resulting in infinite VIF scores and preventing the generation of charts for testing multicollinearity. To resolve the multicollinearity issue, please exclude <%= perfect_collinearity_variables %> from the predictor variables and re-run the analysis.
<% } else if (max_vif > 10) { %>
{{multicollinearity}}

This model shows signs of [multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (strong correlation between multiple predictor variables). When predictor variables have VIF values exceeding 10, it becomes difficult to accurately evaluate the effect of individual variables.
To resolve this issue, exclude one predictor variable with low necessity from those with VIF values exceeding 10, re-run the analysis, and repeat this process until no predictor variables have VIF values exceeding 10.

<% } else { %>
{{multicollinearity}}

This model does not show signs of [multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (strong correlation between multiple predictor variables). (When predictor variables have VIF values exceeding 10, it becomes difficult to accurately evaluate the effect of individual variables.)
<% } %>
<% } %>


# Relationships Between Variables

<% if (predictorColumns.length > 1) { %>
## Variable Importance

The following chart shows which predictor variables are relatively more important for predicting <%= target %>.

{{variable_importance}}

For more information about how variable importance works, please see [this note](https://exploratory.io/note/exploratory/dLm5rwn5).

<% } %>

## Effect of Predictor Variables

<% if (predictorColumns.length > 1) { %>
The following chart shows how the value of <%= target %> changes when the probability of each predictor variable changes while other variables remain constant.
<% } else { %>
The following chart shows how the probability of <%= target %> changes when the value of the predictor variable changes.
<% } %>

{{variable_effect}}

* The blue line (or points) shows the predicted values for the predictor variable values.
* The gray lines show the actual values and their 95% confidence intervals.
* The vertical axis represents the probability of <%= target %>.

Notes:

<% if (predictorColumns.length > 1) { %>

* Since this predicts the effect of each predictor variable individually while other variables remain constant, there may be discrepancies between the mean of actual values and predicted values.
* For details on how predicted values are calculated, please see [this note](https://exploratory.io/note/exploratory/Sbd0LDU6).
* For differences in interpretation between simple regression and multiple regression analysis, please see [this note](https://exploratory.io/note/exploratory/BDI7AeE5).
* Predictor variables are arranged in order of importance as shown in the "Variable Importance" section above.

<% } %>

<% if (has_category_columns) { %>
* For categorical (Character, Factor) predictor variables with more than 12 unique values, the 11 most frequent values are retained and others are grouped as "Others". This can be changed in [Settings](//analytics/settings).
<% } %>

# Variable Coefficients (Odds Ratios) and Significance

The coefficients (odds ratios), p-values for determining significance, and confidence intervals are listed for each variable.

{{coefficient_table}}

<% if (has_perfect_collinearity) { %>
_For categorical (Character, Factor) predictor variables with more than 12 unique values, the 11 most frequent values are retained and others are grouped as "Others". This can be changed in [Settings](//analytics/settings)._
<% } %>

## Interpretation of Odds Ratios

Shows how many times the odds of <%= target %> (likelihood of becoming TRUE) increase (or decrease) when each predictor variable's value changes by 1 unit.

### Examples of Odds Ratio Interpretation

<% variables.forEach(variable => { %>
<% if (variable.type == 'numeric') { %>
When other variables remain constant, a 1-unit increase in <%= variable.variable %> makes the odds of <%= target %> (ratio of TRUE / FALSE) approximately <%= variable.odds_ratio %> times.
<% } else if (variable.type == 'logical') { %>
When other variables remain constant, when <%= variable.variable %> is TRUE, the odds of <%= target %> (ratio of TRUE / FALSE) become approximately <%= variable.odds_ratio %> times compared to FALSE.
<% } else { %>
When other variables remain constant, "<%= variable.variable %>" makes the odds of <%= target %> (ratio of TRUE / FALSE) approximately <%= variable.odds_ratio %> times compared to the base level "<%= variable.base_level %>". For details on base levels, please refer to [this note](https://exploratory.io/note/exploratory/Pxa6FmO2).
<% } %>
<% }) %>

For information on interpreting coefficients by data type in statistical prediction models, please see [this note](https://exploratory.io/note/exploratory/KOC5WYt3).

## Significance Testing Using P-values

At a significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), predictor variables with p-values greater than <%= baseline_p_pct %>% (<%= baseline_p %>) cannot be considered statistically significant in their relationship with <%= target %>. Conversely, predictor variables with p-values less than <%= baseline_p_pct %>% (<%= baseline_p %>) can be considered statistically significant in their relationship with <%= target %>.

_The current significance level (p-value) is set to <%= baseline_p_pct %>% (<%= baseline_p %>), but this can be changed in [Settings](//analytics/settings)._


## Visualization of Odds Ratios and Confidence Intervals

The following chart visualizes the odds ratios and significance for each variable.

{{coefficient}}

* The center point of each error bar represents the odds ratio value, and the upper and lower lines represent its 95% confidence interval. Predictor variables with significant relationships with <%= target %> and positive relationships are shown in blue, those with negative relationships are shown in red. Predictor variables shown in gray do not have significant relationships with <%= target %>.
* An odds ratio of 1 means that the odds (ratio of TRUE / FALSE) do not change even when the predictor variable's value changes, indicating no relationship with <%= target %>.
* The 95% confidence interval for odds ratios means "there is high probability (95% confidence) that the true odds ratio lies within this range." Therefore, predictor variables whose confidence intervals include 1 cannot be considered statistically significant because there is a possibility of no relationship with <%= target %>. Conversely, predictor variables whose confidence intervals do not include 1 can be considered statistically significant because there is almost no possibility of no relationship with <%= target %>.
* Significance can be determined using either p-values or confidence intervals, and both methods yield the same results.

_The above explanation of confidence intervals is intuitive; more precisely, it means "if we repeatedly sample from the same population and calculate 95% confidence intervals each time, 95% of those intervals will contain the true odds ratio."_

### Notes

* Odds ratios represent the change ratio of odds (ratio of TRUE / FALSE), not the change ratio of probability.
* When the odds ratio is greater than 1, the probability of <%= target %> becoming TRUE increases; when less than 1, it decreases.
* These odds ratio values represent the amount of change when each predictor variable changes by 1 point. When predictor variables have different units, you cannot use these odds ratio values to compare the strength of relationships with <%= target %>. To compare the strength of relationships between predictor variables, please refer to the "Variable Importance" section above.

# Model Metrics

<% if (!test_mode) { %>
Various metrics related to model prediction accuracy and significance are summarized in the table below.
<% } else { %>
Various metrics related to model prediction accuracy and significance are summarized in the table below. Since we are currently in test mode, prediction accuracy metrics are displayed for both training and test data.
<% } %>

{{summary}}

## Prediction Accuracy

For logical (TRUE/FALSE) target variables, AUC is commonly used as a metric for evaluating model prediction accuracy.

* AUC
  * A commonly used metric for evaluating the prediction accuracy of models that predict logical target variables.
  * Measures how well this model can classify TRUE and FALSE data.
  * Values range from 0.5 to 1, where 0.5 represents random prediction (equivalent to coin flipping) and 1 means perfect classification of TRUE and FALSE data.
  * Generally interpreted as acceptable (0.6+), good (0.8+), or excellent (0.9+) classification performance.
  * Stands for Area Under the Curve, meaning the area under the ROC curve.

Reference information:

* For detailed explanation of AUC, please see [this note](https://exploratory.io/note/exploratory/AUC-RZG7gbI6).
* Accuracy, misclassification rate, F1 score, precision, and recall are affected by the TRUE/FALSE threshold setting. The current threshold is set to <%= true_false_criteria %>, but this can be changed in [Settings](//analytics/settings).

## Significance

An F-test was conducted to test the significance of the model. The null hypothesis is that "all coefficients in the model are 0," meaning that the predictor variables used in the model have no relationship with the target variable <%= target %>. If the p-value is higher than the significance level of <%= baseline_p_pct %>%, the relationship between the selected predictor variables and <%= target %> cannot be considered statistically significant. Conversely, if the p-value is lower than <%= baseline_p_pct %>%, it can be considered significant.


{start_show_hide}
## Details of Other Metrics

* F1 Score
  * F1 score is the harmonic mean of precision and recall, providing a metric for model prediction accuracy that considers the balance of both.
  * Values range from 0 to 1, with values closer to 1 indicating an excellent model with balanced precision and recall.
  * Particularly useful when there is a large imbalance in the ratio of TRUE and FALSE in the original data.

* Accuracy
  * Accuracy shows the proportion of correct predictions among all predictions.
  * Values range from 0 to 1, with values closer to 1 meaning more cases can be correctly classified.
  * Can be misleading when there is a large imbalance in the ratio of TRUE and FALSE in the original data.

* Misclassification Rate
  * Misclassification rate (Error Rate) is the proportion of incorrect predictions among all predictions, calculated as 1-accuracy.
  * Values range from 0 to 1, with values closer to 0 meaning fewer misclassifications.
  * Like accuracy, interpretation requires caution when there is a large imbalance in the ratio of TRUE and FALSE in the original data.

* Precision
  * Precision shows "the proportion of cases that were actually TRUE among those predicted as TRUE."
  * Values range from 0 to 1, with values closer to 1 meaning higher "accuracy of things predicted as TRUE actually being TRUE."
  * An important metric when you want to minimize false positives (predicting TRUE when actually FALSE).

* Recall
  * Recall shows "the proportion of cases correctly predicted as TRUE among those that are actually TRUE."
  * Values range from 0 to 1, with values closer to 1 meaning higher "ability to not miss actual TRUE cases."
  * An important metric when you want to minimize false negatives (predicting FALSE when actually TRUE).

* P-value
  * P-value shows the probability that observed data is equally or more extreme than the null hypothesis (no relationship between predictor and target variables).
  * Generally, values less than 5% (0.05) are considered statistically significant.
  * Values range from 0 to 1, with smaller p-values indicating higher statistical significance.

* Number of Rows (TRUE)
  * Shows the number of rows where the target variable is TRUE.
  * If TRUE cases are extremely few, bias may occur in model learning and evaluation.

* Number of Rows (FALSE)
  * Shows the number of rows where the target variable is FALSE.
  * If FALSE cases are extremely few, bias may occur in model learning and evaluation.

* Number of Rows
  * Number of rows is the total number of data points (sample size) used in the analysis.
  * More data generally increases model reliability.
  * Generally, a sample size of at least 10 times the number of predictor variables is recommended.

* Log Likelihood
  * Log likelihood quantifies how well the model fits the data.
  * Usually takes negative values, with values closer to 0 indicating better model fit.
  * Difficult to interpret alone; used in calculating AIC and BIC for model comparison.

* AIC
  * AIC (Akaike Information Criterion) is a metric that evaluates the balance between model complexity and fit.
  * Smaller values indicate better models, helping to select optimal models while preventing overfitting.
  * Used when comparing different models on the same dataset; usually takes positive values.

* BIC
  * BIC (Bayesian Information Criterion) is a model selection criterion similar to AIC but with stricter correction for sample size.
  * It tends to select simpler models than AIC, with smaller values indicating better models.
  * Useful for analyses with large sample sizes or when the true model is considered relatively simple.

* Residual Deviance
  * Residual deviance measures the difference (residuals) between actual results and model predictions.
  * Smaller values indicate better model fit.
  * Large values compared to degrees of freedom suggest poor model fit.

* Residual Degrees of Freedom
  * Residual degrees of freedom is calculated as "number of data points - number of model parameters" and shows the remaining information content considering model complexity.
  * Always takes positive integer values, with larger values improving estimation accuracy.
  * Used together with residual deviance to evaluate model fit.

* Null Model Deviance
  * Null model deviance shows the deviance of a model without predictor variables (intercept only).
  * By comparing with the model deviance, you can evaluate the degree of model improvement from adding predictor variables.
  * The difference with model deviance is more important than the value itself.

* Null Model Degrees of Freedom
  * Null model degrees of freedom is the degrees of freedom for the null (intercept only) model, usually number of data points - 1.
  * By comparing with model degrees of freedom, you can confirm the degrees of freedom used by adding predictor variables.
  * Used as a reference value for model comparison.

* VIF (Maximum)
  * VIF (Variance Inflation Factor) is a metric indicating the degree of multicollinearity between predictor variables.
  * Generally, variables with VIF of 10 or higher are considered to have multicollinearity problems.
  * Values are 1 or greater, with values closer to 1 indicating less multicollinearity.

{end_show_hide}


<% if (!test_mode) { %>
## Predictions on Training Data

The following table shows the results of predictions made on the training data using the created prediction model.
<% } else { %>
## Predictions on Training and Test Data

The following table shows the results of predictions made on both training and test data using the created prediction model.
<% } %>

{start_lazy_show_hide}
### Prediction Results
{{data}}
{end_lazy_show_hide}

## Prediction Matrix (Confusion Matrix)

<% if (!test_mode) { %>
This model predicted TRUE or FALSE for each row of the <%= mode %> data. The following table summarizes how many of these predictions corresponded to TRUE or FALSE in the actual values as a contingency table. The numbers represent the percentage (%) of each combination in the total data.

<% } else { %>
This model predicted TRUE or FALSE for each row of the <%= mode %> data. The following table summarizes how many of these predictions corresponded to TRUE or FALSE in the actual values as a contingency table. The numbers represent the percentage (%) of each combination in the total data. Since we are currently in test mode, results for both training and test data are displayed.

<% } %>

{{confusion_matrix}}

## Distribution of Predicted Probabilities

This model predicted the probability of <%= target %> (values between 0 and 1) for each row of the <%= mode %> data. The following chart visualizes the distribution of these probability values, separated by groups where actual values are TRUE (blue) and FALSE (orange).

{{probability_distribution}}

<% if (test_mode) { %>
* Since we are currently in test mode, this shows the distribution of probabilities predicted for test data.
<% } %>
* The more the TRUE actual value group (blue line) is biased toward the right side (probabilities close to 1) and the FALSE actual value group (orange line) is biased toward the left side (probabilities close to 0), the higher the model's prediction accuracy.
* The vertical dotted line shows the probability threshold currently set for classifying TRUE and FALSE. The default is 50% (0.5), but this can be changed in [Settings](//analytics/settings).
* This distribution allows visual confirmation of the model's classification performance and adjustment of the optimal TRUE/FALSE threshold.


## ROC Curve

<% if (!test_mode) { %>
The following chart shows the ROC curve that evaluates the model's classification performance at various TRUE/FALSE thresholds. The Y-axis represents the true positive rate (sensitivity), and the X-axis represents the false positive rate (1-specificity). The blue line is the ROC curve for this model, and the diagonal gray dotted line represents random prediction (AUC: 0.5). ROC curves that bulge toward the upper left indicate higher prediction accuracy, while those closer to the diagonal indicate lower prediction accuracy.
<% } else { %>
The following chart shows the ROC curve that evaluates the model's classification performance at various TRUE/FALSE thresholds. The Y-axis represents the true positive rate (sensitivity), and the X-axis represents the false positive rate (1-specificity). The blue line is the ROC curve for this model on test data, and the orange line is for training data. The diagonal gray dotted line represents random prediction (AUC: 0.5). ROC curves that bulge toward the upper left indicate higher prediction accuracy, while those closer to the diagonal indicate lower prediction accuracy.
<% } %>

{{roc_curve}}

# Additional Information

## Next Steps

* Variable selection optimization: Excluding variables that are not statistically significant (p-values of <%= baseline_p_pct %>% or higher) to simplify the model can make model interpretation easier and reduce the risk of overfitting. For variable selection guidelines, please see [this note](https://exploratory.io/note/exploratory/SWF4cTx8).
<% if (!repeat_by) { %>
* Group-wise analysis: Creating separate models for each group may allow for more detailed understanding of the determinants of <%= target %> within each group. In this case, you can select the grouping variable in "Repeat By" and re-run the analysis.
<% } %>
* Consideration of non-linear relationships: Predictor variables that have non-linear relationships with <%= target %> can be modeled more accurately by transforming the data.
* Checking for outliers: Checking for outliers that may affect prediction accuracy and addressing them as necessary can improve model reliability. For methods to remove outliers, please see [this note](https://exploratory.io/note/exploratory/Eep7kip3).
<% if (!test_mode) { %>
* Model evaluation: To more rigorously evaluate the predictive performance of this model, you can validate it by dividing into training and test data. In this case, set "Test Mode" to TRUE in the "Validation" section under [Settings](//analytics/settings) and re-run.
<% } %>
* Prediction on new data: When you want to use the created model to make predictions on new data, add a "Predict with Model (Analytics View)" step to the target data frame. For details, please refer to [this note](https://exploratory.io/note/exploratory/AAI3Mle3).

`;

module.exports = template;
