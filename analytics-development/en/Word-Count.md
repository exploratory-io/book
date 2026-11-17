const template = `
# Summary

We performed word count analysis on the <%= text_column %> column.

Word count divides sentences into "words" and aggregates (quantifies) the frequency of each word, allowing you to grasp patterns and characteristics within the data.

# Frequent Words

## Word Cloud

We visualized word frequency using a chart called a "word cloud". Words with higher frequency are displayed with larger font sizes. Colors are assigned based on frequency levels, with the same color indicating the same frequency level.

{{word_cloud:1}}

## Words - Bar

We visualized the most frequently used words and their occurrence counts as a bar chart.

{{word_bar_chart:1}}

## Words - Table

Below, you can check the occurrence count of each word in a visual table.

{{word_count_table}}

# Word Combinations

The current range used to count word combinations is "<%= word_pair_method %>".
If you want to change the range used to count word combinations, you can change it from [Settings](//analytics/settings/word_pair).

**Within a Document**

Counts all word combinations that appear within the same document.
Even if two words appear far apart, they will be counted as a pair as long as they appear in the same document.

**Adjacent Words**

After removing stop words and other excluded words, counts only "adjacent word combinations".
Adjacency is determined after stop words (etc.) are removed, so even if words are far apart in the original text, they may be counted as adjacent after removal.

The "number of adjacent words before/after" setting specifies how many words ahead (after stop words etc. are removed) will be counted as pairs.

## Word Pairs - Bar

We visualized the occurrence counts of word pairs that are used together as a bar chart.

{{word_pairs_bar_chart:1}}

## Word Pairs - Table

Below, you can check the occurrence count of each word pair in a visual table.

{{word_pair_count_table}}

<% if (has_category) { %>
# Group & Word Relationships

The following chart visualizes the proportion of occurrence frequency for each word by group. You can compare frequently used words in each group.

{{word_category_ratio_chart}}

<% } %>

# Co-occurrence Network

We visualized the relationships between words that are frequently used together using a network diagram. Words are displayed as nodes (points), and words that frequently appear together are connected by lines.

{{word_pair_network:0.75}}

**How to Read the Chart**

* Circle color: Words are grouped based on frequency of co-occurrence, and each group is assigned a "color".
* Circle size: Determined by the "occurrence frequency" of words. Higher frequency results in larger circles, while lower frequency results in smaller circles.
* Line thickness: Word combinations that are frequently used together are represented by thicker lines.

# Data

The following data adds group IDs to each data based on the co-occurrence network information above.

{{table_full}}


# Appendix

## Words - Data

The following table allows you to check the words contained in each document (original text).

{start_lazy_show_hide}
### Table
{{word_data_table}}
{end_lazy_show_hide}


## Next Steps

* Stop word configuration: By excluding very common words (e.g., auxiliary verbs) from analysis, you can focus on more meaningful words. You can register them as a "Stop Word Dictionary" from Analytics [Settings](//analytics/settings/stop_words).
* Compound word registration: Words that are counted separately but actually refer to one concept (e.g., "Web" + "meeting") can be recognized as a single term (e.g., "web meeting") to improve analysis accuracy. You can register them as a "Compound Word Dictionary" from Analytics [Settings](//analytics/settings/compound_words).
* Utilizing topic modeling: In addition to word frequency, using topic modeling may help discover hidden themes or topics within text. This might provide deeper insights that cannot be obtained from simple word counts alone.
`;

module.exports = template;