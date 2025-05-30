# Summary

<% if (!repeat_by) { %>

We examined whether the difference in means of <%= target %> by <%= explanatory %> is significant after adjusting for <%= covariate %> as a covariate.

{{summary}}

<% if (p_explanatory > baseline_p && p_interaction > baseline_p) { %>
As a result, both the main effect of <%= explanatory %> (P-value: <%= p_explanatory_pct %>%) and the interaction of <%= explanatory %> * <%= covariate %> (P-value: <%= p_interaction_pct %>%) are greater than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), so the difference in means of <%= target %> by <%= explanatory %> after adjusting for the effect of <%= covariate %> is not statistically significant.
<% } %>

<% if (p_explanatory <= baseline_p && p_interaction > baseline_p) { %>
As a result, the main effect of <%= explanatory %> (P-value: <%= p_explanatory_pct %>%) is greater than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>) and is not statistically significant. The interaction of <%= explanatory %> * <%= covariate %> (P-value: <%= p_interaction_pct %>%) is lower than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>) and is statistically significant.

  <% if (effect_size_explanatory < 0.06) { %>
The effect size (Eta squared) of <%= explanatory %> is <%= effect_size_explanatory_pct %>%, which is small, and the difference in means of <%= target %> by <%= explanatory %> after adjusting for the effect of <%= covariate %> is small.
  <% } else if (effect_size_explanatory < 0.14) { %>
The effect size (Eta squared) of <%= explanatory %> is <%= effect_size_explanatory_pct %>%, so the difference in means of <%= target %> by <%= explanatory %> after adjusting for the effect of <%= covariate %> is moderate.
  <% } else { %>
The effect size (Eta squared) of <%= explanatory %> is also large at <%= effect_size_explanatory_pct %>%, and the difference in means of <%= target %> by <%= explanatory %> after adjusting for the effect of <%= covariate %> can be said to be large.
  <% } %>
<% } %>

<% if (p_explanatory > baseline_p && p_interaction <= baseline_p) { %>
  As a result, the interaction of <%= explanatory %> * <%= covariate %> (P-value: <%= p_interaction_pct %>%) is lower than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>) and is statistically significant, but the main effect of <%= explanatory %> (P-value: <%= p_explanatory_pct %>%) is greater than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>) and is not statistically significant. The significant interaction indicates that the effect of <%= explanatory %> on <%= target %> varies depending on the value of <%= covariate %>.

  <% if (effect_size_interaction < 0.06) { %>
The effect size (Eta squared) of the interaction is <%= effect_size_interaction_pct %>%, which is small, and the difference in means of <%= target %> due to the interaction between <%= explanatory %> and <%= covariate %> is small.
  <% } else if (effect_size_interaction < 0.14) { %>
The effect size (Eta squared) of the interaction is <%= effect_size_interaction_pct %>%, so the difference in means of <%= target %> due to the interaction between <%= explanatory %> and <%= covariate %> is moderate.
  <% } else { %>
The effect size (Eta squared) of the interaction is also large at <%= effect_size_interaction_pct %>%, and the difference in means of <%= target %> due to the interaction between <%= explanatory %> and <%= covariate %> can be said to be large.
  <% } %>
<% } %>

<% if (p_explanatory <= baseline_p && p_interaction <= baseline_p) { %>
As a result, both the main effect of <%= explanatory %> (P-value: <%= p_explanatory_pct %>%) and the interaction of <%= explanatory %> * <%= covariate %> (P-value: <%= p_interaction_pct %>%) are lower than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>) and are statistically significant. The significant interaction indicates that the effect of <%= explanatory %> on <%= target %> varies depending on the value of <%= covariate %>. Therefore, the interpretation of the main effect of <%= explanatory %> should be done carefully.

  <% if (effect_size_explanatory < 0.06) { %>
The effect size (Eta squared) of <%= explanatory %> is <%= effect_size_explanatory_pct %>%, which is small, and the difference in means of <%= target %> by <%= explanatory %> after adjusting for the effect of <%= covariate %> is small.
  <% } else if (effect_size_explanatory < 0.14) { %>
The effect size (Eta squared) of <%= explanatory %> is <%= effect_size_explanatory_pct %>%, so the difference in means of <%= target %> by <%= explanatory %> after adjusting for the effect of <%= covariate %> is moderate.
  <% } else { %>
The effect size (Eta squared) of <%= explanatory %> is also large at <%= effect_size_explanatory_pct %>%, and the difference in means of <%= target %> by <%= explanatory %> after adjusting for the effect of <%= covariate %> can be said to be large.
  <% } %>

  <% if (effect_size_interaction < 0.06) { %>
The effect size (Eta squared) of the interaction is <%= effect_size_interaction_pct %>%, which is small, and the difference in means of <%= target %> due to the interaction between <%= explanatory %> and <%= covariate %> is small.
  <% } else if (effect_size_interaction < 0.14) { %>
The effect size (Eta squared) of the interaction is <%= effect_size_interaction_pct %>%, so the difference in means of <%= target %> due to the interaction between <%= explanatory %> and <%= covariate %> is moderate.
  <% } else { %>
The effect size (Eta squared) of the interaction is also large at <%= effect_size_interaction_pct %>%, and the difference in means of <%= target %> due to the interaction between <%= explanatory %> and <%= covariate %> can be said to be large.
  <% } %>
