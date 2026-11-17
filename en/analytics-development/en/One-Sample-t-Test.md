const template = `

# Summary

<% if (!repeat_by) { %>

We performed a one-sample t-test to examine whether the average of <%= target %> is different from the hypothesized mean of <%= hypothesized_mean %>.

{{summary}}

<% if (p > baseline_p) { %>
The P-value is **<%= p_pct %>% (<%= p %>)**, which is greater than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>). Therefore, the average of <%= target %> is not statistically significantly different from the hypothesized mean of <%= hypothesized_mean %>.

However, “not statistically significant” does not prove that the average is equal to the hypothesized mean. It is important to also check the effect size, confidence interval, sample size, and statistical power.

  <% if (power < 0.5) { %>
The statistical power is low at <%= power_pct %>% (<%= power %>). This means that even if a real difference from the hypothesized mean exists, this test may have a high chance of failing to detect it. Please interpret the result with caution.
  <% } else if (power < 0.8) { %>
The statistical power is somewhat low at <%= power_pct %>% (<%= power %>). This means that even if a real difference from the hypothesized mean exists, this test may fail to detect it. Please interpret the result with caution.
  <% } %>

<% } else { %>
The P-value is **<%= p_pct %>% (<%= p %>)**, which is less than or equal to the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>). Therefore, the average of <%= target %> is statistically significantly different from the hypothesized mean of <%= hypothesized_mean %>.

  <% if (effect_size < 0.2) { %>
However, the effect size, measured by Cohen's d, is <%= effect_size %>, which is small. This means that the difference from the hypothesized mean may be small in practical terms.
  <% } else if (effect_size < 0.8) { %>
The effect size, measured by Cohen's d, is <%= effect_size %>, which can be considered moderate.
  <% } else { %>
The effect size, measured by Cohen's d, is <%= effect_size %>, which can be considered large.
  <% } %>
<% } %>

<% } else { %>

We performed a one-sample t-test for each <%= repeat_by %> group to examine whether the average of <%= target %> is different from the hypothesized mean of <%= hypothesized_mean %>.

{{summary}}

<% if (groups.some(group => group.p <= baseline_p)) { %>
In the following groups, the P-value is less than or equal to the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), so the average is statistically significantly different from the hypothesized mean.
  <% groups.forEach(group => { %>
    <% if (group.p <= baseline_p) { %>
* <%= group.name %>
    <% } %>
  <% }); %>
<% } %>

<% if (groups.some(group => group.p > baseline_p)) { %>
In the following groups, the P-value is greater than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), so the average is not statistically significantly different from the hypothesized mean.
  <% groups.forEach(group => { %>
    <% if (group.p > baseline_p) { %>
* <%= group.name %>
    <% } %>
  <% }); %>
<% } %>

Because tests are performed across multiple groups, some statistically significant results may occur by chance. When interpreting the results, check not only the P-values, but also the effect sizes, confidence intervals, sample sizes, and practical meaning.

<% } %>

The significance level for this test is set to <%= baseline_p_pct %>% (<%= baseline_p %>). You can change the significance level from [Settings](//analytics/settings).


{start_show_hide}
## Explanation of Statistical Metrics

* Mean
  * The mean is the average value of <%= target %> in the sample data.
  * This test evaluates whether this sample mean is statistically different from the specified hypothesized mean.

* hypothesized mean
  * The hypothesized mean is the reference value specified for the test.
  * The one-sample t-test examines whether the sample mean is statistically different from this value.

* Difference
  * The difference represents the sample mean minus the hypothesized mean.
  * A positive value means that the sample mean is higher than the hypothesized mean.
  * A negative value means that the sample mean is lower than the hypothesized mean.
  * It is important to interpret the magnitude of the difference along with the confidence interval and P-value.

* t-value
  * The t-value is a statistic that indicates how far the sample mean is from the hypothesized mean, relative to the standard error.
  * It is calculated by dividing the difference between the sample mean and the hypothesized mean by the standard error.
  * A larger absolute value indicates stronger evidence that the sample mean is different from the hypothesized mean. Generally, an absolute value around 2 or greater often indicates a potentially meaningful difference, depending on the degrees of freedom and significance level.

* P-value
  * The P-value indicates the probability of observing a sample mean as extreme as, or more extreme than, the observed one, assuming the null hypothesis is true.
  * In this test, the null hypothesis is that the population average of <%= target %> is equal to <%= hypothesized_mean %>.
  * Generally, if the P-value is less than 5% (0.05), it is judged to be statistically significant.
  * The value is between 0 and 1, and a smaller P-value indicates stronger evidence against the null hypothesis.

* Degrees of Freedom
  * Degrees of freedom in a one-sample t-test represent the number of independent values that can vary in the data.
  * It is calculated as the sample size minus 1.
  * As the degrees of freedom increase, the t-distribution approaches the normal distribution.

* Confidence Interval Lower Limit
  * The confidence interval lower limit indicates the lower bound of the statistically estimated range for the true hypothesized mean.
  * The probability of the true mean being lower than this value is less than half (2.5%) of the set confidence level when using a 95% confidence interval.

* Confidence Interval Upper Limit
  * The confidence interval upper limit indicates the upper bound of the statistically estimated range for the true hypothesized mean.
  * The probability of the true mean being higher than this value is less than half (2.5%) of the set confidence level when using a 95% confidence interval.
  * A wider confidence interval indicates lower precision of the estimate, and a narrower interval indicates higher precision.
  * If the confidence interval does not include the hypothesized mean, the sample mean is considered statistically significantly different from the hypothesized mean.

* Cohen's D
  * Cohen's D is an indicator of effect size, calculated by dividing the difference between the sample mean and the hypothesized mean by the sample standard deviation.
  * A value of 0.2 is often interpreted as a "small effect", 0.5 as a "medium effect", and 0.8 or more as a "large effect".
  * The absolute value of Cohen's D is usually used when evaluating the size of the effect.

* Power
  * Power is the probability of correctly detecting a difference when the true mean is actually different from the specified hypothesized mean.
  * The value is between 0 and 1, and generally 0.8 (80%) or more is desirable.
  * Low power indicates that an actually existing difference may have been missed.

* Type 2 Error
  * Type 2 error is the probability of concluding that there is no difference from the hypothesized mean when a real difference actually exists.
  * The value is between 0 and 1, and there is a relationship of Power = 1 - Type 2 Error.
  * Generally, 0.2 (20%) or less is desirable.

* Number of Rows
  * The number of rows indicates the total number of data points used for analysis.
  * A larger sample size increases the power of the statistical test and improves the reliability of the result.
  * The required sample size varies depending on the effect size, variation in the data, and significance level.
{end_show_hide}


# Statistical Significance

Statistical significance can be evaluated using either the P-value or the confidence interval. For a two-sided test, the decision based on a P-value at the 5% significance level is consistent with whether a 95% confidence interval includes the hypothesized mean.

## Statistical Significance - P-value

The null hypothesis for this test is that “the average of <%= target %> is equal to the hypothesized mean of <%= hypothesized_mean %>.”

<% if (!repeat_by) { %>

<% if (p > baseline_p) { %>
The P-value is <%= p_pct %>% (<%= p %>). This represents the probability of observing a sample mean as extreme as, or more extreme than, the one observed in this data, assuming that the null hypothesis is true — in other words, assuming that the average of <%= target %> is equal to <%= hypothesized_mean %>.

Because the P-value is greater than the significance level of <%= baseline_p_pct %>%, we cannot reject the null hypothesis. Therefore, the average of <%= target %> is not statistically significantly different from the hypothesized mean.
<% } %>

<% if (p <= baseline_p) { %>
The P-value is <%= p_pct %>% (<%= p %>). This represents the probability of observing a sample mean as extreme as, or more extreme than, the one observed in this data, assuming that the null hypothesis is true — in other words, assuming that the average of <%= target %> is equal to <%= hypothesized_mean %>.

Because the P-value is less than or equal to the significance level of <%= baseline_p_pct %>%, we can reject the null hypothesis. Therefore, the average of <%= target %> is statistically significantly different from the hypothesized mean.
<% } %>

The following chart shows where the observed t-value is located on the t-distribution. The light blue area represents the rejection region based on the significance level. If the observed t-value falls within the rejection region, the sample mean is considered statistically significantly different from the hypothesized mean.

<% } else { %>

The P-value represents the probability of observing a sample mean as extreme as, or more extreme than, the one observed in each group, assuming that the null hypothesis is true — in other words, assuming that the average of <%= target %> is equal to <%= hypothesized_mean %>.

If the P-value is greater than the significance level of <%= baseline_p_pct %>%, we cannot reject the null hypothesis, so the result is not statistically significant. If the P-value is less than or equal to <%= baseline_p_pct %>%, we can reject the null hypothesis, so the result is statistically significant.

The following chart shows where the observed t-value is located on the t-distribution for each <%= repeat_by %> group. The light blue area represents the rejection region based on the significance level. If the observed t-value falls within the rejection region, the sample mean is considered statistically significantly different from the hypothesized mean.

<% } %>

{{probability_dist}}

The current significance level is set to <%= baseline_p_pct %>% (<%= baseline_p %>). You can change the significance level from [Settings](//analytics/settings).

The following chart shows the same test on the original scale of <%= target %>. It shows the distribution of the sample mean under the assumption that the true hypothesized mean is <%= hypothesized_mean %>. The dotted line represents the observed sample mean, and the shaded area represents the rejection region based on the significance level. If the observed sample mean falls within the shaded area, the average of <%= target %> is considered statistically significantly different from the hypothesized mean.

{{probability_dist_value}}


## Statistical Significance - Confidence Interval

<% if (!repeat_by) { %>

The following chart visualizes the average of <%= target %> along with its 95% confidence interval using an error bar.

This 95% confidence interval is an estimated range for where the true population average of <%= target %> is likely to be. If the confidence interval includes the hypothesized mean of <%= hypothesized_mean %>, the sample mean is not statistically significantly different from the hypothesized mean. If the confidence interval does not include <%= hypothesized_mean %>, the sample mean is statistically significantly different from the hypothesized mean.

<% } else { %>

The following chart visualizes the average of <%= target %> along with its 95% confidence interval for each <%= repeat_by %> group using error bars.

This 95% confidence interval is an estimated range for where the true population average of <%= target %> is likely to be for each group. If the confidence interval includes the hypothesized mean of <%= hypothesized_mean %>, the sample mean is not statistically significantly different from the hypothesized mean. If the confidence interval does not include <%= hypothesized_mean %>, the sample mean is statistically significantly different from the hypothesized mean.

<% } %>

{{confidence_interval}}

<% if (!repeat_by) { %>

<% if (p > baseline_p) { %>
Because this interval includes the hypothesized mean of <%= hypothesized_mean %>, the average of <%= target %> is not statistically significantly different from the hypothesized mean.
<% } %>

<% if (p <= baseline_p) { %>
Because this interval does not include the hypothesized mean of <%= hypothesized_mean %>, the average of <%= target %> is statistically significantly different from the hypothesized mean.
<% } %>

<% } %>


# Effect Size

The P-value, which indicates statistical significance, is affected by sample size. When the sample size is large, even a small difference from the hypothesized mean may be statistically significant. On the other hand, when the sample size is small, a meaningful difference may not be statistically significant.

Therefore, it is important to check not only the P-value but also the effect size. This test calculates Cohen's d as the effect size. Cohen's d is a standardized measure of how far the sample mean of <%= target %> is from the hypothesized mean, relative to the variation in the data.

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
Although the result is statistically significant, the effect size is small. It is important to check whether the difference from the hypothesized mean is meaningful in practical terms.
<% } else if (p > baseline_p && effect_size >= 0.8) { %>
Although the result is not statistically significant, the effect size is large. This may indicate that the test failed to detect the difference due to insufficient sample size. Please also check the confidence interval and statistical power.
<% } %>

<% } else { %>

It is important to check the effect size regardless of whether the P-value is statistically significant. Even when a result is statistically significant, a small effect size may indicate that the difference from the hypothesized mean is small in practical terms. On the other hand, even when a result is not statistically significant, a large effect size may indicate that the test failed to detect the difference due to insufficient sample size.

<% } %>


# Statistical Power

Statistical power is the probability of detecting a difference when a difference of a certain size actually exists. Type II error is the probability of failing to detect such a difference even though it exists.

In general, statistical power of 80% (0.8) or higher is considered desirable. If the power is lower than that, the test may fail to detect a real difference, so the result should be interpreted with caution.

<% if (!repeat_by) { %>

<% if (p > baseline_p) { %>

<% if (power < 0.5) { %>
The statistical power is low at <%= power_pct %>% (<%= power %>). Even if a real difference from the hypothesized mean exists, this test may have a high chance of failing to detect it. Therefore, the “not statistically significant” result should be interpreted with caution. The Type II error is **<%= type2_error_pct %>% (<%= type2_error %>)**.
<% } else if (power < 0.8) { %>
The statistical power is somewhat low at <%= power_pct %>% (<%= power %>). Even if a real difference from the hypothesized mean exists, this test may fail to detect it. Therefore, the “not statistically significant” result should be interpreted with caution. The Type II error is **<%= type2_error_pct %>% (<%= type2_error %>)**.
<% } else { %>
The statistical power is sufficiently high at <%= power_pct %>% (<%= power %>). This suggests that the test is likely to detect a difference of a certain size if it exists. The Type II error is <%= type2_error_pct %>% (<%= type2_error %>).
<% } %>

<% } else { %>
Because the result is statistically significant, it is especially important to check the effect size and confidence interval to evaluate the size and practical meaning of the difference from the hypothesized mean.
<% } %>

<% } else { %>

Statistical power and Type II error are especially important when interpreting groups where the result is not statistically significant. Even when a result is not statistically significant, low statistical power may indicate that the test failed to detect a difference due to insufficient sample size.

<% } %>


# Descriptive Statistics

## Statistics

The following table shows the descriptive statistics for <%= target %>.

{{statistics}}

## Data Distribution

The following chart visualizes the distribution of <%= target %>.

By checking the shape of the distribution, variation, and possible outliers, you can better understand the data behind the average and evaluate whether the mean is representative of the overall distribution.

{{distribution}}

## Confidence Interval for the Mean

<% if (!repeat_by) { %>

The following chart visualizes the average of <%= target %> and its confidence interval using an error bar. The reference line represents the hypothesized mean of <%= hypothesized_mean %>.

{{mean}}

<% } else { %>

The following chart visualizes the average of <%= target %> and its confidence interval for each <%= repeat_by %> group using error bars. The reference line represents the hypothesized mean of <%= hypothesized_mean %>.

{{mean}}

<% } %>


# Assumptions and Notes

Please keep the following points in mind when interpreting a one-sample t-test.

* The target variable should be numeric.
* The data should be a random sample from the population of interest.
* The observations should be independent of each other.
* The test evaluates whether the average of <%= target %> is different from the specified hypothesized mean of <%= hypothesized_mean %>.
* If the distribution is highly skewed or contains many outliers, the result should be interpreted with caution.
* When the sample size is small, the average may not be estimated reliably.
* Even if a result is statistically significant, the difference from the hypothesized mean may not be meaningful in practical terms. Please also check the effect size and confidence interval.
* Even if a result is not statistically significant, it does not prove that the average is equal to the hypothesized mean. Please also check the statistical power and confidence interval.

<% if (repeat_by) { %>
* Because tests are performed multiple times for each <%= repeat_by %> group, statistically significant results may occur by chance. When interpreting the results, check not only the P-values, but also the effect sizes, confidence intervals, sample sizes, and practical meaning.
<% } %>


`;

module.exports = template;
