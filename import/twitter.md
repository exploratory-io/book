# Import Twitter Search API data

You can query and extract Twitter's tweet data.

* [Quick Video: How to Query and Extract Twitter Data](https://exploratory.io/tutorial#querying-extracting-twitter-data)


## 1. Select Twitter Search Data Menu

- Select 'Import Cloud Apps Data' from Add Data Frames dropdown

![](images/import-cloudapps.png)

- Click 'Twitter Search'

![](images/twitter-select.png)

## 2. OAuth Setting

Create a connection following [this instruction](oauth-connection.html).

## 3. Input parameters

* Max # of tweets - Set max number of the tweets to return.
* Language - Set a language code if you want to limit the tweets to search.
* Last N Days - Set number of the past days for the search data.
* Search Text - Type text to search.

## 4. Preview and Import

Click Preview button to see the data back from Twitter. If it looks ok, then you can click 'Import' to import the data into Exploratory.

## Appendix

### How to build search query?

You can find the search query syntax from [Twitter's Search API page](https://dev.twitter.com/rest/public/search).


Note that due to the Twitter Search API’s restriction, the data is supposed to be only for 7 days period, though it returns 10 days of the data in most cases.