<% } %>

<% } else { %>

We examined whether the difference in means of <%= target %> by <%= explanatory %> is significant after adjusting for <%= covariate %> as a covariate for each <%= repeat_by %>.

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

* Variable
  * Variable shows the name of factors included in the analysis. In ANCOVA, mainly "covariate" and "factor (independent variable)" are displayed.
  * Covariate is a continuous variable to be controlled (e.g., age, score), and factor is a categorical variable whose effect is to be examined.

* Sum of Squares
  * Sum of Squares quantifies the variability in the data. The sum of squares for the covariate represents variability due to the covariate, and the sum of squares for the factor represents variability due to the factor after removing the effect of the covariate.
  * Takes values of 0 or greater, and larger values indicate greater variability due to that variable.
  * Units are the square of the data units, making direct interpretation difficult, so it is used for calculating F-values and effect sizes.

* Sum of Squares Ratio
  * Sum of Squares Ratio shows the proportion of each variable's variability relative to the total variability.
  * Takes values between 0 and 1, and larger values indicate greater influence of that variable.
  * This value often corresponds to Eta squared and serves as a measure of effect size.

* Degrees of Freedom
  * Degrees of Freedom represent the amount of independent information in the data. For covariates, it's usually 1 (per covariate), for factors it's "number of levels - 1", and for error it's "total data points - number of covariates - number of groups".
  * Always takes positive integer values, and larger values indicate more information included in the analysis.
  * Degrees of freedom are essential for interpreting F-values and are used together with F-distribution tables to determine P-values.

* Mean Square
  * Mean Square is calculated as "Sum of Squares ÷ Degrees of Freedom" and is an indicator of variance adjusted for degrees of freedom.
  * Takes values of 0 or greater, and the ratio of each variable's mean square to the error mean square becomes the F-value.
  * Mean square itself has units that are the square of the data units, so it's better interpreted as ratios (F-values) rather than directly.

* F-value
  * F-value is "each variable's mean square ÷ error mean square" and shows how large the effect of that variable is compared to error.
  * The larger the value above 1, the higher the possibility that the variable's effect is meaningful, and the larger the value, the higher this possibility.
  * Specific criteria depend on degrees of freedom and are interpreted by comparing with F-distribution tables.

* P-value
  * P-value shows the probability that the observed data is as extreme or more extreme than what would be expected under the null hypothesis (no effect of the variable).
  * Generally, if less than 5% (0.05), it is judged to be statistically significant.
  * Values range from 0 to 1, and smaller P-values indicate higher statistical significance.

* Eta Squared
  * Eta Squared is an effect size indicator showing the proportion of each variable's variability relative to the total variability.
  * Values range from 0 to 1, where 0 means no effect and 1 means all variability can be explained by that variable.
  * Generally, 0.01 is considered a small effect, 0.06 a medium effect, and 0.14 or above a large effect.

* Partial Eta Squared
  * Partial Eta Squared is an effect size indicator showing the magnitude of effect "after removing the effects of other variables".
  * Values range from 0 to 1, and larger values indicate greater effect of that variable.
  * In ANCOVA, it is particularly useful for evaluating the effect of factors after adjusting for covariate effects.

* Cohen's F
  * Cohen's F is an effect size indicator based on the ratio of variable effect to error.
  * Values are 0 or greater, with 0.1 being a small effect, 0.25 a medium effect, and 0.4 or above a large effect.
  * Useful for comparing effect sizes across different studies.

* Omega Squared
  * Omega Squared is an improved effect size indicator over Eta Squared, said to have less bias due to sample size.
  * Values range from 0 to 1 (strictly speaking, can take negative values), and larger values indicate greater effects.
  * Generally produces slightly smaller values than Eta Squared and is recommended when sample size is small or when considering generalization to future studies.
{end_show_hide}

# Significance

Significance can be determined by P-values.

## Main Effect of <%= explanatory %> (P-value)

<% if (!repeat_by) { %>

The null hypothesis for the main effect of <%= explanatory %> is "there is no difference in the means of <%= target %> among multiple groups of <%= explanatory %> after adjusting for the effect of <%= covariate %>".

<% if (p_explanatory > baseline_p) { %>
As a result of the test, the P-value was <%= p_explanatory_pct %>% (<%= p_explanatory %>). This means that if the null hypothesis were true, the probability of obtaining an F-value like the current data (<%= f_explanatory %>) by chance would be about <%= p_explanatory_pct %>%. With a significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), this probability is sufficiently high, so we cannot reject the null hypothesis. In other words, the difference in means of <%= target %> by <%= explanatory %> after adjusting for the effect of <%= covariate %> cannot be said to be statistically significant.
<% } %>

<% if (p_explanatory <= baseline_p) { %>
As a result of the test, the P-value was <%= p_explanatory_pct %>% (<%= p_explanatory %>). This means that if the null hypothesis were true, the probability of obtaining an F-value like the current data (<%= f_explanatory %>) by chance would be only about <%= p_explanatory_pct %>%. With a significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), this probability is sufficiently low, so we can reject the null hypothesis. In other words, the difference in means of <%= target %> by <%= explanatory %> after adjusting for the effect of <%= covariate %> can be said to be statistically significant.
<% } %>

