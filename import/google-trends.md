# Import Google Trends data

You can get Google Trends data through [gtrendsR](https://github.com/PMassicotte/gtrendsR) package internally.

# Input parameters

* Google User ID - Set user ID.
* Google User Password - Set user password.
* Keywords - Keywords to search. Use "," to search more than one keywords and compare them.
* Type - "Trend", "Top Regions" or "Top Cities".
  * Trend - How search volume have changed.
  * Top Regions - Where those keywords are often searched. If Country is chosen, the areas will be sub-regions in the country. If not, the areas will be country names.
  * Top Cities - In what cities those keywords are often searched.
* Time Range - From when the data should be extracted.
* Country - You can specify country.
