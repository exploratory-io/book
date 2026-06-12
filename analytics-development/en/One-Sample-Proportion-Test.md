const template = `

# Summary

<% if (!repeat_by) { %>

We used a one-sample proportion test to examine whether the proportion of <%= target %> is different from the hypothesized proportion of <%= hypothesized_proportion %>.

This test evaluates whether the observed proportion is likely to have occurred by chance, under the null hypothesis that the true population proportion is equal to the hypothesized proportion.

{{summary}}

<% if (p > baseline_p) { %>
The p-value is **<%= p_pct %>% (<%= p %>)**, which is greater than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>). Therefore, the proportion of <%= target %> is not statistically significantly different from the hypothesized proportion of <%= hypothesized_proportion %>.

However, a non-significant result does not prove that the true proportion is equal to the hypothesized proportion. It is important to review the observed proportion, confidence interval, effect size, sample size, and statistical power together.

  <% if (power < 0.5) { %>
The statistical power is <%= power_pct %>% (<%= power %>), which is low. This means the test may not be able to detect a real difference from the hypothesized proportion even if one exists, so the result should be interpreted with caution.
  <% } else if (power < 0.8) { %>
The statistical power is <%= power_pct %>% (<%= power %>), which is somewhat low. This means the test may fail to detect a real difference from the hypothesized proportion even if one exists, so the result should be interpreted with caution.
  <% } %>

<% } else { %>
The p-value is **<%= p_pct %>% (<%= p %>)**, which is less than or equal to the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>). Therefore, the proportion of <%= target %> is statistically significantly different from the hypothesized proportion of <%= hypothesized_proportion %>.

  <% if (effect_size < 0.2) { %>
However, the effect size, measured by Cohen's H, is <%= effect_size %>, which is small. This means the difference from the hypothesized proportion may be small in practical terms.
  <% } else if (effect_size < 0.5) { %>
The effect size, measured by Cohen's H, is <%= effect_size %>, which can be interpreted as a medium effect.
  <% } else { %>
The effect size, measured by Cohen's H, is <%= effect_size %>, which can be interpreted as a large effect.
  <% } %>
<% } %>

<% } else { %>

We used a one-sample proportion test within each <%= repeat_by %> group to examine whether the proportion of <%= target %> is different from the hypothesized proportion of <%= hypothesized_proportion %>.

Within each <%= repeat_by %> group, this test evaluates whether the observed proportion is likely to have occurred by chance, under the null hypothesis that the true population proportion is equal to the hypothesized proportion.

{{summary}}

<% if (groups.some(group => group.p <= baseline_p)) { %>
For the following groups, the p-value is less than or equal to the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>). Therefore, the proportion is statistically significantly different from the hypothesized proportion.
  <% groups.forEach(group => { %>
    <% if (group.p <= baseline_p) { %>
* <%= group.name %>
    <% } %>
  <% }); %>
<% } %>

<% if (groups.some(group => group.p > baseline_p)) { %>
For the following groups, the p-value is greater than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>). Therefore, the proportion is not statistically significantly different from the hypothesized proportion.
  <% groups.forEach(group => { %>
    <% if (group.p > baseline_p) { %>
* <%= group.name %>
    <% } %>
  <% }); %>
<% } %>

Because multiple tests are performed across groups, some statistically significant results may occur by chance. In addition to p-values, review the observed proportions, confidence intervals, effect sizes, sample sizes, and practical importance of the results.

<% } %>

The significance level for this test is set to <%= baseline_p_pct %>% (<%= baseline_p %>). You can change the significance level and other test settings from [Settings](//analytics/settings).


{start_show_hide}
## Explanation of Statistical Metrics

* Proportion
  * The observed proportion is the proportion of observations in the sample that belong to the target category.
  * This is the sample-based estimate that is compared against the hypothesized proportion.

* Hypothesized Proportion
  * The hypothesized proportion is the reference proportion specified for the test.
  * The one-sample proportion test evaluates whether the observed proportion is statistically different from this value.

* Difference
  * The difference represents the observed proportion minus the hypothesized proportion.
  * A positive value means the observed proportion is higher than the hypothesized proportion.
  * A negative value means the observed proportion is lower than the hypothesized proportion.
  * The difference should be interpreted together with the confidence interval and p-value.

* Z Value
  * The Z value is a test statistic that measures how far the observed proportion is from the hypothesized proportion, relative to its standard error.
  * A larger absolute Z value indicates stronger evidence that the observed proportion is unlikely to be different from the hypothesized proportion by chance alone.
  * For a two-sided test, an absolute Z value of about 1.96 or larger is typically considered statistically significant at the 5% significance level.

* P Value
  * The p-value is the probability of observing a proportion as extreme as, or more extreme than, the observed proportion, assuming that the null hypothesis is true.
  * In this test, the null hypothesis is that the true population proportion is equal to the hypothesized proportion.
  * A p-value below 5% (0.05) is commonly interpreted as statistically significant.
  * The value ranges from 0 to 1. A smaller p-value indicates stronger statistical evidence against the null hypothesis.

* Lower Confidence Interval
  * The lower confidence interval is the lower bound of the estimated true population proportion.
  * With a 95% confidence interval, values below this bound are outside the likely range of the true proportion, based on the observed data and the assumptions of the test.

* Upper Confidence Interval
  * The upper confidence interval is the upper bound of the estimated true population proportion.
  * A wider confidence interval indicates lower precision, while a narrower interval indicates higher precision.
  * If the confidence interval does not include the hypothesized proportion, the observed proportion can be considered statistically significantly different from the hypothesized proportion.

* Cohen's H
  * Cohen's H is an effect size measure for the difference between two proportions, or between an observed proportion and a hypothesized proportion.
  * Because proportions are bounded between 0 and 1, Cohen's H applies a transformation to the proportions before comparing them.
  * A value of 0.2 is often interpreted as a small effect, 0.5 as a medium effect, and 0.8 or above as a large effect.

* Power
  * Statistical power is the probability that the test will detect a true difference from the hypothesized proportion when such a difference actually exists.
  * The value ranges from 0 to 1. A power of 0.8 (80%) or higher is commonly considered desirable.
  * Low power means that a real difference may be missed.

* Type 2 Error
  * A Type 2 Error is the probability of failing to detect a true difference from the hypothesized proportion.
  * It is related to statistical power as follows: statistical power = 1 - Type 2 Error.
  * A Type 2 Error rate of 0.2 (20%) or lower is commonly considered desirable.

* Number of Rows
  * The number of rows represents the total number of observations used in the analysis.
  * Larger sample sizes generally increase statistical power and improve the reliability of the test.
  * For proportion tests, both the total sample size and the number of observations in the target category are important.
{end_show_hide}


# Statistical Significance

Statistical significance can be evaluated using either the p-value or the confidence interval. For a two-sided test, the p-value-based decision at the 5% significance level and the confidence-interval-based decision using a 95% confidence interval generally lead to the same conclusion.

## Statistical Significance - P Value

The null hypothesis for this test is that the true proportion of <%= target %> is equal to the hypothesized proportion of <%= hypothesized_proportion %>.

<% if (!repeat_by) { %>

<% if (p > baseline_p) { %>
The p-value from the test is <%= p_pct %>% (<%= p %>). This represents the probability of observing a proportion as extreme as, or more extreme than, the one observed in this data, assuming that the null hypothesis is true.

Because the p-value is greater than the significance level of <%= baseline_p_pct %>%, we cannot reject the null hypothesis. Therefore, the proportion of <%= target %> is not statistically significantly different from the hypothesized proportion of <%= hypothesized_proportion %>.

<% } %>

<% if (p <= baseline_p) { %>
The p-value from the test is <%= p_pct %>% (<%= p %>). This represents the probability of observing a proportion as extreme as, or more extreme than, the one observed in this data, assuming that the null hypothesis is true.

Because the p-value is less than or equal to the significance level of <%= baseline_p_pct %>%, we can reject the null hypothesis. Therefore, the proportion of <%= target %> is statistically significantly different from the hypothesized proportion of <%= hypothesized_proportion %>.

<% } %>

The following chart shows where the observed Z value falls on the normal distribution. The light blue areas represent the rejection regions based on the significance level. If the observed Z value falls within a rejection region, the observed proportion is considered statistically significantly different from the hypothesized proportion.

<% } else { %>

The p-value represents the probability of observing a proportion as extreme as, or more extreme than, the one observed in each group, assuming that the null hypothesis is true.

If the p-value is greater than the significance level of <%= baseline_p_pct %>%, we cannot reject the null hypothesis, and the result is not statistically significant. If the p-value is less than or equal to the significance level of <%= baseline_p_pct %>%, we can reject the null hypothesis, and the result is statistically significant.

The following chart shows, for each <%= repeat_by %> group, where the observed Z value falls on the normal distribution. The light blue areas represent the rejection regions based on the significance level. If the observed Z value falls within a rejection region, the observed proportion is considered statistically significantly different from the hypothesized proportion.

<% } %>

{{probability_dist}}

The current significance level is set to <%= baseline_p_pct %>% (<%= baseline_p %>). You can change the significance level from [Settings](//analytics/settings).

The following chart shows the same test on the scale of the original proportion. It shows the distribution of the observed proportion under the assumption that the true population proportion is equal to the hypothesized proportion of <%= hypothesized_proportion %>. The dotted line represents the observed proportion, and the light blue areas represent the rejection regions based on the significance level. If the observed proportion falls within a light blue region, the proportion is considered statistically significantly different from the hypothesized proportion.

{{probability_dist_prop}}


## Statistical Significance - Confidence Interval

<% if (!repeat_by) { %>

The following chart shows the observed proportion of <%= target %>, along with its 95% confidence interval.

The 95% confidence interval shows the estimated range of the true population proportion. If the confidence interval includes the hypothesized proportion of <%= hypothesized_proportion %>, the proportion of <%= target %> is not statistically significantly different from the hypothesized proportion. If it does not include <%= hypothesized_proportion %>, the proportion is statistically significantly different from the hypothesized proportion.

<% } else { %>

The following chart shows the observed proportion of <%= target %>, along with its 95% confidence interval, for each <%= repeat_by %> group.

The 95% confidence interval shows the estimated range of the true population proportion for each group. If the confidence interval includes the hypothesized proportion of <%= hypothesized_proportion %>, the proportion of <%= target %> is not statistically significantly different from the hypothesized proportion. If it does not include <%= hypothesized_proportion %>, the proportion is statistically significantly different from the hypothesized proportion.

<% } %>

{{confidence_interval}}

<% if (!repeat_by) { %>

<% if (p > baseline_p) { %>
Because this interval includes the hypothesized proportion of <%= hypothesized_proportion %>, the proportion of <%= target %> is not statistically significantly different from the hypothesized proportion.
<% } %>

<% if (p <= baseline_p) { %>
Because this interval does not include the hypothesized proportion of <%= hypothesized_proportion %>, the proportion of <%= target %> is statistically significantly different from the hypothesized proportion.
<% } %>

<% } %>


# Effect Size

The p-value is affected by sample size. With a large sample size, even a very small difference from the hypothesized proportion can be statistically significant. With a small sample size, a meaningful difference may not be statistically significant.

Therefore, it is important to review the effect size in addition to the p-value. In this test, Cohen's H is used as the effect size. Cohen's H is a standardized measure of how far the observed proportion of <%= target %> is from the hypothesized proportion.

The following table shows common guidelines for interpreting Cohen's H.

| Effect Size | Interpretation |
|------------|----------------|
| 0.2 | Small effect |
| 0.5 | Medium effect |
| 0.8 | Large effect |

<% if (!repeat_by) { %>

<% if (effect_size < 0.2) { %>
The effect size, measured by Cohen's H, is <%= effect_size %>, which can be interpreted as a small effect.
<% } else if (effect_size < 0.8) { %>
The effect size, measured by Cohen's H, is <%= effect_size %>, which can be interpreted as a medium effect.
<% } else { %>
The effect size, measured by Cohen's H, is <%= effect_size %>, which can be interpreted as a large effect.
<% } %>

<% if (p <= baseline_p && effect_size < 0.2) { %>
Although the p-value is statistically significant, the effect size is small. It is important to evaluate whether the difference from the hypothesized proportion is meaningful in practical terms.
<% } else if (p > baseline_p && effect_size >= 0.8) { %>
Although the p-value is not statistically significant, the effect size is large. This may indicate that the test did not have enough sample size or power to detect the difference from the hypothesized proportion. Review the confidence interval and statistical power as well.
<% } %>

<% } else { %>

It is important to review the effect size regardless of whether the p-value is statistically significant. A statistically significant result with a small effect size may not be practically meaningful. On the other hand, a non-significant result with a large effect size may indicate that the test did not have enough sample size or power to detect the difference.

<% } %>


# Statistical Power

Statistical power is the probability of detecting a difference when a difference of a certain size truly exists. A Type 2 Error is the probability of failing to detect such a difference.

In general, statistical power of 80% (0.8) or higher is considered desirable. If the power is lower than that, the test may fail to detect a real difference, so the result should be interpreted with caution.

<% if (!repeat_by) { %>

<% if (p > baseline_p) { %>

<% if (power < 0.5) { %>
The statistical power is **<%= power_pct %>% (<%= power %>)**, which is low. Even if a real difference from the hypothesized proportion exists, this test may not be able to detect it. Therefore, the non-significant result should be interpreted carefully. The Type 2 Error rate is **<%= type2_error_pct %>% (<%= type2_error %>)**.
<% } else if (power < 0.8) { %>
The statistical power is **<%= power_pct %>% (<%= power %>)**, which is somewhat low. Even if a real difference from the hypothesized proportion exists, this test may fail to detect it. Therefore, the non-significant result should be interpreted with caution. The Type 2 Error rate is **<%= type2_error_pct %>% (<%= type2_error %>)**.
<% } else { %>
The statistical power is **<%= power_pct %>% (<%= power %>)**, which is sufficiently high. This test is likely to detect a difference of a certain size if such a difference exists. The Type 2 Error rate is **<%= type2_error_pct %>% (<%= type2_error %>)**.
<% } %>

<% } else { %>
Because the result is statistically significant, it is especially important to review the effect size and confidence interval to evaluate the size and practical importance of the difference from the hypothesized proportion.
<% } %>

<% } else { %>

Statistical power and Type 2 Error are especially important when interpreting groups where the result is not statistically significant. A non-significant result with low power may simply mean that the sample size was not large enough to detect the difference.

<% } %>


# Descriptive Statistics

## Statistics

The statistics for <%= target %> are shown below.

{{statistics}}

## Distribution of Proportion

The following chart visualizes the observed proportion of <%= target %>.

This helps you understand the observed proportion and how it compares with the hypothesized proportion, beyond the statistical test result alone.

{{distribution}}

## Confidence Interval of Proportion

<% if (!repeat_by) { %>

The following chart shows the observed proportion of <%= target %>, along with its confidence interval. The reference line represents the hypothesized proportion of <%= hypothesized_proportion %>.

{{proportion}}

<% } else { %>

The following chart shows the observed proportion of <%= target %>, along with its confidence interval, for each <%= repeat_by %> group. The reference line represents the hypothesized proportion of <%= hypothesized_proportion %>.

{{proportion}}

<% } %>


# Assumptions and Notes

Please keep the following points in mind when interpreting a one-sample proportion test.

* The target variable should be logical data type (binary variable).
* The hypothesized proportion should be between 0 and 1.
* Each observation should be independent.
* The sample should be representative of the population of interest.
* The sample size should be sufficiently large. In particular, both the number of observations in the target category and the number outside the target category should not be too small.
* When sample sizes are small, the estimated proportion may be unstable.
* A statistically significant result does not necessarily mean that the difference from the hypothesized proportion is meaningful in practical terms. Review the effect size and confidence interval as well.
* A non-significant result does not prove that the true proportion is equal to the hypothesized proportion. Review the statistical power and confidence interval.
* The test assumes that observations are independent. It may not be appropriate for repeated measurements from the same individuals or subjects.

<% if (repeat_by) { %>
* Because multiple tests are performed across <%= repeat_by %> groups, statistically significant results may occur by chance. In addition to p-values, review the effect sizes, confidence intervals, sample sizes, and practical importance of the results.
<% } %>


# Additional Information

## Next Steps

* This analysis examined whether the proportion of <%= target %> differs from the hypothesized proportion of <%= hypothesized_proportion %>. However, other variables may also affect <%= target %>. To account for multiple factors at the same time, consider using a multivariate method such as logistic regression.
<% if (!repeat_by) { %>
* This test was performed on the overall data. You can also run the test separately by group by assigning a grouping variable to Repeat By and running the analysis again.
<% } %>


`;

module.exports = template;
