const template = `

A decision tree model was created to predict <%= target %> based on the selected explanatory variables.

# Variable Relationships

<% if (predictorColumns.length > 1) { %>
## Variable Importance

The following chart shows which explanatory variables are relatively more important for predicting <%= target %>.

{{variable_importance}}

For more information about the mechanism of variable importance, please see [this note](https://exploratory.io/note/exploratory/dLm5rwn5).

<% } %>

## Variable Effects

<% if (predictorColumns.length > 1) { %>
The following chart shows how the values of <%= target %> change when the probability of each explanatory variable changes.
<% } else { %>
The following chart shows how the probability of <%= target %> changes when the value of the explanatory variable changes.
<% } %>

{{variable_effect}}

* The blue line (or points) shows predicted values for explanatory variable values.
* Gray lines show actual measured values and their 95% confidence intervals.
* The Y-axis represents the probability of <%= target %>.

Important Notes:

<% if (predictorColumns.length > 1) { %>

* Since we predict the effect of each explanatory variable individually while holding other variables constant, discrepancies arise between the mean of actual values and predicted values.
* For details on the prediction value calculation method, please refer to [this note](https://exploratory.io/note/exploratory/Sbd0LDU6).
* Explanatory variables are arranged in order of importance as shown in the "Variable Importance" section above.

<% } %>

<% if (has_category_columns) { %>
* For categorical (Character, Factor) explanatory variables with more than <%= predictor_n %> unique values, the top <%= predictor_n - 1 %> most frequent values are retained and the rest are grouped as "Others". This can be changed from [Settings](//analytics/settings/max_categories_for_factor) in Analytics.
<% } %>

# Decision Tree

The following visualizes the decision tree (a series of conditional branches) created based on the data. You can see the conditional branches created when predicting <%= target %>.

{{tree_structure}}

**How to Read the Decision Tree**

Each box is called a node, and the lines extending from them are called branches.

- **Conditional Branching**: Below each node, a condition (e.g., "Variable A < Value X") is displayed, and branching occurs left and right based on this condition.
 - Left branch is for when the condition is "yes (true)"
 - Right branch is for when the condition is "no (false)"
- **Information in Nodes**
 - **Top row**: The majority of TRUE or FALSE values in the data contained in each node
 - **Middle row**: The proportion of TRUE values in the data contained in each node
 - **Bottom row**: The proportion of data contained in each node relative to the total (%)

 The top row value of the bottom-most nodes and their corresponding middle row proportions become the predicted values when using the decision tree model.

# Model Metrics

<% if (!test_mode) { %>
Various metrics related to model prediction accuracy and significance are summarized in the following table.
<% } else { %>
Various metrics related to model prediction accuracy and significance are summarized in the following table. Since we are currently in test mode, metrics for both training data and test data are displayed for prediction accuracy.
<% } %>

{{summary}}

## Prediction Accuracy

For logical (TRUE/FALSE) target variables, AUC is commonly used as a metric to evaluate model prediction accuracy.

* AUC
  * This is a commonly used metric to evaluate the prediction accuracy of models predicting logical target variables.
  * It measures how well this model can classify TRUE and FALSE data.
  * Values range from 0.5 to 1, where 0.5 is random prediction (equivalent to coin tossing) and 1 means perfect classification of TRUE and FALSE data.
  * Generally, 0.6 or above is acceptable, 0.8 or above is good, and 0.9 or above indicates excellent classification performance.
  * AUC stands for Area Under the Curve, meaning the area under the ROC curve (the Curve).

Reference Information:

* For detailed explanation of AUC, please see [this note](https://exploratory.io/note/exploratory/AUC-RZG7gbI6).
* Accuracy, misclassification rate, F1 score, precision, and recall are affected by the TRUE/FALSE boundary value setting. The current boundary value is set to <%= true_false_criteria %>, but this can be changed from [Settings](//analytics/settings/true_false_criteria) in Analytics.


{start_show_hide}
## Details of Other Metrics

* AUC
 * This is a commonly used metric to evaluate the prediction accuracy of models predicting logical target variables.
 * It measures how well this model can classify TRUE and FALSE data.
 * Values range from 0.5 to 1, where 0.5 is random prediction (equivalent to coin tossing) and 1 means perfect classification of TRUE and FALSE data.
 * Generally, 0.6 or above is acceptable, 0.8 or above is good, and 0.9 or above indicates excellent classification performance.
 * AUC stands for Area Under the Curve, meaning the area under the ROC curve (the Curve).

* F1 Score
 * F1 score is the harmonic mean of precision and recall, representing a metric of model prediction accuracy that considers both balance.
 * Values range from 0 to 1, where closer to 1 indicates an excellent model with balanced appropriateness and reproducibility.
 * Particularly useful when there are large differences in the proportions of TRUE and FALSE in the original data.

* Accuracy
 * Accuracy shows the proportion of correct predictions out of all predictions.
 * Values range from 0 to 1, where closer to 1 means the ability to correctly classify more cases.
 * When there are large differences in the proportions of TRUE and FALSE in the original data, it can be misleading if there is imbalance.

* Misclassification Rate
 * Misclassification rate (Error Rate) is the proportion of incorrect predictions out of all predictions, calculated as 1-accuracy.
 * Values range from 0 to 1, where closer to 0 means fewer misclassifications.
 * Like accuracy, interpretation requires attention when there are large differences in the proportions of TRUE and FALSE in the original data.

* Precision
 * Precision shows "the proportion of those predicted as TRUE that were actually TRUE".
 * Values range from 0 to 1, where closer to 1 means higher "accuracy of things predicted as TRUE actually being TRUE".
 * This metric is emphasized when wanting to minimize false positives (predicting TRUE when actually FALSE).

* Recall
 * Recall shows "the proportion of those actually TRUE that were correctly predicted as TRUE".
 * Values range from 0 to 1, where closer to 1 means higher "ability to not miss actual TRUE cases".
 * This metric is emphasized when wanting to minimize false negatives (predicting FALSE when actually TRUE).

* Row Count (TRUE)
 * Shows the number of rows of data where the target variable is TRUE.
 * If TRUE is extremely few, bias may occur in model learning and evaluation.

* Row Count (FALSE)
 * Shows the number of rows of data where the target variable is FALSE.
 * If FALSE is extremely few, bias may occur in model learning and evaluation.

* Row Count
 * Row count is the total number of data (sample size) used in the analysis.
 * The more data, the higher the reliability of the model.
 * Generally, a sample size of 10 times or more than the number of explanatory variables is recommended.

 {end_show_hide}

## Prediction Matrix (Confusion Matrix)

<% if (!test_mode) { %>
The following table summarizes how many of the model's predictions for each row of <%= mode %> data were the same or different from the actual values as a correspondence table. The numbers represent the percentage (%) of each combination in the total data.

<% } else { %>
The following table summarizes how many of the model's predictions for each row of <%= mode %> data were the same or different from the actual values as a correspondence table. The numbers represent the percentage (%) of each combination in the total data. Since we are currently in test mode, results for both training data and test data are displayed.

<% } %>

{{confusion_matrix}}

## Distribution of Prediction Probabilities

This model predicted the probability of <%= target %> (values between 0 and 1) for each row of <%= mode %> data. The following chart visualizes the distribution of these probability values separated by groups where actual values are TRUE (blue) and FALSE (orange).

{{probability_distribution}}

<% if (test_mode) { %>
* Since we are currently in test mode, this shows the distribution of probabilities predicted for test data.
<% } %>
* The more the group with actual TRUE values (blue line) is biased toward the right side (probabilities close to 1) and the group with actual FALSE values (orange line) is biased toward the left side (probabilities close to 0), the higher the model's prediction accuracy.
* The vertical dotted line shows the currently set probability boundary value for classifying TRUE and FALSE. The default is 50% (0.5), but this can be changed from [Settings](//analytics/settings/true_false_criteria) in Analytics.
* From this distribution, you can visually confirm the model's classification performance and adjustments to the optimal TRUE/FALSE boundary value.

## ROC Curve

<% if (!test_mode) { %>
The following chart shows the ROC curve that evaluates the model's classification performance at various TRUE/FALSE boundary values. The Y-axis represents true positive rate (sensitivity), and the X-axis represents false positive rate (1-specificity). The blue line is the ROC curve for the current model, and the diagonal gray dotted line represents random prediction (AUC: 0.5). ROC curves that bulge toward the upper left indicate higher prediction accuracy, while those closer to the diagonal indicate lower prediction accuracy.
<% } else { %>
The following chart shows the ROC curve that evaluates the model's classification performance at various TRUE/FALSE boundary values. The Y-axis represents true positive rate (sensitivity), and the X-axis represents false positive rate (1-specificity). The blue line is the ROC curve for the current model on test data, and the orange line is for training data. The diagonal gray dotted line represents random prediction (AUC: 0.5). ROC curves that bulge toward the upper left indicate higher prediction accuracy, while those closer to the diagonal indicate lower prediction accuracy.
<% } %>

{{roc_curve}}

## Prediction Results

The following table shows the results of predictions made on all data using the created predictive model.

{start_lazy_show_hide}
### Table
{{data}}
{end_lazy_show_hide}

# Appendix

## Next Steps

* Variable Selection Optimization: Consider excluding explanatory variables with low variable importance to simplify the model. This makes the model easier to interpret and reduces the risk of overfitting. For variable selection guidelines, please see [this note](https://exploratory.io/note/exploratory/SWF4cTx8).
* Outlier Verification: By checking for outliers that may affect prediction accuracy and addressing them as necessary, the reliability of the model may improve. For methods to remove outliers, please see [this note](https://exploratory.io/note/exploratory/Eep7kip3).
* Consideration of Ensemble Learning Methods: To capture patterns that cannot be captured by a single decision tree, it may be effective to consider ensemble learning methods such as Random Forest or XGBoost.
<% if (!test_mode) { %>
* Model Evaluation: To more rigorously evaluate the predictive performance of this model, you can validate it by splitting into training data and test data. In that case, set "Test Mode" to TRUE in the "Validation" section under [Settings](//analytics/settings/test_mode) and re-run the analysis.
<% } %>
* Prediction on New Data: When you want to use the created model to make predictions on new data, add a "Predict with Model (Analytics View)" step to the target data frame you want to predict. For details, please refer to [this note](https://exploratory.io/note/exploratory/AAI3Mle3).

`;
module.exports = template; 