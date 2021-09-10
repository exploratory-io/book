# Text Analysis

Runs text analysis based on frequency and co-occurrence of words.

## Input Data

Input data should contain following column.

  * Text Column - The column of the text data.

## Properties

  * Sample Data Size - Number of rows to sample before running the analysis.
  * Text Tokenization
    * Remove Stopwords - Default is Yes.
    * Language for Stopwords - By default it is automatically selected based on the content of the text.
    * Additional Stopwords - Words to be added to the default set of stopwords.
    * Exclude from Stopwords - Words to be excluded from the default set of stopwords.
    * Words To Be Treated As One Word - If a word or phrase that should be treated as one token is separated into multiple tokens, it can be fixed by specifying the word/phrase here.
    * Remove Punctuations
    * Remove Numbers
    * Remove Hiragana Only Words - You can treat often meaningless short Japanese Hiragana words as stopwords altogether by selecting an option here.
  * Words - Bar
    * Number of Bars (Words)
  * Word Cloud
    * Number of Words
    * Min Count for Words to Show
    * Min Word Size (px)
    * Max Word Size (px)
    * Rotated Text Ratio (0-1)
    * Chart Width (px)
    * Chart Height (px)
  * Word Pairs - Bar
    * Number of Bars (Word Pairs)
  * Word Pairs - Network
    * Number of Words
    * Max Size of Circle (px)
    * Criterion for Size of Circle
    * Max Width of Edge (px)
    * Font Size (Ratio)

## How to Use This Feature

1. Under Analytics view, select "Word Count" for Analytics Type.
2. Select a column for Text Column.
3. Click Run button to run the analytics.
4. Select each view type (explained below) see the detail of the analysis.

## "Word Cloud" View

"Word Cloud" View displays the word cloud of the words used in the text data. Both the color and the size of a word indicates the count of the word.

## "Words - Bar" View and "Words - Count" View

"Words - Bar" View and "Words - Count" View display the count of the words in the text data.

## "Words - Data" View

"Words - Data" View displays the text data after tokenization.

## "Word Pairs - Bar" View and "Word Pairs - Count" View

"Word Pairs - Bar" View and "Word Pairs - Count" View display the count of the word pairs in the text data.

## "Word Pairs - Network" View

"Word Pairs - Network" View displays the network graph of co-occurrence of the words. The line thickness in the graph represents the count of co-occurrence. The sizes of the circles represents the count of the word. The colors of circles are the result of clustering of the words based on co-occurrence.

## R Package

Text Analysis Analytics View uses the [quanteda](https://cran.r-project.org/web/packages/quanteda/index.html) R Package under the hood.

## Exploratory R Package

For details about `quanteda` usage in Exploratory R Package, please refer to the [github repository](https://github.com/exploratory-io/exploratory_func/blob/master/R/textanal.R)
