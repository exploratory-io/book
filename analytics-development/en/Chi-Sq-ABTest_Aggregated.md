const template = `
# Summary

<% if (!repeat_by) { %>

We examined whether the relationship between <%= target %> and <%= explanatory %> is significant.

{{summary}}

<% if (p > baseline_p) { %>
As a result, the P-value is <%= p_pct %>% (<%= p %>), which is greater than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), so the relationship between <%= target %> and <%= explanatory %> is not statistically significant.

  <% if (power < 0.5) { %>
However, the power is <%= power_pct %>% (<%= power %>), which is low, and if there actually is a relationship, the probability of missing it (Type II error) is <%= type2_error_pct %>% (<%= type2_error %>), which is very high and requires attention.
  <% } else { %>
However, the power is <%= power_pct %>% (<%= power %>), which is somewhat low, and if there actually is a relationship, the probability of missing it (Type II error) is <%= type2_error_pct %>% (<%= type2_error %>), which requires attention.
  <% } %>
<% } %>

<% if (p <= baseline_p) { %>
As a result, the P-value is <%= p_pct %>% (<%= p %>), which is lower than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), so the relationship between <%= target %> and <%= explanatory %> is statistically significant.

  <% if (effect_size < 0.1) { %>
The effect size (Cramer's V) is <%= effect_size %>, which is low, indicating a small relationship between <%= target %> and <%= explanatory %>.
  <% } else if (effect_size < 0.3) { %>
The effect size is <%= effect_size %>, so the relationship between <%= target %> and <%= explanatory %> is moderate.
  <% } else { %>
The effect size is also <%= effect_size %>, which is large, indicating a strong relationship between <%= target %> and <%= explanatory %>.
  <% } %>
<% } %>

<% } else { %>

We examined whether the relationship between <%= target %> and <%= explanatory %> is significant for each <%= repeat_by %>.

{{summary}}

<% if (groups.some(group => group.p <= baseline_p)) { %>
For the following groups, the P-value is lower than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), so it is statistically significant.
  <% groups.forEach(group => { %>
    <% if (group.p <= baseline_p) { %>
* <%= group.name %>
    <% } %>
  <% }); %>
<% } %>
<% if (groups.some(group => group.p > baseline_p)) { %>
For the following groups, the P-value is higher than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), so it is not statistically significant.
  <% groups.forEach(group => { %>
    <% if (group.p > baseline_p) { %>
* <%= group.name %>
    <% } %>
  <% }); %>
<% } %>

<% } %>

The significance level (P-value) for this test is set to <%= baseline_p_pct %>% (<%= baseline_p %>), but this can be changed in Analytics [Settings](//analytics/settings).

{start_show_hide}
## Statistical Indicators Explained
* Chi-square value
  * The chi-square value is a statistic that measures the difference between observed and expected values, used to evaluate the association of categorical data.
  * Values are 0 or greater, with 0 meaning that observed and expected values match perfectly. Larger values indicate greater differences between observed and expected values.
  * Generally interpreted in combination with P-values, and chi-square values themselves have no absolute reference values.

* P-value
  * The P-value indicates the probability that the observed data is equal to or more extreme than the null hypothesis (no association between variables).
  * Generally, if less than 5% (0.05), it is considered statistically significant.
  * Values range from 0 to 1, with smaller P-values indicating higher statistical significance.

* Degrees of freedom
  * Degrees of freedom in chi-square tests are determined by how the data is classified, generally calculated as "(number of rows - 1) × (number of columns - 1)".
  * Always takes positive integer values, with larger values capturing more complex relationships between data.
  * Degrees of freedom serve as a reference for interpreting chi-square values; with the same chi-square value, larger degrees of freedom result in lower significance.

* Phi coefficient
  * The Phi coefficient is an indicator of the strength of association in a 2×2 contingency table (relationship between two binary variables).
  * Values range from -1 to +1, with 0 indicating no association and values closer to ±1 indicating stronger association.
  * Generally, ±0.1 is interpreted as weak association, ±0.3 as moderate association, and ±0.5 or higher as strong association.

* Cramer's V
  * Cramer's V is an indicator of the strength of association for contingency tables larger than 2×2, extending the Phi coefficient.
  * Values range from 0 to 1, with 0 indicating no association and values closer to 1 indicating stronger association.
  * Generally, 0.1 is interpreted as weak association, 0.3 as moderate association, and 0.5 or higher as strong association.

* Cohen's W
  * Cohen's W is an effect size indicator that shows the magnitude of effect in chi-square tests, unaffected by sample size.
  * Values range from 0 to infinity, with 0.1 interpreted as small effect, 0.3 as moderate effect, and 0.5 or higher as large effect.
  * Useful for comparing effect sizes between studies with different sample sizes.

* Power
  * Power represents the probability of statistically detecting an effect when it actually exists.
  * Values range from 0 to 1, with 0.8 (80%) or higher generally considered desirable.
  * Low power indicates a possibility of missing effects that actually exist.

* Type II Error
  * Type II error is "the probability of concluding there is no effect when there actually is one."
  * Values range from 0 to 1, with the relationship: Power = 1 - Type II Error.
  * Generally, 0.2 (20%) or lower is considered desirable.

* Number of rows
  * The number of rows indicates the total number of data points (sample size) used in the analysis.
  * Larger sample sizes increase the power of statistical tests and improve the reliability of results.
  * The required sample size varies depending on the type of test and effect size.
{end_show_hide}

# Significance

Significance can be determined by the P-value.

## Significance - P-value

The null hypothesis for this test is "there is no relationship between <%= target %> and <%= explanatory %>".

<% if (!repeat_by) { %>

<% if (p > baseline_p) { %>
The test resulted in a P-value of <%= p_pct %>% (<%= p %>). This means that if the null hypothesis is correct, the probability that the proportions of each group of <%= explanatory %> within <%= target %> would differ as much as in the current data is approximately <%= p_pct %>%. With a significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), this probability is sufficiently high, so we cannot reject the null hypothesis. Therefore, the relationship between <%= target %> and <%= explanatory %> is not statistically significant.
<% } %>

<% if (p <= baseline_p) { %>
The test resulted in a P-value of <%= p_pct %>% (<%= p %>). This means that if the null hypothesis is correct, the probability that the proportions of each group of <%= explanatory %> within each group of <%= target %> would differ as much as in the current data is only approximately <%= p_pct %>%. With a significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), this probability is sufficiently low, so we can reject the null hypothesis. Therefore, the relationship between <%= target %> and <%= explanatory %> is statistically significant.
<% } %>

The following chart visualizes where the P-value (blue dotted line) is positioned in the chi-square distribution. Since the chi-square distribution uses a right-tailed test, the right-side area represents the (null hypothesis) rejection region.

<% } else { %>

If the null hypothesis is correct, the P-value is the probability that the proportions by group of <%= target %> and <%= explanatory %> would differ as much as or more than in the current data. If it is greater than the significance level of <%= baseline_p_pct %>%, we cannot reject the null hypothesis, so it is not statistically significant. Conversely, if it is <%= baseline_p_pct %>% or lower, we can reject the null hypothesis, so it is statistically significant.

The following chart visualizes where the P-value (blue dotted line) is positioned in the chi-square distribution for each <%= repeat_by %>. Since the chi-square distribution uses a right-tailed test, the right-side area represents the (null hypothesis) rejection region.

<% } %>

{{probability_dist}}

The current significance level (P-value) is set to <%= baseline_p_pct %>% (<%= baseline_p %>), but this can be changed in Analytics [Settings](//analytics/settings).



# Effect Size

Statistical significance (P-value) can sometimes determine "significance" even for small differences when the sample size is large, so the actual magnitude of the effect can be evaluated based on effect size. In this test, the effect size Cramer's V is calculated. This is a standardized measure of the magnitude of the relationship between <%= target %> and <%= explanatory %>.

The guidelines for judging the magnitude of effect size (Cramer's V) are as follows:

| Effect Size Value | Effect Size Magnitude |
|------------|------------|
| 0.1 | Small effect |
| 0.3 | Medium effect |
| 0.5 | Large effect |

<% if (!repeat_by) { %>

<% if (p > baseline_p) { %>
Effect size needs attention when the test result is judged significant, but since this time it is not significant, there is no particular need for attention.
<% } %>

<% if (p <= baseline_p) { %>
Since this test result can be judged as significant, attention to effect size is necessary.
<% } %>

<% } else { %>

Effect size needs attention when the test result is judged significant. If not significant, there is no particular need for attention.

<% } %>

## Power

Power is the probability of correctly detecting a relationship when there actually is one between <%= target %> and <%= explanatory %>. The inverse of this power is Type II error, which is the probability of being wrong when judging as not significant, i.e., the probability that it might actually have been significant (there was a relationship). Generally, power should be 80% (0.8) or higher. If it is lower, attention is required.

<% if (!repeat_by) { %>

<% if (p > baseline_p) { %>

<% if (power < 0.5) { %>
The power is <%= power_pct %>% (<%= power %>), which is a low value. If we judge as not significant based on the P-value obtained this time, the probability of being wrong (Type II error) is **<%= type2_error_pct %>% (<%= type2_error %>)**, so we should be cautious in our judgment.
<% } else if (power < 0.8) { %>
The power is <%= power_pct %>% (<%= power %>), which is somewhat low. If we judge as not significant based on the P-value obtained this time, the probability of being wrong (Type II error) is **<%= type2_error_pct %>% (<%= type2_error %>)**, which requires attention.
<% } else { %>
The power is <%= power_pct %>% (<%= power %>), which is sufficiently high, and even if we judge as not significant, the probability of being wrong is only <%= type2_error_pct %>% or less, so no particular attention is needed.
<% } %>

<% } else { %>
Since we can judge as significant this time, no particular attention is needed.
<% } %>

Power and Type II error need attention when judging as not significant based on test results. Conversely, if the relationship is judged as significant, no particular attention is needed.

<% } else { %>

Power and Type II error need attention when judging as not significant based on test results. Conversely, if the relationship is judged as significant, no particular attention is needed.

<% } %>


# Descriptive Statistics

## Proportions (Table)

The following shows the proportions of each group of <%= explanatory %> within each group of <%= target %> in table format.

### Chart
{{pivot}}

## Proportions (Chart)

The following visualizes the proportions of each group of <%= explanatory %> within each group of <%= target %> using a bar chart.

{start_lazy_show_hide}
### Chart
{{ratio}}
{end_lazy_show_hide}

## Contribution to Chi-square Value

The following visualizes the proportion that each combination of <%= target %> and <%= explanatory %> groups contributes to the chi-square value, which is an indicator of overall "deviation". The color intensity of the circles indicates the contribution rate, with darker blue meaning that combination has greater "deviation" compared to other combinations. The size of the circles represents the amount of data, with larger circles indicating more data for that combination.

{start_lazy_show_hide}
### Chart
{{contribution}}
{end_lazy_show_hide}

# Next Steps

<% if (is_target_logical) { %>
* This time we analyzed the influence of one variable, <%= explanatory %>, on <%= target %>. However, other variables may also influence <%= target %>. Therefore, multivariate analysis using "Logistic Regression" or similar methods can be used to analyze multiple factors simultaneously.
<% } %>
<% if (!repeat_by) { %>
* This test was conducted on the overall data, but it can also be performed separately by groups. In that case, you can select a grouping variable for "Repeat by" and re-run the analysis.
<% } %>
* If you want to test multiple indicators collectively in batch, this is possible by changing the data format. For details, please see [this note](https://exploratory.io/note/exploratory/mxW2zKb2).

`;

module.exports = template;