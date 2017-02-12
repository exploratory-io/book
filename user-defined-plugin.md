# Add your Custom Data Sources with Plugin Framework

Exploratory provides a framework with which developers can create their own data sources that can be invoked from Exploratory's Data Import Dialog.

## Plugin Structure

A User defined plugin consists of JSON format plugin definition meta file (`plugin.json`) and R script file (`plugin.r`).
These two files need to be stored inside `~/.exploratory/plugins` directory as follows.

`~/.exploratory/plugins/<plugin_name>/plugin.json`

`~/.exploratory/plugins/<plugin_name>/scripts/plugin.r`
 

## Create Plugin directory

So let's say you want to create a plugin that uses `riem_measures` function from [riem](https://github.com/ropensci/riem) R package to get ASOS data via the Iowa Environment Mesonet. Then first you want to to create a directory called `riem_measures`. NOTE: The directory name is the plugin name and should be unique among user-defined plugins.

So on Mac, you can do:

`$ cd ~/.exploratory/plugins`

`$ mkdir riem_measures`

## Create Plugin Definition Meta File.

This is how your Plugin Definition Meta File (`plugin.json`) looks like. The file must be in valid JSON format.

```
{
"name": "riem_measures",
"displayName": "riem measures",
"iconURL" : "lib/images/plugin.png",
"helpURL" :  "http://ropensci.github.io/riem/",
"rPackageDependencies": ["riem"],
"function": "riem_measures",
"rSourceFile" : "plugin.r",
"inputParameters": [
     {
       "name": "station",
       "displayName":"Station",
       "colSpan" : 5,
       "dataType": "text",
       "defaultValue" : "",
       "required" : true
     },
     {
       "name": "date_start",
       "displayName":"Date Start",
       "colSpan" : 5,
       "dataType": "text",
       "defaultValue" : "",
       "required" : true
     },
     {
       "name": "date_end",
       "displayName":"Date End",
       "colSpan" : 5,
       "dataType": "text",
       "defaultValue" : "",
       "required" : true
     }
   ]
}
```

### Attributes

#### name

`name` attribute holds Name of the plugin. in this case `riem_measurs`, please make sure to use your directory name for this `name` attribute. 

#### displayName

`displayName` attribute is used for Display Name on Data Source Picker Dialog and Import Data Dialog.

#### iconURL

`iconURL` holds icon image file URL for your plugin. Other than default plugin icon (`lib/images/plugin.png`), currently it only supports external URL. If you use external URL, make sure to set
`iconWidh` and `iconHeight` to 32px to fit icon in the UI.

```
"iconWidth" : "32px",
"iconHeight" : "32px"
```

#### helpURL

`helpURL` holds URL for your plugin help page. Help Link is put on Import Dialog Header

#### rPackageDependencies

`rPackageDependencies` is an array of package names that the plugin depends.

#### function

`function` holds R function name that the plugin calls to get a data. The R function must return data frame as output. In this example, you'll call `riem_measures` from riem package.

#### rSourceFile

`rSourceFile` holds a name of R script file that the plugin depends. Let's use `plugin.r` for this example.

### inputParameters

`inputParameters` is an array of parameter passed to the `function` (i.e in this case, `riem_measures`) and these are renered as input fields on Data Import Dialog. Each parameter can have following Attributes

- name
- displayName
- colSpan
- dataType
- showLabel
- defaultValue
- required

#### name

`name` of the input parameter. 

#### displayName

`displayName` attribute is used for Display Name on Data Source Picker Dialog and Import Data Dialog.

#### colSpan

`colSpan` attribute holds width of the input parameter on UI. Please use 5 for now.

#### dataType

`dataType` attribute holds a type of the input parameter. Supported types are:

- text
- select
- number
- boolean

We do not support Date type parameter for now.

##### text

if you use `text`, it becomes input field that accepts characters.

##### select

This is useful when you want to create a static List of Values.
For example, if you want to create a time range List of Values, you can create it by specifying `options` and `itemDataType` like below.
if your option value is text, `itemDataType` should be set as `text`. If your option value is number, `itemDataType` should be number. 

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

If you want to make the parameter as mandatory parameter, set this `required` attribute as `true`.

## Create plugin R script file.

If your plugin simply passes input parameter values from UI to the R function defined in `function` attribute, you can stub the R script. (i.e. all you need is create a single line `library(riem)` file and save it as `plugin.r`)
However, if you plugin needs some pre-processing and/or post-processing along with some function call from a R package, then you need to write some R script in `plugin.r`.

```
library(riem)
```

## How to use

So once you created your custom plugin, you can test it by selecting `Import by User Defined Plugin`

![](import/images/import_by_user_defined_plugin.png)

And from User Defined Plugin Picker, select your plugin


![](import/images/user_defined_plugin_picker.png)

This will open a Data Import Dialog

![](import/images/data_import_diloag_with_user_defined_plugin.png)
