const template = `

# Summary

<% if (!repeat_by) { %>

We examined whether the difference in proportions of <%= target_col %> between <%= group_a %> and <%= group_b %> is statistically significant.

{{summary_chart}}

<% if (significant) { %>
As a result, the P-value is **<%= p_value %>**, which is lower than the significance level <%= sig_level_pct %>% (0.<%= sig_level_pct === '5' ? '05' : sig_level_pct %>). Therefore, the difference in proportions of **<%= group_a %> (<%= prop_a_pct %>%)** vs **<%= group_b %> (<%= prop_b_pct %>%)** is statistically significant.
<% } else { %>
As a result, the P-value is **<%= p_value %>**, which is greater than the significance level <%= sig_level_pct %>%. Therefore, the difference in proportions of **<%= group_a %> (<%= prop_a_pct %>%)** vs **<%= group_b %> (<%= prop_b_pct %>%)** is not statistically significant.
<% } %>

<% } else { %>

We examined whether the difference in proportions of <%= target_col %> between the two groups is statistically significant for each group.

{{summary_chart}}

<% if (groups.some(g => g.significant)) { %>
For the following groups, the difference in proportions is statistically significant (P-value < <%= sig_level_pct %>%):
  <% groups.forEach(g => { %>
    <% if (g.significant) { %>
* **<%= g.group_a %> vs <%= g.group_b %>**: Proportions are <%= g.prop_a_pct %>% vs <%= g.prop_b_pct %>%, P-value = <%= g.p_value %>.
    <% } %>
  <% }); %>
<% } %>

<% if (groups.some(g => !g.significant)) { %>
For the following groups, the difference in proportions is not statistically significant (P-value >= <%= sig_level_pct %>%):
  <% groups.forEach(g => { %>
    <% if (!g.significant) { %>
* **<%= g.group_a %> vs <%= g.group_b %>**: Proportions are <%= g.prop_a_pct %>% vs <%= g.prop_b_pct %>%, P-value = <%= g.p_value %>.
    <% } %>
  <% }); %>
<% } %>

<% } %>


{start_show_hide}
## Explanation of Statistical Metrics

* P-value
  * The P-value indicates the probability of observing a difference in proportions as extreme as or more extreme than the observed data, assuming the null hypothesis (no difference between groups) is true.
  * Generally, if it is less than 5% (0.05), it is judged to be statistically significant.

* Test Direction
  * "Different between groups": A two-sided test checking whether the proportions differ in either direction.
  * "Group A greater than Group B": A one-sided test checking whether Group A has a higher proportion.
  * "Group A less than Group B": A one-sided test checking whether Group A has a lower proportion.

* Method
  * "Auto": The method is automatically selected based on the data.
  * "Exact Test" (Fisher's exact test): Recommended when sample sizes are small or any expected cell count is less than 5.
  * "Approximate Test" (Chi-square based): Suitable for larger sample sizes.

* Cohen's h
  * Cohen's h is an effect size measure for the difference between two proportions.
  * A value of 0.2 is interpreted as a "small effect", 0.5 as a "medium effect", and 0.8 or more as a "large effect".

* Power
  * Power is the probability of correctly detecting a difference in proportions when there actually is one.
  * The value is between 0 and 1, and generally 0.8 (80%) or more is desirable.
{end_show_hide}


# Probability Distribution

The chart below shows the standard normal distribution. The dotted line marks the observed two-sample Z value, and the shaded area is the critical region at the significance level. When the Z value falls inside the shaded region, the difference in proportions is statistically significant.

{{probability_dist}}


# Proportions by Group

The chart below visualizes the observed proportions for each group with confidence intervals.

{{confidence_interval}}

<% if (!repeat_by) { %>
* **<%= group_a %>**: <%= successes_a %> out of <%= n_a %> observations are TRUE (<%= prop_a_pct %>%).
* **<%= group_b %>**: <%= successes_b %> out of <%= n_b %> observations are TRUE (<%= prop_b_pct %>%).
* **Difference**: The proportion difference is approximately **<%= difference_pct %>** percentage points.
<% } %>



`;

module.exports = template;
