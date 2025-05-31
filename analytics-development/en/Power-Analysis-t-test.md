const template = `
# Power Analysis - t-Test

Power analysis is a method for calculating the required sample size to detect a meaningful effect in statistical testing.

## Summary

{{summary}}

Based on the results of this power analysis, the required sample size is estimated to be **<%= sample_size %>**.

The main statistical indicators calculated based on the set parameters are displayed. The following information can be confirmed here:

* Type 1 Error
  * Type 1 error is the probability of incorrectly concluding that there is an effect when there is actually no effect.
  * It is generally set to 0.05 (5%).

* Type 2 Error
  * Type 2 error is the probability of incorrectly concluding that there is no effect when there is actually an effect.
  * It is generally desirable to be 0.2 (20%) or less.

* Power
  * Power is the probability of correctly detecting an effect when there is actually one.
  * It is generally desirable to be 0.8 (80%) or more.
  * Power = 1 - Type 2 Error.

* Effect Size (Cohen's D)
  * Cohen's D is an indicator of effect size, calculated by dividing the difference between group means by the data variability (standard deviation).
  * A value of 0.2 is interpreted as a "small effect", 0.5 as a "medium effect", and 0.8 or more as a "large effect".
  * The smaller the effect size, the larger the sample size required to achieve the same power.

* Required Sample Size
  * This is the number of samples required to achieve the specified effect size, Type 1 error, and power.
  * The smaller the effect size and the higher the desired power, the more samples are required.

## Probability Distribution

The following chart shows the probability distributions for the null hypothesis (no effect) and the alternative hypothesis (specified effect size).

{{probability_chart}}

- The blue curve represents the distribution of the null hypothesis (no effect).
- The orange curve represents the distribution of the alternative hypothesis (with the specified effect size).

The blue filled area to the right of the blue curve of the null hypothesis distribution (the area to the right of the significance level) represents the Type 1 error. This is the probability of incorrectly concluding that there is an effect when there is actually no effect.

The orange filled area to the left of the orange curve of the alternative hypothesis distribution (the area to the left of the significance level) represents the Type 2 error. This is the probability of incorrectly concluding that there is no effect when there is actually an effect.


## Sample Size Simulation

The following is a line chart showing the relationship between sample size and power.

{{sample_size_chart}}

The horizontal axis (X-axis) represents the sample size, and the vertical axis (Y-axis) represents the power. It can be seen that as the sample size increases, the power (the probability of correctly detecting an effect when there is actually one) increases. It is also possible to estimate the sample size required to achieve a specific power with the specified effect size and significance level.

# Summary

<% if (!repeat_by) { %>

We examined whether the difference in means of <%= target %> by <%= explanatory %> is significant.

{{summary}}

<% if (p > baseline_p) { %>
As a result, the P-value is **<%= p_pct %>% (<%= p %>)**, which is greater than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), so the difference in means of <%= target %> by <%= explanatory %> is not statistically significant.

  <% if (power < 0.5) { %>
However, the power is low at <%= power_pct %>% (<%= power %>). If there was actually a difference, the probability of overlooking it (Type 2 error) is very high at <%= type2_error_pct %>% (<%= type2_error %>), so caution is required.
  <% } else { %>
However, the power is relatively low at <%= power_pct %>% (<%= power %>). If there was actually a difference, the probability of overlooking it (Type 2 error) is <%= type2_error_pct %>% (<%= type2_error %>), so caution is required.
  <% } %>
<% } %>

<% if (p <= baseline_p) { %>
As a result, the P-value is **<%= p_pct %>% (<%= p %>)**, which is lower than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), so the difference in means of <%= target %> by <%= explanatory %> is statistically significant.

  <% if (effect_size < 0.2) { %>
The effect size is low at <%= effect_size %>, and the difference in means of <%= target %> by <%= explanatory %> is small.
  <% } else if (effect_size < 0.8) { %>
The effect size is <%= effect_size %>, so the difference in means of <%= target %> by <%= explanatory %> is moderate.
  <% } else { %>
The effect size is large at <%= effect_size %>, and the difference in means of <%= target %> by <%= explanatory %> can be said to be large.
  <% } %>
<% } %>


<% } else { %>

We examined whether the difference in means of <%= target %> by <%= explanatory %> is significant for each <%= repeat_by %>.

{{summary}}

<% if (groups.some(group => group.p <= baseline_p)) { %>
For the following groups, the P-value is lower than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), so they can be said to be statistically significant.
  <% groups.forEach(group => { %>
    <% if (group.p <= baseline_p) { %>
* <%= group.name %>
    <% } %>
  <% }); %>
<% } %>
<% if (groups.some(group => group.p > baseline_p)) { %>
For the following groups, the P-value is higher than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), so they cannot be said to be statistically significant.
  <% groups.forEach(group => { %>
    <% if (group.p > baseline_p) { %>
* <%= group.name %>
    <% } %>
  <% }); %>
<% } %>


<% } %>

The significance level (P-value) for this test is set to <%= baseline_p_pct %>% (<%= baseline_p %>), but this can be changed from [Settings](//analytics/settings) in Analytics.

{start_show_hide}
## Statistical Indicators Explanation

* t-value
  * The t-value is a statistic that indicates whether the difference between two mean values is due to chance or if they are truly different. It is the value obtained by dividing the difference in means of the current data by the standard error.
  * A larger absolute value indicates a higher possibility that the difference in means is not due to chance. Generally, a difference with an absolute value of 2 or more is considered meaningful.

* P-value
  * The P-value indicates the probability of observing data as extreme as, or more extreme than, what was observed, assuming the null hypothesis (no difference between groups) is true.
  * Generally, if it is less than 5% (0.05), it is judged to be statistically significant.
  * Values range from 0 to 1, and smaller P-values indicate higher statistical significance.

* Degrees of Freedom
  * In the t-test, degrees of freedom represent the number of independent variations the data can take. It is generally calculated as "total sample size - number of groups".
  * It always takes positive integer values, and a larger value increases the precision of the test.
  * As the degrees of freedom increase, the t-distribution approaches the normal distribution.

* Difference
  * Difference represents the difference in mean values between the two groups being compared.
  * The value of the difference itself varies depending on the unit of measurement. A positive value indicates that the mean of the first group is higher, and a negative value indicates that the mean of the second group is higher.
  * It is important to interpret the magnitude of the difference together with the confidence interval and P-value.

* Lower Confidence Interval
  * The lower confidence interval indicates the lower bound of the statistically estimated difference in mean values.
  * The probability of the actual difference being lower than this value is less than half (2.5%) of the set confidence level (usually 95%).

* Upper Confidence Interval
  * The upper confidence interval indicates the upper bound of the statistically estimated difference in mean values.
  * The probability of the actual difference being higher than this value is less than half (2.5%) of the set confidence level (usually 95%).
  * A wider confidence interval indicates lower precision of the estimation, and a narrower interval indicates higher precision.
  * If the confidence interval does not include 0 (the lower bound is positive or the upper bound is negative), it can be judged that there is a statistically significant difference.

* Base Level
  * Base level indicates the group or condition used as the reference for comparison.
  * The difference and effect size are expressed as relative values compared to this base level.

* Cohen's D
  * Cohen's D is an indicator of effect size, calculated by dividing the difference in mean values between groups by the data variability (standard deviation).
  * A value of 0.2 is interpreted as a "small effect", 0.5 as a "medium effect", and 0.8 or more as a "large effect".

* Power
  * Power represents the probability of correctly detecting an effect when there is actually a difference in the means of <%= target %> due to <%= explanatory %>.
  * Values range from 0 to 1, and generally 0.8 (80%) or more is desirable.
  * A low power indicates that there is a possibility of overlooking an actually existing effect.

* Type 2 Error
  * Type 2 error is the probability of incorrectly concluding that there is no effect when there is actually an effect.
  * Values range from 0 to 1, and Power = 1 - Type 2 Error.
  * It is generally desirable to be 0.2 (20%) or less.

* Number of Rows
  * The number of rows indicates the total number of data points (sample size) used in the analysis.
  * A larger sample size increases the power of the statistical test and improves the reliability of the results.
  * The required sample size varies depending on the type of test and the effect size.
{end_show_hide}

# Significance

Significance can be determined by either the P-value or the confidence interval. Both will yield the same result.

## Significance - P-value

The null hypothesis for this test is that there is no difference in the means of <%= target %> between <%= group_a %> and <%= group_b %>.

<% if (!repeat_by) { %>

<% if (p > baseline_p) { %>
As a result of the test, the P-value is <%= p_pct %>% (<%= p %>). This means that if the null hypothesis were true, the probability of observing a difference like <%= mean_diff %> or greater by chance in the current data would be approximately <%= p_pct %>%. Since it is greater than the significance level of <%= baseline_p_pct %>%, we cannot reject the null hypothesis. Therefore, the difference in <%= target %> due to <%= explanatory %> cannot be said to be statistically significant.
<% } %>

<% if (p <= baseline_p) { %>
As a result of the test, the P-value is <%= p_pct %>% (<%= p %>). This means that if the null hypothesis were true, the probability of observing a difference like <%= mean_diff %> or greater by chance in the current data would be only about <%= p_pct %>%. Since it is less than or equal to the significance level of <%= baseline_p_pct %>%, we can reject the null hypothesis. Therefore, the difference in <%= target %> due to <%= explanatory %> can be said to be statistically significant.
<% } %>

The following chart visualizes where the P-value (blue dotted line) is located within the t-distribution, which is a probability distribution. The light blue area is the rejection region (for the null hypothesis).

<% } else { %>

If the null hypothesis is true, the P-value is the probability of observing a difference in the current data as large as or larger than the observed difference by chance. If it is greater than the significance level of <%= baseline_p_pct %>%, we cannot reject the null hypothesis, so it cannot be said to be statistically significant. Conversely, if it is less than or equal to <%= baseline_p_pct %>%, we can reject the null hypothesis, so it can be said to be statistically significant.

The following chart visualizes where the P-value (blue dotted line) is located within the t-distribution, which is a probability distribution, for each <%= repeat_by %>. The light blue area is the rejection region (for the null hypothesis).

<% } %>

{{probability_dist}}

The current significance level (P-value) is set to <%= baseline_p_pct %>% (<%= baseline_p %>), but this can be changed from [Settings](//analytics/settings) in Analytics.

## Significance - Confidence Interval

<% if (!repeat_by) { %>

The following chart visualizes the difference in means between <%= target %> and its 95% confidence interval using error bars. This 95% confidence interval means that there is a high probability (95% confidence) that the difference in means of <%= target %> between <%= group_a %> and <%= group_b %> is within this range. If the confidence interval includes 0 (no difference), the difference in means between <%= target %> cannot be said to be significant. Conversely, if it does not include 0 (no difference), it can be said to be significant.

<% } else { %>

The following chart visualizes the difference in means between <%= target %> and its 95% confidence interval using error bars for each <%= repeat_by %>. This 95% confidence interval means that there is a high probability (95% confidence) that the difference in means of <%= target %> between <%= group_a %> and <%= group_b %> is within this range. If the confidence interval includes 0 (no difference), the difference in means between <%= target %> cannot be said to be significant. Conversely, if it does not include 0 (no difference), it can be said to be significant.

<% } %>


{{confidence_interval}}

<% if (!repeat_by) { %>

<% if (p > baseline_p) { %>
Since this interval includes 0 (no difference), the difference in means of <%= target %> due to <%= explanatory %> cannot be said to be significant.
<% } %>

<% if (p <= baseline_p) { %>
Since this interval does not include 0 (no difference), the difference in means of <%= target %> due to <%= explanatory %> can be said to be significant.
<% } %>

<% } %>

# Effect Size

Statistical significance (P-value) can sometimes judge a small difference as "significant" when the sample size is large. Therefore, effect size can be used to evaluate the actual magnitude of the effect. In this test, Cohen's D is calculated as the effect size measure. This is a standardized measure of the difference in mean values of <%= target %> due to <%= explanatory %>.

The following are guidelines for interpreting the magnitude of effect size (Cohen's D):

| Effect Size Value | Effect Size Magnitude |
|------------|------------|
| 0.2 | Small effect |
| 0.5 | Medium effect |
| 0.8 | Large effect |

<% if (!repeat_by) { %>

<% if (p > baseline_p) { %>
Effect size needs attention when the test result is judged significant, but since it is not significant this time, there is no particular need for attention.
<% } %>

<% if (p <= baseline_p) { %>
Since this test result can be judged as significant, attention to effect size is necessary.
<% } %>

<% } else { %>

Effect size needs attention when the test result is judged significant. If it is not significant, there is no particular need for attention.

<% } %>

# Power

Power is the probability of correctly detecting a difference in the means of <%= target %> due to <%= explanatory %> when there is actually one. The inverse of this power is the Type 2 error, which is the probability of being wrong when judging something as not significant, meaning there might have been a truly significant difference. Generally, a power of 80% (0.8) or more is desirable. Caution is required if it is lower than that.

<% if (!repeat_by) { %>

<% if (p > baseline_p) { %>

<% if (power < 0.5) { %>
The power is low at <%= power_pct %>% (<%= power %>). If we judge it as not significant based on the P-value obtained this time, the probability of being wrong (Type 2 error) is **<%= type2_error_pct %>% (<%= type2_error %>)**, so the judgment should be made carefully.
<% } else if (power < 0.8) { %>
The power is somewhat low at <%= power_pct %>% (<%= power %>). If we judge it as not significant based on the P-value obtained this time, the probability of being wrong (Type 2 error) is **<%= type2_error_pct %>% (<%= type2_error %>)**, so caution is required.
<% } else { %>
The power is sufficiently high at <%= power_pct %>% (<%= power %>), and the probability of being wrong even if we judge it as not significant is less than <%= type2_error_pct %>%, so there is no particular need for attention.
<% } %>

<% } else { %>
This time, since it can be judged as significant, there is no particular need for attention.
<% } %>

Power and Type 2 error need attention when judging the test result as not significant. Conversely, if the difference is judged to be significant, there is no particular need for attention.

<% } else { %>

Power and Type 2 error need attention when judging the test result as not significant. Conversely, if the difference is judged to be significant, there is no particular need for attention.

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

## Confidence Intervals of Means

The following visualizes the confidence intervals of the mean for each group using error bars.

{start_lazy_show_hide}
### Chart
{{mean}}
{end_lazy_show_hide}

# Additional Information

## Next Steps

* This time we analyzed the influence of one variable, <%= explanatory %>, on <%= target %>. However, other variables may also be influencing <%= target %>. Therefore, you can perform multivariate analysis using "Linear Regression" to simultaneously consider multiple factors.
<% if (!repeat_by) { %>
* This test was performed on the overall data, but it can also be conducted separately for each group. In that case, you can select a grouping variable in "Repeat By" and re-run the analysis.
<% } %>
* If you want to test multiple indicators together in a batch, this is possible by changing the data format. For details, please refer to [this note](https://exploratory.io/note/exploratory/mxW2zKb2).

`;

module.exports = template; 