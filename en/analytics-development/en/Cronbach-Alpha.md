const template = `

# Summary

Reliability analysis was conducted on the following <%= num_variables %> items to measure how consistently they capture the same underlying concept.

<%= variables.map(variable => '- ' + variable.name).join('\\n') %>

{{summary}}

The **<%= coefficient_name %>** is <%= alpha_value %>, which indicates **<%= alpha_label %>** internal consistency. Combining or averaging these items into a single scale score is generally <% if (alpha_acceptable) { %>reasonable<% } else { %>worth reconsidering<% } %>.

<%= (has_flagged ? 'Note that **"' + flagged_item + '"** is relatively weakly related to the other items; ' + (flagged_alpha_value ? 'dropping it would raise alpha to ' + flagged_alpha_value + ',' : 'dropping it would raise alpha,') + ' so it may be measuring a somewhat different aspect.' : '') %>

# Alpha Guidelines

<div markdown="1" class="markdown-spec-table">

| Alpha | Interpretation |
| :--- | :--- |
| 0.90 or higher | Very high consistency |
| 0.80–0.90 | High consistency |
| 0.70–0.80 | Acceptable consistency |
| 0.60–0.70 | Somewhat low consistency |
| Below 0.60 | Low consistency |

</div>

**Selected Correlation Type and Reason**

{{correlation_method}}

# Alpha if Each Item Is Dropped

This shows how the overall alpha would change if each item were removed. Items whose removal **raises the alpha above the current value of <%= alpha_value %>** may be lowering the consistency of the scale.

{{alpha_dropped_bar}}

<%= (has_alpha_increasing_items ? alpha_increasing_items.map(item => '- Removing "' + item.name + '" raises alpha from ' + alpha_value + ' to ' + item.alpha + '.').join('\\n') + '\\n\\nThis suggests that these items may be measuring somewhat different content from the other items.' : '') %>

{{alpha_dropped_table}}

When removing an item lowers alpha below its current value, that item contributes to the overall consistency of the scale.

The greater the decrease in alpha after removal, the more strongly that item contributes to the scale's consistency.

# Correlations

## Item-Total Correlations

The following shows how strongly each item relates to the total scale. The total score is the sum of all items. The main measure to examine is the \`Item-Rest Correlation\`, the correlation between an item and the sum score of the remaining items.

{{item_stats}}

## Inter-item Correlations

{{correlation_matrix}}

If some items have weak correlations with the other items, reconsider whether they belong in the same scale.

# Response Distribution

The distribution of responses for each item. Differences in distribution can affect the inter-item correlations and the alpha.

{{response_dist}}

# Recommendations

This compares alpha when using all items with alpha after dropping items that raise it.

{{scale_candidates}}

Creating a scale score from all items is possible, but a subset may have higher internal consistency. Whether to drop an item should be decided based not only on the statistics but also on the analytical purpose and the meaning of the questions.

`;

module.exports = template;
