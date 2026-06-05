const template = `

# Summary

<% if (!repeat_by) { %>

We performed a two-sample t-test to examine whether the average of <%= target %> differs by <%= explanatory %>.

<% if (var_equal) { %>
This test assumes that the two groups have equal variances.
<% } else { %>
This test uses Welch’s t-test, which does not assume that the two groups have equal variances.
<% } %>

{{summary}}

<% if (p > baseline_p) { %>
The P-value is **<%= p_pct %>% (<%= p %>)**, which is greater than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>). Therefore, the difference in the average of <%= target %> by <%= explanatory %> is not statistically significant.

However, “not statistically significant” does not prove that there is no difference. It is important to also check the effect size, confidence interval, sample size, and statistical power.

  <% if (power < 0.5) { %>
The statistical power is low at <%= power_pct %>% (<%= power %>). This means that even if a real difference exists, this test may have a high chance of failing to detect it. Please interpret the result with caution.
  <% } else if (power < 0.8) { %>
The statistical power is somewhat low at <%= power_pct %>% (<%= power %>). This means that even if a real difference exists, this test may fail to detect it. Please interpret the result with caution.
  <% } %>

<% } else { %>
The P-value is **<%= p_pct %>% (<%= p %>)**, which is less than or equal to the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>). Therefore, the difference in the average of <%= target %> by <%= explanatory %> is statistically significant.

  <% if (effect_size < 0.2) { %>
However, the effect size, measured by Cohen's d, is <%= effect_size %>, which is small. This means that the difference in averages may be small in practical terms.
  <% } else if (effect_size < 0.8) { %>
The effect size, measured by Cohen's d, is <%= effect_size %>, which can be considered moderate.
  <% } else { %>
The effect size, measured by Cohen's d, is <%= effect_size %>, which can be considered large.
  <% } %>
<% } %>

<% } else { %>

We performed a two-sample t-test for each <%= repeat_by %> group to examine whether the average of <%= target %> differs by <%= explanatory %>.

<% if (var_equal) { %>
For each <%= repeat_by %> group, this test assumes that the two groups being compared have equal variances.
<% } else { %>
For each <%= repeat_by %> group, this test uses Welch’s t-test, which does not assume that the two groups being compared have equal variances.
<% } %>

{{summary}}

<% if (groups.some(group => group.p <= baseline_p)) { %>
In the following groups, the P-value is less than or equal to the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), so the difference in averages is statistically significant.
  <% groups.forEach(group => { %>
    <% if (group.p <= baseline_p) { %>
* <%= group.name %>
    <% } %>
  <% }); %>
<% } %>

<% if (groups.some(group => group.p > baseline_p)) { %>
In the following groups, the P-value is greater than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), so the difference in averages is not statistically significant.
  <% groups.forEach(group => { %>
    <% if (group.p > baseline_p) { %>
* <%= group.name %>
    <% } %>
  <% }); %>
<% } %>

Because tests are performed across multiple groups, some statistically significant results may occur by chance. When interpreting the results, check not only the P-values, but also the effect sizes, confidence intervals, sample sizes, and practical meaning.

<% } %>

The significance level for this test is set to <%= baseline_p_pct %>% (<%= baseline_p %>). You can change the significance level and whether to assume equal variances from [Settings](//analytics/settings).


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

# Statistical Significance

Statistical significance can be evaluated using either the P-value or the confidence interval. For a two-sided test, the decision based on a P-value at the 5% significance level is consistent with whether a 95% confidence interval includes 0.

## Statistical Significance - P-value

The null hypothesis for this test is that “there is no difference in the average of <%= target %> between <%= group_a %> and <%= group_b %>.”

<% if (!repeat_by) { %>

<% if (p > baseline_p) { %>
The P-value is <%= p_pct %>% (<%= p %>). This represents the probability of observing a difference as extreme as, or more extreme than, the one observed in this data, assuming that the null hypothesis is true — in other words, assuming that there is no difference between the two group averages.

Because the P-value is greater than the significance level of <%= baseline_p_pct %>%, we cannot reject the null hypothesis. Therefore, the difference in the average of <%= target %> by <%= explanatory %> is not statistically significant.
<% } %>

<% if (p <= baseline_p) { %>
The P-value is <%= p_pct %>% (<%= p %>). This represents the probability of observing a difference as extreme as, or more extreme than, the one observed in this data, assuming that the null hypothesis is true — in other words, assuming that there is no difference between the two group averages.

Because the P-value is less than or equal to the significance level of <%= baseline_p_pct %>%, we can reject the null hypothesis. Therefore, the difference in the average of <%= target %> by <%= explanatory %> is statistically significant.
<% } %>

The following chart shows where the observed t-value is located on the t-distribution. The light blue area represents the rejection region based on the significance level. If the observed t-value falls within the rejection region, the difference in averages is considered statistically significant.

<% } else { %>

The P-value represents the probability of observing a difference as extreme as, or more extreme than, the one observed in this data, assuming that the null hypothesis is true — in other words, assuming that there is no difference between the two group averages.

If the P-value is greater than the significance level of <%= baseline_p_pct %>%, we cannot reject the null hypothesis, so the result is not statistically significant. If the P-value is less than or equal to <%= baseline_p_pct %>%, we can reject the null hypothesis, so the result is statistically significant.

The following chart shows where the observed t-value is located on the t-distribution for each <%= repeat_by %> group. The light blue area represents the rejection region based on the significance level. If the observed t-value falls within the rejection region, the difference in averages is considered statistically significant.

<% } %>

{{probability_dist}}

The current significance level is set to <%= baseline_p_pct %>% (<%= baseline_p %>). You can change the significance level from [Settings](//analytics/settings).

The following chart shows the same test on the scale of the difference in averages. It shows the distribution of the average difference under the assumption that there is no difference, centered at 0. The dotted line represents the observed average difference, and the shaded area represents the rejection region based on the significance level. If the observed average difference falls within the shaded area, the difference in averages is considered statistically significant.

{{probability_dist_diff}}

## Statistical Significance - Confidence Interval

<% if (!repeat_by) { %>

The following chart visualizes the difference in the average of <%= target %> between <%= group_a %> and <%= group_b %>, along with its 95% confidence interval, using an error bar.

This 95% confidence interval is an estimated range for where the true difference in the population averages is likely to be. If the confidence interval includes 0, which means no difference, the difference in averages is not statistically significant. If the confidence interval does not include 0, the difference in averages is statistically significant.

<% } else { %>

The following chart visualizes the difference in the average of <%= target %> between <%= group_a %> and <%= group_b %>, along with its 95% confidence interval, for each <%= repeat_by %> group using error bars.

This 95% confidence interval is an estimated range for where the true difference in the population averages is likely to be. If the confidence interval includes 0, which means no difference, the difference in averages is not statistically significant. If the confidence interval does not include 0, the difference in averages is statistically significant.

<% } %>

{{confidence_interval}}

<% if (!repeat_by) { %>

<% if (p > baseline_p) { %>
Because this interval includes 0, which means no difference, the difference in the average of <%= target %> by <%= explanatory %> is not statistically significant.
<% } %>

<% if (p <= baseline_p) { %>
Because this interval does not include 0, which means no difference, the difference in the average of <%= target %> by <%= explanatory %> is statistically significant.
<% } %>

<% } %>

# Effect Size

The P-value, which indicates statistical significance, is affected by sample size. When the sample size is large, even a small difference may be statistically significant. On the other hand, when the sample size is small, a meaningful difference may not be statistically significant.

Therefore, it is important to check not only the P-value but also the effect size. This test calculates Cohen's d as the effect size. Cohen's d is a standardized measure of the difference in the average of <%= target %> by <%= explanatory %>, relative to the variation in the data.

A common guideline for interpreting Cohen's d is shown below.

| Effect Size | Interpretation |
|-------------|----------------|
| 0.2 | Small effect |
| 0.5 | Moderate effect |
| 0.8 | Large effect |

<% if (!repeat_by) { %>

<% if (effect_size < 0.2) { %>
The effect size, measured by Cohen's d, is <%= effect_size %>, which can be considered small.
<% } else if (effect_size < 0.8) { %>
The effect size, measured by Cohen's d, is <%= effect_size %>, which can be considered moderate.
<% } else { %>
The effect size, measured by Cohen's d, is <%= effect_size %>, which can be considered large.
<% } %>

<% if (p <= baseline_p && effect_size < 0.2) { %>
Although the result is statistically significant, the effect size is small. It is important to check whether the difference is meaningful in practical terms.
<% } else if (p > baseline_p && effect_size >= 0.8) { %>
Although the result is not statistically significant, the effect size is large. This may indicate that the test failed to detect the difference due to insufficient sample size. Please also check the confidence interval and statistical power.
<% } %>

<% } else { %>

It is important to check the effect size regardless of whether the P-value is statistically significant. Even when a result is statistically significant, a small effect size may indicate that the difference is small in practical terms. On the other hand, even when a result is not statistically significant, a large effect size may indicate that the test failed to detect the difference due to insufficient sample size.

<% } %>

# Statistical Power

Statistical power is the probability of detecting a difference when a difference of a certain size actually exists. Type II error is the probability of failing to detect such a difference even though it exists.

In general, statistical power of 80% (0.8) or higher is considered desirable. If the power is lower than that, the test may fail to detect a real difference, so the result should be interpreted with caution.

<% if (!repeat_by) { %>

<% if (p > baseline_p) { %>

<% if (power < 0.5) { %>
The statistical power is low at <%= power_pct %>% (<%= power %>). Even if a real difference exists, this test may have a high chance of failing to detect it. Therefore, the “not statistically significant” result should be interpreted with caution. The Type II error is **<%= type2_error_pct %>% (<%= type2_error %>)**.
<% } else if (power < 0.8) { %>
The statistical power is somewhat low at <%= power_pct %>% (<%= power %>). Even if a real difference exists, this test may fail to detect it. Therefore, the “not statistically significant” result should be interpreted with caution. The Type II error is **<%= type2_error_pct %>% (<%= type2_error %>)**.
<% } else { %>
The statistical power is sufficiently high at <%= power_pct %>% (<%= power %>). This suggests that the test is likely to detect a difference of a certain size if it exists. The Type II error is <%= type2_error_pct %>% (<%= type2_error %>).
<% } %>

<% } else { %>
Because the result is statistically significant, it is especially important to check the effect size and confidence interval to evaluate the size and practical meaning of the difference.
<% } %>

<% } else { %>

Statistical power and Type II error are especially important when interpreting groups where the result is not statistically significant. Even when a result is not statistically significant, low statistical power may indicate that the test failed to detect a difference due to insufficient sample size.

<% } %>

# Descriptive Statistics

## Statistics

The following table shows the statistics for each group.

{{statistics}}

## Data Distribution

The following chart visualizes the distribution of <%= target %> by <%= explanatory %> using density curves.

By checking the shape of the distributions, variation, and possible outliers, you can better understand differences between groups that may not be visible from the average alone.

{{distribution}}

## Confidence Intervals for Group Means

The following chart visualizes the average and confidence interval for each group using error bars.

{{mean}}

# Assumptions and Notes

Please keep the following points in mind when interpreting a two-sample t-test.

* The two groups being compared should be independent of each other.
* The target variable should be numeric.
* If the distribution of each group is highly skewed or contains many outliers, the result should be interpreted with caution.
* When the sample size is small, the difference in averages may not be estimated reliably.
* Even if a result is statistically significant, the difference may not be meaningful in practical terms. Please also check the effect size and confidence interval.
* Even if a result is not statistically significant, it does not prove that there is no difference. Please also check the statistical power and confidence interval.

<% if (var_equal) { %>
* This test assumes that the two groups have equal variances. If the variances or sample sizes differ greatly between groups, consider using Welch’s t-test.
<% } else { %>
* This test uses Welch’s t-test, which does not assume that the two groups have equal variances. This is often a safer option when the variances or sample sizes may differ between groups.
<% } %>

<% if (repeat_by) { %>
* Because tests are performed multiple times for each <%= repeat_by %> group, statistically significant results may occur by chance. When interpreting the results, check not only the P-values, but also the effect sizes, confidence intervals, sample sizes, and practical meaning.
<% } %>

# Additional Information

## Next Steps

* This analysis examined the difference in the average of <%= target %> by one variable, <%= explanatory %>. However, other variables may also affect <%= target %>. You can use multivariate analysis, such as linear regression, to consider multiple factors at the same time.
<% if (!repeat_by) { %>
* This test was performed on the overall data, but it can also be performed separately by group. To do this, select a grouping variable for “Repeat By” and run the analysis again.
<% } %>
* If you want to run tests for multiple measures at once, you can do so by reshaping the data. For more details, see [this note](https://exploratory.io/note/exploratory/mxW2zKb2).

`;

module.exports = template;