<% } else { %>

When the null hypothesis is true, the P-value is the probability of obtaining an F-value equal to or greater than that observed in the current data by chance. If it is greater than the significance level of <%= baseline_p_pct %>%, we cannot reject the null hypothesis, so it cannot be said to be statistically significant. Conversely, if it is <%= baseline_p_pct %>% or below, we can reject the null hypothesis, so it can be said to be statistically significant.

<% } %>

## Effect of <%= covariate %> (P-value)

The null hypothesis for the effect of <%= covariate %> is "there is no linear relationship between <%= target %> and <%= covariate %>".

<% if (!repeat_by) { %>

<% if (p_covariate > baseline_p) { %>
As a result of the test, the P-value was <%= p_covariate_pct %>% (<%= p_covariate %>). This means that if the null hypothesis were true, the probability of obtaining an F-value like the current data (<%= f_covariate %>) by chance would be about <%= p_covariate_pct %>%. With a significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), this probability is sufficiently high, so we cannot reject the null hypothesis. In other words, it cannot be said that there is a statistically significant linear relationship between <%= target %> and <%= covariate %>.
<% } %>

<% if (p_covariate <= baseline_p) { %>
As a result of the test, the P-value was <%= p_covariate_pct %>% (<%= p_covariate %>). This means that if the null hypothesis were true, the probability of obtaining an F-value like the current data (<%= f_covariate %>) by chance would be only about <%= p_covariate_pct %>%. With a significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), this probability is sufficiently low, so we can reject the null hypothesis. In other words, it can be said that there is a statistically significant linear relationship between <%= target %> and <%= covariate %>.
<% } %>

<% } else { %>

When the null hypothesis is true, the P-value is the probability of obtaining an F-value equal to or greater than that observed in the current data by chance. If it is greater than the significance level of <%= baseline_p_pct %>%, we cannot reject the null hypothesis, so it cannot be said to be statistically significant. Conversely, if it is <%= baseline_p_pct %>% or below, we can reject the null hypothesis, so it can be said to be statistically significant.

<% } %>


## Interaction of <%= explanatory %> * <%= covariate %> (P-value)

The null hypothesis for the interaction between <%= explanatory %> and <%= covariate %> is "the relationship between <%= target %> and <%= covariate %> is the same in each group of <%= explanatory %>".

<% if (!repeat_by) { %>

<% if (p_interaction > baseline_p) { %>
As a result of the test, the P-value was <%= p_interaction_pct %>% (<%= p_interaction %>). This means that if the null hypothesis were true, the probability of obtaining an F-value like the current data (<%= f_interaction %>) by chance would be about <%= p_interaction_pct %>%. With a significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), this probability is sufficiently high, so we cannot reject the null hypothesis. In other words, it cannot be said that there is a statistically significant difference in the relationship between <%= target %> and <%= covariate %> in each group of <%= explanatory %>.
<% } %>

