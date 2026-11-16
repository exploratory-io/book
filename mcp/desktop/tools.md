# Tools

The Desktop MCP lets an AI client work with the project open in Exploratory Desktop. Find what it can do by purpose.

<a id="overview"></a>

## Scope

The table below shows the main tools as examples. There are many more tools than the ones listed. The tools below are the ones the Exploratory Desktop plugin guides the AI to use. Which tools appear depends on your Desktop version and on the settings in System Settings \> MCP / CLI: with Allow create, edit and delete off, only reading is possible.

| Purpose | What the AI can do | Tools (examples) |
| --- | --- | --- |
| Data frames and wrangling | Read data frames, preview and profile them, add and remove wrangling steps, work with branches, run R code and save the result as a data frame. | create_wrangling_step, ai_wrangle, preview_data_frame, profile_data_frame, create_branch, execute_r_script, save_result_as_dataframe |
| Data sources and connections | Read and save connections, import data, create and replace data sources, extract tables from PDF files. | get_connections, save_connection, create_data_source, replace_data_source, extract_pdf_tables |
| Charts | Create, change, copy and read charts (settings, data and image), export chart data. | create_chart, update_chart, get_chart, get_chart_data, get_chart_image, copy_chart, export_chart_data |
| Analytics | Create, change and read analytics (regression, tests, clustering and so on) and their templates. | create_analytics, update_analytics, get_analytics, list_analytics_templates |
| Notes | Write, change, read, open, publish and export notes; ask the note AI. | create_note, update_note, get_note, publish_note, export_note_html, ask_note_ai |
| Dashboards | Create, change, validate, publish and export dashboards; set parameter values. | create_dashboard, update_dashboard, validate_dashboard, publish_dashboard, export_dashboard_pdf |
| Parameters | Create, rename, read and delete parameters. | save_parameter, get_parameters, rename_parameter, delete_parameter |
| System settings | Read and change system settings, color palettes, AI function templates and dictionaries. | get_system_settings, update_system_settings, save_palette, save_dictionary |

> **Some tools change and delete**
>
> Some of these tools delete things, publish and unpublish, or run R code. See Permissions and settings for how Desktop asks you first.

<a id="all-tools"></a>

## All tools

There are 146 tools in all. 68 are always available, and 78 work only when Allow create, edit and delete is on in System Settings \> MCP / CLI. The tools you can use depend on your Exploratory Desktop version and the MCP / CLI settings.

The always-available tools include reading and a few that only open a screen. With the switch off, the other tools stop with a permission error.

### Projects (16)

**Always available (12)**

| Name | What it does |
| --- | --- |
| ask_project | Asks which project to use before a write. |
| get_environment | Shows the connected Desktop: app version, Agent API version, OS, signed-in user and open projects. |
| get_lineage | Shows which data sources a chart, analytics, note or data frame is built on. |
| get_project | Reads one project's name, description, last update time and whether it is open. |
| get_project_history | Reads and searches the project's change history. |
| list_created_artifacts | Lists the charts, analytics, steps and branches the AI created or changed in this conversation. |
| list_projects | Lists the projects in this installation, newest first. |
| locate_published_source | Traces published data back to where it came from. |
| open_project | Opens a local project in its window, or focuses the existing window. |
| search_artifacts | Searches the open project for items by name, comment or content. |
| search_projects | Searches all local projects for data frames, charts, analytics, notes and more. |
| search_server_projects | Lists published projects on the signed-in Exploratory server. |

**Available with Allow create, edit and delete on (4)**

| Name | What it does |
| --- | --- |
| close_project | Closes the project's window after saving. |
| import_project | Downloads a published project and imports it as a new local project. |
| restore_project_history | Restores the whole project to a point in its change history. |
| save_project | Creates a new project, or imports a project file. |

### Data frames (10)

**Always available (6)**

| Name | What it does |
| --- | --- |
| get_data_frame | Reads a data frame's steps, column names, types and row count. |
| get_step_diagram | Returns the Step Diagram of a data frame. |
| get_summary_view | Returns the Summary table of a data frame. |
| list_data_frames | Lists the data frames of the project. |
| preview_data_frame | Returns the first rows of a data frame's last step. |
| profile_data_frame | Summarizes every column: type, missing values, statistics and distribution. |

**Available with Allow create, edit and delete on (4)**

| Name | What it does |
| --- | --- |
| execute_r_script | Runs an R script and returns the result. |
| manage_data_frame | Runs data frame and catalog actions such as rename and delete. |
| save_result_as_dataframe | Saves the data of a chart or analytics output as a new data frame. |
| select_data_frame | Selects the data frame to work on and returns its columns. |

### Wrangling (15)

**Always available (2)**

| Name | What it does |
| --- | --- |
| get_wrangling_command | Shows the parameters a wrangling command accepts. |
| list_ai_proposals | Lists the AI proposals of the project with their review status. |

