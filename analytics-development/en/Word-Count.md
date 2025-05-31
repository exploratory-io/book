const template = `
# Summary

We performed word count analysis on the <%= text_column %> column.

Word count divides sentences into "words" and aggregates (quantifies) the frequency of each word, allowing you to understand patterns and characteristics within the data.

# Frequent Words

## Word Cloud

We visualized word frequency using a chart called a "word cloud". Words with higher frequency are displayed with larger font sizes. Colors are assigned based on frequency levels, with the same color indicating the same frequency level.

{{word_cloud:1}}

## Words - Bar

We visualized the most frequently used words and their occurrence counts as a bar chart.

{{word_bar_chart:1}}

# Word Combinations

We visualized the occurrence counts of word combinations that are used together as a bar chart.

{{word_pairs_bar_chart:1}}

# Co-occurrence Network

We visualized the relationships between words that are frequently used together using a network diagram. Words are displayed as nodes (points), and words that frequently appear together are connected by lines.

{{word_pair_network:0.75}}

**How to Read the Chart**

* Circle color: Words are grouped based on frequency of co-occurrence, and each group is assigned a "color".
* Circle size: Determined by the "occurrence frequency" of words. Higher frequency results in larger circles, while lower frequency results in smaller circles.
* Line thickness: Word combinations that are frequently used together are represented by thicker lines.

<% if (has_category) { %>
# Relationship Between Groups and Words

The following chart visualizes the proportion of occurrence frequency for each word by group. You can compare frequently used words in each group.

{{word_category_ratio_chart}}

<% } %>



# Additional Information

## Words - Count

Below you can check the occurrence count of each word in a visual table.

{start_lazy_show_hide}
### Table
{{word_count_table}}
{end_lazy_show_hide}

## Word Pairs - Count

Below you can check the occurrence count of each word pair in a visual table.

{start_lazy_show_hide}
### Table
{{word_pair_count_table}}
{end_lazy_show_hide}

## Words - Data

The following table allows you to check the words contained in each document (original text).

{start_lazy_show_hide}
### Table
{{word_data_table}}
{end_lazy_show_hide}



## Next Steps

* Stop word configuration: By excluding common auxiliary verbs like "できる" (can do) and "られる" (be able to), and common nouns like "方" (person/way) and "者" (person), you can focus on more meaningful words. You can register these words as "Stop Word Dictionary" from Analytics [Settings](//analytics/settings).
* Compound word registration: Words that are counted separately but actually refer to one concept, such as "Web" and "会議" (meeting), can be recognized as "Web会議" (web meeting) to improve analysis accuracy. You can also register this as "Compound Word Dictionary" from Analytics [Settings](//analytics/settings).
* Utilizing topic modeling: In addition to word frequency, using topic modeling may help discover hidden themes or topics within text. This might provide deeper insights that cannot be obtained from simple word counts alone.
`;

module.exports = template; 