<% if (p_interaction <= baseline_p) { %>
As a result of the test, the P-value was <%= p_interaction_pct %>% (<%= p_interaction %>). This means that if the null hypothesis were true, the probability of obtaining an F-value like the current data (<%= f_interaction %>) by chance would be only about <%= p_interaction_pct %>%. With a significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), this probability is sufficiently low, so we can reject the null hypothesis. In other words, it can be said that there is a statistically significant difference in the relationship between <%= target %> and <%= covariate %> in each group of <%= explanatory %>. This means that the effect of <%= explanatory %> on <%= target %> varies depending on the value of <%= covariate %>.
<% } %>

<% } else { %>

When the null hypothesis is true, the P-value is the probability of obtaining an F-value equal to or greater than that observed in the current data by chance. If it is greater than the significance level of <%= baseline_p_pct %>%, we cannot reject the null hypothesis, so it cannot be said to be statistically significant. Conversely, if it is <%= baseline_p_pct %>% or below, we can reject the null hypothesis, so it can be said to be statistically significant.

<% } %>

<% if (!repeat_by) { %>

The following chart visualizes where the P-value (blue dotted line) is positioned within the F-distribution, which is a probability distribution. Since the F-distribution is a right-tailed test, the right-side area becomes the rejection region (for the null hypothesis).

<% } else { %>

The following chart visualizes where the P-value (blue dotted line) is positioned within the F-distribution, which is a probability distribution, for each <%= repeat_by %>. Since the F-distribution is a right-tailed test, the right-side area becomes the rejection region (for the null hypothesis).

<% } %>

{{probability_dist}}

The current significance level (P-value) is set to <%= baseline_p_pct %>% (<%= baseline_p %>), but this can be changed from [Settings](//analytics/settings) in Analytics.

# Effect Size

This test uses Eta squared as the effect size measure. Eta squared is an indicator of how much the explanatory variables or interactions can explain the variability in the dependent variable. Values range from 0 to 1, and closer to 1 means a larger effect.

The following table shows guidelines for interpreting effect sizes (Eta squared) in ANCOVA.

| Effect Size Value | Effect Size Magnitude |
|-------------------|----------------------|
| 0.01 | Small effect |
| 0.06 | Medium effect |
| 0.14 | Large effect |

<% if (!repeat_by) { %>

<% if (p_explanatory > baseline_p) { %>
Effect size needs attention when the test result is judged significant, but since it is not significant this time, there is no particular need for attention.
<% } %>

<% if (p_explanatory <= baseline_p) { %>
Since this test result can be judged as significant, attention to effect size is necessary.
<% } %>

<% } else { %>

Effect size needs attention when the test result is judged significant. If it is not significant, there is no particular need for attention.

<% } %>

# Multiple Comparisons

Multiple comparison analysis is for examining which combinations of groups for each variable show significant differences in the means of <%= target %>. When performing the same type of test repeatedly for multiple comparisons, the probability of incorrectly judging something as significant when it is not truly significant (Type I error) increases. The test results are corrected using <%= correction %> correction to control the Type I error probability within expected limits.

Combinations where the following P-values are below the significance level of 5% can be said to have statistically significant differences in means of <%= target %>.

{{comparison}}

# Descriptive Statistics

## Statistics

The adjusted statistical values for each group are as follows:

{{statistics}}

## Data Distribution

The following visualization shows the differences in distribution of <%= target %> by <%= explanatory %> using density curves.

{start_lazy_show_hide}
### Chart
{{distribution}}
{end_lazy_show_hide}

## Confidence Intervals of Means

The following visualization shows the confidence intervals of means for each group using error bars.

{start_lazy_show_hide}
### Chart
{{means}}
{end_lazy_show_hide}

## Adjusted Means

The following visualization shows the confidence intervals of <%= target %> means adjusted for the mean values of <%= covariate %> for each <%= explanatory %> group using error bars.

{start_lazy_show_hide}
### Chart
{{adjusted_means}}
{end_lazy_show_hide}

# Next Steps

* This time we analyzed the effect of <%= explanatory %> on <%= target %> while adjusting for <%= covariate %>. However, other variables may also influence <%= target %>. Therefore, you can perform multivariate analysis using "Linear Regression" to simultaneously consider multiple factors.
<% if (!repeat_by) { %>
* This test was performed on the overall data, but it can also be conducted separately for each group. In that case, you can select a grouping variable in "Repeat By" and re-run the analysis.
<% } %>
* If you want to test multiple indicators together in a batch, this is possible by changing the data format. For details, please refer to [this note](https://exploratory.io/note/exploratory/mxW2zKb2).

`;

module.exports = template; 