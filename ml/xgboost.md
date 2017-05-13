# XGBoost - Extreme Gradient Boosting

## Introduction

Create extreme gradient boosting model regression, binary classification and multiclass classification.

## How to Access?

There are two ways to access. One is to access from 'Add' (Plus) button.

![](images/xgb_add.png)

Another way is to access from a column header menu.

![](images/xgb_cols.png)

## How to Use?

### Column Selection

![](images/xgb_dialog.png)

There are two ways to set what you want to predict by what variables.

![](images/fml_col_selection.png)

If you are on "Select Columns" tab, you can set them by column selector.

![](images/fml_custom.png)

If you are on "Custom" tab, you can type a formula directly.

### Train Test Split

![](images/train_test_split.png)

You can split the data into training and test to evaluate the performance of the model. You can set

* Test Data Set Ratio - Ratio of test data in the whole data.
* Random Seed to Split Training/Test - You can change random seed to try other training and test data combination.

### Regression

#### Parameters

* Use Validation Data	(Optional) - You can set data randomly selected to use as validation data set to watch the performance of the model against data that is not used for learning process. It prevents overfitting.
* How to treat NA? (Optional) - "na.action" parameter of glm. function. The default is "na.pass". This changes the behaviour of NA data. Can be one of the following.
  * "na.pass"
  * "na.omit"
  * "na.fail"
* Use Sparse Matrix (Optional) - If TRUE, it uses sparse matrix internally. This is memory efficient when the data becomes sparse, which means it has a lot of zero values. You can set this implicitly but as default, sparse matrix is used when categorical values are used because the model matrix is often sparse in such case.
* Type of Output (Optional) - The default is "linear". What distribution the target variable follows. This can be
  * "linear"
  * "logistic"
  * "gamma"
  * "tweedie"
* Max Number of Iterations (Optional) - The default is 10. Max number of iterations for training.
* Booster Type (Optional) - The default is "gbtree". Distribution that the target variable follows. This can be
  * "gbtree"
  * "gblinear"
  * "dart"
* Weight Column (Optional) - The default is NULL. A column with weight for each data.
* Number of Early Stopping Rounds (Optional) - The default is NULL. The number of iterations to stop after the performance doesn't improve.
* Max Depth (Optional)
* Minimum Child Weight (Optional)
* Gamma (Optional)
* Subsample (Optional)
* Column Sample by Tree (Optional)
* Learning Rate (Optional)
* Evaluation Metrics (Optional)

#### How to Read Summary

![](images/xgb_regression_summary.png)

##### Summary of Fit

* Number of Iteration - Number of training iteration
* Root Mean Square Error - Root mean square error to training data.
* Mean Absolute Error - Mean absolute to training data.

##### Feature Importance

* Feature - Name of the feature.
* Importance - Improvement in accuracy for predicting the outcome by the feature.
* Coverage - The ratio of the data covered by the feature.
* Frequency - How many times each feature is used in all generated trees for training the model in a relative quantity scale.

### Binary Classification

#### Parameters

* Use Validation Data	(Optional) - You can set data randomly selected to use as validation data set to watch the performance of the model against data that is not used for learning process. It prevents overfitting.
* How to treat NA? (Optional) - "na.action" parameter of glm. function. The default is "na.pass". This changes the behaviour of NA data. Can be one of the following.
  * "na.pass"
  * "na.omit"
  * "na.fail"
* Use Sparse Matrix (Optional) - If TRUE, it uses sparse matrix internally. This is memory efficient when the data becomes sparse, which means it has a lot of zero values. You can set this implicitly but as default, sparse matrix is used when categorical values are used because the model matrix is often sparse in such case.
* Type of Output (Optional) - The default is "softprob". What distribution the target variable follows. This can be
  * "softprob"
  * "softmax"
* Max Number of Iterations (Optional) - The default is 10. Max number of iterations for training.
* Booster Type (Optional) - The default is "gbtree". Distribution that the target variable follows. This can be
  * "gbtree"
  * "gblinear"
  * "dart"
* Weight Column (Optional) - The default is NULL. A column with weight for each data.
* Number of Early Stopping Rounds (Optional) - The default is NULL. The number of iterations to stop after the performance doesn't improve.
* Max Depth (Optional)
* Minimum Child Weight (Optional)
* Gamma (Optional)
* Subsample (Optional)
* Column Sample by Tree (Optional)
* Learning Rate (Optional)
* Evaluation Metrics (Optional)

#### How to Read Summary

![](images/xgb_binary_summary.png)

##### Summary of Fit

* Number of Iteration - Number of training iteration
* AUC - Area under curve score to training data.
* Misclassification Rate - Ratio of wrong classification to training data.
* Negative Log Likelihood - Negative log likelihood score to training data.

##### Feature Importance

* Feature - Name of the feature.
* Importance - Improvement in accuracy for predicting the outcome by the feature.
* Coverage - The ratio of the data covered by the feature.
* Frequency - How many times each feature is used in all generated trees for training the model in a relative quantity scale.

### Multiclass Classification

#### Parameters

* Use Validation Data	(Optional) - You can set data randomly selected to use as validation data set to watch the performance of the model against data that is not used for learning process. It prevents overfitting.
* How to treat NA? (Optional) - "na.action" parameter of glm. function. The default is "na.pass". This changes the behaviour of NA data. Can be one of the following.
  * "na.pass"
  * "na.omit"
  * "na.fail"
* Use Sparse Matrix (Optional) - If TRUE, it uses sparse matrix internally. This is memory efficient when the data becomes sparse, which means it has a lot of zero values. You can set this implicitly but as default, sparse matrix is used when categorical values are used because the model matrix is often sparse in such case.
* Type of Output (Optional) - The default is "linear". What distribution the target variable follows. This can be
  * "linear"
  * "logistic"
  * "gamma"
  * "tweedie"
* Max Number of Iterations (Optional) - The default is 10. Max number of iterations for training.
* Booster Type (Optional) - The default is "gbtree". Distribution that the target variable follows. This can be
  * "gbtree"
  * "gblinear"
  * "dart"
* Weight Column (Optional) - The default is NULL. A column with weight for each data.
* Number of Early Stopping Rounds (Optional) - The default is NULL. The number of iterations to stop after the performance doesn't improve.
* Max Depth (Optional)
* Minimum Child Weight (Optional)
* Gamma (Optional)
* Subsample (Optional)
* Column Sample by Tree (Optional)
* Learning Rate (Optional)
* Evaluation Metrics (Optional)

### How to Read Summary

![](images/xgb_multi_summary.png)

##### Summary of Fit

* Number of Iteration - Number of training iteration.
* Misclassification Rate - Ratio of wrong classification to training data.
* Multiclass Logloss - Negative log likelihood score to training data.

##### Feature Importance

* Feature - Name of the feature.
* Importance - Improvement in accuracy for predicting the outcome by the feature.
* Coverage - The ratio of the data covered by the feature.
* Frequency - How many times each feature is used in all generated trees for training the model in a relative quantity scale.

## Step-by-step

Here's a step-by-step tutorial guide on how you can build, predict and evaluate logistic regression model.

* [Introduction to Extreme Gradient Boosting in Exploratory](https://blog.exploratory.io/introduction-to-extreme-gradient-boosting-in-exploratory-7bbec554ac7)
