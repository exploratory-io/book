const template = `
<% var isCA = (typeof analysis_type !== 'undefined' && analysis_type === 'CA'); %>
<% var methodName = isCA ? 'Correspondence Analysis' : 'Multiple Correspondence Analysis'; %>
<% var isOneDim = (typeof n_dims !== 'undefined' && n_dims !== null && Number(n_dims) === 1); %>
<% var _alpha = (typeof alpha !== 'undefined' && alpha !== null && alpha !== '') ? alpha : 0.05; %>

# Summary

We ran <%= methodName %> to explore the relationships <% if (isCA) { %>between<% } else { %>among the categories within<% } %> the following categorical variables.

<% if (typeof variables !== 'undefined' && variables && variables.length > 0) { variables.forEach(function(v){ %>
- <%= (typeof v === 'object' && v.name) ? v.name : v %>
<% }); } %>

<% if (isCA) { %>Correspondence Analysis summarizes the relationships between the categories of two categorical variables into a small number of dimensions and visualizes them. By comparing the distribution pattern of each category, you can explore which categories are distinctive and which category combinations may be related.<% } else { %>Multiple Correspondence Analysis summarizes the relationships among the categories within several categorical variables into a small number of dimensions and analyzes them. You can grasp the associations among categories and the major category patterns present in the data.<% } %>

<% if (typeof main_variables !== 'undefined' && main_variables) { %>The variables that contribute most to Dimensions 1 and 2 are <%= String(main_variables).split(',').map(function(v){ return v.trim(); }).join(' and ') %>. <% } %><% if (typeof cumulative_1_2 !== 'undefined' && cumulative_1_2 !== null) { %>Together, Dimensions 1 and 2 represent <%= cumulative_1_2 %>% of the relationships among the categories.<% } %>

{{analysis_summary_table}}

# Relationships Between Variables

<% if (typeof associated_pair_labels !== 'undefined' && associated_pair_labels && associated_pair_labels.length > 0) { %>A statistically clear association was found between <%= associated_pair_labels.join(', ') %>.<% if (typeof unclear_pair_count !== 'undefined' && unclear_pair_count > 0) { %> No clear statistical association was found for the other variable pairs.<% } %><% } else if (typeof total_pair_count !== 'undefined' && total_pair_count > 0) { %>No clear statistical association was found among the variable pairs.<% } %>

{{association_table}}

* Because multiple variable pairs are tested at once, chance findings become more likely, so the adjusted P Value is corrected using the Holm method. The correction method can be changed in Settings.
* The judgement of statistical association uses the adjusted P Value. The significance level is α = <%= _alpha %>. It can be changed in Settings.
* Cramér's V expresses the strength of the association between variables on a 0 to 1 scale. The strength is classified as "Negligible," "Weak," "Moderate," or "Strong" using a criterion that accounts for the number of categories in the cross tabulation.

{start_show_hide}

## Judgement Guidelines

**Statistical Association:**

| Condition | Judgement |
|---|---|
| Adjusted P Value is missing | Cannot be judged |
| Adjusted P Value < <%= _alpha %> | Yes |
| Adjusted P Value ≥ <%= _alpha %> | Not clear |

**Association Strength:**

| Condition | Strength |
|---|---|
| Cramér's V is missing | Cannot be judged |
| \\\\(V < 0.10/\\sqrt{k}\\\\) | Negligible |
| \\\\(0.10/\\sqrt{k} \\le V < 0.30/\\sqrt{k}\\\\) | Weak |
| \\\\(0.30/\\sqrt{k} \\le V < 0.50/\\sqrt{k}\\\\) | Moderate |
| \\\\(V \\ge 0.50/\\sqrt{k}\\\\) | Strong |

\\\\(k\\\\) is computed as follows.

\\\\[ k = \\min(\\text{row categories} - 1,\\ \\text{column categories} - 1) \\\\]

{end_show_hide}

<% if (typeof sparse_warning !== 'undefined' && sparse_warning) { %>
For some category combinations the expected counts are small, so the chi-square approximation may be unstable. Consider merging low-frequency categories.
<% } %>

# Category Relationships

## 2D Map

The categories of the selected variables are placed in the same 2D space, representing the relationships and distinctive patterns among the categories.

{{category_plot}}

<% if (isOneDim) { %>One of the selected variables has only 2 categories, so this correspondence analysis produces only a single dimension (Dimension 1). Since Dimension 2 does not exist, each category's Y position in the chart above is shown as 0 for display purposes. Use the horizontal position and distance along the X axis to interpret the relationships between categories.

This does not mean any information was lost. The association pattern of a 2-category variable can be fully expressed along a single axis, and that information is captured entirely in Dimension 1.

<% } %>**How to read this chart:**

* The farther a category is from the origin, the more it differs from the general pattern of the overall data.
* Categories of different variables positioned in the same direction may share a similar tendency. Categories positioned in opposite directions may show a contrasting tendency.
* The distance between categories of the same variable does not represent the strength of a direct association.
* Being close together on the chart alone does not mean the association is statistically significant.
<% if (typeof cumulative_1_2 !== 'undefined' && cumulative_1_2 !== null) { %>* This map represents <%= cumulative_1_2 %>% of the relationships between categories, via Dimension 1 and Dimension 2.
<% } %>* When interpreting a category's position, also check the "2D map representation quality," the sum of that category's Dimension 1 and Dimension 2 representation quality (cos²) in the table below. A higher value means the category's characteristics are better represented on this map.

## Characteristics of Each Dimension

The table below summarizes the main categories that characterize each dimension. By comparing the categories that characterize the positive and negative sides of each dimension, you can see the contrasting tendency the dimension represents.

The positive and negative directions have no fixed meaning on their own; interpret each dimension from the difference between the categories on each side. The main categories shown here are those with both a large contribution to the dimension (high contribution) and relatively good representation on that dimension (high representation quality).

{{dimension_summary_table}}

## Explained Rate by Dimension

The chart below shows how much each dimension represents the differences included in the relationships between categories. The bars show each dimension's own explained rate, and the line shows the cumulative explained rate up to that dimension.

{{contribution_chart}}

<% if (typeof cumulative_1_2 !== 'undefined' && cumulative_1_2 !== null) { %>Dimensions 1 and 2 together explain <%= cumulative_1_2 %>% of the structure. The 2D map uses this <%= cumulative_1_2 %>% of information to represent the relationships between categories. The remaining <%= (100 - cumulative_1_2).toFixed(1) %>% is contained in Dimension 3 and beyond, so interpret the 2D map as representing only part of the relationships between categories.<% } %>

<% if (!isCA) { %>In Multiple Correspondence Analysis, the more variables and categories there are, the more the relationships between categories tend to be spread across dimensions. As a result, it is not uncommon for the combined explained rate of Dimensions 1 and 2 alone to be low. If the cumulative explained rate is low, also review the results for Dimension 3 and beyond in "Dimension and Category Relationships".<% } %>

## Dimension and Category Relationships

The table below shows each category's coordinate, contribution to the dimension, and representation quality (cos²), per dimension.

By comparing the categories on the positive and negative sides of the coordinate, you can see the contrasting tendency the dimension represents. The higher a category's contribution, the more important it is in forming that dimension. The higher the representation quality (cos²), the better that category's characteristics are represented on that dimension.

{{dimension_matrix_table}}

By adding together a category's Dimension 1 and Dimension 2 cos², you can see how well that category's characteristics are represented on the 2D map. The value ranges from 0 to 1; the closer to 1, the better the category's characteristics are represented on the 2D map. For example, if a category's Dimension 1 cos² is 0.21 and its Dimension 2 cos² is 0.22, the 2D map representation quality is 0.43 -- meaning 43% of that category's characteristics are represented by Dimension 1 and Dimension 2 together.

## Metric Descriptions

### Coordinate

Where a category sits on each dimension. The sign has no fixed meaning, so use it to check the relative position against other categories on the same dimension.

### Contribution

How much a category contributes to forming each dimension. Contributions within a dimension sum to 100%. A category whose contribution exceeds the average contribution (100% ÷ total number of categories) is comparatively important in characterizing that dimension.

### cos² (representation quality)

How well a category's characteristics are represented by each dimension. It ranges from 0 to 1; the larger the value, the better that category's characteristics are represented on that dimension.

| cos² | Interpretation |
| --- | --- |
| 0.70 or above | Well represented |
| 0.40 to below 0.70 | Fairly well represented |
| 0.20 to below 0.40 | Partially represented |
| Below 0.20 | Interpretation on this dimension alone is limited |

## Bias by Category Combination

For each variable pair's category combination, this compares the observed count with the count expected if the two variables were not related.

The table is sorted in descending order of the absolute adjusted standardized residual. The combinations near the top show the clearest sign of the observed count being more or less than the expected count.

Reviewing the observed count, expected count, and observed/expected ratio together shows the direction and size of the bias.

{{featured_table}}

Testing many category combinations at once increases the chance of a result being significant by chance, so the judgement uses the \`Adjusted P Value\`, corrected with the Holm method. The significance level is <%= _alpha %>. The judgement indicates statistical significance, not the practical size of the bias.

The chi-square test, which evaluates the association across the whole variable pair, and the tests for individual category combinations look at different things. As a result, a combination can show a bias even when no clear overall association is found for the variable pair. In that case, interpret it as a local, exploratory tendency.
<% if (typeof sparse_expected_count_warning !== 'undefined' && sparse_expected_count_warning) { %>
For some combinations, the expected counts are small, so the precision of the p-value may be lower. For those results, also check the observed counts and adjusted standardized residuals, and interpret them as an exploratory tendency.
<% } %>

## Adjusted Standardized Residuals

For each category combination, this shows how far the observed count deviates from the count expected if the two variables were not related, expressed as an adjusted standardized residual. Positive values indicate more than expected; negative values indicate fewer than expected. The larger the absolute value, the greater the deviation from the expected count.

{{residual_heatmap}}

**How to read the colors:**

| Condition | Color | Meaning |
|---|---|---|
| Residual ≥ 3 | Dark blue | Far more than expected |
| 2 ≤ Residual < 3 | Medium blue | More than expected |
| 0 < Residual < 2 | Light blue | Slightly more than expected |
| Residual = 0 | Gray | Same as the expected count |
| -2 < Residual < 0 | Light red | Slightly fewer than expected |
| -3 < Residual ≤ -2 | Medium red | Fewer than expected |
| Residual ≤ -3 | Dark red | Far fewer than expected |

±2 and ±3 are guidelines for gauging the size of the deviation from the expected count.

## Category Combination Counts and Proportions

For each variable pair, this table shows the row counts and proportions by category.

{{proportion_table}}

## Category Combination Proportions (Chart)

This shows how the categories of one variable are distributed within each category of the other, as 100% stacked horizontal bars (the horizontal axis is the proportion, %). Use the "Variable Pair" dropdown above the chart to switch which pair of variables is displayed. Comparing the bar segments lets you see how much the distribution pattern differs across categories.

{{proportion_chart}}

# Detailed Data

## Detailed Dimension and Category Metrics

The table below shows detailed results — coordinate, contribution, representation quality, count, and more — for every category and dimension in the analysis.

{{category_details_table}}

## Data with Dimension Scores

The table below adds each dimension's score, computed by <%= methodName %>, to the original data. You can use the dimension scores to compare observations by other attributes, visualize them in charts, or feed them into another analysis method.

{{data}}
`;

module.exports = template;
