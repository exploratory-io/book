# Text Analysis

Runs text analysis based on frequency and co-occurrence of words.

## Input Data

Input data should contain following column.

  * Text Column - The column of the text data.

## Properties

  * Sample Data Size - Number of rows to sample before running the analysis.
  * Text Tokenization
    * Remove Stopwords
    * Language for Stopwords
    * Additional Stopwords
    * Words To Be Treated As One Word - If a word or phrase that should be treated as one token is separated into multiple tokens, it can be fixed by specifying the word/phrase here.
    * Remove Punctuations
    * Remove Numbers
    * Remove Hiragana Only Words - You can treat often meaningless short Japanese Hiragana words as stopwords altogether by selecting an option here.
  * Words - Bar
    * Number of Words to Show
  * Word Cloud
    * Number of Words to Show
    * Min Word Size (px)
    * Max Word Size (px)
    * Rotated Text Ratio (0-1)
    * Chart Width (px)
    * Chart Height (px)
  * Word Pairs - Bar
    * Number of Word Pairs to Show
  * Word Pairs - Network
    * Number of Words to Show
    * Max Size of Circle (px)
    * Criterion for Size of Circle
    * Max Width of Edge (px)
    * Font Size (Ratio)


## R Package

Text Analysis Analytics View uses the [quanteda](https://cran.r-project.org/web/packages/quanteda/index.html) R Package under the hood.

## Exploratory R Package

For details about `quanteda` usage in Exploratory R Package, please refer to the [github repository](https://github.com/exploratory-io/exploratory_func/blob/master/R/textanal.R)
