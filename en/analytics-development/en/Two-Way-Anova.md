const template = `
# Summary

<% if (!repeat_by) { %>

We examined whether the differences in means of <%= target %> by <%= explanatory1 %> and <%= explanatory2 %>, as well as their interaction, are significant.

{{summary}}

<% if (p1 > baseline_p && p2 > baseline_p && p_interaction > baseline_p) { %>
As a result, the main effect of <%= explanatory1 %> (P-value: <%= p1_pct %>%), the main effect of <%= explanatory2 %> (P-value: <%= p2_pct %>%), and the interaction of <%= explanatory1 %> * <%= explanatory2 %> (P-value: <%= p_interaction_pct %>%) are all greater than the significance level of 5% (0.05). Therefore, the differences in means of <%= target %> are not statistically significant.
<% } %>

<% if (p1 <= baseline_p && p2 > baseline_p && p_interaction > baseline_p) { %>
As a result, the main effect of <%= explanatory1 %> (P-value: <%= p1_pct %>%) is lower than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>) and therefore statistically significant, but the main effect of <%= explanatory2 %> (P-value: <%= p2_pct %>%) and the interaction of <%= explanatory1 %> * <%= explanatory2 %> (P-value: <%= p_interaction_pct %>%) are greater than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>) and therefore not statistically significant.

 <% if (effect_size1 < 0.06) { %>
The effect size (Eta squared) of <%= explanatory1 %> is <%= effect_size1_pct %>%, which is low, indicating that the difference in means of <%= target %> by <%= explanatory1 %> is small.
 <% } else if (effect_size1 < 0.14) { %>
The effect size (Eta squared) of <%= explanatory1 %> is <%= effect_size1_pct %>%, so the difference in means of <%= target %> by <%= explanatory1 %> is moderate.
 <% } else { %>
The effect size (Eta squared) of <%= explanatory1 %> is also <%= effect_size1_pct %>%, which is large, indicating that the difference in means of <%= target %> by <%= explanatory1 %> is substantial.
 <% } %>
<% } %>

<% if (p1 > baseline_p && p2 <= baseline_p && p_interaction > baseline_p) { %>
As a result, the main effect of <%= explanatory2 %> (P-value: <%= p2_pct %>%) is lower than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>) and therefore statistically significant, but the main effect of <%= explanatory1 %> (P-value: <%= p1_pct %>%) and the interaction of <%= explanatory1 %> * <%= explanatory2 %> (P-value: <%= p_interaction_pct %>%) are greater than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>) and therefore not statistically significant.

 <% if (effect_size2 < 0.06) { %>
The effect size (Eta squared) of <%= explanatory2 %> is <%= effect_size2_pct %>%, which is low, indicating that the difference in means of <%= target %> by <%= explanatory2 %> is small.
 <% } else if (effect_size2 < 0.14) { %>
The effect size (Eta squared) of <%= explanatory2 %> is <%= effect_size2_pct %>%, so the difference in means of <%= target %> by <%= explanatory2 %> is moderate.
 <% } else { %>
The effect size (Eta squared) of <%= explanatory2 %> is also <%= effect_size2_pct %>%, which is large, indicating that the difference in means of <%= target %> by <%= explanatory2 %> is substantial.
 <% } %>
<% } %>

<% if (p1 > baseline_p && p2 > baseline_p && p_interaction <= baseline_p) { %>
As a result, the interaction of <%= explanatory1 %> * <%= explanatory2 %> (P-value: <%= p_interaction_pct %>%) is lower than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>) and therefore statistically significant, but the main effect of <%= explanatory1 %> (P-value: <%= p1_pct %>%) and the main effect of <%= explanatory2 %> (P-value: <%= p2_pct %>%) are greater than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>) and therefore not statistically significant.

 <% if (effect_size_interaction < 0.06) { %>
The effect size (Eta squared) of the interaction is <%= effect_size_interaction_pct %>%, which is low, indicating that the difference in means of <%= target %> by the combination of <%= explanatory1 %> and <%= explanatory2 %> is small.
 <% } else if (effect_size_interaction < 0.14) { %>
The effect size (Eta squared) of the interaction is <%= effect_size_interaction_pct %>%, so the difference in means of <%= target %> by the combination of <%= explanatory1 %> and <%= explanatory2 %> is moderate.
 <% } else { %>
The effect size (Eta squared) of the interaction is also <%= effect_size_interaction_pct %>%, which is large, indicating that the difference in means of <%= target %> by the combination of <%= explanatory1 %> and <%= explanatory2 %> is substantial.
 <% } %>
<% } %>

<% if (p1 <= baseline_p && p2 <= baseline_p && p_interaction > baseline_p) { %>
As a result, both the main effect of <%= explanatory1 %> (P-value: <%= p1_pct %>%) and the main effect of <%= explanatory2 %> (P-value: <%= p2_pct %>%) are lower than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>) and therefore statistically significant, but the interaction of <%= explanatory1 %> * <%= explanatory2 %> (P-value: <%= p_interaction_pct %>%) is greater than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>) and therefore not statistically significant.

 <% if (effect_size1 < 0.06) { %>
The effect size (Eta squared) of <%= explanatory1 %> is <%= effect_size1_pct %>%, which is low, indicating that the difference in means of <%= target %> by <%= explanatory1 %> is small.
 <% } else if (effect_size1 < 0.14) { %>
The effect size (Eta squared) of <%= explanatory1 %> is <%= effect_size1_pct %>%, so the difference in means of <%= target %> by <%= explanatory1 %> is moderate.
 <% } else { %>
The effect size (Eta squared) of <%= explanatory1 %> is also <%= effect_size1_pct %>%, which is large, indicating that the difference in means of <%= target %> by <%= explanatory1 %> is substantial.
 <% } %>

 <% if (effect_size2 < 0.06) { %>
The effect size (Eta squared) of <%= explanatory2 %> is <%= effect_size2_pct %>%, which is low, indicating that the difference in means of <%= target %> by <%= explanatory2 %> is small.
 <% } else if (effect_size2 < 0.14) { %>
The effect size (Eta squared) of <%= explanatory2 %> is <%= effect_size2_pct %>%, so the difference in means of <%= target %> by <%= explanatory2 %> is moderate.
 <% } else { %>
The effect size (Eta squared) of <%= explanatory2 %> is also <%= effect_size2_pct %>%, which is large, indicating that the difference in means of <%= target %> by <%= explanatory2 %> is substantial.
 <% } %>
<% } %>

<% if (p1 <= baseline_p && p2 > baseline_p && p_interaction <= baseline_p) { %>
As a result, the main effect of <%= explanatory1 %> (P-value: <%= p1_pct %>%) and the interaction of <%= explanatory1 %> * <%= explanatory2 %> (P-value: <%= p_interaction_pct %>%) are lower than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>) and therefore statistically significant, but the main effect of <%= explanatory2 %> (P-value: <%= p2_pct %>%) is greater than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>) and therefore not statistically significant. When the interaction is significant, the interpretation of main effects should be done carefully.

 <% if (effect_size1 < 0.06) { %>
The effect size (Eta squared) of <%= explanatory1 %> is <%= effect_size1_pct %>%, which is low, indicating that the difference in means of <%= target %> by <%= explanatory1 %> is small.
 <% } else if (effect_size1 < 0.14) { %>
The effect size (Eta squared) of <%= explanatory1 %> is <%= effect_size1_pct %>%, so the difference in means of <%= target %> by <%= explanatory1 %> is moderate.
 <% } else { %>
The effect size (Eta squared) of <%= explanatory1 %> is also <%= effect_size1_pct %>%, which is large, indicating that the difference in means of <%= target %> by <%= explanatory1 %> is substantial.
 <% } %>

 <% if (effect_size_interaction < 0.06) { %>
The effect size (Eta squared) of the interaction is <%= effect_size_interaction_pct %>%, which is low, indicating that the difference in means of <%= target %> by the combination of <%= explanatory1 %> and <%= explanatory2 %> is small.
 <% } else if (effect_size_interaction < 0.14) { %>
The effect size (Eta squared) of the interaction is <%= effect_size_interaction_pct %>%, so the difference in means of <%= target %> by the combination of <%= explanatory1 %> and <%= explanatory2 %> is moderate.
 <% } else { %>
The effect size (Eta squared) of the interaction is also <%= effect_size_interaction_pct %>%, which is large, indicating that the difference in means of <%= target %> by the combination of <%= explanatory1 %> and <%= explanatory2 %> is substantial.
 <% } %>
<% } %>

<% if (p1 > baseline_p && p2 <= baseline_p && p_interaction <= baseline_p) { %>
As a result, the main effect of <%= explanatory2 %> (P-value: <%= p2_pct %>%) and the interaction of <%= explanatory1 %> * <%= explanatory2 %> (P-value: <%= p_interaction_pct %>%) are lower than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>) and therefore statistically significant, but the main effect of <%= explanatory1 %> (P-value: <%= p1_pct %>%) is greater than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>) and therefore not statistically significant. When the interaction is significant, the interpretation of main effects should be done carefully.

 <% if (effect_size2 < 0.06) { %>
The effect size (Eta squared) of <%= explanatory2 %> is <%= effect_size2_pct %>%, which is low, indicating that the difference in means of <%= target %> by <%= explanatory2 %> is small.
 <% } else if (effect_size2 < 0.14) { %>
The effect size (Eta squared) of <%= explanatory2 %> is <%= effect_size2_pct %>%, so the difference in means of <%= target %> by <%= explanatory2 %> is moderate.
 <% } else { %>
The effect size (Eta squared) of <%= explanatory2 %> is also <%= effect_size2_pct %>%, which is large, indicating that the difference in means of <%= target %> by <%= explanatory2 %> is substantial.
 <% } %>

 <% if (effect_size_interaction < 0.06) { %>
The effect size (Eta squared) of the interaction is <%= effect_size_interaction_pct %>%, which is low, indicating that the difference in means of <%= target %> by the combination of <%= explanatory1 %> and <%= explanatory2 %> is small.
 <% } else if (effect_size_interaction < 0.14) { %>
The effect size (Eta squared) of the interaction is <%= effect_size_interaction_pct %>%, so the difference in means of <%= target %> by the combination of <%= explanatory1 %> and <%= explanatory2 %> is moderate.
 <% } else { %>
The effect size (Eta squared) of the interaction is also <%= effect_size_interaction_pct %>%, which is large, indicating that the difference in means of <%= target %> by the combination of <%= explanatory1 %> and <%= explanatory2 %> is substantial.
 <% } %>
<% } %>

<% if (p1 <= baseline_p && p2 <= baseline_p && p_interaction <= baseline_p) { %>
As a result, the main effect of <%= explanatory1 %> (P-value: <%= p1_pct %>%), the main effect of <%= explanatory2 %> (P-value: <%= p2_pct %>%), and the interaction of <%= explanatory1 %> * <%= explanatory2 %> (P-value: <%= p_interaction_pct %>%) are all lower than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>) and therefore statistically significant. When the interaction is significant, the interpretation of main effects should be done carefully.

 <% if (effect_size1 < 0.06) { %>
The effect size (Eta squared) of <%= explanatory1 %> is <%= effect_size1_pct %>%, which is low, indicating that the difference in means of <%= target %> by <%= explanatory1 %> is small.
 <% } else if (effect_size1 < 0.14) { %>
The effect size (Eta squared) of <%= explanatory1 %> is <%= effect_size1_pct %>%, so the difference in means of <%= target %> by <%= explanatory1 %> is moderate.
 <% } else { %>
The effect size (Eta squared) of <%= explanatory1 %> is also <%= effect_size1_pct %>%, which is large, indicating that the difference in means of <%= target %> by <%= explanatory1 %> is substantial.
 <% } %>

 <% if (effect_size2 < 0.06) { %>
The effect size (Eta squared) of <%= explanatory2 %> is <%= effect_size2_pct %>%, which is low, indicating that the difference in means of <%= target %> by <%= explanatory2 %> is small.
 <% } else if (effect_size2 < 0.14) { %>
The effect size (Eta squared) of <%= explanatory2 %> is <%= effect_size2_pct %>%, so the difference in means of <%= target %> by <%= explanatory2 %> is moderate.
 <% } else { %>
The effect size (Eta squared) of <%= explanatory2 %> is also <%= effect_size2_pct %>%, which is large, indicating that the difference in means of <%= target %> by <%= explanatory2 %> is substantial.
 <% } %>

 <% if (effect_size_interaction < 0.06) { %>
The effect size (Eta squared) of the interaction is <%= effect_size_interaction_pct %>%, which is low, indicating that the difference in means of <%= target %> by the combination of <%= explanatory1 %> and <%= explanatory2 %> is small.
 <% } else if (effect_size_interaction < 0.14) { %>
The effect size (Eta squared) of the interaction is <%= effect_size_interaction_pct %>%, so the difference in means of <%= target %> by the combination of <%= explanatory1 %> and <%= explanatory2 %> is moderate.
 <% } else { %>
The effect size (Eta squared) of the interaction is also <%= effect_size_interaction_pct %>%, which is large, indicating that the difference in means of <%= target %> by the combination of <%= explanatory1 %> and <%= explanatory2 %> is substantial.
 <% } %>
<% } %>


<% } else { %>

We examined whether the difference in means of <%= target %> by <%= explanatory1 %> and <%= explanatory2 %> is significant for each <%= repeat_by %>.

{{summary}}

<% if (groups.some(group => group.p <= baseline_p)) { %>
In the following groups, the P-value is lower than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), so they are statistically significant:
  <% groups.forEach(group => { %>
    <% if (group.p <= baseline_p) { %>
* <%= group.name %>
    <% } %>
  <% }); %>
<% } %>
<% if (groups.some(group => group.p > baseline_p)) { %>
In the following groups, the P-value is higher than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), so they are not statistically significant:
  <% groups.forEach(group => { %>
    <% if (group.p > baseline_p) { %>
* <%= group.name %>
    <% } %>
  <% }); %>
<% } %>

<% } %>

The significance level (P-value) for this test is set to <%= baseline_p_pct %>% (<%= baseline_p %>), but this can be changed in Analytics [Settings](//analytics/settings).

{start_show_hide}
## Key Statistical Indicators
* Variable
  * Variable shows the name of factors included in the analysis. In Two-Way ANOVA, mainly "Factor A", "Factor B", and "Interaction (A×B)" are displayed.
  * Factor A and Factor B are each independent variable, and interaction shows the combined effect of the two factors.
  * When interaction is significant, it means that the effect of one factor differs depending on the level of the other factor.

* Sum of Squares
  * Sum of squares quantifies the variability in data. The sum of squares for each factor and interaction represents the variability caused by each factor.
  * It takes values of 0 or higher, with larger values indicating greater variability caused by that factor.
  * Since the unit is the square of the data unit, it is difficult to interpret directly and is used to calculate F-values and effect sizes.

* Sum of Squares Ratio
  * Sum of squares ratio shows the proportion of variability for each factor relative to the total variability.
  * It takes values between 0 and 1, with larger values indicating greater influence of that factor.
  * This value often corresponds to Eta squared and serves as a measure of effect size.

* Degrees of Freedom
  * Degrees of freedom represents the amount of independent information in data. For factor A, it is "number of levels of A - 1", for factor B it is "number of levels of B - 1", for interaction it is "degrees of freedom of A × degrees of freedom of B", and for error it is "total number of data - number of groups".
  * It always takes positive integer values, with larger values indicating more information included in the analysis.
  * Degrees of freedom is essential for interpreting F-values and is used together with F-distribution tables to determine P-values.

* Mean Square
  * Mean square is calculated as "sum of squares ÷ degrees of freedom" and is a variance measure adjusted for degrees of freedom.
  * It takes values of 0 or higher, and the ratio of mean square for each factor to error mean square becomes the F-value.
  * Since mean square itself has units of data unit squared, it is interpreted through ratios (F-values) rather than directly.

* F-value
  * F-value is "mean square for each factor ÷ error mean square" and shows how large the effect of that factor is compared to error.
  * Values greater than 1 indicate higher possibility that the factor's effect is meaningful, with larger values indicating higher possibility.
  * Specific criteria vary depending on degrees of freedom and are interpreted by comparing with F-distribution tables.

* P-value
  * P-value indicates the probability that observed data is as extreme or more extreme than what would be expected under the null hypothesis (no effect of factors).
  * Generally, values less than 5% (0.05) are considered statistically significant.
  * Values range from 0 to 1, with smaller P-values indicating higher statistical significance.

* Eta Squared
  * Eta squared is an effect size measure that shows the proportion of variability for each factor relative to total variability.
  * Values range from 0 to 1, where 0 indicates no effect and 1 indicates that all variability can be explained by that factor.
  * Generally, 0.01 is considered a small effect, 0.06 a medium effect, and 0.14 or higher a large effect.

* Partial Eta Squared
  * Partial Eta squared is an effect size measure that shows the magnitude of effect "after removing the effects of other factors".
  * Values range from 0 to 1, with larger values indicating greater effect of that factor.
  * In two-way ANOVA, it is particularly useful when evaluating the effects of each factor and interaction individually.

* Cohen's F
  * Cohen's F is an effect size measure based on the ratio between factor effects and error.
  * Values are 0 or higher, with 0.1 considered a small effect, 0.25 a medium effect, and 0.4 or higher a large effect.
  * It is useful for comparing effect sizes between different studies.

* Omega Squared
  * Omega squared is an improved effect size measure from Eta squared that is said to have less bias due to sample size.
  * Values range from 0 to 1 (strictly speaking, can take negative values), with larger values indicating greater effects.
  * It generally shows slightly smaller values than Eta squared and is recommended for small sample sizes or when considering generalization to future studies.
{end_show_hide}

# Significance

Significance can be determined based on P-values.

<% if (!repeat_by) { %>
## Main Effect of <%= explanatory1 %> (P-value)

The null hypothesis for the main effect of <%= explanatory1 %> is "there is no difference in means of <%= target %> between multiple groups of <%= explanatory1 %>".

<% if (p1 > baseline_p) { %>
As a result of the test, the P-value is <%= p1_pct %>% (<%= p1 %>). This means that if the null hypothesis is correct, the probability of obtaining an F-value like this data (<%= main_effect1_f %>) by chance is approximately <%= p1_pct %>%. Since the significance level is <%= baseline_p_pct %>% (<%= baseline_p %>), this probability is sufficiently high, so we cannot reject the null hypothesis. Therefore, the difference in means of <%= target %> by <%= explanatory1 %> is not statistically significant.
<% } %>

<% if (p1 <= baseline_p) { %>
As a result of the test, the P-value is <%= p1_pct %>% (<%= p1 %>). This means that if the null hypothesis is correct, the probability of obtaining an F-value like this data (<%= main_effect1_f %>) by chance is only approximately <%= p1_pct %>%. Since the significance level is <%= baseline_p_pct %>% (<%= baseline_p %>), this probability is sufficiently low, so we can reject the null hypothesis. Therefore, the difference in means of <%= target %> by <%= explanatory1 %> is statistically significant.
<% } %>

## Main Effect of <%= explanatory2 %> (P-value)

The null hypothesis for the main effect of <%= explanatory2 %> is "there is no difference in means of <%= target %> between multiple groups of <%= explanatory2 %>".

<% if (p2 > baseline_p) { %>
As a result of the test, the P-value is <%= p2_pct %>% (<%= p2 %>). This means that if the null hypothesis is correct, the probability of obtaining an F-value like this data (<%= main_effect2_f %>) by chance is approximately <%= p2_pct %>%. Since the significance level is <%= baseline_p_pct %>% (<%= baseline_p %>), this probability is sufficiently high, so we cannot reject the null hypothesis. Therefore, the difference in means of <%= target %> by <%= explanatory2 %> is not statistically significant.
<% } %>

<% if (p2 <= baseline_p) { %>
As a result of the test, the P-value is <%= p2_pct %>% (<%= p2 %>). This means that if the null hypothesis is correct, the probability of obtaining an F-value like this data (<%= main_effect2_f %>) by chance is only approximately <%= p2_pct %>%. Since the significance level is <%= baseline_p_pct %>% (<%= baseline_p %>), this probability is sufficiently low, so we can reject the null hypothesis. Therefore, the difference in means of <%= target %> by <%= explanatory2 %> is statistically significant.
<% } %>

## Interaction of <%= explanatory1 %> * <%= explanatory2 %> (P-value)

The null hypothesis for the interaction between <%= explanatory1 %> and <%= explanatory2 %> is "the effect of <%= explanatory1 %> on the mean of <%= target %> is the same for each group of <%= explanatory2 %>".

<% if (p_interaction > baseline_p) { %>
As a result of the test, the P-value is <%= p_interaction_pct %>% (<%= p_interaction %>). This means that if the null hypothesis is correct, the probability of obtaining an F-value like this data (<%= interaction_f %>) by chance is approximately <%= p_interaction_pct %>%. Since the significance level is <%= baseline_p_pct %>% (<%= baseline_p %>), this probability is sufficiently high, so we cannot reject the null hypothesis. Therefore, the interaction between <%= explanatory1 %> and <%= explanatory2 %> is not statistically significant.
<% } %>

<% if (p_interaction <= baseline_p) { %>
As a result of the test, the P-value is <%= p_interaction_pct %>% (<%= p_interaction %>). This means that if the null hypothesis is correct, the probability of obtaining an F-value like this data (<%= interaction_f %>) by chance is only approximately <%= p_interaction_pct %>%. Since the significance level is <%= baseline_p_pct %>% (<%= baseline_p %>), this probability is sufficiently low, so we can reject the null hypothesis. Therefore, the interaction between <%= explanatory1 %> and <%= explanatory2 %> is statistically significant.
<% } %>

<% } else { %>

If the null hypothesis is correct, the P-value is the probability that differences as observed in this data or greater could occur by chance. If it is greater than the significance level of <%= baseline_p_pct %>%, we cannot reject the null hypothesis, so it is not statistically significant. Conversely, if it is <%= baseline_p_pct %>% or lower, we can reject the null hypothesis, so it is statistically significant.

The following chart visualizes where the P-value (blue dotted line) is positioned in the F-distribution for each <%= repeat_by %>. The light blue area represents the (null hypothesis) rejection region.

<% } %>


{{probability_dist}}

The current significance level (P-value) is set to <%= baseline_p_pct %>% (<%= baseline_p %>), but this can be changed in Analytics [Settings](//analytics/settings).

## Effect Size

Statistical significance (P-value) can sometimes determine "significance" even for small differences when sample size is large, so the actual magnitude of effects can be evaluated based on effect size.

In this test, we use Eta squared, which is one of the effect size measures. This represents the ratio of variability in <%= target %> due to <%= explanatory1 %>, <%= explanatory2 %>, and their interaction to the overall variability. In other words, it shows what proportion of the overall variability in <%= target %> can be explained by each factor.

The guidelines for judging the magnitude of effect size (Eta squared) are as follows:

| Effect Size Value | Effect Size Magnitude |
|-------------------|----------------------|
| 0.01 | Small effect |
| 0.06 | Medium effect |
| 0.14 | Large effect |

<% if (!repeat_by) { %>

<% if (p1 <= baseline_p) { %>

### Effect Size of Main Effect of <%= explanatory1 %>
In this test, Eta squared, which is one of the effect size measures, is shown as <%= effect_size1 %>. This is the ratio of the magnitude of variability in mean values of <%= target %> by <%= explanatory1 %> to the overall variability. In other words, <%= effect_size1_pct %>% of the variability in <%= target %> can be explained by <%= explanatory1 %>.

<% if (effect_size1 < 0.06) { %>
The effect size (Eta squared) is <%= effect_size1_pct %>%, which is low, indicating that the difference in means of <%= target %> by <%= explanatory1 %> is small.
<% } else if (effect_size1 < 0.14) { %>
The effect size (Eta squared) is <%= effect_size1_pct %>%, so the difference in means of <%= target %> by <%= explanatory1 %> is moderate.
<% } else { %>
The effect size (Eta squared) is also <%= effect_size1_pct %>%, which is large, indicating that the difference in means of <%= target %> by <%= explanatory1 %> is substantial.
<% } %>
<% } %>

<% if (p2 <= baseline_p) { %>
### Effect Size of Main Effect of <%= explanatory2 %>
In this test, Eta squared, which is one of the effect size measures, is shown as <%= effect_size2 %>. This is the ratio of the magnitude of variability in mean values of <%= target %> by <%= explanatory2 %> to the overall variability. In other words, <%= effect_size2_pct %>% of the variability in <%= target %> can be explained by <%= explanatory2 %>.

<% if (effect_size2 < 0.06) { %>
The effect size (Eta squared) is <%= effect_size2_pct %>%, which is low, indicating that the difference in means of <%= target %> by <%= explanatory2 %> is small.
<% } else if (effect_size2 < 0.14) { %>
The effect size (Eta squared) is <%= effect_size2_pct %>%, so the difference in means of <%= target %> by <%= explanatory2 %> is moderate.
<% } else { %>
The effect size (Eta squared) is also <%= effect_size2_pct %>%, which is large, indicating that the difference in means of <%= target %> by <%= explanatory2 %> is substantial.
<% } %>
<% } %>

<% if (p_interaction <= baseline_p) { %>
### Effect Size of Interaction <%= explanatory1 %> * <%= explanatory2 %>
In this test, Eta squared, which is one of the effect size measures, is shown as <%= effect_size_interaction %>. This is the ratio of the magnitude of variability in mean values of <%= target %> due to the interaction between <%= explanatory1 %> and <%= explanatory2 %> to the overall variability. In other words, <%= effect_size_interaction_pct %>% of the variability in <%= target %> can be explained by the interaction between <%= explanatory1 %> and <%= explanatory2 %>.

<% if (effect_size_interaction < 0.06) { %>
The effect size (Eta squared) is <%= effect_size_interaction_pct %>%, which is low, indicating that the difference in means of <%= target %> due to the interaction between <%= explanatory1 %> and <%= explanatory2 %> is small.
<% } else if (effect_size_interaction < 0.14) { %>
The effect size (Eta squared) is <%= effect_size_interaction_pct %>%, so the difference in means of <%= target %> due to the interaction between <%= explanatory1 %> and <%= explanatory2 %> is moderate.
<% } else { %>
The effect size (Eta squared) is also <%= effect_size_interaction_pct %>%, which is large, indicating that the difference in means of <%= target %> due to the interaction between <%= explanatory1 %> and <%= explanatory2 %> is substantial.
<% } %>
<% } %>

<% } else { %>

Effect size needs attention when test results are judged significant. If not significant, there is no particular need for attention.

<% } %>

# Multiple Comparisons - Variables

Multiple comparison analysis is for examining which combinations of groups in each variable show significant differences in means of <%= target %>. When performing similar tests repeatedly for multiple comparisons, the probability of incorrectly judging as significant when it is actually not significant (Type I error) increases. The test results are corrected using <%= correction %> correction to control the Type I error probability within expected limits.

The combinations where the P-value is 5% or lower have statistically significant differences in means of <%= target %>.

{{comparison}}

# Multiple Comparisons - Interaction

Multiple comparison analysis for interaction is for examining which pairs of combinations of <%= explanatory1 %> and <%= explanatory2 %> show significant differences in means of <%= target %>. When performing similar tests repeatedly for multiple comparisons, the probability of incorrectly judging as significant when it is actually not significant (Type I error) increases. The test results are corrected using <%= correction %> correction to control the Type I error probability within expected limits.

The combinations where the P-value is 5% or lower have statistically significant differences in means of <%= target %>.

{{interaction_comparison}}

# Descriptive Statistics

## Statistical Values

The statistical values for each group are as follows:

{{statistics}}

## Data Distribution

The following visualizes the difference in distribution of <%= target %> by <%= explanatory1 %> and <%= explanatory2 %> using density curves.

{start_lazy_show_hide}
### Chart
{{distribution}}
{end_lazy_show_hide}

## Mean Interaction (Line)

The following visualizes the interaction effects of <%= explanatory1 %> and <%= explanatory2 %> on <%= target %>.

{start_lazy_show_hide}
### Chart
{{mean_line}}
{end_lazy_show_hide}

# Next Steps

* This time we analyzed the impact of two variables, <%= explanatory1 %> and <%= explanatory2 %>, on <%= target %>. However, other variables may also influence <%= target %>. Therefore, you can perform multivariate analysis using "Linear Regression" etc., to consider multiple factors simultaneously.
<% if (!repeat_by) { %>
* This test was performed on the overall data, but it can also be conducted by dividing into groups. In that case, you can select a grouping variable for "Repeat by" and re-run the analysis.
<% } %>
* If you want to test multiple indicators in batch, it is possible by changing the data format. For details, please refer to [this note](https://exploratory.io/note/exploratory/mxW2zKb2).

`;

module.exports = template; 