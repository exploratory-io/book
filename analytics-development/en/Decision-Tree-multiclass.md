const template =
`

A decision tree model was created to predict <%= target %> based on the selected explanatory variables.

# Variable Relationships

<% if (predictorColumns.length > 1) { %>
## Variable Importance

The following chart shows which explanatory variables are relatively more important for predicting <%= target %>.

{{variable_importance}}

For more information about the mechanism of variable importance, please see [this note](https://exploratory.io/note/exploratory/dLm5rwn5).

<% } %>

## Variable Effects

The following chart shows how the probability for each classification of <%= target %> changes when the value of each explanatory variable changes.

{{variable_effect}}

Important Notes:

<% if (predictorColumns.length > 1) { %>

* Since we predict the effect of each explanatory variable individually while holding other variables constant, discrepancies arise between the mean of actual values and predicted values.
* For details on the prediction value calculation method, please refer to [this note](https://exploratory.io/note/exploratory/Sbd0LDU6).
* Explanatory variables are arranged in order of importance as shown in the "Variable Importance" section above.

<% } %>

<% if (has_category_columns) { %>
* For categorical (Character, Factor) explanatory variables with more than 12 unique values, the 11 most frequent values are retained and others are grouped as "Others". This can be changed from [Settings](//analytics/settings/max_categories_for_factor) in Analytics.
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
 - **Top row**: The most frequent value of <%= target %> in the data contained in each node
 - **Middle row**: The proportion of each value of <%= target %> in the data contained in each node
 - **Bottom row**: The proportion of data contained in each node relative to the total (%)

 The top row value of the bottom-most nodes and their corresponding middle row proportions become the predicted values when using the decision tree model.


# Model Metrics

## Model-Level Prediction Accuracy

<% if (test_mode) { %>
Various metrics related to model prediction accuracy are summarized in the following table. Since we are currently in test mode, metrics for both training data and test data are displayed for prediction accuracy.
<% } else { %>
Various metrics related to model prediction accuracy are summarized in the following table.
<% } %>

{{summary}}

* Row count indicates the number of rows of data used for model creation.
* Accuracy, misclassification rate, F1 score, precision, and recall are affected by the TRUE/FALSE boundary value setting. The current boundary value is set to <%= true_false_criteria %>, but this can be changed from [Settings](//analytics/settings/true_false_criteria) in Analytics.


**Metric Details**

* F-value (Micro Average)
  * F-value (micro average) is the F-value calculated by integrating all classes, showing overall classification performance.
  * Values range from 0 to 1, where closer to 1 means higher overall prediction accuracy.
  * Easily influenced by the number of samples per classification, strongly reflecting the performance of majority classes.

* F-value (Macro Average)
  * F-value (macro average) is a simple average of F-values for each classification, showing classification performance considering balance between classes.
  * Values range from 0 to 1, where closer to 1 means maintaining uniformly high prediction accuracy across all classes.
  * Less influenced by sample number bias and evaluates minority class performance equally.

* Accuracy
  * Accuracy by classification shows the proportion of those predicted as that class that were actually that class.
  * Values range from 0 to 1, where closer to 1 means more accurate prediction for that class.
  * Unlike overall accuracy, this represents prediction accuracy on a class-by-class basis.

* Misclassification Rate
  * Misclassification rate by classification shows the proportion of those predicted as that class that were actually different classes.
  * Values range from 0 to 1, where closer to 0 means fewer misclassifications for that class.
  * Calculated as 1-accuracy, representing prediction error rate on a class-by-class basis.


## Group-wise Prediction Accuracy

The following table shows prediction accuracy for each group.

{{class_summary}}

* Accuracy, misclassification rate, F1 score, precision, and recall are affected by the TRUE/FALSE boundary value setting. The current boundary value is set to <%= true_false_criteria %>, but this can be changed from [Settings](//analytics/settings/true_false_criteria) in Analytics.

{start_show_hide}
### Metric Details

* F1 Score
    * F1 score is the harmonic mean of precision and recall for each classification, representing a comprehensive metric of classification performance for that class.
    * Values range from 0 to 1, where closer to 1 means higher prediction accuracy for that class.
    * Can appropriately evaluate performance for each classification even when class imbalance exists.

* Accuracy
    * Accuracy by classification shows the proportion of those predicted as that class that were actually that class.
    * Values range from 0 to 1, where closer to 1 means more accurate prediction for that class.
    * Unlike overall accuracy, this represents prediction accuracy on a class-by-class basis.

* Misclassification Rate
    * Misclassification rate by classification shows the proportion of those predicted as that class that were actually different classes.
    * Values range from 0 to 1, where closer to 0 means fewer misclassifications for that class.
    * Calculated as 1-accuracy, representing prediction error rate on a class-by-class basis.

* Precision
    * Precision shows "the proportion of those predicted as that class that were actually that class".
    * Values range from 0 to 1, where closer to 1 means higher "accuracy of things predicted as that class actually being that class".
    * This metric is emphasized when wanting to minimize false positives (predicting that class when actually a different class).

* Recall
    * Recall shows "the proportion of those actually that class that were correctly predicted as that class".
    * Values range from 0 to 1, where closer to 1 means higher "ability to not miss actual cases of that class".
    * This metric is emphasized when wanting to minimize false negatives (predicting a different class when actually that class).

{end_show_hide}




## Prediction Matrix (Confusion Matrix)

<% if (!test_mode) { %>
The following table summarizes how many of the model's predictions for each row of <%= mode %> data were the same or different from the actual values as a correspondence table. The numbers represent the percentage (%) of each combination in the total data.
<% } else { %>
The following table summarizes how many of the model's predictions for each row of <%= mode %> data were the same or different from the actual values as a correspondence table. The numbers represent the percentage (%) of each combination in the total data. Since we are currently in test mode, results for both training data and test data are displayed.
<% } %>

{{confusion_matrix}}

## Prediction Results

The following table shows the results of predictions made on all data using the created predictive model.

{start_lazy_show_hide}
### Table
{{data}}
{end_lazy_show_hide}

# Supplementary Information

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