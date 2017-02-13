# Add your Custom Data Sources with Plugin Framework

Exploratory provides a framework with which developers can create their own data sources that can be invoked from Exploratory's Data Import Dialog.

## Plugin Structure

A user-defined plugin consists of JSON format plugin definition meta file (`plugin.json`) and R script file (`plugin.r`).
These two files need to be stored inside `~/.exploratory/plugins` directory as follows.

`~/.exploratory/plugins/<plugin_name>/plugin.json`

`~/.exploratory/plugins/<plugin_name>/scripts/plugin.r`
 

## Create Plugin directory

So let's say you want to create a plugin that uses `riem_measures` function from [riem](https://github.com/ropensci/riem) R package to get ASOS data via the Iowa Environment Mesonet. Then first you want to to create a directory called `my_riem_measures`. NOTE: The directory name is the plugin name and should be unique among user-defined plugins.

So on Mac, you can do:

`$ cd ~/.exploratory/plugins`

`$ mkdir my_riem_measures`

## Create Plugin Definition Meta File.

This is how your Plugin Definition Meta File (`plugin.json`) looks like. The file must be in valid JSON format.

```
{
  "name": "my_riem_measures",
  "displayName": "riem measures",
  "iconURL" : "lib/images/plugin.png",
  "helpURL" :  "http://ropensci.github.io/riem/",
  "rPackageDependencies": ["riem"],
  "function": "riem_measures",
  "rSourceFile" : "plugin.r",
  "hasQueryField" : false,
  "inputParameters": [
    {
      "name": "station",
      "displayName":"Station",
      "dataType": "text",
      "defaultValue" : "",
      "required" : true
    },
    {
      "name": "date_start",
      "displayName":"Date Start",
      "dataType": "text",
      "defaultValue" : "",
      "required" : true
    },
    {
      "name": "date_end",
      "displayName":"Date End",
      "dataType": "text",
      "defaultValue" : "",
      "required" : true
    }
  ]
}
```

### Attributes

#### name (required)

`name` attribute holds Name of the plugin. in this case `my_riem_measures`, please make sure to use your directory name for this `name` attribute. 

#### displayName (required)

`displayName` attribute is used for Display Name on Data Source Picker Dialog and Import Data Dialog.

#### iconURL (required)

`iconURL` holds icon image file URL for your plugin. currently it only supports external URL.

For example:
 
```
   "iconURL" : "http://xmllondon.com/images/sparqlThumb.png",
```

If you do not have an icon default lego like block icon is used instead.

If you use external URL, `iconWidth` and `iconHeight` are set to 32px by default to fit icon in the UI. If you want to change it for some reason, you can change these by specifying following attributes.

```
"iconWidth" : "64px",
"iconHeight" : "32px"
```

#### helpURL (required)

`helpURL` holds URL for your plugin help page. Help Link is put on Import Dialog Header.
If you do not have one, you can set default exploratory doc link like below:

```
"helpURL" :  "http://docs.exploratory.io/",
```

#### rPackageDependencies (optional)

`rPackageDependencies` is an array of package names that the plugin depends. For example, if you plugin depends on `riem` you need to set it like below: 

```
"rPackageDependencies": ["riem"],
```

#### function (required)

`function` holds R function name that the plugin calls to get data. The R function must return data frame as output. In this example, you'll call `riem_measures` from riem package.

#### rSourceFile (required)

`rSourceFile` holds the name of R script file that the plugin depends. Let's use `plugin.r` for this example.

#### hasQueryField (optional)

If you want to have a dedicated query input field that has much space for your query string, Set `hasQueryField` as `true` and add a parameter whose `name` is `query` and `dataType` is text.

For example, if you define following in your `plugin.json`

``` 
"hasQueryField" : true,
"inputParameters": [
  {
    "name" : "query",
    "displayName":"Query",
    "dataType":"text",
    "defaultValue" : "",
    "required" : true
  },
```
then you can have dedicated query input field on right hand side of the import Dialog.

![](import/images/plugin_with_query_field.png)

### inputParameters

`inputParameters` is an array of parameters passed to the `function` (i.e in this case, `riem_measures`) and these are rendered as input fields on Data Import Dialog. Parameters order matters so make sure to set input parameters in a way that underly R function expects. For example, if your R function has arguments station, start_date, and end_date then you need to define your inputParameters in this order.(i.e station, start_date, and end_date). If you want to define parameter order in a different way, you need to write wrapper function in library.r file and then do a parameter mapping there like below and set the wrapper function name (`riem_measures_wrapper`) to `function` attribute.

```
riem_measures_wrapper <- function(start_date, end_date, station){
  riem_measures(station = station, start_date = start_date, end_date = end_date)  
}
```

 Each parameter can have following Attributes

- name
- displayName
- colSpan
- dataType
- showLabel
- defaultValue
- required

#### name (required)

`name` of the input parameter. 

#### displayName (required)

`displayName` attribute is used for Parameter Display Name on Import Data Dialog.


#### dataType (required)

`dataType` attribute holds a type of the input parameter. Supported types are:

- text
- select
- number
- boolean

We do not support Date type parameter for now.

##### text

If you use `text`, it becomes input field that accepts characters.

##### select

This is useful when you want to create a static List of Values.
For example, if you want to create a time range List of Values, you can create it by specifying `options` and `itemDataType` like below. `options` is an array of selector options and each option needs to have `label` and `value` attributes.If your option value is text, `itemDataType` should be set as `text`. If your option value is number, `itemDataType` should be number. Date is not supported for `itemDataType` for now.

```
{
  "name": "time_range",
  "displayName": "Time Range",
  "dataType": "select",
  "itemDataType" : "text",
  "options": [
    {"label":"Last 5 Years", "value":"5y"},
    {"label":"Last 1 Hour", "value":"1h"},
    {"label":"Last 4 Hours", "value":"4h"},
    {"label":"Last 1 Day", "value":"1d"},
    {"label":"Last 7 Day", "value":"7d"},
    {"label":"Last 30 Days", "value":"30d"},
    {"label":"Last 90 Days", "value":"90d"},
    {"label":"Last 12 Months", "value":"1y"},
    {"label":"From 2004", "value":"all"}
  ],
  "defaultValue" : "5y"
}
```  
##### number

If you use `number`, it becomes input field that accepts numeric value.

##### boolean

If you use `boolean`, you can define a list of values with two values (i.e. true/false)

#### defaultValue

If the parameter needs default value, you can set it through `defaultValue` attribute.

#### required

If you want to make a parameter as mandatory parameter, set the `required` attribute as `true`. By setting this to `true`, you can force users to enter values for these parameters and if a user clicks `Get Data` button without filling these parameters, he/she gets following error on Import Dialog.

![](import/images/plugin_input_field_validation.png)

## Create plugin R script file.

If your plugin simply passes input parameter values from UI to the R function defined in `function` attribute, you don't need to define a new function in the R script. (i.e. all you need is create a single line `library(riem)` file and save it as `plugin.r`)
However, if you plugin needs some pre-processing and/or post-processing along with some function call from a R package, then you need to write some R script in `plugin.r`.

```
library(riem)
```

## How to use

So once you created your custom plugin, you can test it by selecting `Import by User Defined Plugin` after clicking `+ (plus)` icon next to `Data Frames`.

![](import/images/import_by_user_defined_plugin.png)

And from User Defined Plugin Picker, select your plugin


![](import/images/user_defined_plugin_picker.png)

This will open a Data Import Dialog. And your input parameters should be displayed on left-hand side of the Import Dialog.

![](import/images/data_import_diloag_with_user_defined_plugin.png)
