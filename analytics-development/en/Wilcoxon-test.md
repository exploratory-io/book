const template = `
# Analysis Results

<% if (!repeat_by) { %>

We examined whether the difference in medians of <%= target %> by <%= explanatory %> is significant.

{{summary}}

<% if (p > baseline_p) { %>
  As a result, the P-value is <%= p_pct %>% (<%= p %>), which is greater than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>). Therefore, the difference in medians of <%= target %> by <%= explanatory %> is not statistically significant.
<% } %>

<% if (p <= baseline_p) { %>
  As a result, the P-value is <%= p_pct %>% (<%= p %>), which is lower than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>). Therefore, the difference in medians of <%= target %> by <%= explanatory %> is statistically significant.
<% } %>

<% } else { %>

We examined whether the difference in medians of <%= target %> by <%= explanatory %> is significant for each <%= repeat_by %>.

{{summary}}

<% if (groups.some(group => group.p <= baseline_p)) { %>
In the following groups, the P-value is lower than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), so they are statistically significant:
  <% groups.forEach(group => { %>
    <% if (group.p <= baseline_p) { %>
* <%= group.name %>
    <% } %>
  <% }); %>
<% } %>
<% if (groups.some(group => group.p > baseline_p)) { %>
In the following groups, the P-value is higher than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), so they are not statistically significant:
  <% groups.forEach(group => { %>
    <% if (group.p > baseline_p) { %>
* <%= group.name %>
    <% } %>
  <% }); %>
<% } %>


<% } %>

The significance level (P-value) for this test is set to <%= baseline_p_pct %>% (<%= baseline_p %>), but this can be changed in Analytics [Settings](//analytics/settings).

{start_show_hide}
## Statistical Indicator Explanations

* U-value
  * The U-value is the test statistic for the Wilcoxon rank-sum test (also called the Mann-Whitney U test), which quantifies the difference in ranks between two groups.
  * When the U-value is extremely small or large, it indicates a difference in rank distributions between the two groups. However, specific criteria depend on sample size.

* P-value
  * The P-value indicates the probability that observed data is as extreme or more extreme than what would be expected under the null hypothesis (no difference between two groups).
  * Generally, values less than 5% (0.05) are considered statistically significant.
  * Values range from 0 to 1, with smaller P-values indicating higher statistical significance.

* Base Level
  * Base level indicates the group that serves as the reference for comparison.
  * In the Wilcoxon test, it becomes the reference point when determining which group has higher (or lower) ranks.

* Number of Rows
  * Number of rows is the total amount of data (sample size) used in the analysis.
  * For the Wilcoxon test, the number of rows in each group is also important, as these values affect the interpretation of the U-value.
  * Generally, having 10 or more samples in each group improves test accuracy, but it can be performed with smaller samples.
{end_show_hide}

# Significance

Significance can be determined by the P-value.

## Significance - P-value

The null hypothesis for this test is "there is no difference in medians of <%= target %> between <%= group_a %> and <%= group_b %>".

<% if (!repeat_by) { %>

<% if (p > baseline_p) { %>
  As a result of the test, the P-value is <%= p_pct %>% (<%= p %>). This means that if the null hypothesis is correct, the probability of obtaining the Wilcoxon statistic value (U-value: <%= u_value %>) observed in this data by chance is approximately <%= p_pct %>%. Since the significance level is <%= baseline_p_pct %>% (<%= baseline_p %>), this probability is sufficiently high, so we cannot reject the null hypothesis. Therefore, the difference in medians of <%= target %> by <%= explanatory %> is not statistically significant.
<% } %>

<% if (p <= baseline_p) { %>
  As a result of the test, the P-value is <%= p_pct %>% (<%= p %>). This means that if the null hypothesis is correct, the probability of obtaining the Wilcoxon statistic value (U-value: <%= u_value %>) observed in this data by chance is only approximately <%= p_pct %>%. Since the significance level is <%= baseline_p_pct %>% (<%= baseline_p %>), this probability is sufficiently low, so we can reject the null hypothesis. Therefore, the difference in medians of <%= target %> by <%= explanatory %> is statistically significant.
<% } %>

The following chart visualizes where the P-value (blue dotted line) is positioned in the U-distribution. The light blue area represents the (null hypothesis) rejection region.

<% } else { %>

If the null hypothesis is correct, the P-value is the probability that a U-value as observed in this data or greater difference could occur by chance. If it is greater than the significance level of <%= baseline_p_pct %>%, we cannot reject the null hypothesis, so it is not statistically significant. Conversely, if it is <%= baseline_p_pct %>% or lower, we can reject the null hypothesis, so it is statistically significant.

The following chart visualizes where the P-value (blue dotted line) is positioned in the U-distribution for each <%= repeat_by %>. The light blue area represents the (null hypothesis) rejection region.

<% } %>

{{probability_chart}}

The current significance level (P-value) is set to <%= baseline_p_pct %>% (<%= baseline_p %>), but this can be changed in Analytics [Settings](//analytics/settings).

# Descriptive Statistics

## Statistics

The statistical values for each group are as follows:

{{statistics}}

## Data Distribution

The following visualizes the difference in distribution of <%= target %> by <%= explanatory %> using density curves.

{start_lazy_show_hide}
### Chart
{{distribution}}
{end_lazy_show_hide}

## Confidence Intervals for Means

The following visualizes the confidence intervals for means of each group using error bars.

{start_lazy_show_hide}
### Chart
{{mean}}
{end_lazy_show_hide}

# Additional Information

## Next Steps

* This time we analyzed the impact of one variable, <%= explanatory %>, on <%= target %>. However, other variables may also influence <%= target %>. Therefore, you can perform multivariate analysis using "Linear Regression" etc., to consider multiple factors simultaneously.
<% if (!repeat_by) { %>
* This test was performed on the overall data, but it can also be conducted by dividing into groups. In that case, you can select a grouping variable for "Repeat by" and re-run the analysis.
<% } %>
* If you want to test multiple indicators in batch, it is possible by changing the data format. For details, please refer to [this note](https://exploratory.io/note/exploratory/mxW2zKb2).

`;
module.exports = template; 