const template = `

# Summary

A one-sample t-test checks whether an observed mean differs from a hypothesized mean.

<% if (!repeat_by) { %>
The observed mean of <%= target_col %> is <%= observed_mean %> (n = <%= n_total %>), compared with the hypothesized mean of <%= mu %>.

<% if (significant) { %>
The difference (<%= difference %>) is **statistically significant** at the <%= sig_level_pct %>% level (p = <%= p_value %>). There is sufficient evidence to conclude the observed mean differs from the hypothesized mean.
<% } else { %>
The difference (<%= difference %>) is **not statistically significant** at the <%= sig_level_pct %>% level (p = <%= p_value %>). There is insufficient evidence to conclude the observed mean differs from the hypothesized mean.
<% } %>
<% } else { %>
We examined whether the observed mean of <%= target_col %> differs from the hypothesized mean of <%= mu %> for each <%= repeat_by %>.

<% if (groups.some(group => group.significant)) { %>
For the following groups, the difference is **statistically significant** at the <%= sig_level_pct %>% level:
  <% groups.forEach(group => { %>
    <% if (group.significant) { %>
* <%= group.name %> (observed mean <%= group.observed_mean %>, p = <%= group.p_value %>)
    <% } %>
  <% }); %>
<% } %>
<% if (groups.some(group => !group.significant)) { %>
For the following groups, the difference is **not statistically significant** at the <%= sig_level_pct %>% level:
  <% groups.forEach(group => { %>
    <% if (!group.significant) { %>
* <%= group.name %> (observed mean <%= group.observed_mean %>, p = <%= group.p_value %>)
    <% } %>
  <% }); %>
<% } %>
<% } %>

{{summary_chart}}


{start_show_hide}
## Explanation of Statistical Metrics


**Effect Size (Cohen's d)**: Cohen's d measures the magnitude of difference between the observed mean and the hypothesized mean. Values of 0.2, 0.5, and 0.8 indicate small, medium, and large effects, respectively.

**Statistical Power**: Power is the probability of correctly detecting a true difference. Values above 0.8 are generally considered adequate.

**t-Test**: The one-sample t-test compares the sample mean to a known or hypothesized value using the t-distribution. It is appropriate for continuous numeric variables when you want to test whether the population mean equals a specific value.
{end_show_hide}


# Chart

The chart below shows the t-distribution. The dotted line marks the observed t value, and the shaded area is the critical region at the significance level. When the t value falls inside the shaded region, the observed mean is statistically significantly different from the hypothesized mean.

{{probability_dist}}

The chart below shows the same test on the scale of the mean. It is the t-distribution of the sample mean under the assumption that the population mean equals the hypothesized mean (centered at the hypothesized mean), with a spread determined by the standard error. The dotted line marks the observed mean, and the shaded area is the critical region at the significance level. When the observed mean falls inside the shaded region, it is statistically significantly different from the hypothesized mean.

{{probability_dist_mean}}

The chart below visualizes the observed mean together with its confidence interval. When the confidence interval does not contain the hypothesized mean, the difference is statistically significant at the corresponding level.

{{confidence_interval}}


`;

module.exports = template;
