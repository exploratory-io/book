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


## R Package

Text Analysis Analytics View uses the [quanteda](https://cran.r-project.org/web/packages/quanteda/index.html) R Package under the hood.

## Exploratory R Package

For details about `quanteda` usage in Exploratory R Package, please refer to the [github repository](https://github.com/exploratory-io/exploratory_func/blob/master/R/textanal.R)
