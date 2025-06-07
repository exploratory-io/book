const template = `

A Random Forest model to predict <%= target %> has been created based on the selected explanatory variables.

# Relationship between Variables

<% if (predictorColumns.length > 1) { %>
## Explanatory Variable Importance

The following chart shows which explanatory variables are relatively more important for predicting <%= target %>.

<% if (with_boruta) { %>
  {{variable_importance_boxplot}}
<% } else { %>
  {{variable_importance}}
<% } %>

For more information about the mechanism of variable importance, please refer to [this note](https://exploratory.io/note/exploratory/dLm5rwn5).

<% } %>

## Explanatory Variable Influence

<% if (predictorColumns.length > 1) { %>
The following chart shows how the probability for each explanatory variable changes how the value of <%= target %> changes.
<% } else { %>
The following chart shows how the probability of <%= target %> changes as the value of the explanatory variable changes.
<% } %>

{{variable_effect}}

* The blue line (or points) shows the predicted value for the explanatory variable value.
* The gray line shows the actual value and its 95% confidence interval.
* The vertical axis is the probability of <%= target %>.

Notes:

<% if (predictorColumns.length > 1) { %>

* Assuming other variables are constant, this predicts the effect of the single explanatory variable, so there may be a discrepancy between the actual average and the predicted value.
* For details on how predicted values are calculated, please refer to [this note](https://exploratory.io/note/exploratory/Sbd0LDU6).
* Explanatory variables are ordered by importance as shown in "Explanatory Variable Importance" above.

<% } %>

<% if (has_category_columns) { %>
* If a categorical variable (Character type, Factor type) has more than 12 unique values, the 11 most frequent values are kept, and the rest are grouped as "Others". This can be changed in [Settings](//analytics/settings/max_categories_for_factor).
<% } %>


# Model Metrics

<% if (!test_mode) { %>
The following table summarizes various metrics regarding the prediction accuracy and significance of the model.
<% } else { %>
The following table summarizes various metrics regarding the prediction accuracy and significance of the model. Since it is currently in test mode, metrics for prediction accuracy are displayed for both training and test data.
<% } %>

{{summary}}

## Prediction Accuracy

When the target variable is logical (TRUE/FALSE), AUC is a commonly used metric for evaluating model prediction accuracy.

* AUC
  * This is a commonly used metric for evaluating the prediction accuracy of models that predict logical target variables.
  * It measures how well the model can classify TRUE and FALSE data.
  * Values range from 0.5 to 1, where 0.5 means random prediction (equivalent to flipping a coin), and 1 means the model can perfectly classify TRUE and FALSE data.
  * Generally, AUC is interpreted as acceptable at 0.6 or higher, good at 0.8 or higher, and excellent classification performance at 0.9 or higher.
  * AUC stands for Area Under the Curve, which means the area under the ROC curve (the Curve).

Reference Information:

* For a detailed explanation of AUC, please refer to [this note](https://exploratory.io/note/exploratory/AUC-RZG7gbI6).
* Accuracy, error rate, F1 score, precision, and recall are affected by the TRUE/FALSE boundary value setting. The current boundary value is set to <%= true_false_criteria %>, which can be changed in [Settings](//analytics/settings/true_false_criteria).

{start_show_hide}
## Details of Model Metrics

* AUC
 * This is a commonly used metric for evaluating the prediction accuracy of models that predict logical target variables.
 * It measures how well the model can classify TRUE and FALSE data.
 * Values range from 0.5 to 1, where 0.5 means random prediction (equivalent to flipping a coin), and 1 means the model can perfectly classify TRUE and FALSE data.
 * Generally, AUC is interpreted as acceptable at 0.6 or higher, good at 0.8 or higher, and excellent classification performance at 0.9 or higher.
 * AUC stands for Area Under the Curve, which means the area under the ROC curve (the Curve).

* F1 Score
 * F1 Score is the harmonic mean of precision and recall and is an indicator of model prediction accuracy that considers the balance between both.
 * Values range from 0 to 1, and a value closer to 1 indicates an excellent model with a good balance of precision and recall.
 * It is particularly useful when there is a significant difference in the proportion of TRUE and FALSE in the original data.

* Accuracy
 * Accuracy is the proportion of correct predictions out of all predictions.
 * Values range from 0 to 1, and a value closer to 1 means the model can correctly classify more cases.
 * It can be misleading if there is a significant difference in the proportion of TRUE and FALSE in the original data or if there is imbalance.

* Error Rate
 * Error Rate is the proportion of incorrect predictions out of all predictions, calculated as 1 - Accuracy.
 * Values range from 0 to 1, and a value closer to 0 means fewer misclassifications.
 * Similar to accuracy, caution is required in interpretation if there is a significant difference in the proportion of TRUE and FALSE in the original data.

* Precision
 * Precision indicates the proportion of instances predicted as TRUE that were actually TRUE.
 * Values range from 0 to 1, and a value closer to 1 means higher accuracy in predicting TRUE.
 * This metric is important when you want to minimize false positives (predicting TRUE when it's actually FALSE).

* Recall
 * Recall indicates the proportion of instances that are actually TRUE that were correctly predicted as TRUE.
 * Values range from 0 to 1, and a value closer to 1 means a higher ability to not miss actual TRUE cases.
 * This metric is important when you want to minimize false negatives (predicting FALSE when it's actually TRUE).

* Number of Rows (TRUE)
 * Indicates the number of data rows where the target variable is TRUE.
 * If there are extremely few TRUE cases, it may lead to bias in model training and evaluation.

* Number of Rows (FALSE)
 * Indicates the number of data rows where the target variable is FALSE.
 * If there are extremely few FALSE cases, it may lead to bias in model training and evaluation.

* Number of Rows
 * Number of rows is the total number of data points (sample size) used in the analysis.
 * A larger number of data points increases the reliability of the model.
 * Generally, a sample size of at least 10 times the number of explanatory variables is recommended.

 {end_show_hide}


<% if (!test_mode) { %>
## Prediction on Training Data

The following table shows the results of predicting on the training data using the created prediction model.
<% } else { %>
## Prediction on Training and Test Data

The following table shows the results of predicting on the training and test data using the created prediction model.
<% } %>

{start_lazy_show_hide}
### Prediction Results
{{data}}
{end_lazy_show_hide}

## Prediction Matrix (Confusion Matrix)

<% if (!test_mode) { %>
This table summarizes the correspondence between the model's predictions of TRUE or FALSE for each row of the <%= mode %> data and whether the actual values were TRUE or FALSE. The numbers represent the proportion (%) of each combination relative to the total data.

<% } else { %>
This table summarizes the correspondence between the model's predictions of TRUE or FALSE for each row of the <%= mode %> data and whether the actual values were TRUE or FALSE. The numbers represent the proportion (%) of each combination relative to the total data. Since it is currently in test mode, results for both training data and test data are displayed.

<% } %>

{{confusion_matrix}}

## Distribution of Predicted Probabilities

This model predicted a probability (a value between 0 and 1) of <%= target %> for each row of the <%= mode %> data. The following chart visualizes the distribution of these probability values, separated by groups where the actual value was TRUE (blue) and FALSE (orange).

{{probability_distribution}}

<% if (test_mode) { %>
* Since it is currently in test mode, this is the distribution of probabilities predicted for the test data.
<% } %>
* The more the distribution for the actual TRUE group (blue line) is skewed to the right (closer to a probability of 1), and the more the distribution for the actual FALSE group (orange line) is skewed to the left (closer to a probability of 0), the higher the prediction accuracy of the model.
* The vertical dotted line indicates the currently set probability threshold for classifying as TRUE or FALSE. The default is 50% (0.5), but this can be changed in [Settings](//analytics/settings/true_false_criteria).
* This distribution allows for visual confirmation of the model's classification performance and adjustment of the optimal TRUE/FALSE threshold.

# Additional Information

## Next Steps

* Optimizing variable selection: Consider excluding explanatory variables with low variable importance to simplify the model. This will make the model easier to interpret and reduce the risk of overfitting. For guidelines on variable selection, please refer to [this note](https://exploratory.io/note/exploratory/SWF4cTx8).
<% if (!repeat_by) { %>
* Group-wise analysis: Creating separate models for each group may provide a more detailed understanding of the determinants of <%= target %> within each group. In that case, you can select the grouping variable in "Repeat By" and re-run the analysis.
<% } %>
* Checking for outliers: Checking for outliers that may affect prediction accuracy and addressing them as necessary may improve model reliability. For information on how to remove outliers, please refer to [this note](https://exploratory.io/note/exploratory/Eep7kip3).
<% if (!test_mode) { %>
* Model evaluation: To more rigorously evaluate the prediction performance of this model, you can validate it by splitting the data into training and test sets. In that case, set "Test Mode" under the "Validation" section in [Settings](//analytics/settings/test_mode) to TRUE and re-run.
<% } %>
* Prediction on new data: When you want to make predictions on new data using the created model, add the "Predict with Model (Analytics View)" step to the target data frame. For details, please refer to [this note](https://exploratory.io/note/exploratory/AAI3Mle3).

`;

module.exports = template; 