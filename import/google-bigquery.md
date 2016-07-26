# Google BigQuery Data Import

## 1. Before you start

To use Google BigQuery Data with Exploratory Desktop, you need to create a project on Google Cloud Platform and a dataset on Google BigQuery.

### Create a project for Google BigQuery

- Open [Google Cloud Platform Console](https://console.cloud.google.com/)

- Click "Create Project" menu at the right hand side top

![](images/create-google-bq-billing-project.png)

- Select a name and project ID, and click "Create"

![](images/create-google-bq-dialog.png)

- Make sure that you enable BigQuery API for you Project by clicking "API Manager" menu under Google Cloud Platform

![](images/google-bq-enable-api.png)

### Create a dataset on Google BigQuery

- Open [Google BigQuery Web ui](https://bigquery.cloud.google.com/)

- Click down arrow icon next to your project name

![](images/google-bq-create-dataset-menu.png)

- Enter dataset id and Click OK button

![](images/google-bq-create-dataset-dialog.png) 

## 2. Select Google BigQuery Data Menu

- Select 'Import Remote Data' from Add Data Frames dropdown

![](images/import-remote-data-menu.png)

- Click 'Google BigQuery'

![](images/google-big-query-menu.png)

## 3. Authentication with Google OAuth

Select an account you want to use for your Google BigQuery and click 'Allow' button to allow Exploratory to extract your Google BigQuery data based on the parameters you are going to set up in the next step.

![](images/google-big-query-oauth.png)

![](images/google-big-query-allow.png)

## 4. Write SQL Query

### 4.1 Preview Data

- Type Data Frame Name

- Select Google BigQuery Project from the dropdown menu

- Enter query to SQL Query editor

- Click Run button to preview data.

![](images/google-big-query-preview.png)

### 4.2 Save query result as a new table on Google BigQuery 

If your query is against huge table, it’s probably a good idea to create a a new table containing just the data you want to use for further analysis to minimize the cost. To do this, after getting preview data click Save As Table button.

![](images/google-big-query-saveas-dialog.png)

- Select Project from pulldown menu
- Select Dataset from pulldown menu
- Type new table name 
- Click Save button
 
Exploratory Desktop checks list of tables after you saved a table and once check is done, you can see newly created table on the tree

![](images/google-big-query-tree-refresh-after.png)

Once new table is created, you can query against the table.

![](images/google-big-query-after-saveas.png)


## 5. Import

Click 'Import' button

If the data in the preview table look ok, then click 'Import' button to import the data into Exploratory.
