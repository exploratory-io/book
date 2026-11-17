const template = `
# Summary

<% if (!repeat_by) { %>

We investigated whether the difference in the mean of <%= target %> by <%= explanatory %> is significant.

{{summary_chart}}

<% if (p > baseline_p) { %>
As a result, the P-value is <%= p_pct %>% (<%= p %>), which is greater than the significance level <%= baseline_p_pct %>% (<%= baseline_p %>), so the difference in the mean of <%= target %> by <%= explanatory %> is not statistically significant.

  <% if (power < 0.5) { %>
However, the power is low at <%= power_pct %>% (<%= power %>), and the probability of overlooking a difference (Type 2 error) is very high at <%= type2_error_pct %>% (<%= type2_error %>), so caution is required.
  <% } else { %>
However, the power is somewhat low at <%= power_pct %>% (<%= power %>), and the probability of overlooking a difference (Type 2 error) is <%= type2_2_error_pct %>% (<%= type2_error %>), so caution is required.
  <% } %>
<% } %>

<% if (p <= baseline_p) { %>
As a result, the P-value is <%= p_pct %>% (<%= p %>), which is less than the significance level <%= baseline_p_pct %>% (<%= baseline_p %>), so the difference in the mean of <%= target %> by <%= explanatory %> is statistically significant.

  <% if (effect_size < 0.06) { %>
The effect size (Eta squared) is low at <%= effect_size_pct %>% (<%= effect_size %>), and the difference in the mean of <%= target %> by <%= explanatory %> is small.
  <% } else if (effect_size < 0.14) { %>
The effect size (Eta squared) is <%= effect_size_pct %>% (<%= effect_size %>), so the difference in the mean of <%= target %> by <%= explanatory %> is moderate.
  <% } else { %>
The effect size (Eta squared) is also large at <%= effect_size_pct %>% (<%= effect_size %>), so the difference in the mean of <%= target %> by <%= explanatory %> can be said to be large.
  <% } %>
<% } %>

<% } else { %>

We investigated whether the difference in the mean of <%= target %> by <%= explanatory %> is significant for each <%= repeat_by %>.

{{summary_chart}}

<% if (groups.some(group => group.p <= baseline_p)) { %>
For the following groups, since the P-value is less than the significance level <%= baseline_p_pct %>% (<%= baseline_p %>), we can say that it is statistically significant.
  <% groups.forEach(group => { %>
    <% if (group.p <= baseline_p) { %>
* <%= group.name %>
    <% } %>
  <% }); %>
<% } %>
<% if (groups.some(group => group.p > baseline_p)) { %>
For the following groups, since the P-value is greater than the significance level <%= baseline_p_pct %>% (<%= baseline_p %>), we cannot say that it is statistically significant.
  <% groups.forEach(group => { %>
    <% if (group.p > baseline_p) { %>
* <%= group.name %>
    <% } %>
  <% }); %>
<% } %>

<% } %>

{start_show_hide}
## Explanation of Statistical Metrics

* Sum of Squares
  * Sum of squares quantifies the variability of data. The total sum of squares represents the "total variability", the between-group sum of squares represents the "variability due to group differences", and the within-group sum of squares represents the "variability within groups (error)".
  * Takes values of 0 or more, and a larger value indicates greater variability.
  * The unit is the square of the data unit, making it difficult to interpret directly, and it is used to calculate F-value and effect size.

* Ratio of Squares
  * The ratio of squares indicates the proportion of variability for each factor (between-group and within-group) relative to the total variability.
  * Takes values between 0 and 1, and a larger between-group ratio of squares indicates a larger difference due to groups.
  * This value often corresponds to Eta squared and serves as a guideline for the magnitude of the effect.

* Degrees of Freedom
  * Degrees of freedom represent the amount of independent information in the data. Between-group degrees of freedom are calculated as "number of groups - 1", and within-group degrees of freedom are calculated as "total number of data - number of groups".
  * Always takes a positive integer value, and a larger value means more information is included in the analysis.
  * Degrees of freedom are essential for interpreting the F-value and are used in conjunction with the F-distribution table to find the P-value.

* Mean Square
  * Mean square is calculated as "sum of squares ÷ degrees of freedom" and is a measure of variance adjusted for degrees of freedom.
  * Takes values of 0 or more, and the ratio of the between-group mean square to the within-group mean square becomes the F-value.
  * The mean square itself has a unit that is the square of the data unit, so it is interpreted as a ratio (F-value) rather than directly.

* F-value
  * The F-value is "between-group mean square ÷ within-group mean square" and indicates how much larger the difference between groups is compared to the variability within groups.
  * A value greater than 1 indicates a higher possibility that the difference between groups is meaningful, and a larger value increases that possibility.
  * The specific criterion for judgment varies depending on the degrees of freedom and is interpreted by comparing with the F-distribution table.

* P-value
  * The P-value is the probability value that indicates the "possibility that the observed F-value occurred by chance".
  * Generally, if the P-value is less than 5% (0.05), it is judged to be statistically significant.
  * Values range from 0 to 1, where a smaller P-value indicates higher statistical significance.

* Power
  * Power is the "probability of statistically detecting a difference when there is actually a difference between groups".
  * Values range from 0 to 1 (0% to 100%), and generally, a value of 0.8 (80%) or more is considered good.
  * Low power increases the possibility of overlooking an actually existing difference.

* Type 2 Error
  * Type 2 error is the "probability of judging that there is no difference between groups when there actually is a difference".
  * Values range from 0 to 1, and there is a relationship of Power = 1 - Type 2 Error.
  * Generally, a value of 0.2 (20%) or less is desirable.

* Row Count
  * Row count is the number of data used in the analysis (sample size).
  * A larger number of data makes it easier to detect even small differences and increases the reliability of the results.
  * In ANOVA, it is desirable that the sample sizes of each group are as equal as possible.

* Eta Squared
  * Eta squared is a measure of effect size and indicates the ratio of the variability between groups to the total variability.
  * Values range from 0 to 1, where 0 indicates no effect and 1 indicates that all variability can be explained by the differences between groups.
  * Generally, 0.01 is interpreted as a small effect, 0.06 as a moderate effect, and 0.14 or more as a large effect.

* Partial Eta Squared
  * Partial Eta squared is a measure of effect size and indicates the magnitude of the effect "after excluding the effects of other factors".
  * Values range from 0 to 1, and a larger value indicates a larger effect of that factor.
  * Useful for evaluating the effect of each factor individually in analyses with multiple factors (e.g., two-way ANOVA).

* Cohen's F
  * Cohen's F is a measure of effect size based on the ratio of the difference between groups to the variability within groups.
  * Values are 0 or more, and 0.1 is interpreted as a small effect, 0.25 as a moderate effect, and 0.4 or more as a large effect.
  * Useful for comparing the magnitude of effects across different studies.

* Omega Squared
  * Omega squared is an improved measure of effect size over Eta squared, and is considered to have less bias due to sample size.
  * Values range from 0 to 1 (strictly speaking, it can also take negative values), and a larger value indicates a larger effect.
  * Generally, it will be slightly smaller than Eta squared, and the difference will be more pronounced with smaller sample sizes.
{end_show_hide}

# Significance

Significance can be judged based on the P-value.

## Significance - P-value

The null hypothesis in this test is that "there is no difference in the mean of <%= target %> between the multiple groups of <%= explanatory %>".

<% if (!repeat_by) { %>

<% if (p > baseline_p) { %>
As a result of the test, the P-value is <%= p_pct %>% (<%= p %>), so if the null hypothesis is true, the probability that a difference of <%= mean_diff %> or more would occur by chance, as in the current data, can be interpreted as approximately <%= p_pct %>%. Since it is greater than the significance level <%= baseline_p_pct %>, we cannot reject the null hypothesis. Therefore, the difference in <%= target %> due to <%= explanatory %> is not statistically significant.
<% } %>

<% if (p <= baseline_p) { %>
As a result of the test, the P-value is <%= p_pct %>% (<%= p %>), so if the null hypothesis is true, the probability that a difference of <%= mean_diff %> or more would occur by chance, as in the current data, can be interpreted as only about <%= p_pct %>%. Since it is less than or equal to the significance level <%= baseline_p_pct %>, we can reject the null hypothesis. Therefore, the difference in <%= target %> due to <%= explanatory %> is statistically significant.
<% } %>

The following chart visualizes where the P-value (blue dashed line) is located on the probability distribution F-distribution. The light blue area is the rejection region (of the null hypothesis).

<% } else { %>

If the null hypothesis is true, the P-value is the probability that a difference as large as or larger than the difference observed in the current data would occur by chance. If it is greater than the significance level <%= baseline_p_pct %>, we cannot reject the null hypothesis, so it is not statistically significant. Conversely, if it is less than or equal to <%= baseline_p_pct %>, we can reject the null hypothesis, so it is statistically significant.

The following chart visualizes where the P-value (blue dashed line) is located on the probability distribution F-distribution for each <%= repeat_by %>. The light blue area is the rejection region (of the null hypothesis).

<% } %>

{{probability_chart}}

The current significance level (P-value) is set to <%= baseline_p_pct %>% (<%= baseline_p %>), but this can be changed from [Settings](//analytics/settings) in Analytics.


# Effect Size

Since statistical significance (P-value) may be judged as "significant" even for small differences when the sample size is large, you can evaluate the actual magnitude of the effect based on the effect size.

In this test, one measure of effect size, Eta squared, is shown as <%= effect_size %>. This is the ratio of the magnitude of variability in the mean value of <%= target %> due to <%= explanatory %> to the total magnitude of variability. That is, it can be interpreted that <%= effect_size %> of the magnitude of variability in <%= target %> can be explained by <%= explanatory %>.

The following are guidelines for interpreting the magnitude of the effect size (Eta squared).

| Effect Size Value | Magnitude of Effect |
|------------|------------|
| 0.01 | Small effect |
| 0.06 | Moderate effect |
| 0.14 | Large effect |

<% if (!repeat_by) { %>

<% if (p > baseline_p) { %>
Effect size needs to be considered when the test results are judged to be significant, but since it is not significant this time, there is no need to pay particular attention.
<% } %>

<% if (p <= baseline_p) { %>
Since the test results are judged to be significant this time, it is necessary to pay attention to the effect size.
<% } %>

<% } else { %>

Effect size needs to be considered when the test results are judged to be significant. If it is not significant, there is no need to pay particular attention.

<% } %>

# Power

Power is the probability of correctly detecting a difference in the mean of <%= target %> due to <%= explanatory %> when there is actually a difference. The inverse of this power is the Type 2 error, which is the probability of being wrong when you judge something as not significant, that is, the probability that it might actually have been significant (there was a difference). Generally, a power of 80% (0.8) or more is considered desirable. If it is lower than that, caution is required.

<% if (!repeat_by) { %>

<% if (p > baseline_p) { %>

<% if (power < 0.5) { %>
The power is low at <%= power_pct %>% (<%= power %>). If you judge that it is not significant based on the P-value obtained this time, the probability of being wrong (Type 2 error) is as high as <%= type2_error_pct %>% (<%= type2_error %>), so you should be cautious in your judgment.
<% } else if (power < 0.8) { %>
The power is somewhat low at <%= power_pct %>% (<%= power %>). If you judge that it is not significant based on the P-value obtained this time, the probability of being wrong (Type 2 error) is <%= type2_error_pct %>% (<%= type2_error %>), so caution is required.
<% } else { %>
The power is sufficiently high at <%= power_pct %>% (<%= power %>), and even if you judge that it is not significant, the probability of being wrong is less than or equal to <%= type2_error_pct %>, so there is no need to pay particular attention.
<% } %>

<% } else { %>
This time, since we can judge that it is significant, there is no need to pay particular attention.
<% } %>

Power and Type 2 error should be considered when the test results are judged to be not significant. Conversely, if the difference is judged to be significant, there is no need to pay particular attention.

<% } else { %>

Power and Type 2 error should be considered when the test results are judged to be not significant. Conversely, if the difference is judged to be significant, there is no need to pay particular attention.

<% } %>

# Multiple Comparison

<% if (!repeat_by) { %>

<% if (p > baseline_p) { %>

Multiple comparison analysis is to investigate which combination of groups of <%= explanatory %> has a significant difference in the mean of <%= target %>. Since the overall difference in the mean of <%= target %> by <%= explanatory %> is not significant, there is no need to perform multiple comparison analysis, but the results are as follows for reference.

If the significance level is 5%, combinations with a P-value less than that value are statistically significant.

{{comparison}}

<% } %>

<% if (p <= baseline_p) { %>

The overall difference in the mean of <%= target %> by <%= explanatory %> was significant. Therefore, as a multiple comparison analysis, we investigated which combination of groups of <%= explanatory %> has a significant difference in the mean of <%= target %>. If you repeatedly perform the same test for multiple comparisons, the probability of incorrectly judging something as significant when it is actually not significant (Type 1 error) increases. Therefore, we apply <%= correction %> correction to the test results to control the probability of Type 1 error.

If the significance level is 5%, combinations with a P-value less than that value are statistically significant.

{{comparison}}

<% } %>

<% } else { %>

Multiple comparison analysis is to investigate which combination of groups of <%= explanatory %> has a significant difference in the mean of <%= target %>. If you repeatedly perform the same test for multiple comparisons, the probability of incorrectly judging something as significant when it is actually not significant (Type 1 error) increases. Therefore, we apply <%= correction %> correction to the test results to control the probability of Type 1 error.

If the significance level is 5%, combinations with a P-value less than that value are statistically significant.

{{comparison}}

<% } %>


# Descriptive Statistics Information

## Statistics

The statistics for each group are as follows.

{{statistics}}

## Data Distribution

The following is a visualization of the difference in the distribution of <%= target %> by <%= explanatory %> using density curves.

{start_lazy_show_hide}
### Chart
{{distribution}}
{end_lazy_show_hide}

## Confidence Interval of Mean

The following is a visualization of the confidence interval of the mean for each group using error bars.

{start_lazy_show_hide}
### Chart
{{mean}}
{end_lazy_show_hide}

# Appendix

## Next Steps

* This time, we analyzed the effect of one variable, <%= explanatory %>, on <%= target %>. However, other variables may also be affecting <%= target %>. Therefore, you can perform a multivariate analysis using "Linear Regression" or other methods to consider multiple factors simultaneously.
<% if (!repeat_by) { %>
* This test was performed on the entire data, but it is also possible to perform it separately for each group. In that case, you can select a variable to group by in "Repeat By" and re-run.
<% } %>
* If you want to perform tests on multiple metrics at once, you can do so by changing the shape of the data. For details, please refer to [this note](https://exploratory.io/note/exploratory/mxW2zKb2).

`;
module.exports = template; 