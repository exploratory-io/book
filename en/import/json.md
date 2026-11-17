# Import JSON Data

You can import both local and remote JSON File Data quickly.

## 1. Select JSON File Data Menu

Click '+' button next to 'Data Frames' and select 'Import File Data'.

![](images/import-file-data.png)

If you import JSON File on your desktop or laptop, make sure Local tab is selected. If you import a JSON file from remote server like Amazon S3, Dropbox, etc or accessing REST APIs that return JSON data, make sure Remote tab is selected. Click 'JSON File'

![](images/json-select.png)

## 2. Select File.
If you select local, file picker shows up so select a file to import.
### 2.1 Local File

![](images/local-file-picker-json.png)

### 2.2 Remote File
if you select remote, small dialog shows up so enter a URL for the file. Enter either json file URL or REST API endpoint URL that returns JSON as response.

![](images/import-remote-json-url.png)


## 3. JSON Tree

JSON Tree and Preview sections are same for both local and remote.

![](images/import-json-dialog.png)

Select node on JSON Tree.

On the left hand side, you an see JSON Tree and you can select red table icon for importing data.


You can configure the following properties for the JSON Tree.
* Max Tree Depth: How deep you want to show the tree structure. If your JSON tree structure is deep and you want to see the deeper levels, increase this. If you increase this, it may take time to load the tree.  
* Max List Size:  How many list items to show in the tree. If you want to see more list items in the list data type in your JSON tree, increase this. If you increase this, it may take time to load the tree.  


## 4. Column Selection

On top of input parameters, you can also use checkboxes on the preview table to include/exclude columns. if you uncheck the checkboxes on the columns, these columns are excluded when you save the data. 

## 5. Preview and Import

Select red table node on the tree (or Click Get Data button) to see the data in JSON File (or REST API). If it looks ok, then you can click 'Import' to import the JSON data into Exploratory.

## 5. More details about JSON

* [Analyzing JSON data by taking advantage of what makes it JSON in R](https://blog.exploratory.io/analyzing-json-data-by-taking-advantage-of-the-structure-in-r-1e0508e30117)
