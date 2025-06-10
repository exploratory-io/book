const template =
`

A Random Forest model to predict <%= target %> has been created based on the selected explanatory variables.

# Relationship between Variables

<% if (predictorColumns.length > 1) { %>
## Explanatory Variable Importance

The following chart shows which explanatory variables are relatively more important for predicting <%= target %>.

{{variable_importance}}

For more information about the mechanism of variable importance, please refer to [this note](https://exploratory.io/note/exploratory/dLm5rwn5).

<% } %>


## Explanatory Variable Influence

The following chart shows how the probability for each category of <%= target %> changes as the value of each explanatory variable changes.

{{variable_effect}}

Notes:

<% if (predictorColumns.length > 1) { %>

* Assuming other variables are constant, this predicts the effect of the single explanatory variable, so there may be a discrepancy between the actual average and the predicted value.
* For details on how predicted values are calculated, please refer to [this note](https://exploratory.io/note/exploratory/Sbd0LDU6).
* Explanatory variables are ordered by importance as shown in "Explanatory Variable Importance" above.

<% } %>

<% if (has_category_columns) { %>
* If a categorical variable (Character type, Factor type) has more than <%= predictor_n %> unique values, the top <%= predictor_n - 1 %> most frequent values are kept, and the rest are grouped as "Others". This can be changed in [Settings](//analytics/settings/max_categories_for_factor).
<% } %>

# Model Metrics

## Model-Level Prediction Accuracy

<% if (!test_mode) { %>
The following table summarizes various metrics regarding the prediction accuracy and significance of the model.
<% } else { %>
The following table summarizes various metrics regarding the prediction accuracy and significance of the model. Since it is currently in test mode, metrics for prediction accuracy are displayed for both training and test data.
<% } %>

{{summary}}

* Number of rows indicates the number of data rows used to create the model.
* Accuracy, error rate, F1 score, precision, and recall are affected by the TRUE/FALSE boundary value setting. The current boundary value is set to <%= true_false_criteria %>, which can be changed in [Settings](//analytics/settings/true_false_criteria).

**Metric Details**

* F-value (Micro Average)
  * F-value (Micro Average) is the F-value calculated by aggregating all classes and indicates overall classification performance.
  * Values range from 0 to 1, and a value closer to 1 means higher overall prediction accuracy.
  * It is easily affected by the number of samples per class, and the performance of the majority class is strongly reflected.

* F-value (Macro Average)
  * F-value (Macro Average) is the simple average of the F-values for each class and indicates classification performance considering the balance between classes.
  * Values range from 0 to 1, and a value closer to 1 means equally high prediction accuracy is maintained for all classes.
  * It is less affected by sample size imbalance and evaluates the performance of minority classes equally.

* Accuracy
  * Accuracy is the proportion of correct predictions out of all predictions.
  * Values range from 0 to 1, and a value closer to 1 means the model can correctly classify more cases.
  * It can be misleading if there is a large imbalance in the number of samples between classes.

* Error Rate
  * Error Rate is the proportion of incorrect predictions out of all predictions, calculated as 1 - Accuracy.
  * Values range from 0 to 1, and a value closer to 0 means fewer misclassifications.
  * Similar to accuracy, caution is required in interpretation if there is a large imbalance in sample size between classes.

* Number of Rows
  * Number of rows indicates the total number of data points (sample size) used in the analysis.
  * A larger number of data points increases the reliability of the model but also increases computation cost.
  * In multiclass classification, it is important to have sufficient sample size for each class.

## Prediction Accuracy per Group

The following table shows the prediction accuracy for each group.

{{class_summary}}

* Accuracy, error rate, F1 score, precision, and recall are affected by the TRUE/FALSE boundary value setting. The current boundary value is set to <%= true_false_criteria %>, which can be changed in [Settings](//analytics/settings/true_false_criteria).

{start_show_hide}
### Metric Details

* F1 Score
  * F1 Score is the harmonic mean of precision and recall for each class and is an overall indicator of classification performance for that class.
  * Values range from 0 to 1, and a value closer to 1 means higher prediction accuracy for that class.
  * It can appropriately evaluate the performance per class even in the presence of class imbalance.

* Accuracy
  * Accuracy per class indicates the proportion of instances predicted as that class that were actually that class.
  * Values range from 0 to 1, and a value closer to 1 means the prediction for that class is more accurate.
  * Unlike overall accuracy, it represents prediction accuracy at the class level.

* Error Rate
  * Error rate per class indicates the proportion of instances predicted as that class that were actually a different class.
  * Values range from 0 to 1, and a value closer to 0 means fewer misclassifications for that class.
  * It is calculated as 1 - Accuracy and represents the prediction error rate at the class level.

* Precision
  * Precision indicates the proportion of instances predicted as that class that were actually that class.
  * Values range from 0 to 1, and a value closer to 1 means higher accuracy in predicting that class.
  * This metric is important when you want to minimize false positives (predicting a class when it's actually a different class).

* Recall
  * Recall indicates the proportion of instances that are actually that class that were correctly predicted as that class.
  * Values range from 0 to 1, and a value closer to 1 means a higher ability to not miss actual cases of that class.
  * This metric is important when you want to minimize false negatives (predicting a different class when it's actually that class).

* Number of Rows
  * Indicates the number of data rows for each class.
  * A large imbalance in sample size between classes can affect model training and evaluation.
  * Low performance in minority classes may be due to insufficient sample size.
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

## Prediction Matrix

<% if (!test_mode) { %>
This table is a prediction matrix showing the correspondence between the model's prediction results and the actual results. The value in each cell represents the proportion (%) relative to the total.

<% } else { %>
This table is a prediction matrix showing the correspondence between the model's prediction results and the actual results. The value in each cell represents the proportion (%) relative to the total. Since it is currently in test mode, results for both training data and test data are displayed.
<% } %>

{start_lazy_show_hide}
### Chart
{{confusion_matrix}}
{end_lazy_show_hide}

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