const template = `

An XGBoost model has been created to predict <%= target %> based on the selected predictor variables.

# Variable Relationships

<% if (predictorColumns.length > 1) { %>
## Predictor Variable Importance

The following chart shows which predictor variables are relatively more important for predicting <%= target %>.

{{variable_importance}}

For details on how variable importance works, please refer to [this note](https://exploratory.io/note/exploratory/dLm5rwn5).

<% } %>

## Predictor Variable Effects

<% if (predictorColumns.length > 1) { %>
The following chart shows how the value of <%= target %> changes when the probability of each predictor variable changes.
<% } else { %>
The following chart shows how the probability of <%= target %> changes when the value of the predictor variable changes.
<% } %>

{{variable_effect}}

* The blue line (or points) shows predicted values for predictor variable values.
* The grey line shows actual observed values and their 95% confidence intervals.
* The vertical axis represents the probability of <%= target %>.

Notes:

<% if (predictorColumns.length > 1) { %>

* Since this predicts the effect of each predictor variable alone while keeping other variables constant, there may be discrepancies between the actual observed average values and predicted values.
* For detailed calculation methods of predicted values, please refer to [this note](https://exploratory.io/note/exploratory/Sbd0LDU6).
* Predictor variables are arranged in order of importance as shown in the "Predictor Variable Importance" section above.

<% } %>

<% if (has_category_columns) { %>
* For categorical (Character type, Factor type) predictor variables with more than 12 unique values, the 11 most frequent values are retained and the rest are categorized as "Others". This can be changed in [Settings](//analytics/settings).
<% } %>

# Model Metrics

<% if (!test_mode) { %>
Various metrics related to model prediction accuracy and significance are summarized in the table below.
<% } else { %>
Various metrics related to model prediction accuracy and significance are summarized in the table below. Since we are currently in test mode, metrics for prediction accuracy are displayed for both training data and test data.
<% } %>

{{summary}}

## Prediction Accuracy

For logical type (TRUE/FALSE) target variables, AUC is commonly used as a metric to evaluate model prediction accuracy.

* AUC
  * This is a commonly used metric for evaluating the prediction accuracy of models that predict logical type target variables.
  * It measures how well this model can classify TRUE and FALSE data.
  * Values range from 0.5 to 1, where 0.5 means random prediction (equivalent to coin toss), and 1 means perfect classification of TRUE and FALSE data.
  * Generally, 0.6 or higher is considered acceptable, 0.8 or higher is good, and 0.9 or higher is excellent classification performance.
  * AUC stands for Area Under the Curve, meaning the area under the ROC curve (the Curve).

Reference Information:

* For detailed explanation of AUC, please refer to [this note](https://exploratory.io/note/exploratory/AUC-RZG7gbI6).
* Accuracy Rate, Misclassification Rate, F1 Score, Precision, and Recall are affected by the TRUE/FALSE threshold setting. The current threshold is set to <%= true_false_criteria %>, but this can be changed in [Settings](//analytics/settings).


{start_show_hide}
## Detailed Model Metrics

* AUC
 * This is a commonly used metric for evaluating the prediction accuracy of models that predict logical type target variables.
 * It measures how well this model can classify TRUE and FALSE data.
 * Values range from 0.5 to 1, where 0.5 means random prediction (equivalent to coin toss), and 1 means perfect classification of TRUE and FALSE data.
 * Generally, 0.6 or higher is considered acceptable, 0.8 or higher is good, and 0.9 or higher is excellent classification performance.
 * AUC stands for Area Under the Curve, meaning the area under the ROC curve (the Curve).

* F1 Score
 * F1 Score is the harmonic mean of precision and recall, serving as a metric for model prediction accuracy that considers the balance of both.
 * Values range from 0 to 1, where closer to 1 indicates an excellent model with a good balance of precision and recall.
 * This is particularly useful when there is a large difference in the proportion of TRUE and FALSE in the original data.

* Accuracy Rate
 * Accuracy Rate shows the proportion of correct predictions among all predictions.
 * Values range from 0 to 1, where closer to 1 means being able to correctly classify more cases.
 * It can be misleading when there is a large difference in the proportion of TRUE and FALSE in the original data.

* Misclassification Rate
 * Misclassification Rate is the proportion of incorrect predictions among all predictions, calculated as 1-Accuracy Rate.
 * Values range from 0 to 1, where closer to 0 means fewer misclassifications.
 * Like Accuracy Rate, interpretation requires caution when there is a large difference in the proportion of TRUE and FALSE in the original data.

* Precision
 * Precision shows "the proportion of cases that were actually TRUE among those predicted as TRUE".
 * Values range from 0 to 1, where closer to 1 means higher accuracy of "cases predicted as TRUE actually being TRUE".
 * This metric is emphasized when wanting to minimize false positives (predicting TRUE when actually FALSE).

* Recall
 * Recall shows "the proportion of cases correctly predicted as TRUE among those that are actually TRUE".
 * Values range from 0 to 1, where closer to 1 means higher ability to "not miss actual TRUE cases".
 * This metric is emphasized when wanting to minimize false negatives (predicting FALSE when actually TRUE).

* Number of Rows (TRUE)
 * Shows the number of data rows where the target variable is TRUE.
 * If TRUE cases are extremely few, bias may occur in model learning and evaluation.

* Number of Rows (FALSE)
 * Shows the number of data rows where the target variable is FALSE.
 * If FALSE cases are extremely few, bias may occur in model learning and evaluation.

* Number of Rows
 * Number of Rows is the total number of data used in the analysis (sample size).
 * The larger the data size, the higher the model reliability.
 * Generally, a sample size of at least 10 times the number of predictor variables is recommended.

 {end_show_hide}


<% if (!test_mode) { %>
## Predictions on Training Data

The following table shows the results of predictions made on the training data using the created prediction model.
<% } else { %>
## Predictions on Training and Test Data

The following table shows the results of predictions made on both training data and test data using the created prediction model.
<% } %>

{start_lazy_show_hide}
### Prediction Results
{{data}}
{end_lazy_show_hide}

## Confusion Matrix

<% if (!test_mode) { %>
This model predicted TRUE or FALSE for each row of the <%= mode %> data. This table summarizes how many of these predictions corresponded to TRUE or FALSE in the actual observed values. The numbers represent the percentage of each combination relative to all data.

<% } else { %>
This model predicted TRUE or FALSE for each row of the <%= mode %> data. This table summarizes how many of these predictions corresponded to TRUE or FALSE in the actual observed values. The numbers represent the percentage of each combination relative to all data. Since we are currently in test mode, results are displayed for both training data and test data.

<% } %>

{{confusion_matrix}}

## Predicted Probability Distribution

This model predicted the probability of <%= target %> (values between 0 and 1) for each row of the <%= mode %> data. The following chart visualizes the distribution of these probability values, separated by groups where the actual values were TRUE (blue) and FALSE (orange).

{{probability_distribution}}

<% if (test_mode) { %>
* Since we are currently in test mode, this shows the distribution of probabilities predicted on test data.
<% } %>
* The better the model's prediction accuracy, the more the group with actual TRUE values (blue line) should be biased towards the right side (probabilities close to 1), and the group with actual FALSE values (orange line) should be biased towards the left side (probabilities close to 0).
* The vertical dotted line shows the currently set probability threshold for classifying TRUE and FALSE. The default is 50% (0.5), but this can be changed in [Settings](//analytics/settings).
* From this distribution, you can visually confirm the model's classification performance and adjust the optimal TRUE/FALSE threshold.

## ROC Curve

<% if (!test_mode) { %>
The following chart shows the ROC curve that evaluates the model's classification performance at various TRUE/FALSE thresholds. The Y-axis represents the true positive rate (sensitivity), and the X-axis represents the false positive rate (1-specificity). The blue line is the ROC curve for this model, and the diagonal grey dotted line represents random prediction (AUC: 0.5). The more the ROC curve bulges towards the upper left, the higher the prediction accuracy; the closer it is to the diagonal line, the lower the prediction accuracy.
<% } else { %>
The following chart shows the ROC curve that evaluates the model's classification performance at various TRUE/FALSE thresholds. The Y-axis represents the true positive rate (sensitivity), and the X-axis represents the false positive rate (1-specificity). The blue line is the ROC curve for this model on test data, and the orange line is for training data. The diagonal grey dotted line represents random prediction (AUC: 0.5). The more the ROC curve bulges towards the upper left, the higher the prediction accuracy; the closer it is to the diagonal line, the lower the prediction accuracy.
<% } %>

{{roc_curve}}

## Learning Iterations and Accuracy Improvement

The following chart shows the model learning process. The horizontal axis represents the number of learning iterations, and the vertical axis represents the Negative Log-Likelihood.
In XGBoost, the negative log-likelihood decreases as the number of learning iterations increases. Initially, the negative log-likelihood decreases rapidly, then tends to become more gradual.
When the learning curve starts to flatten, it may be approaching the optimal number of learning iterations. Conversely, if the negative log-likelihood continues to decrease, further increasing the number of learning iterations may improve performance.

{start_lazy_show_hide}
### Chart
{{learning_curve_logical}}
{end_lazy_show_hide}

# Additional Information

## Next Steps

* Variable Selection Optimization: Consider excluding predictor variables with low variable importance to simplify the model. This makes the model easier to interpret and reduces the risk of overfitting. For variable selection guidelines, please refer to [this note](https://exploratory.io/note/exploratory/SWF4cTx8).
<% if (!repeat_by) { %>
* Group-by Analysis: By creating separate models for each group, you may be able to understand the determining factors of <%= target %> within each group in more detail. In that case, you can select a grouping variable in "Repeat By" and re-run the analysis.
<% } %>
* Outlier Verification: Check for outliers that may affect prediction accuracy and address them as necessary to potentially improve model reliability. For methods to remove outliers, please refer to [this note](https://exploratory.io/note/exploratory/Eep7kip3).
* Parameter Tuning: You may be able to further improve model performance by adjusting XGBoost parameters (tree depth, learning rate, number of learning iterations, etc.).
<% if (!test_mode) { %>
* Model Evaluation: To more rigorously evaluate the prediction performance of this model, you can validate by splitting into training data and test data. In that case, set "Test Mode" to TRUE in the "Evaluation" section under [Settings](//analytics/settings) and re-run.
<% } %>
* Prediction on New Data: When you want to make predictions on new data using the created model, add a "Predict with Model (Analytics View)" step to the data frame you want to make predictions on. For details, please refer to [this note](https://exploratory.io/note/exploratory/AAI3Mle3).

`;

module.exports = template; 