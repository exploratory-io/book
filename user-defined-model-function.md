# Use Custom Model Function

Exploratory provides a framework with which users can use model functions. This is an introduction of how to use it.

## Custom Model Function Overview

build_model function defined in [exploratory R package](https://github.com/exploratory-io/exploratory_func) and functions in [broom package](https://github.com/tidyverse/broom) make it easy to use model functions in Exploratory.
Steps to use model functions are explained below using **svm** function from [e1071](https://github.com/cran/e1071) packages as an example.

## Install R Package

There are tons of R packages with model functions, so the package you need might not be installed yet. Packages already installed can be checked from project list view.

![](import/images/installed_packages.png)

You can install R package from install tab. In this case, it's e1071.

![](import/images/install_package.png)

## Define Functions to Show Model Summary

Exploratory shows summary of model in table format when it's created. Let's define a function to convert the model to data frame.

**tidy** and **glance** function provided from [broom package](https://github.com/tidyverse/broom) is a function to define how to represent models as data frames. Those functions are already defined for some types of model but not all. Supported models are listed in the [broom github page](https://github.com/tidyverse/broom). svm is not included either, so let's define functions for it.

You can define those functions in **Scripts**

![](import/images/define_tidiers.png)

In svm case, you can define the functions like below.

``` r
glance.svm <- function(x, ...){
  data.frame(
    total_number_of_support_vector = x$tot.nSV,
    degree = x$degree,
    gamma = x$gamma,
    epsilon = x$epsilon,
    rho = x$rho
  )
}

tidy.svm <- function(x, ...){
  as.data.frame(x$SV)
}
```

Please note that **x** is the model object and these functions are expected to return a **data frame**. Usually, glance returns one row data frame with statistical values and tidy returns data frame with multi rows but it's just conventional rule, so you can ignore it if you want.

## Apply Model Function to a Data Frame

You can now call model function from command line mode. Please open the data frame you want to apply the model function. Here, svm is applied to this data.
- [Bank Account Data](https://exploratory.io/data/yosuke/7797836164735084)

You can run command below to this data now.

```
build_model(model_func=e1071::svm, formula = subscribed ~ age + housing + duration, kernel = "linear", test_rate = 0.2, seed = 1)
```

You can see model summary view like this. "Summary of Fit" is the result from **glance** function and "Parameter Estimates" is the result from **tidy** function.

![](import/images/model_result.png)

Here, test_rate and seed are arguments for build_model. __test_rate = 0.2__ means 20% of the data will be used for test and 80% of the data is used for training. __seed = 1__ means 1 is a random seed to split training data and test data by sampling. __formula = subscribed ~ age + housing + duration__ and __kernel = "linear"__ is a parameter for e1071::svm. You will see summary of the created model like this.

### Use the Model for Prediction

You can also use the model for prediction. By defining **augment** function for the models, which is also from [broom package](https://github.com/tidyverse/broom). You can define it like this for svm for example.

``` r
augment.svm <- function(x, data = NULL, newdata = NULL, ...) {
    if(is.null(newdata)){
        if(is.null(data)){
            stop("data or newdata is needed")
        }
        data$predicted_value <- x$fitted   
        data
    } else {
        predicted <- predict(x, newdata)
        newdata$predicted_value <- predicted
        newdata
    }
}
```

**x** is the model, **data** is training data frame and **newdata** is data frame to be used for prediction. This is how to put predicted result of each row to data frame. If you add this to custom script, you can now use prediction from UI.

![](import/images/prediction_ui.png)

The result is like this.

![](import/images/prediction_result.png)
