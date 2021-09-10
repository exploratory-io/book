# Text Clustering with Topic Model

Clusters documents based on the topics they are talking about with topic model (LDA - Latent Dirichlet allocation).

It is a fuzzy clustering, in that the topic model gives ratio of topics for each document, rather than labeling a document with a single topic.

## Input Data

Input data should contain following column.

  * Text Column - The column of the text data. Each row is treated as a document.

## Properties

  * Sample Data Size - Number of rows to sample before running the analysis.
  * Topic Model (LDA)
    * Number of Topics
    * Random Seed
  * Text Tokenization
    * Remove Stopwords - Default is Yes.
    * Language for Stopwords - By default it is automatically selected based on the content of the text.
    * Additional Stopwords - Words to be added to the default set of stopwords.
    * Exclude from Stopwords - Words to be excluded from the default set of stopwords.
    * Words To Be Treated As One Word - If a word or phrase that should be treated as one token is separated into multiple tokens, it can be fixed by specifying the word/phrase here.
    * Remove Punctuations
    * Remove Numbers
    * Clean Up Twitter Data - Whether to remove hashtag (starts with #) and mention (starts with @). The default is No.
    * Remove Hiragana Only Words - You can treat often meaningless short Japanese Hiragana words as stopwords altogether by selecting an option here.
  * Documents of Topics - This section is about "Documents of Topics" View.
    * Number of Documents to Show - Number of documents to show for each topic.
  * Topics of Documents - This section is about "Topics of Documents" View.
    * Number of Documents to Show - Number of documents to show in the document-topic matrix.
  * Important Words of Topics - This section is about "Important Words of Topics" View.
    * Number of Important Words to Show - Number of important words to show in the bar charts for each topic.
  * Topics of Words - This section is about "Topics of Words" View.
    * Number of Words to Show - Numver of words to show in the word-topic matrix.

## How to Use This Feature

1. Under Analytics view, select "Word Count" for Analytics Type.
2. Select a column for Text Column.
3. Click Run button to run the analytics.
4. Select each view type (explained below) see the detail of the analysis.

## "Summary" View

"Summary" View shows number of documents for each topic. Since topic model gives ratio of topics for each document, rather than labeling with a single topic, the numbers here are the count of documents by the topic with the highest ratio for the document.

## "Documents of Topics" View

"Documents of Topics" View shows samples of documents for each topic. The documents shown here as the samples of each topic are the ones that have the highest ratio of the topic among all the documents.

## "Topics of Documents" View

"Topics of Documents" View shows the document-topic matrix. It shows ratio of topics for each document.

## "Important Words of Topics" View

"Important Words of Topics" View shows a bar chart for each topic that shows the words with the highest probability of occurrence.

## "Topics of Words" View

"Topics of Words" View shows the word-topic matrix. It shows occurrence probability of each words in each topic. The words are sorted by the highest probability it has with any one of the topics.

## "Data" View

"Data" View shows the original data frame with additional columns for ratios of topics for each document (i.e. for each row).

