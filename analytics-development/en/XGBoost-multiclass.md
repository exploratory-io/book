const template =
`

An XGBoost model has been created to predict <%= target %> based on the selected predictor variables.


# Variable Relationships

<% if (predictorColumns.length > 1) { %>
## Predictor Variable Importance

The following chart shows which predictor variables are relatively more important for predicting <%= target %>.

{{variable_importance}}

For details on how variable importance works, please refer to [this note](https://exploratory.io/note/exploratory/dLm5rwn5).

<% } %>

## Predictor Variable Effects

The following chart shows how the probability for each class of <%= target %> changes when the value of each predictor variable changes.

{{variable_effect}}

Notes:

<% if (predictorColumns.length > 1) { %>

* Since this predicts the effect of each predictor variable alone while keeping other variables constant, there may be discrepancies between the actual observed average values and predicted values.
* For detailed calculation methods of predicted values, please refer to [this note](https://exploratory.io/note/exploratory/Sbd0LDU6).
* Predictor variables are arranged in order of importance as shown in the "Predictor Variable Importance" section above.

<% } %>

<% if (has_category_columns) { %>
* For categorical (Character type, Factor type) predictor variables with more than <%= predictor_n %> unique values, the top <%= predictor_n - 1 %> most frequent values are retained and the rest are categorized as "Others". This can be changed in [Settings](//analytics/settings/max_categories_for_factor).
<% } %>

# Model Metrics

## Model-Level Prediction Accuracy

<% if (!test_mode) { %>
Various metrics related to model prediction accuracy and significance are summarized in the table below.
<% } else { %>
Various metrics related to model prediction accuracy and significance are summarized in the table below. Since we are currently in test mode, metrics for prediction accuracy are displayed for both training data and test data.
<% } %>

{{summary}}

* The number of rows indicates the number of data rows used for model creation.
* Accuracy Rate, Misclassification Rate, F1 Score, Precision, and Recall are affected by the TRUE/FALSE threshold setting. The current threshold is set to <%= true_false_criteria %>, but this can be changed in [Settings](//analytics/settings/true_false_criteria).

**Metric Details**

* F Score (Micro Average)
  * F Score (Micro Average) is the F Score calculated by integrating all classes, showing overall classification performance.
  * Values range from 0 to 1, where closer to 1 means higher overall prediction accuracy.
  * It is heavily influenced by the number of samples in each class, with majority class performance being strongly reflected.

* F Score (Macro Average)
  * F Score (Macro Average) is the simple average of F Scores for each class, showing classification performance considering class balance.
  * Values range from 0 to 1, where closer to 1 means maintaining uniformly high prediction accuracy across all classes.
  * It is less affected by sample size bias and evaluates minority class performance equally.

* Accuracy Rate
  * Accuracy Rate shows the proportion of correct predictions among all predictions.
  * Values range from 0 to 1, where closer to 1 means being able to correctly classify more cases.
  * It can be misleading when there is a large imbalance in sample sizes between classes.

* Misclassification Rate
  * Misclassification Rate is the proportion of incorrect predictions among all predictions, calculated as 1-Accuracy Rate.
  * Values range from 0 to 1, where closer to 0 means fewer misclassifications.
  * Like Accuracy Rate, interpretation requires caution when there is a large imbalance in sample sizes between classes.

* Number of Rows
  * Number of Rows indicates the total number of data used in the analysis (sample size).
  * The larger the data size, the higher the model reliability, but computational cost also increases.
  * In multiclass classification, it's important to have sufficient sample sizes for each class.

## Class-Level Prediction Accuracy

The following table shows prediction accuracy for each class.

{{class_summary}}

* Accuracy Rate, Misclassification Rate, F1 Score, Precision, and Recall are affected by the TRUE/FALSE threshold setting. The current threshold is set to <%= true_false_criteria %>, but this can be changed in [Settings](//analytics/settings/true_false_criteria).

{start_show_hide}
### Metric Details

* F1 Score
  * F1 Score is the harmonic mean of precision and recall for each class, serving as a comprehensive indicator of classification performance for that class.
  * Values range from 0 to 1, where closer to 1 means higher prediction accuracy for that class.
  * It can appropriately evaluate performance for each class even when there is class imbalance.

* Accuracy Rate
  * Class-level accuracy rate shows the proportion of cases that were actually that class among those predicted as that class.
  * Values range from 0 to 1, where closer to 1 means more accurate predictions for that class.
  * Unlike overall accuracy rate, this represents prediction accuracy at the class level.

* Misclassification Rate
  * Class-level misclassification rate shows the proportion of cases that were actually different classes among those predicted as that class.
  * Values range from 0 to 1, where closer to 0 means fewer misclassifications for that class.
  * Calculated as 1-Accuracy Rate, representing prediction error rate at the class level.

* Precision
  * Precision shows "the proportion of cases that were actually that class among those predicted as that class".
  * Values range from 0 to 1, where closer to 1 means higher accuracy of "cases predicted as that class actually being that class".
  * This metric is emphasized when wanting to minimize false positives (predicting as that class when actually a different class).

* Recall
  * Recall shows "the proportion of cases correctly predicted as that class among those that are actually that class".
  * Values range from 0 to 1, where closer to 1 means higher ability to "not miss actual cases of that class".
  * This metric is emphasized when wanting to minimize false negatives (predicting as a different class when actually that class).

* Number of Rows
  * Shows the number of data rows for each class.
  * When there is a large imbalance in sample sizes between classes, it may affect model learning and evaluation.
  * If minority class performance is low, insufficient sample size may be the cause.
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
This table is a confusion matrix showing the correspondence between model prediction results and actual results. The values in each cell represent percentages of the total.

<% } else { %>
This table is a confusion matrix showing the correspondence between model prediction results and actual results. The values in each cell represent percentages of the total. Since we are currently in test mode, results are displayed for both training data and test data.
<% } %>

{start_lazy_show_hide}
### Chart
{{confusion_matrix}}
{end_lazy_show_hide}

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
* Model Evaluation: To more rigorously evaluate the prediction performance of this model, you can validate by splitting into training data and test data. In that case, set "Test Mode" to TRUE in the "Evaluation" section under [Settings](//analytics/settings/test_mode) and re-run.
<% } %>
* Prediction on New Data: When you want to make predictions on new data using the created model, add a "Predict with Model (Analytics View)" step to the data frame you want to make predictions on. For details, please refer to [this note](https://exploratory.io/note/exploratory/AAI3Mle3).

`;

module.exports = template; 