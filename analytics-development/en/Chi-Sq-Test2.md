const template = `
# Summary

<% if (!repeat_by) { %>

We examined whether the relationship between <%= target %> and <%= explanatory %> is significant.

{{summary}}

<% if (p > baseline_p) { %>
As a result, the P-value is <%= p_pct %>% (<%= p %>), which is greater than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), so the relationship between <%= target %> and <%= explanatory %> cannot be said to be statistically significant.

  <% if (power < 0.5) { %>
However, the statistical power is <%= power_pct %>% (<%= power %>), which is low, and even if there were actually a relationship, the probability of missing it (Type II error) is <%= type2_error_pct %>% (<%= type2_error %>), which is very high and requires attention.
  <% } else { %>
However, the statistical power is <%= power_pct %>% (<%= power %>), which is somewhat low, and even if there were actually a relationship, there is a <%= type2_error_pct %>% (<%= type2_error %>) probability of missing it (Type II error), which requires attention.
  <% } %>
<% } %>

<% if (p <= baseline_p) { %>
As a result, the P-value is <%= p_pct %>% (<%= p %>), which is lower than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), so the relationship between <%= target %> and <%= explanatory %> can be said to be statistically significant.

  <% if (effect_size < 0.1) { %>
The effect size (Cramer's V) is <%= effect_size %>, which is low, so the relationship between <%= target %> and <%= explanatory %> is small.
  <% } else if (effect_size < 0.3) { %>
The effect size is <%= effect_size %>, so the relationship between <%= target %> and <%= explanatory %> is moderate.
  <% } else { %>
The effect size is also large at <%= effect_size %>, so the relationship between <%= target %> and <%= explanatory %> can be said to be strong.
  <% } %>
<% } %>

<% } else { %>

We examined whether the relationship between <%= target %> and <%= explanatory %> is significant for each <%= repeat_by %>.

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
* Chi-square Value
  * The chi-square value is a statistic that measures the difference between observed and expected values, used to evaluate the association in categorical data.
  * Values are 0 or greater, where 0 means the observed and expected values match perfectly. Larger values indicate greater differences between observed and expected values.
  * Generally interpreted in combination with P-values, and the chi-square value itself has no absolute reference standard.

* P-value
  * P-value shows the probability that the observed data is as extreme or more extreme than what would be expected under the null hypothesis (no association between variables).
  * Generally, if less than 5% (0.05), it is judged to be statistically significant.
  * Values range from 0 to 1, and smaller P-values indicate higher statistical significance.

* Degrees of Freedom
  * Degrees of freedom in chi-square tests are determined by how the data is classified, generally calculated as "(number of rows - 1) × (number of columns - 1)".
  * Always takes positive integer values, and larger values allow for capturing more complex relationships between data.
  * Degrees of freedom serve as a standard for interpreting chi-square values; with the same chi-square value, larger degrees of freedom result in lower significance.

* Phi Coefficient
  * Phi coefficient is an indicator of the strength of association in a 2×2 contingency table (relationship between two binary variables).
  * Values range from -1 to +1, where 0 indicates no association, and values closer to ±1 indicate stronger association.
  * Generally, ±0.1 is interpreted as weak association, ±0.3 as moderate association, and ±0.5 or above as strong association.

* Cramer's V
  * Cramer's V is an indicator of the strength of association for contingency tables larger than 2×2, being an extension of the Phi coefficient.
  * Values range from 0 to 1, where 0 indicates no association and values closer to 1 indicate stronger association.
  * Generally, 0.1 is interpreted as weak association, 0.3 as moderate association, and 0.5 or above as strong association.

* Cohen's W
  * Cohen's W is an effect size indicator that shows the magnitude of effect in chi-square tests, unaffected by sample size.
  * Values range from 0 to infinity, with 0.1 interpreted as small effect, 0.3 as medium effect, and 0.5 or above as large effect.
  * Useful for comparing effect sizes across studies with different sample sizes.

* Statistical Power
  * Statistical power represents the probability of correctly detecting an effect when it actually exists.
  * Values range from 0 to 1, with generally 0.8 (80%) or higher being desirable.
  * Low power indicates the possibility of missing effects that actually exist.

* Type II Error
  * Type II error is "the probability of concluding there is no effect when there actually is one".
  * Values range from 0 to 1, with the relationship: power = 1 - Type II error.
  * Generally, 0.2 (20%) or lower is desirable.

* Number of Rows
  * Number of rows indicates the total number of data (sample size) used in the analysis.
  * Larger sample sizes increase the statistical power of tests and improve the reliability of results.
  * The required sample size varies depending on the type of test and effect size.
{end_show_hide}

# Significance

Significance can be determined by P-values.

{{summary}}

## Significance - P-value

The null hypothesis for this test is "there is no relationship between <%= target %> and <%= explanatory %>".

<% if (!repeat_by) { %>

<% if (p > baseline_p) { %>
As a result of the test, the P-value was <%= p_pct %>% (<%= p %>). This means that if the null hypothesis were true, the probability that the proportions of each group of <%= explanatory %> for <%= target %> would differ as much as in the current data is about <%= p_pct %>%. With a significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), this probability is sufficiently high, so we cannot reject the null hypothesis. In other words, the relationship between <%= target %> and <%= explanatory %> cannot be said to be statistically significant.
<% } %>

<% if (p <= baseline_p) { %>
As a result of the test, the P-value was <%= p_pct %>% (<%= p %>). This means that if the null hypothesis were true, the probability that the proportions of each group of <%= explanatory %> in each group of <%= target %> would differ as much as in the current data would be only about <%= p_pct %>%. With a significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), this probability is sufficiently low, so we can reject the null hypothesis. In other words, the relationship between <%= target %> and <%= explanatory %> can be said to be statistically significant.
<% } %>

The following chart visualizes where the P-value (blue dotted line) is positioned within the chi-square distribution, which is a probability distribution. Since the chi-square distribution is a right-tailed test, the right-side area becomes the rejection region (for the null hypothesis).

<% } else { %>

When the null hypothesis is true, the P-value is the probability that the proportions by group of <%= target %> and <%= explanatory %> differ as much as or more than in the current data. If it is greater than the significance level of <%= baseline_p_pct %>%, we cannot reject the null hypothesis, so it cannot be said to be statistically significant. Conversely, if it is <%= baseline_p_pct %>% or below, we can reject the null hypothesis, so it can be said to be statistically significant.

The following chart visualizes where the P-value (blue dotted line) is positioned within the chi-square distribution, which is a probability distribution, for each <%= repeat_by %>. Since the chi-square distribution is a right-tailed test, the right-side area becomes the rejection region (for the null hypothesis).

<% } %>

{{probability_dist}}

The current significance level (P-value) is set to <%= baseline_p_pct %>% (<%= baseline_p %>), but this can be changed from [Settings](//analytics/settings) in Analytics.



# Effect Size

Statistical significance (P-value) can sometimes judge even small differences as "significant" when sample size is large, so the actual magnitude of effect can be evaluated based on effect size. In this test, Cramer's V, which is an effect size measure, is calculated. This is a standardized measure of the magnitude of relationship between <%= target %> and <%= explanatory %>.

Guidelines for judging the magnitude of effect size (Cramer's V) are as follows:

| Effect Size Value | Effect Size Magnitude |
|-------------------|----------------------|
| 0.1 | Small effect |
| 0.3 | Medium effect |
| 0.5 | Large effect |

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

## Statistical Power

Statistical power is the probability of correctly detecting a relationship when there actually is a relationship between <%= target %> and <%= explanatory %>. The inverse of this power is Type II error, which is the probability of being wrong when judging as not significant, i.e., the probability that it might have actually been significant (had a relationship). Generally, statistical power should be 80% (0.8) or higher. If it's lower than that, caution is needed.

<% if (!repeat_by) { %>

<% if (p > baseline_p) { %>

<% if (power < 0.5) { %>
The statistical power is <%= power_pct %>% (<%= power %>), which is a low value. If we judge as not significant based on the P-value obtained this time, there is a **<%= type2_error_pct %>% (<%= type2_error %>)** probability of being wrong (Type II error), so we should be cautious in our judgment.
<% } else if (power < 0.8) { %>
The statistical power is <%= power_pct %>% (<%= power %>), which is somewhat low. If we judge as not significant based on the P-value obtained this time, there is a **<%= type2_error_pct %>% (<%= type2_error %>)** probability of being wrong (Type II error), so caution is needed.
<% } else { %>
The statistical power is <%= power_pct %>% (<%= power %>), which is sufficiently high, and even if we judge as not significant, the probability of being wrong is only <%= type2_error_pct %>% or less, so no particular attention is needed.
<% } %>

<% } else { %>
Since we can judge as significant this time, no particular attention is needed.
<% } %>

Statistical power and Type II error need attention when judging as not significant based on test results. Conversely, if the relationship is judged to be significant, no particular attention is needed.

<% } else { %>

Statistical power and Type II error need attention when judging as not significant based on test results. Conversely, if the relationship is judged to be significant, no particular attention is needed.

<% } %>


# Descriptive Statistics

## Proportions (Table)

The following shows the proportions of each group of <%= explanatory %> in each group of <%= target %> in table format.

### Chart
{{pivot}}

## Proportions (Chart)

The following visualizes the proportions of each group of <%= explanatory %> in each group of <%= target %> using a bar chart.

{start_lazy_show_hide}
### Chart
{{ratio}}
{end_lazy_show_hide}

## Contribution to Chi-square Value

The following visualizes the proportion that each combination of <%= target %> and <%= explanatory %> groups contributes to the chi-square value, which is an indicator of overall "deviation." The color intensity of circles indicates the contribution rate, with darker blue meaning that combination has greater "deviation" compared to other combinations. The size of circles represents the amount of data, with larger circles meaning more data for that combination.

{start_lazy_show_hide}
### Chart
{{contribution}}
{end_lazy_show_hide}

# Next Steps

<% if (is_target_logical) { %>
* This time we analyzed the impact of one variable, <%= explanatory %>, on <%= target %>. However, other variables may also influence <%= target %>. Therefore, you can use multivariate analysis such as "Logistic Regression" to simultaneously consider multiple factors.
<% } %>
<% if (!repeat_by) { %>
* This test was performed on the overall data, but it can also be conducted separately for each group. In that case, you can select a grouping variable in "Repeat By" and re-run the analysis.
<% } %>
* If you want to test multiple indicators together in a batch, this is possible by changing the data format. For details, please refer to [this note](https://exploratory.io/note/exploratory/mxW2zKb2).

`;

module.exports = template; 