**Available with Allow create, edit and delete on (13)**

| Name | What it does |
| --- | --- |
| ai_wrangle | Has the AI write an R script for a wrangling request and optionally add it as a step. |
| apply_wrangling_preview | Applies the changes tried by the preview in one commit. |
| copy_wrangling_steps | Copies steps into a data frame of this or another open project. |
| create_branch | Creates a branch from a step. |
| create_wrangling_step | Adds one wrangling step to a data frame. |
| delete_branch | Deletes a branch. |
| delete_wrangling_step | Deletes steps of a data frame. |
| edit_wrangling_steps | Edits existing steps the same way the step menus do. |
| move_branch | Moves a branch to start from a different step. |
| preview_wrangling_steps | Tries changes on temporary objects and shows the effect without saving. |
| set_step_cache | Caches, refreshes or clears the data of a step. |
| set_step_disabled | Disables or re-enables a step without deleting it. |
| update_ai_proposal | Records whether a fix from an AI proposal worked after publishing. |

### Charts (15)

**Always available (7)**

| Name | What it does |
| --- | --- |
| get_chart | Reads a chart's definition, data and parameters. |
| get_chart_data | Runs a chart and returns the aggregated values. |
| get_chart_image | Returns the chart as a PNG image. |
| get_chart_summary_prompt | Returns reference data with the actual values for writing a chart's AI Summary. |
| list_chart_maps | Lists the maps available for map charts. |
| list_chart_settings | Shows the settings and functions available for a chart type. |
| list_charts | Lists the charts of a data frame. |

**Available with Allow create, edit and delete on (8)**

| Name | What it does |
| --- | --- |
| copy_chart | Duplicates a chart, or pastes it into another data frame. |
| create_chart | Creates an editable chart from a data frame. |
| delete_chart | Deletes a chart. |
| export_chart_data | Writes a chart's data to a file. |
| install_chart_map | Installs or updates a map extension from the Exploratory server. |
| open_chart | Opens a chart in the chart view. |
| save_chart_ai_summary | Saves an interpretation as the chart's AI Summary. |
| update_chart | Changes a chart's type, aggregation, name and other settings. |

### Analytics (9)

**Always available (5)**

| Name | What it does |
| --- | --- |
| get_analytics | Reads an analytics result: type, settings and outputs. |
| get_analytics_summary_prompt | Returns reference data with the actual values for writing an analytics AI Summary. |
| get_analytics_template | Shows the slots and settings an analytics type accepts. |
| list_analytics | Lists the analytics of a data frame. |
| list_analytics_templates | Lists the analytics types that can be created. |

**Available with Allow create, edit and delete on (4)**

| Name | What it does |
| --- | --- |
| create_analytics | Creates and runs an analytics (regression, classification, clustering and so on). |
| delete_analytics | Deletes an analytics. |
| save_analytics_ai_summary | Saves an interpretation to the analytics' comment. |
| update_analytics | Changes an analytics' columns, settings or type and runs it again. |

### Notes (10)

**Always available (3)**

| Name | What it does |
| --- | --- |
| get_note | Reads one note including its Markdown body. |
| get_note_image | Returns the whole note preview as a PNG image. |
| list_notes | Lists the notes of the project without their bodies. |

**Available with Allow create, edit and delete on (7)**

| Name | What it does |
| --- | --- |
| ask_note_ai | Asks the note editor's AI to rewrite, translate or summarize note text. |
| create_note | Creates a Markdown note that can embed charts and analytics. |
| delete_note | Deletes a note. |
| export_note_html | Writes a note to an HTML file. |
| export_note_pdf | Writes a note to a PDF file. |
| open_note | Opens a note in the window. |
| update_note | Appends to or replaces the body of a note, or renames it. |

### Dashboards (9)

**Always available (4)**

| Name | What it does |
| --- | --- |
| get_dashboard | Reads one dashboard's pages, markdown, variables and settings. |
| get_dashboard_image | Returns a page of a saved dashboard as a PNG image. |
| list_dashboards | Lists the dashboards of the project. |
| validate_dashboard | Checks a dashboard layout without saving it. |

**Available with Allow create, edit and delete on (5)**

| Name | What it does |
| --- | --- |
| create_dashboard | Creates a dashboard of pages, rows and panels. |
| delete_dashboard | Deletes a dashboard. |
| export_dashboard_html | Writes a dashboard to an HTML file. |
| export_dashboard_pdf | Writes all pages of a dashboard to a PDF file. |
| update_dashboard | Changes a dashboard's pages, panels, name and settings. |

### Data sources and connections (18)

**Always available (8)**

