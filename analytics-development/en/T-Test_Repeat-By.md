const template = `
# Summary

We examined whether the difference in the mean of <%= target %> by <%= explanatory %> is significant for each <%= repeat_by %>.

<% if (groups.some(group => group.p <= baseline_p)) { %>
In the following groups, the p-value is lower than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), so it can be said to be statistically significant.
  <% groups.forEach(group => { %>
    <% if (group.p <= baseline_p) { %>
* <%= group.name %>
    <% } %>
  <% }); %>
<% } %>
<% if (groups.some(group => group.p > baseline_p)) { %>
In the following groups, the p-value is higher than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), so it cannot be said to be statistically significant.
  <% groups.forEach(group => { %>
    <% if (group.p > baseline_p) { %>
* <%= group.name %>
    <% } %>
  <% }); %>
<% } %>

Details for each group are as follows.

{{summary}}

{start_show_hide}
## Explanation of Statistical Indicators

* t-value
  * The t-value is a statistic that indicates whether the difference between two means is due to chance or is truly different. It is the value obtained by dividing the difference in means of the data at hand by the standard error.
  * The larger the absolute value, the more likely it is that the difference in means is not due to chance. Generally, an absolute value of 2 or more is considered a meaningful difference.

* P-value
  * The p-value indicates the probability that the observed data is as extreme as, or more extreme than, what would be expected under the null hypothesis (no difference between groups).
  * Generally, if it is less than 5% (0.05), it is judged to be statistically significant.
  * The value ranges from 0 to 1, and the smaller the p-value, the higher the statistical significance.

* Degrees of Freedom
  * Degrees of freedom in a t-test represent the number of independent values that can vary. It is generally calculated as "total sample size - number of groups".
  * It always takes a positive integer value, and the larger the value, the higher the accuracy of the test.
  * As the degrees of freedom increase, the t-distribution approaches the normal distribution.

* Difference
  * The difference represents the difference in means between the two groups being compared.
  * The value of the difference itself varies depending on the unit of measurement; a positive value indicates that the mean of the first group is higher, and a negative value indicates that the mean of the second group is higher.
  * It is important to interpret not only the magnitude of the difference but also the confidence interval and p-value together.

* Lower Confidence Interval
  * The lower confidence interval indicates the lower bound of the statistically estimated difference in means.
  * The probability that the difference is lower than this value is less than half (2.5%) of the set confidence level (usually 95%).

* Upper Confidence Interval
  * The upper confidence interval indicates the upper bound of the statistically estimated difference in means.
  * The probability that the difference is higher than this value is less than half (2.5%) of the set confidence level (usually 95%).
  * The wider the confidence interval, the lower the accuracy of the estimate; the narrower, the higher the accuracy.
  * If 0 is not included in the confidence interval (the lower bound is positive or the upper bound is negative), it can be judged that there is a statistically significant difference.

* Baseline
  * The baseline indicates the reference group or condition for comparison.
  * Differences and effect sizes are expressed as relative values compared to this baseline.

* Cohen's D
  * Cohen's D is an indicator of effect size, calculated by dividing the difference between groups by the variability (standard deviation) of the data.
  * A value of 0.2 is interpreted as a "small effect", 0.5 as a "medium effect", and 0.8 or more as a "large effect".

* Power
  * Power represents the probability of statistically detecting an effect when there is actually an effect.
  * The value ranges from 0 to 1, and generally, 0.8 (80%) or more is desirable.
  * If the power is low, it indicates that there is a possibility of missing an actual effect.

* Type II Error
  * Type II error is "the probability of judging that there is no effect when there actually is one".
  * The value ranges from 0 to 1, and there is a relationship: Power = 1 - Type II error.
  * Generally, 0.2 (20%) or less is desirable.

* Number of Rows
  * The number of rows indicates the total number of data (sample size) used in the analysis.
  * The larger the sample size, the higher the power of the statistical test and the more reliable the results.
  * The required sample size varies depending on the type of test and effect size.

{end_show_hide}

# Significance

Significance can be determined by either the p-value or the confidence interval. Both yield the same result.

## P-value

The null hypothesis in this test is that "there is no difference in the mean of <%= target %> between <%= group_a %> and <%= group_b %>".

If the null hypothesis is true, the p-value is the probability that a difference as large as or larger than the one observed in this data would occur by chance. If it is greater than the significance level of 5% (0.05), the null hypothesis cannot be rejected, so it cannot be said to be statistically significant. Conversely, if it is 5% (0.05) or less, the null hypothesis can be rejected, so it can be said to be statistically significant.

{{probability_dist}}

The current significance level (p-value) is set to <%= baseline_p_pct %>% (<%= baseline_p %>), but this can be changed from "Settings" in Analytics.

## Confidence Interval

The following chart shows the 95% confidence interval for the difference in the mean of <%= target %> by <%= explanatory %>. This means that there is a 95% probability that the difference in the mean of <%= target %> between <%= group_a %> and <%= group_b %> is within this range. If 0 (no difference) is included in this interval, it cannot be said that the difference is statistically significant. Conversely, if 0 (no difference) is not included in this interval, it can be said that the difference is statistically significant.

# Effect Size

In this test, Cohen's D, which is the effect size, is calculated. This is a standardized measure of the difference in the mean of <%= target %> by <%= explanatory %>.

As a general guideline, a value greater than 0.8 is considered a large difference, between 0.2 and 0.8 is considered a medium difference, and less than 0.2 is considered a small difference.

However, effect size should be noted when the test result is judged to be significant. If it is not significant, there is no particular need to pay attention.

# Power

Power is the probability of correctly detecting a difference in the mean of <%= target %> by <%= explanatory %> when there is actually a difference. The inverse of power is the type II error, which is the probability of mistakenly concluding that there is no difference when there actually is one.

Power and type II error should be noted when the result is judged not to be significant. Generally, power of 80% (0.8) or more is desirable. If it is lower than that, caution is needed.


# Appendix

## Statistics

The statistics for each group are as follows.

{{statistics}}

## Data Distribution

The following shows the difference in the distribution of <%= target %> by <%= explanatory %> using density curves.

{{distribution}}

## Confidence Interval of Means

The following shows the confidence interval of the mean of <%= target %> for each group using error bars.

{{mean}}

# Next Steps

* In this analysis, we examined the effect of a single variable, <%= explanatory %>, on <%= target %>. However, other variables may also affect <%= target %>. Therefore, you can use multivariate analysis such as "linear regression" to analyze the effects of multiple factors simultaneously.
`;

module.exports = template;