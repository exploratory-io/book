# Treasure Data Import

Please refer [this note](https://exploratory.io/note/2ac8ae888097/How-to-access-Treasure-Data-from-Exploratory-kWs8Gid5gk) for Treasure Data Import. 

# Known issues (Query exceeded distributed user memory limit of xxGB)

You might see the "Query exceeded distributed user memory limit of xxGB" error when you try to import data from Treasure Data with a SQL that uses following operators.

- DISTINCT
- UNION
- ORDER BY
- GROUP BY (of many columns)
- JOINS

To workaround the issue, please refer below documents.

https://docs.treasuredata.com/display/public/PD/How+can+I+fix+the+Exceeded+max+local+memory+xxGB+error (English)
https://docs.treasuredata.com/pages/releaseview.action?pageId=328022 (Japanese)