| Name | What it does |
| --- | --- |
| get_connections | Reads the data connections, or one connection's items. |
| get_data_source_params | Shows the settings a data source plugin takes and whether it needs a connection. |
| identify_data_source | Identifies the requested data source and returns its reference. |
| lookup_connection | Finds a selected connection and returns its metadata without credentials. |
| lookup_reference | Returns the AI Data reference for a kind of data source. |
| request_connection_creation | Opens the connection creation dialog. |
| search_schema | Reads the saved table and column information of a connection. |
| validate_connection | Checks whether a saved connection has all required items. |

**Available with Allow create, edit and delete on (10)**

| Name | What it does |
| --- | --- |
| create_data_source | Saves a data frame together with its data source. |
| delete_connection | Deletes a data connection. |
| extract_pdf_tables | Checks the contents of a PDF table before importing it. |
| list_pdf_tables | Previews the tables found in a PDF file. |
| list_schema_nodes | Lists the child nodes of a path in a hierarchical connection. |
| read_file_header | Checks the beginning and format of a local text file. |
| replace_data_source | Replaces the data source of an existing data frame. |
| sample_collections | Gets the actual table list and samples of a connection. |
| save_connection | Opens the dialog to create or edit a connection; the user enters the values. |
| save_schema_info | Saves table and column information confirmed from a connection. |

### Parameters (6)

**Always available (2)**

| Name | What it does |
| --- | --- |
| get_parameters | Reads the project's parameters. |
| get_session_parameters | Reads the definitions of session parameters set from the login. |

**Available with Allow create, edit and delete on (4)**

| Name | What it does |
| --- | --- |
| delete_parameter | Deletes a parameter. |
| rename_parameter | Renames a parameter. |
| save_parameter | Creates a parameter, or updates one that exists. |
| set_dashboard_parameter_value | Changes the selected parameter values of a displayed dashboard. |

### Publishing (7)

**Always available (2)**

| Name | What it does |
| --- | --- |
| list_published | Lists the notes, dashboards and data published from the project. |
| list_teams | Lists the teams you belong to. |

**Available with Allow create, edit and delete on (5)**

| Name | What it does |
| --- | --- |
| publish_dashboard | Publishes a dashboard to the server with a public URL. |
| publish_data_frame | Publishes a data frame's steps to the server. |
| publish_note | Publishes a note to the server with a public URL. |
| publish_project | Opens the Publish dialog for the project. |
| unpublish | Cancels the publishing of a note or dashboard. |

### Settings and shared resources (17)

**Always available (7)**

| Name | What it does |
| --- | --- |
| get_ai_function_presets | Returns the preset instructions of the AI functions in the column menu. |
| get_ai_function_templates | Reads the saved AI function templates. |
| get_dictionaries | Reads the dictionaries used for text analysis. |
| get_note_prompt_templates | Reads the saved prompt templates for note editing. |
| get_palettes | Reads the color palettes you created. |
| get_r_packages | Lists the custom R packages of the project. |
| get_system_settings | Reads the system settings, with secrets hidden. |

**Available with Allow create, edit and delete on (10)**

| Name | What it does |
| --- | --- |
| add_r_package | Installs an R package from CRAN or a local file. |
| delete_ai_function_template | Deletes an AI function template. |
| delete_note_prompt_template | Deletes a prompt template for note editing. |
| delete_palette | Deletes a color palette. |
| delete_r_package | Removes a custom R package. |
| save_ai_function_template | Saves an instruction as an AI function template. |
| save_dictionary | Creates or updates a dictionary for text analysis. |
| save_note_prompt_template | Saves a prompt template for note editing. |
| save_palette | Creates or updates a color palette. |
| update_system_settings | Changes the system settings that are allowed to change. |

### Local data catalog (10)

**Always available (7)**

| Name | What it does |
| --- | --- |
| fetch_catalog_item | Reads one catalog item as Markdown: title, description, columns and more. |
| get_catalog_schedule | Gets the refresh schedule of a catalog item. |
| get_catalog_schema | Gets the columns of a catalog item with descriptions and statistics. |
| preview_catalog_data | Gets rows of a catalog item, paged. |
| query_catalog_data | Filters, groups, aggregates or joins catalog items. |
| read_catalog | Reads data frames, charts, analytics, notes, parameters and dashboards of the project in one call. |
| search_catalog | Searches the local data catalog on this computer. |

**Available with Allow create, edit and delete on (3)**

| Name | What it does |
| --- | --- |
| delete_catalog_item | Deletes a catalog item with its data, schedule and access log. |
| set_catalog_schedule | Sets the refresh schedule of a catalog item. |
| update_catalog_item | Changes the description of a catalog item or its columns. |

### Other (4)

**Always available (3)**

| Name | What it does |
| --- | --- |
| cancel_execution | Stops a long-running operation. |
| get_execution | Returns the progress and results of a long-running operation. |
| get_guide | Returns the usage guide of a tool. |

**Available with Allow create, edit and delete on (1)**

| Name | What it does |
| --- | --- |
| rerun_artifact | Re-runs a chart, analytics or other item of the open project. |

