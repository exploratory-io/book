const template = `
# Analysis Results

<% if (!repeat_by) { %>

We examined whether the difference in medians of <%= target %> by <%= explanatory %> is significant.

<% if (p > baseline_p) { %>
As a result, the P-value is <%= p_pct %>% (<%= p %>), which is greater than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>). Therefore, the difference in medians of <%= target %> by <%= explanatory %> is not statistically significant.
<% } %>

<% if (p <= baseline_p) { %>
As a result, the P-value is <%= p_pct %>% (<%= p %>), which is lower than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>). Therefore, the difference in medians of <%= target %> by <%= explanatory %> is statistically significant.

  <% if (effect_size < 0.06) { %>
The effect size (Eta squared) is <%= effect_size_pct %>%, which is low, indicating that the difference in medians of <%= target %> by <%= explanatory %> is small.
  <% } else if (effect_size < 0.14) { %>
The effect size (Eta squared) is <%= effect_size_pct %>%, so the difference in medians of <%= target %> by <%= explanatory %> is moderate.
  <% } else { %>
The effect size (Eta squared) is also <%= effect_size_pct %>%, which is large, indicating that the difference in medians of <%= target %> by <%= explanatory %> is substantial.
  <% } %>
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
## Key Statistical Indicators

* H-value
  * The H-value is the test statistic for the Kruskal-Wallis test, which quantifies the difference between groups based on ranks.
  * It takes values of 0 or higher, and larger values indicate greater differences between groups.
  * It should be interpreted together with degrees of freedom; larger H-values indicate a higher possibility of meaningful differences between groups.

* P-value
  * The P-value indicates the probability that observed data is as extreme or more extreme than what would be expected under the null hypothesis (no difference between groups).
  * Generally, values less than 5% (0.05) are considered statistically significant.
  * Values range from 0 to 1, with smaller P-values indicating higher statistical significance.

* Degrees of Freedom
  * The degrees of freedom for the Kruskal-Wallis test is calculated as "number of groups - 1".
  * It always takes positive integer values and is used together with the H-value to determine the significance of the test.
  * The larger the degrees of freedom, the lower the significance tends to be for the same H-value.

* Eta Squared
  * Eta squared is an effect size measure for non-parametric tests, indicating the proportion of rank variation explained by groups.
  * Values range from 0 to 1, where 0 indicates no effect and 1 indicates that all variation can be explained by group differences.
  * Generally, 0.01 is considered a small effect, 0.06 a medium effect, and 0.14 or higher a large effect.

* Epsilon Squared
  * Epsilon squared is another effect size measure for the Kruskal-Wallis test, which is a corrected version of Eta squared.
  * Values range from 0 to 1, generally showing smaller values than Eta squared.
  * It is less affected by sample size, making it suitable for comparisons between different studies.

* Number of Rows
  * Number of rows is the amount of data (sample size) used in the analysis.
  * The more data there is, the easier it becomes to detect small differences, and the reliability of results increases.
  * The Kruskal-Wallis test does not assume normal distribution, so it can be used even with outliers or small sample sizes, but it is recommended to have at least 5 data points in each group.

{end_show_hide}

# Significance

Significance can be determined by the P-value.

## P-value

The null hypothesis for this test is "there is no difference in medians of <%= target %> between multiple groups of <%= explanatory %>".

<% if (!repeat_by) { %>

<% if (p > baseline_p) { %>
As a result of the test, the P-value is <%= p_pct %>% (<%= p %>), which means that if the null hypothesis is correct, the probability of obtaining the Kruskal-Wallis test statistic value (H-value: <%= h_value %>) observed in this data by chance is approximately <%= p_pct %>%. Since this is greater than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), we cannot reject the null hypothesis. Therefore, the difference in medians of <%= target %> by <%= explanatory %> is not statistically significant.
<% } %>

<% if (p <= baseline_p) { %>
As a result of the test, the P-value is <%= p_pct %>% (<%= p %>), which means that if the null hypothesis is correct, the probability of obtaining the Kruskal-Wallis test statistic value (H-value: <%= h_value %>) observed in this data by chance is approximately <%= p_pct %>%. Since the significance level is <%= baseline_p_pct %>% (<%= baseline_p %>) or lower, we can reject the null hypothesis. Therefore, the difference in medians of <%= target %> by <%= explanatory %> is statistically significant.
<% } %>

The following chart visualizes where the P-value (blue dotted line) is positioned in the H-distribution (Kruskal-Wallis distribution). Since the H-distribution is a right-tailed test, the right-side area represents the (null hypothesis) rejection region.

<% } else { %>

If the null hypothesis is correct, the P-value is the probability that an H-value as observed in this data or higher could occur by chance. If it is greater than the significance level of <%= baseline_p_pct %>%, we cannot reject the null hypothesis, so it is not statistically significant. Conversely, if it is <%= baseline_p_pct %>% or lower, we can reject the null hypothesis, so it is statistically significant.

The following chart visualizes where the P-value (blue dotted line) is positioned in the H-distribution (Kruskal-Wallis distribution) for each <%= repeat_by %>. Since the H-distribution is a right-tailed test, the right-side area represents the (null hypothesis) rejection region.

{{probability_dist}}

The current significance level (P-value) is set to <%= baseline_p_pct %>% (<%= baseline_p %>), but this can be changed in Analytics [Settings](//analytics/settings).

<% } %>

# Effect Size

Statistical significance (P-value) can sometimes determine "significance" even for small differences when sample size is large, so the actual magnitude of the effect can be evaluated based on effect size. In this test, Eta squared, which is one of the effect size measures, is calculated. This is the ratio of the variance in the mean values of <%= target %> by <%= explanatory %> to the overall variance.

The guidelines for judging the magnitude of effect size (Eta squared) are as follows:

| Effect Size Value | Effect Size Magnitude |
|-------------------|----------------------|
| 0.01 | Small effect |
| 0.06 | Medium effect |
| 0.14 | Large effect |

<% if (!repeat_by) { %>

<% if (p > baseline_p) { %>
Effect size needs attention when test results are judged significant, but since this result is not significant, there is no particular need for attention.
<% } %>

<% if (p <= baseline_p) { %>
Since this test result can be judged as significant, attention to effect size is necessary.
<% } %>

<% } else { %>

Effect size needs attention when test results are judged significant. If not significant, there is no particular need for attention.

<% } %>

# Multiple Comparisons

<% if (!repeat_by) { %>

<% if (p > baseline_p) { %>
Multiple comparison analysis is for examining which combinations of groups in <%= explanatory %> show significant differences in medians of <%= target %>. Since the overall difference in medians of <%= target %> by <%= explanatory %> is not significant, there is no need to perform multiple comparison analysis, but here are the results for reference.

The combinations where the P-value is 5% or lower have statistically significant differences in medians of <%= target %>.

{{comparison}}

<% } %>

<% if (p <= baseline_p) { %>

Overall, the difference in medians of <%= target %> by <%= explanatory %> was significant. Therefore, as a multiple comparison analysis, we examined which combinations of groups in <%= explanatory %> show significant differences in medians of <%= target %>. When performing similar tests repeatedly for multiple comparisons, the probability of incorrectly judging as significant when it is actually not significant (Type I error) increases. The test results are corrected using <%= correction %> correction to control the Type I error probability within expected limits.

The combinations where the P-value is 5% or lower have statistically significant differences in medians of <%= target %>.

{{comparison}}

<% } %>

<% } else { %>

Multiple comparison analysis is for examining which combinations of groups in <%= explanatory %> show significant differences in medians of <%= target %>. When performing similar tests repeatedly for multiple comparisons, the probability of incorrectly judging as significant when it is actually not significant (Type I error) increases. Therefore, the test results are corrected using <%= correction %> correction to control the Type I error probability.

With a significance level of 5%, combinations with P-values smaller than that value are statistically significant.

{{comparison}}

<% } %>

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