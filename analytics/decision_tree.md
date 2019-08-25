# Decision Tree Analytics View

Builds a decision tree to predict Target Variable column value from Predictor Variable(s) column values.

## Input Data
Input data should contain following columns.

  * Target Variable - Column that has values to be predicted by the decision tree. It can be of categorical (binary or multi-class) or nuneric value.
  * Predictor Variable(s) - Column(s) that has values on which the prediction by decision tree is based.

## Properties

  * Decision Tree
    * Min Size for Node before Split - Split is performed only if the sample size for the node is at least this size.
    * Min Size for Terminal Node - Split is not performed if it would make size of any of the resulting nodes smaller than this size.
    * Min Improvement Rate by Split - Split is not performed if it does not improve the fit of the tree by this ratio.
    * Max Levels for Tree Depth - Max depth of the resulting tree. Root node is counted as level 0.
  * Binary Classification
    * Cut Point for TRUE/FALSE - Cut point of predicted probability to be TRUE to decide whether a sample is classified as TRUE or FALSE.
  * Data Preprocessing
    * Sample Data Size - Number of rows to sample before building decision tree.
    * Random Seed - Seed used to generate random numbers. Specify this value to always reproduce the same result.
    * Max # of Categories for Target Variable - If categorical Target Variable column has more categories than this number, less frequent categories are combined into 'Other' category.
    * Max # of Categories for Predictor Vars - If categorical predictor column has more categories than this number, less frequent categories are combined into 'Other' category.
  * Imbalanced Data Adjustment
    * Adjust Imbalanced Data - Adjust imbalance of data in Target Variable (e.g. FALSE being majority and TRUE being minority.) by SMOTE (Synthetic Minority Over-sampling Technique) altorithm.
  * Evaluation
    * Test Mode - Enables/Disables Test Mode, where data is split into training data and test data for evaluation of the resulting Decision Tree model.
    * Ratio for Test Data - Ratio of test data to select from the entire data. Default is 0.3.
    * Data Splitting Method
      * Random - Test data is randomly sampled from the original data.
      * Reserve Order in Data - Data that shows up later in the original data is used as test data.

## How to Use This Feature
1. Click Analytics View tab.
2. If necessary, click "+" button on the left of existing Analytics tabs, to create a new Analytics.
3. Select "Decision Tree" for Type.
4. Select Target Variable column that you want to predict with the decision tree.
5. Select Predictor Variable(s) columns to be the basis of the prediction by the decison tree.
6. Click Run button to run the analytics.
7. Select view type by clicking view type link to see each type of generated visualization.

