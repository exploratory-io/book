---
title: "All commands"
---

The commands you will use most, grouped by purpose. For the full list, including the rest, see [Full list](#more) later on this page.

<a id="cmd-check"></a>

## Check

| Command | Purpose |
| --- | --- |
| expl status | The Desktop version and the signed-in user (with `--json` it also shows permissions and tools) |
| expl tools list | All available commands (read-only or not, and risk) |
| expl tools describe \<command\> | Arguments, types, required or not, allowed values (put a two-word command in quotes, for example `expl tools describe "dashboard get"`; a tool name such as get_data_frame also works) |

Exit code 0 from expl tools list does not mean that Desktop is connected. When Desktop is not running, it shows the list it saved last time, or an empty list when none is saved. To check the connection, run expl status.

<a id="cmd-project"></a>

## Projects

| Command | Purpose |
| --- | --- |
| expl project list | List projects |
| expl project use \<id\|name\> | Choose the project later commands work on |
| expl project open \<id\> | Open a project |

<a id="cmd-data"></a>

## Data

| Command | Purpose |
| --- | --- |
| expl dataframe list | List data frames |
| expl dataframe get-schema \<id\> | Column names and types (it also returns the wrangling steps and more) |
| expl dataframe preview | See rows |

<a id="cmd-chart"></a>

## Charts

| Command | Purpose |
| --- | --- |
| expl chart list \<dataframe_id\> | List charts (a data frame id is required) |
| expl chart get-result \<id\> | The numbers of a chart |
| `expl chart get-image <id> --output <file>` | Save the image of a chart |

<a id="cmd-note"></a>

## Notes

| Command | Purpose |
| --- | --- |
| expl note list | List notes |
| expl note get \<id\> | The content of a note |

<a id="cmd-dashboard"></a>

## Dashboards

| Command | Purpose |
| --- | --- |
| expl dashboard list | List dashboards |
| expl dashboard get \<id\> | The definition of a dashboard |
| `expl dashboard create --input <file>` | Create a dashboard |
| expl dashboard publish \<id\> | Publish it (a confirmation appears before it runs) |

<a id="cmd-other"></a>

## Other

| Command | Purpose |
| --- | --- |
| `expl execution get <execution_id> --operation-id <operation_id>` | Check the state of an operation you did not wait for, with the two ids that `--no-wait` printed |
| expl call \<tool_name\> | Call an operation by its tool name |
| expl lang \[en\|ja\] | Show or switch the display language of Desktop (switching also changes the language of Desktop itself; run expl status first to check the connection; it exits with code 2 when it cannot decide the target project; for example `expl lang --project <id>`) |
| expl skill | Print a description for AI agents |
| expl completion \[bash\|zsh\|powershell\] | Print a shell completion script (see [Global flags](/en/cli/desktop/global-flags#completion)) |

<a id="more"></a>

## Full list

Commands are added or removed depending on the Desktop version. To see the exact list on your machine, run expl tools list; for the arguments of a command, run `expl <command> --help`.

### Projects

| Command | What it does | Available |
| --- | --- | --- |
| expl project ask | Asks which project to use before a write. | Always |
| expl environment get | Shows the connected Desktop: app version, Agent API version, OS, signed-in user and open projects. | Always |
| expl artifact get-lineage | Shows which data sources a chart, analytics, note or data frame is built on. | Always |
| expl project get | Reads one project's name, description, last update time and whether it is open. | Always |
| expl project get-history | Reads and searches the project's change history. | Always |
| expl artifact list-created | Lists the charts, analytics, steps and branches the AI created or changed in this conversation. | Always |
| expl project list | Lists the projects in this installation, newest first. | Always |
| expl project locate-published-source | Traces published data back to where it came from. | Always |
| expl project open | Opens a local project in its window, or focuses the existing window. | Always |
| expl artifact search | Searches the open project for items by name, comment or content. | Always |
| expl project search | Searches all local projects for data frames, charts, analytics, notes and more. | Always |
| expl project search-server | Lists published projects on the signed-in Exploratory server. | Always |
| expl project close | Closes the project's window after saving. | When Allow create, edit and delete is on |
| expl project import | Downloads a published project and imports it as a new local project. | When Allow create, edit and delete is on |
| expl project restore-history | Restores the whole project to a point in its change history. | When Allow create, edit and delete is on |
| expl project save | Creates a new project, or imports a project file. | When Allow create, edit and delete is on |

### Data frames

| Command | What it does | Available |
| --- | --- | --- |
| expl dataframe get-schema | Reads a data frame's steps, column names, types and row count. | Always |
| expl dataframe step-diagram | Returns the Step Diagram of a data frame. | Always |
| expl dataframe get-summary-view | Returns the Summary table of a data frame. | Always |
| expl dataframe list | Lists the data frames of the project. | Always |
| expl dataframe preview | Returns the first rows of a data frame's last step. | Always |
| expl dataframe profile | Summarizes every column: type, missing values, statistics and distribution. | Always |
| expl dataframe run-r | Runs an R script and returns the result. | When Allow create, edit and delete is on |
| expl dataframe manage | Runs data frame and catalog actions such as rename and delete. | When Allow create, edit and delete is on |
| expl dataframe save-result | Saves the data of a chart or analytics output as a new data frame. | When Allow create, edit and delete is on |
| expl dataframe open | Selects the data frame to work on and returns its columns. | When Allow create, edit and delete is on |

### Wrangling

| Command | What it does | Available |
| --- | --- | --- |
| expl dataframe get-command | Shows the parameters a wrangling command accepts. | Always |
| expl dataframe list-ai-proposals | Lists the AI proposals of the project with their review status. | Always |
| expl dataframe ai-wrangle | Has the AI write an R script for a wrangling request and optionally add it as a step. | When Allow create, edit and delete is on |
| expl dataframe apply-preview | Applies the changes tried by the preview in one commit. | When Allow create, edit and delete is on |
| expl dataframe copy-steps | Copies steps into a data frame of this or another open project. | When Allow create, edit and delete is on |
| expl dataframe create-branch | Creates a branch from a step. | When Allow create, edit and delete is on |
| expl dataframe apply-step | Adds one wrangling step to a data frame. | When Allow create, edit and delete is on |
| expl dataframe delete-branch | Deletes a branch. | When Allow create, edit and delete is on |
| expl dataframe delete-step | Deletes steps of a data frame. | When Allow create, edit and delete is on |
| expl dataframe edit-steps | Edits existing steps the same way the step menus do. | When Allow create, edit and delete is on |
| expl dataframe move-branch | Moves a branch to start from a different step. | When Allow create, edit and delete is on |
| expl dataframe preview-steps | Tries changes on temporary objects and shows the effect without saving. | When Allow create, edit and delete is on |
| expl dataframe set-step-cache | Caches, refreshes or clears the data of a step. | When Allow create, edit and delete is on |
| expl dataframe set-step-disabled | Disables or re-enables a step without deleting it. | When Allow create, edit and delete is on |
| expl dataframe update-ai-proposal | Records whether a fix from an AI proposal worked after publishing. | When Allow create, edit and delete is on |

### Charts

| Command | What it does | Available |
| --- | --- | --- |
| expl chart get | Reads a chart's definition, data and parameters. | Always |
| expl chart get-result | Runs a chart and returns the aggregated values. | Always |
| expl chart get-image | Returns the chart as a PNG image. | Always |
| expl chart get-summary-prompt | Returns reference data with the actual values for writing a chart's AI Summary. | Always |
| expl chart list-maps | Lists the maps available for map charts. | Always |
| expl chart list-settings | Shows the settings and functions available for a chart type. | Always |
| expl chart list | Lists the charts of a data frame. | Always |
| expl chart copy | Duplicates a chart, or pastes it into another data frame. | When Allow create, edit and delete is on |
| expl chart add | Creates an editable chart from a data frame. | When Allow create, edit and delete is on |
| expl chart delete | Deletes a chart. | When Allow create, edit and delete is on |
| expl chart export-data | Writes a chart's data to a file. | When Allow create, edit and delete is on |
| expl chart install-map | Installs or updates a map extension from the Exploratory server. | When Allow create, edit and delete is on |
| expl chart open | Opens a chart in the chart view. | When Allow create, edit and delete is on |
| expl chart save-ai-summary | Saves an interpretation as the chart's AI Summary. | When Allow create, edit and delete is on |
| expl chart edit | Changes a chart's type, aggregation, name and other settings. | When Allow create, edit and delete is on |

### Analytics

| Command | What it does | Available |
| --- | --- | --- |
| expl analytics get | Reads an analytics result: type, settings and outputs. | Always |
| expl analytics get-summary-prompt | Returns reference data with the actual values for writing an analytics AI Summary. | Always |
| expl analytics get-template | Shows the slots and settings an analytics type accepts. | Always |
| expl analytics list | Lists the analytics of a data frame. | Always |
| expl analytics list-templates | Lists the analytics types that can be created. | Always |
| expl analytics add | Creates and runs an analytics (regression, classification, clustering and so on). | When Allow create, edit and delete is on |
| expl analytics delete | Deletes an analytics. | When Allow create, edit and delete is on |
| expl analytics save-ai-summary | Appends an interpretation to the analytics' comment. | When Allow create, edit and delete is on |
| expl analytics edit | Changes an analytics' columns, settings or type and runs it again. | When Allow create, edit and delete is on |

### Notes

| Command | What it does | Available |
| --- | --- | --- |
| expl note get | Reads one note including its Markdown body. | Always |
| expl note get-image | Returns the whole note preview as a PNG image. | Always |
| expl note list | Lists the notes of the project without their bodies. | Always |
| expl note ask-ai | Asks the note editor's AI to rewrite, translate or summarize note text. | When Allow create, edit and delete is on |
| expl note add | Creates a Markdown note that can embed charts and analytics. | When Allow create, edit and delete is on |
| expl note delete | Deletes a note. | When Allow create, edit and delete is on |
| expl note export-html | Writes a note to an HTML file. | When Allow create, edit and delete is on |
| expl note export-pdf | Writes a note to a PDF file. | When Allow create, edit and delete is on |
| expl note open | Opens a note in the window. | When Allow create, edit and delete is on |
| expl note edit | Appends to or replaces the body of a note, or renames it. | When Allow create, edit and delete is on |

### Dashboards

| Command | What it does | Available |
| --- | --- | --- |
| expl dashboard get | Reads one dashboard's pages, markdown, variables and settings. | Always |
| expl dashboard get-image | Returns a page of a saved dashboard as a PNG image. | Always |
| expl dashboard list | Lists the dashboards of the project. | Always |
| expl dashboard validate | Checks a dashboard layout without saving it. | Always |
| expl dashboard create | Creates a dashboard of pages, rows and panels. | When Allow create, edit and delete is on |
| expl dashboard delete | Deletes a dashboard. | When Allow create, edit and delete is on |
| expl dashboard export-html | Writes a dashboard to an HTML file. | When Allow create, edit and delete is on |
| expl dashboard export-pdf | Writes all pages of a dashboard to a PDF file. | When Allow create, edit and delete is on |
| expl dashboard edit | Changes a dashboard's pages, panels, name and settings. | When Allow create, edit and delete is on |

### Data sources and connections

| Command | What it does | Available |
| --- | --- | --- |
| expl connection get | Reads the data connections, or one connection's items. | Always |
| expl dataframe get-source-params | Shows the settings a data source plugin takes and whether it needs a connection. | Always |
| expl dataframe identify-source | Identifies the requested data source and returns its reference. | Always |
| expl connection lookup | Finds a selected connection and returns its metadata without credentials. | Always |
| expl dataframe lookup-reference | Returns the AI Data reference for a kind of data source. | Always |
| expl connection request-creation | Opens the connection creation dialog. | Always |
| expl connection search-schema | Reads the saved table and column information of a connection. | Always |
| expl connection validate | Checks whether a saved connection has all required items. | Always |
| expl dataframe create-source | Saves a data frame together with its data source. | When Allow create, edit and delete is on |
| expl connection delete | Deletes a data connection. | When Allow create, edit and delete is on |
| expl dataframe extract-pdf-tables | Checks the contents of a PDF table before importing it. | When Allow create, edit and delete is on |
| expl dataframe list-pdf-tables | Previews the tables found in a PDF file. | When Allow create, edit and delete is on |
| expl connection list-schema-nodes | Lists the child nodes of a path in a hierarchical connection. | When Allow create, edit and delete is on |
| expl dataframe read-file-header | Checks the beginning and format of a local text file. | When Allow create, edit and delete is on |
| expl dataframe replace-source | Replaces the data source of an existing data frame. | When Allow create, edit and delete is on |
| expl connection sample-collections | Gets the actual table list and samples of a connection. | When Allow create, edit and delete is on |
| expl connection save | Opens the dialog to create or edit a connection; the user enters the values. | When Allow create, edit and delete is on |
| expl connection save-schema-info | Saves table and column information confirmed from a connection. | When Allow create, edit and delete is on |

### Parameters

| Command | What it does | Available |
| --- | --- | --- |
| expl parameter get | Reads the project's parameters. | Always |
| expl parameter get-session | Reads the definitions of session parameters set from the login. | Always |
| expl parameter delete | Deletes a parameter. | When Allow create, edit and delete is on |
| expl parameter rename | Renames a parameter. | When Allow create, edit and delete is on |
| expl parameter save | Creates a parameter, or updates one that exists. | When Allow create, edit and delete is on |
| expl dashboard set-parameter-value | Changes the selected parameter values of a displayed dashboard. | When Allow create, edit and delete is on |

### Publishing

| Command | What it does | Available |
| --- | --- | --- |
| expl published list | Lists the notes, dashboards and data published from the project. | Always |
| expl team list | Lists the teams you belong to. | Always |
| expl dashboard publish | Publishes a dashboard to the server with a public URL. | When Allow create, edit and delete is on |
| expl dataframe publish | Publishes a data frame's steps to the server. | When Allow create, edit and delete is on |
| expl note publish | Publishes a note to the server with a public URL. | When Allow create, edit and delete is on |
| expl project publish | Opens the Publish dialog for the project. | When Allow create, edit and delete is on |
| expl published unpublish | Cancels the publishing of a note or dashboard. | When Allow create, edit and delete is on |

### Settings and shared resources

| Command | What it does | Available |
| --- | --- | --- |
| expl aifunction get-presets | Returns the preset instructions of the AI functions in the column menu. | Always |
| expl aifunction get-templates | Reads the saved AI function templates. | Always |
| expl dictionary get | Reads the dictionaries used for text analysis. | Always |
| expl noteprompt get-templates | Reads the saved prompt templates for note editing. | Always |
| expl palette get | Reads the color palettes you created. | Always |
| expl rpackage get | Lists the custom R packages of the project. | Always |
| expl settings get | Reads the system settings, with secrets hidden. | Always |
| expl rpackage add | Installs an R package from CRAN or a local file. | When Allow create, edit and delete is on |
| expl aifunction delete-template | Deletes an AI function template. | When Allow create, edit and delete is on |
| expl noteprompt delete-template | Deletes a prompt template for note editing. | When Allow create, edit and delete is on |
| expl palette delete | Deletes a color palette. | When Allow create, edit and delete is on |
| expl rpackage delete | Removes a custom R package. | When Allow create, edit and delete is on |
| expl aifunction save-template | Saves an instruction as an AI function template. | When Allow create, edit and delete is on |
| expl dictionary save | Creates or updates a dictionary for text analysis. | When Allow create, edit and delete is on |
| expl noteprompt save-template | Saves a prompt template for note editing. | When Allow create, edit and delete is on |
| expl palette save | Creates or updates a color palette. | When Allow create, edit and delete is on |
| expl settings edit | Changes the system settings that are allowed to change. | When Allow create, edit and delete is on |

### Local data catalog

| Command | What it does | Available |
| --- | --- | --- |
| expl catalog fetch | Reads one catalog item as Markdown: title, description, columns and more. | Always |
| expl catalog get-schedule | Gets the refresh schedule of a catalog item. | Always |
| expl catalog get-schema | Gets the columns of a catalog item with descriptions and statistics. | Always |
| expl catalog preview | Gets rows of a catalog item, paged. | Always |
| expl catalog query | Filters, groups, aggregates or joins catalog items. | Always |
| expl project read-catalog | Reads data frames, charts, analytics, notes, parameters and dashboards of the project in one call. | Always |
| expl catalog search | Searches the local data catalog on this computer. | Always |
| expl catalog delete | Deletes a catalog item with its data, schedule and access log. | When Allow create, edit and delete is on |
| expl catalog set-schedule | Sets the refresh schedule of a catalog item. | When Allow create, edit and delete is on |
| expl catalog update | Changes the description of a catalog item or its columns. | When Allow create, edit and delete is on |

### Other

| Command | What it does | Available |
| --- | --- | --- |
| expl execution cancel | Stops a long-running operation. | Always |
| expl execution get | Returns the progress and results of a long-running operation. | Always |
| expl guide get | Returns the usage guide of a tool. | Always |
| expl artifact rerun | Re-runs a chart, analytics or other item of the open project. | When Allow create, edit and delete is on |

The built-in commands (expl status, project use, tools list, tools describe, call, lang, skill and completion) are in the tables at the top of this page, not below. For their flags, see [Global flags](/en/cli/desktop/global-flags).

For the commands that read content on exploratory.io, see [Server commands](/en/cli/server/commands).
