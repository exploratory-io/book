# Text Clustering with Topic Model

Clusters documents based on the topics they are talking about with topic model. The topic model algorithm is LDA (Latent Dirichlet allocation).

It is a fuzzy clustering, in that the topic model gives ratios of topics for each document, rather than labeling a document with a single topic.

## Input Data

There are 2 types of this Analytics View.
"Topic Model (Text Data)" can handle raw text data before tokenizing.
"Topic Model (Tokenized Data)" can handle tokenized text data.

Input data for "Topic Model (Text Data)" should contain the following columns.

  * Text Column - The column of the text data. Each row is treated as a document.
  * Category (Optional) - Category to compare with the clustering result.

Input data for "Topic Model (Tokenized Data)" should contain the following columns.

  * Words - The tokenized words.
  * Group By - The ID of the document the word belongs to.
  * Category (Optional) - Category to compare with the clustering result.

## Properties

  * Sample Data Size - Number of rows to sample before running the analysis.
  * Topic Model (LDA)
    * Number of Topics
    * Random Seed
  * Text Tokenization
    * Remove Stopwords - Default is Yes.
    * Language for Stopwords - By default it is automatically selected based on the content of the text.
    * Additional Stopword Dictionary - Dictionary of the words to be added to the default set of stopwords.
    * Additional Stopwords - Words to be added to the default set of stopwords and the words in the stopword dictionary.
    * Exclude from Stopwords - Words to be excluded from the default set of stopwords.
    * Compound Word Dictionary - Dictionary of the compound words. If a word or phrase that should be treated as one token is separated into multiple tokens, it can be fixed by creating a dictionary and adding the word/phrase to it.
    * Additional Compound Words - Compound words to be added to the words in the compound word dictionary.
    * Remove Punctuations
    * Remove Numbers
    * Remove Alphabets
    * Remove URLs 
    * Clean Up Twitter Data - Whether to remove hashtag (starts with #) and mention (starts with @). The default is No.
    * Remove Hiragana Only Words - You can treat often meaningless short Japanese Hiragana words as stopwords altogether by selecting an option here.
  * Top Words - This section is about "Top Words" View.
    * Number of Words to Show - Number of top words to show in the bar charts for each topic.
  * Documents - This section is about "Documents" View.
    * Number of Documents to Show - Number of documents to show for each topic.
    * Baseline Probability for Word Highlight - Word in the documents are highlighted if the word's occurrence probability from the topic in the document is higher than this threshold.
  * Data (Words)
    * Number of Words to Show - Number of words to show in the word-topic matrix in the "Data (Words)" View.

## How to Use This Feature

1. Under Analytics view, select "Word Count" for Analytics Type.
2. Select a column for Text Column.
3. Click the Run button to run the analytics.
4. Select each view type (explained below) see the detail of the analysis.

## "Summary" View

"Summary" View shows the number of documents for each topic. Since the topic model gives a ratio of topics for each document, rather than labeling with a single topic, the numbers here are the count of documents by the topic with the highest ratio for the document.

## "Top Words" View

"Top Words" View shows a bar chart for each topic that shows the words with the highest probability of occurrence.

## "Top Words by Category" View

"Top Words by Category" View appears only when the optional Category column is specified.
It shows percent stacked bar charts that show the ratio of the document's category for the occurrences of each topic's top words.

## "Documents" View

"Documents" View appears only with the "Topic Model (Text Data)" Analytics View.
It shows typical documents for each topic along with the topic ratios of each document. The documents shown here are the ones that have the highest ratio of the topic among all the documents.

## "Category (Ratio)" View

"Category (Ratio)" View appears only when the optional Category column is specified.
It shows a percent stacked bar chart that shows the ratio of the document's category for each topic.

## "Category (Path)" View

"Category (Path)" View appears only when the optional Category column is specified.
It shows a parallel categories diagram that shows the ratio of the document's category for each topic.

## "Data (Full)" View

"Data (Full)" View shows the data frame with each row representing a document, with additional columns for ratios of topics for each document.

## "Data (Words)" View

"Data (Words)" View shows the word-topic matrix. It shows the occurrence probability of each word in each topic. The words are sorted in a way that the top words of each topic shows up close to each other.
