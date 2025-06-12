const template = `
# Summary

Using the topic model method on the text in the "<%= text_column %>" column, we classified it into <%= topic_count %> topics. The number of rows for each topic is as follows:

{{summary}}

Topic modeling is an analytical method that discovers several "topics," also known as themes, from text (document) data. For details on how topic modeling classifies documents, please refer to [this note](https://exploratory.io/note/exploratory/fXu6heu5).

# Relationship between Topics and Words

## Important Words

The important words that characterize each topic and the probability that each word is included in each topic are visualized below.

{{topic_keywords}}

The length of the bars indicates the probability, and a larger value means that the word is more important in characterizing the topic.

## Data (Words)

This is the data for the probability that each word is included in each topic, which is the basis for the chart above.

{{word_topic_probabilities}}

# Relationship between Topics and Documents

The original text (documents) are colored to show which topic they are most strongly related to. Important words for classifying each topic are highlighted in the respective topic's color.

{{document:1}}

The topic columns show the probability that each text (document) belongs to each topic. For example, if a text has a "Topic 1" value of 0.8, it can be interpreted as having an 80% probability of belonging to Topic 1.

<% if (has_category) { %>

# Relationship with Categories

## Visualization by Bar Chart

Based on the relationship between each topic and the original text (documents), the relationship between each topic and the values of <%= category %> has been visualized using a bar chart. You can check which group (category) of <%= category %> has a larger proportion in each topic.

{{category_ratio_chart}}

## Visualization by Path Diagram

The relationship between each topic and the values of <%= category %>, visualized in the bar chart above, has been presented using a path diagram to make it easier to see from both perspectives. The thickness of the lines represents the strength of the relationship between topics and categories, with thicker lines indicating a stronger association.

{{category_path_chart}}

## Relationship between Categories and Important Words

The relationship between the important words for each topic and the values of <%= category %> has been visualized as a bar chart. For each important word, you can see which group (category) of <%= category %> has a larger proportion.

{{keyword_category_chart}}

<% } %>

## Data (Overall)

The table below shows the original data with topic probability information added.

{{data_with_topic_probabilities}}

Each row represents one text data, and the columns "Topic 1" to "Topic <%= topic_count %>" show the probability that the text belongs to each topic. The sum of probabilities equals 1 (100%).

# Next Steps

* Stop word configuration: By excluding common auxiliary verbs like "can do" and "be able to", and common nouns like person/way and person, you can focus on more meaningful words. You can register these words as "Stop Word Dictionary" from Analytics [Settings](//analytics/settings/stop_words).
* Compound word registration: Words that are counted separately but actually refer to one concept, such as "Web" and "meeting", can be recognized as "web meeting" to improve analysis accuracy. You can also register this as "Compound Word Dictionary" from Analytics [Settings](//analytics/settings/compound_words).
`;

module.exports = template; 