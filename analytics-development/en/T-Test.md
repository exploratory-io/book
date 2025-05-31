const template = `

# Summary

<% if (!repeat_by) { %>

We examined whether the difference in means of <%= target %> by <%= explanatory %> is statistically significant.

{{summary}}

<% if (p > baseline_p) { %>
As a result, the P-value is **<%= p_pct %>% (<%= p %>)**, which is greater than the significance level <%= baseline_p_pct %>% (<%= baseline_p %>), so the difference in means of <%= target %> by <%= explanatory %> is not statistically significant.

  <% if (power < 0.5) { %>
The power is as low as <%= power_pct %>% (<%= power %>), so it is important to note that the probability of missing a difference (Type 2 error) is very high at <%= type2_error_pct %>% (<%= type2_error %>), even if there is an actual difference.
  <% } else { %>
The power is as low as <%= power_pct %>% (<%= power %>), so it is important to note that the probability of missing a difference (Type 2 error) is as high as <%= type2_error_pct %>% (<%= type2_error %>), even if there is an actual difference.
  <% } %>
<% } %>

<% if (p <= baseline_p) { %>
As a result, the P-value is **<%= p_pct %>% (<%= p %>)**, which is lower than the significance level <%= baseline_p_pct %>% (<%= baseline_p %>), so the difference in means of <%= target %> by <%= explanatory %> is statistically significant.

  <% if (effect_size < 0.2) { %>
The effect size is low at <%= effect_size %>, and the difference in means of <%= target %> by <%= explanatory %> is small.
  <% } else if (effect_size < 0.8) { %>
The effect size is <%= effect_size %>, so the difference in means of <%= target %> by <%= explanatory %> is medium.
  <% } else { %>
The effect size is also large at <%= effect_size %>, so the difference in means of <%= target %> by <%= explanatory %> can be said to be large.
  <% } %>
<% } %>


<% } else { %>

We examined whether the difference in means of <%= target %> by <%= explanatory %> is statistically significant for each <%= repeat_by %>.

{{summary}}

<% if (groups.some(group => group.p <= baseline_p)) { %>
For the following groups, the P-value is lower than the significance level <%= baseline_p_pct %>% (<%= baseline_p %>), so it is statistically significant.
  <% groups.forEach(group => { %>
    <% if (group.p <= baseline_p) { %>
* <%= group.name %>
    <% } %>
  <% }); %>
<% } %>
<% if (groups.some(group => group.p > baseline_p)) { %>
For the following groups, the P-value is higher than the significance level <%= baseline_p_pct %>% (<%= baseline_p %>), so it is not statistically significant.
  <% groups.forEach(group => { %>
    <% if (group.p > baseline_p) { %>
* <%= group.name %>
    <% } %>
  <% }); %>
<% } %>


<% } %>

The significance level (P-value) for this test is set to <%= baseline_p_pct %>% (<%= baseline_p %>), but this can be changed from the ["Settings"](//analytics/settings) in Analytics.

{start_show_hide}
## Explanation of Statistical Metrics

* t-value
  * The t-value is a statistic that indicates whether the difference between two means is due to chance or is truly different. It is the value obtained by dividing the difference between the means of the data at hand by the standard error.
  * A larger absolute value indicates a higher probability that the difference in means is not due to chance. Generally, a difference is considered meaningful if the absolute value is 2 or more.

* P-value
  * The P-value indicates the probability of observing data as extreme as or more extreme than the observed data, assuming the null hypothesis (no difference between groups) is true.
  * Generally, if it is less than 5% (0.05), it is judged to be statistically significant.
  * The value is between 0 and 1, and a smaller P-value indicates higher statistical significance.

* Degrees of Freedom
  * Degrees of freedom in a t-test represent the number of independent values that can vary in the data. It is generally calculated as "total sample size - number of groups".
  * It is always a positive integer, and a larger value increases the accuracy of the test.
  * As the degrees of freedom increase, the t-distribution approaches the normal distribution.

* Difference
  * The difference represents the difference between the means of the two groups being compared.
  * The value of the difference itself varies depending on the unit of measurement, with a positive value indicating a higher mean for the first group and a negative value indicating a higher mean for the second group.
  * It is important to interpret the magnitude of the difference along with the confidence interval and P-value.

* Confidence Interval Lower Limit
  * The confidence interval lower limit indicates the lower bound of the statistically estimated difference in means.
  * The probability of a difference being lower than this value is less than half (2.5%) of the set confidence level (usually 95%).

* Confidence Interval Upper Limit
  * The confidence interval upper limit indicates the upper bound of the statistically estimated difference in means.
  * The probability of a difference being higher than this value is less than half (2.5%) of the set confidence level (usually 95%).
  * A wider confidence interval indicates lower precision of the estimation, and a narrower interval indicates higher precision.
  * If the confidence interval does not include 0 (lower limit is positive or upper limit is negative), a statistically significant difference can be determined.

* Base Level
  * The base level indicates the group or condition used as the basis for comparison.
  * Differences and effect sizes are expressed as relative values compared to this base level.

* Cohen's D
  * Cohen's D is an indicator of effect size, calculated by dividing the difference between groups by the data variability (standard deviation).
  * A value of 0.2 is interpreted as a "small effect", 0.5 as a "medium effect", and 0.8 or more as a "large effect".

* Power
  * Power is the probability of correctly detecting an effect when there is actually a difference in the means of <%= target %> by <%= explanatory %>.
  * The value is between 0 and 1, and generally 0.8 (80%) or more is desirable.
  * Low power indicates that an actually existing effect may have been missed.

* Type 2 Error
  * Type 2 error is the probability of "concluding that there is no effect when there actually is one".
  * The value is between 0 and 1, and there is a relationship of Power = 1 - Type 2 Error.
  * Generally, 0.2 (20%) or less is desirable.

* Number of Rows
  * The number of rows indicates the total number of data used for analysis (sample size).
  * A larger sample size increases the power of the statistical test and improves the reliability of the results.
  * The required sample size varies depending on the type of test and effect size.
{end_show_hide}

# Significance

Significance can be determined by either the P-value or the confidence interval. Both will yield the same result.

## Significance - P-value

The null hypothesis in this test is that "there is no difference in the mean of <%= target %> between <%= group_a %> and <%= group_b %>".

<% if (!repeat_by) { %>

<% if (p > baseline_p) { %>
As a result of the test, the P-value is <%= p_pct %>% (<%= p %>). Therefore, if the null hypothesis is true, the probability of observing a difference of <%= mean_diff %> or more by chance, as in this data, can be interpreted as approximately <%= p_pct %>%. Since it is greater than the significance level <%= baseline_p_pct %>%, the null hypothesis cannot be rejected. Therefore, the difference in <%= target %> by <%= explanatory %> is not statistically significant.
<% } %>

<% if (p <= baseline_p) { %>
As a result of the test, the P-value is <%= p_pct %>% (<%= p %>). Therefore, if the null hypothesis is true, the probability of observing a difference of <%= mean_diff %> or more by chance, as in this data, is only approximately <%= p_pct %>%. Since it is less than or equal to the significance level <%= baseline_p_pct %>%, the null hypothesis can be rejected. Therefore, the difference in <%= target %> by <%= explanatory %> is statistically significant.
<% } %>

The chart below visualizes where the P-value (blue dotted line) is located in the probability distribution, the t-distribution. The light blue area is the rejection region (of the null hypothesis).

<% } else { %>

If the null hypothesis is true, the P-value is the probability of observing a difference as large as or larger than the difference seen in this data by chance. If it is greater than the significance level <%= baseline_p_pct %>%, the null hypothesis cannot be rejected, so it is not statistically significant. Conversely, if it is less than or equal to <%= baseline_p_pct %>%, the null hypothesis can be rejected, so it is statistically significant.

The chart below visualizes where the P-value (blue dotted line) is located in the probability distribution, the t-distribution, for each <%= repeat_by %>. The light blue area is the rejection region (of the null hypothesis).

<% } %>

{{probability_dist}}

The current significance level (P-value) is set to <%= baseline_p_pct %>% (<%= baseline_p %>), but this can be changed from the ["Settings"](//analytics/settings) in Analytics.

## Significance - Confidence Interval

<% if (!repeat_by) { %>

The chart below visualizes the difference in means between <%= target %> and its 95% confidence interval using error bars. This 95% confidence interval means that there is a high probability (95% confidence) that the difference in means of <%= target %> between <%= group_a %> and <%= group_b %> is within this range. If the confidence interval includes 0 (no difference), the difference in means between <%= target %> is not statistically significant. Conversely, if it does not include 0 (no difference), it is statistically significant.

<% } else { %>

The chart below visualizes the difference in means between <%= target %> and its 95% confidence interval using error bars for each <%= repeat_by %>. This 95% confidence interval means that there is a high probability (95% confidence) that the difference in means of <%= target %> between <%= group_a %> and <%= group_b %> is within this range. If the confidence interval includes 0 (no difference), the difference in means between <%= target %> is not statistically significant. Conversely, if it does not include 0 (no difference), it is statistically significant.

<% } %>


{{confidence_interval}}

<% if (!repeat_by) { %>

<% if (p > baseline_p) { %>
Since this interval includes 0 (no difference), the difference in means of <%= target %> by <%= explanatory %> is not statistically significant.
<% } %>

<% if (p <= baseline_p) { %>
Since this interval does not include 0 (no difference), the difference in means of <%= target %> by <%= explanatory %> is statistically significant.
<% } %>

<% } %>

# Effect Size

Statistical significance (P-value) can sometimes determine a small difference as "significant" when the sample size is large. Therefore, effect size can be used to evaluate the actual magnitude of the effect. This test calculates Cohen's D as the effect size. This standardizes the magnitude of the difference in means of <%= target %> by <%= explanatory %>.

The following are guidelines for interpreting the magnitude of effect size (Cohen's D):

| Effect Size Value | Magnitude of Effect |
|------------|------------|
| 0.2 | Small Effect |
| 0.5 | Medium Effect |
| 0.8 | Large Effect |

<% if (!repeat_by) { %>

<% if (p > baseline_p) { %>
Effect size needs to be considered when the test result is judged to be significant, but since it is not significant this time, there is no particular need to pay attention to it.
<% } %>

<% if (p <= baseline_p) { %>
The test result this time is judged to be significant, so it is necessary to pay attention to the effect size.
<% } %>

<% } else { %>

Effect size needs to be considered when the test result is judged to be significant. If it is not significant, there is no particular need to pay attention to it.

<% } %>

# Power

Power is the probability of correctly detecting a difference in the means of <%= target %> by <%= explanatory %> when there actually is one. The inverse of this power is the Type 2 error, which is the probability of being wrong when judging it not to be significant, meaning there might have been a significant difference (an effect). Generally, a power of 80% (0.8) or more is desirable. Caution is required if it is lower than that.

<% if (!repeat_by) { %>

<% if (p > baseline_p) { %>

<% if (power < 0.5) { %>
The power is low at <%= power_pct %>% (<%= power %>). If you judge it not to be significant based on the obtained P-value, the probability of being wrong (Type 2 error) is **<%= type2_error_pct %>% (<%= type2_error %>)**, so you should be cautious in your judgment.
<% } else if (power < 0.8) { %>
The power is slightly low at <%= power_pct %>% (<%= power %>). If you judge it not to be significant based on the obtained P-value, the probability of being wrong (Type 2 error) is **<%= type2_error_pct %>% (<%= type2_error %>)**, so caution is required.
<% } else { %>
The power is sufficiently high at <%= power_pct %>% (<%= power %>), and even if you judge it not to be significant, the probability of being wrong is less than or equal to <%= type2_error_pct %>%, so there is no particular need for caution.
<% } %>

<% } else { %>
This time, it is judged to be significant, so there is no particular need for caution.
<% } %>

Power and Type 2 error need to be considered when judging the test result not to be significant. Conversely, if the difference is judged to be significant, there is no particular need for caution.

<% } else { %>

Power and Type 2 error need to be considered when judging the test result not to be significant. Conversely, if the difference is judged to be significant, there is no particular need for caution.

<% } %>

# Descriptive Statistics

## Statistics Values

The statistics values for each group are as follows:

{{statistics}}

## Data Distribution

The chart below visualizes the difference in the distribution of <%= target %> by <%= explanatory %> using density curves.

{start_lazy_show_hide}
### Chart
{{distribution}}
{end_lazy_show_hide}

## Mean Confidence Interval

The chart below visualizes the confidence interval of the mean for each group using error bars.

{start_lazy_show_hide}
### Chart
{{mean}}
{end_lazy_show_hide}

# Additional Information

## Next Steps

* This time, we analyzed the effect of one variable, <%= explanatory %>, on <%= target %>. However, other variables may also be affecting <%= target %>. Therefore, you can use multivariate analysis such as "Linear Regression" to analyze multiple factors simultaneously.
<% if (!repeat_by) { %>
* This test was conducted on the entire data, but it is also possible to perform it separately for each group. In that case, you can select the variable that will be the group in "Repeat By" and run it again.
<% } %>
* If you want to perform tests on multiple metrics at once, you can do so by changing the shape of the data. For details, please refer to [this](https://exploratory.io/note/exploratory/mxW2zKb2) note.

`;

module.exports = template; 