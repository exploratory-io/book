# Import Twitter Search API data

You can query and extract Twitter's tweet data. It uses [Twitter's Search API](https://dev.twitter.com/rest/public/search) through TwitteR package internally.

# Input parameters

* Max # of tweets - Set number of the tweets to return.
* Language - Set a language code if you want to limit the tweets to search.
* Last N Days - Set number of the past days for the search data.
* Search Text - Type text to search.

### How to build search query?

You can find the search query syntax from [Twitter's Search API page](https://dev.twitter.com/rest/public/search).


Note that due to the Twitter Search API’s restriction, the data is supposed to be only for 7 days period, even though it returns 10 days of the data in most cases.
