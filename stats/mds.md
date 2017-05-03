# Multi Dimensional Scaling

## Introduction

Calculates coordinations by reducing dimensionality using SVD (Singular Value Decomposition).

## How to Access?

You can access from 'Add' (Plus) button.

![](images/mds_add.png)

## How to Use?

#### Column Selection

![](images/mds_dialog.png)

* Name1 Column - Set one of name columns to calculate coordinations for.
* Name2 Column - Set another column of names to calculate coordinations for.
* Value Column (Optional) - Set a column to use as a distance value. If you use do_dist in the previous step, this will be value.

### Parameters

* Number of Dimensions (Optional) - The default is "group".
  * "group" is to see how groups are projected to a new coordinations. This corresponds to u matrix of svd.
  * "dimension" is to see what direction the new coordinations face. This corresponds to v matrix of svd.
  * "variance" is to see how data is scattered in each of the new coordinations. This corresponds to d vector of svd. itself.
  * n_component (Optional) - The default is 3. Set number of dimensions to reduce to. This must be less than the number of subjects and the number of keys.
* Number of Dimensions (Optional) - The default is TRUE. Set if data should be centralized to the origin.
* Centralize Data - Whether data should be centralized or not.
* Output Format (Optional) - The default is "wide".
 * "wide" - The components will be in columns.
 * "long" - The component will be in row.

Take a look at the [reference document](https://stat.ethz.ch/R-manual/R-devel/library/base/html/svd.html) for the 'svd' function from base R for more details on the parameters.
