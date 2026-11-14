# Tools and what you can do

The Desktop MCP lets an AI client work with the project open in Exploratory Desktop. Find what it can do by purpose.

<a id="overview"></a>

## Scope

The tools below are the ones the Exploratory Desktop plugin guides the AI to use. Which tools appear depends on your Desktop version and on the settings in System Settings \> MCP / CLI: with Allow create, edit and delete off, only reading is possible.

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
> Some of these tools delete things, publish and unpublish, or run R code. See Limits and what you control for how Desktop asks you first.
