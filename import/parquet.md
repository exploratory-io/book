# Import Parquet File Data

You can import both local and remote Parquet File Data quickly.

## 1. Select Parquet File Data Menu

Click '+' button next to 'Data Frames' and select 'Import File Data'.

![](images/import-file-data.png)

If you import CSV / Delimited File on your desktop or laptop, make sure Local tab is selected. If you import a file from remote server like Amazon S3, Dropbox, etc make sure Remote tab is selected. Click 'Text File (CSV, delimited)'

![](images/parquet-select.png)

## 2. Select File.
If you select local, file picker shows up so select a file to import.
### 2.1 Local File

![](images/parquet-file-select.png)

### 2.2 Remote File
if you select remote, small dialog shows up so enter a URL for the file.

![](images/remote-parquet-select.png)


## 3. Preview

Preview the Parquet file import.

![](images/import-parquet-dialog.png)

## 5. Column Selection

On top of input parameters, you can also use checkboxes on the preview table to include/exclude columns. if you uncheck the checkboxes on the columns, these columns are excluded when you save the data.

## 6. Import

If it looks ok, then you can click 'Import' to import the whole CSV / Delimited data into Exploratory.
