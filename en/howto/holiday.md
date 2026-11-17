# How to Set Holidays Data for Time Series Forecast

In this page, I will introduce how to set holidays data for time series forecasting.

## Import Holiday Data

We provide a data extension to get bank holidays, so let's import data from it.

It can be used from this "Import Extension Data" dropdown menu.

![](images/extension_data.png)

If you haven't installed the extension yet, please add it from "Add New" button. Then, the plugin is added to "Installed" and you can import data from "Import Data".

![](images/holiday_extension.png)

You can choose holiday type, start year and end year.

![](images/holiday_dialog.png)

If you import the data, it will be like this.

![](images/holiday_data.png)

## Set Up Data Format

do_prophet, which is the function for time series forecast, expect the name of the date column to be "ds", so let's rename it.

![](images/holiday_rename.png)

And it also need "holiday" column, so let's create it.

![](images/holiday_column.png)

If you'd like to to have the effect of holiday before or after the holiday too, you can also add "lower_window" column and "upper_window" column.
For example, if you want the holiday effect to take effect from 1 day before the holiday to 1 day after the holiday, you can set -1 to the "lower_window" column, and 1 to the "upper_window" column.
For more detail on the content of the data frame for holidays, refer to [the official document of Prophet](https://facebook.github.io/prophet/docs/seasonality,_holiday_effects,_and_regressors.html).

## Use it from Time Series Forecast

Then, you can choose this data frame from Time Series Forecast dialog and the dates in the data frame are recognized as holidays.

![](images/holiday_command.png)
