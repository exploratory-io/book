const template = `
# Summary

We performed topic modeling on the <%= text_column %> column and classified it into <%= topic_count %> topics.

Topic modeling is an analytical method that discovers several "topics" called themes from text (document) data. In this analysis, we determine the probability that each text (document) belongs to each topic and identify important words that characterize each topic.

For details on how topic modeling classifies documents, please refer to [this note](https://exploratory.io/note/exploratory/fXu6heu5).

As a result of topic modeling, the number of rows for each of the <%= topic_count %> topics is as follows:

{{summary}}

Topic selection for each document is based on the topic with the highest probability in the document.

# Topic Characteristics

## Documents

Each row represents original text (documents), and each column (Topic 1 to <%= topic_count %>) shows the probability that the text belongs to each topic. Words with high probability of belonging to that topic are displayed in the topic's color.

{{document:1}}

For example, if a text has a "Topic 1" value of 0.8, it can be interpreted as having an 80% probability of belonging to Topic 1.

## Important Words

The following chart shows important words that characterize each topic and the probability that words belong to that topic.

{{topic_keywords}}

The length of the bars represents the probability of each word belonging to that topic, with larger values indicating more important words that characterize the topic.

## Data (Overall)

This is the original data with topic probability information added. In this table, you can check both the original text data and the probability of belonging to each topic.

{{data_with_topic_probabilities}}

Each row represents one text data, and the columns "Topic 1" to "Topic <%= topic_count %>" show the probability that the text belongs to each topic. The sum of probabilities equals 1 (100%).

## Data (Words)

The following table shows the probability of each word belonging to each topic. Larger values indicate that the word is more important for that topic.

{{word_topic_probabilities}}

<% if (has_category) { %>

# Relationship with Categories

The following visualizes the relationship between each topic and categories as a ratio bar chart. You can see which categories dominate in each topic.

{{category_ratio_chart}}


The following visualizes the relationship between topics and categories using a path diagram. You can see which categories each topic is associated with. The thickness of lines represents the strength of association between topics and categories, with thicker lines indicating stronger associations.

{{category_path_chart}}

The following visualizes the relationship between important words for each topic and categories as a ratio bar chart. You can see which categories dominate for each important word.

{{keyword_category_chart}}

<% } %>

# Next Steps

* Stop word configuration: By excluding common auxiliary verbs like "できる" (can do) and "られる" (be able to), and common nouns like "方" (person/way) and "者" (person), you can focus on more meaningful words. You can register these words as "Stop Word Dictionary" from Analytics [Settings](//analytics/settings).
* Compound word registration: Words that are counted separately but actually refer to one concept, such as "Web" and "会議" (meeting), can be recognized as "Web会議" (web meeting) to improve analysis accuracy. You can also register this as "Compound Word Dictionary" from Analytics [Settings](//analytics/settings).
`;

module.exports = template; 