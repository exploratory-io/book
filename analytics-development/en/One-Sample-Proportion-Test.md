const template = `

# Summary

A one-sample proportion test checks whether an observed proportion differs from a known benchmark proportion.

<% if (!repeat_by) { %>
The observed proportion of TRUE in the <%= target_col %> column is <%= observed_pct %>% (<%= n_success %> successes out of <%= n_total %> observations), compared with the benchmark of <%= benchmark_pct %>%.

<% if (significant) { %>
The difference (<%= difference_pct %> percentage points) is **statistically significant** at the <%= sig_level_pct %>% level (p = <%= p_value %>). There is sufficient evidence to conclude the observed proportion differs from the benchmark.
<% } else { %>
The difference (<%= difference_pct %> percentage points) is **not statistically significant** at the <%= sig_level_pct %>% level (p = <%= p_value %>). There is insufficient evidence to conclude the observed proportion differs from the benchmark.
<% } %>
<% } else { %>
We examined whether the observed proportion of TRUE in <%= target_col %> differs from the benchmark of <%= benchmark_pct %>% for each <%= repeat_by %>.

<% if (groups.some(group => group.significant)) { %>
For the following groups, the difference is **statistically significant** at the <%= sig_level_pct %>% level:
  <% groups.forEach(group => { %>
    <% if (group.significant) { %>
* <%= group.name %> (observed <%= group.observed_pct %>%, p = <%= group.p_value %>)
    <% } %>
  <% }); %>
<% } %>
<% if (groups.some(group => !group.significant)) { %>
For the following groups, the difference is **not statistically significant** at the <%= sig_level_pct %>% level:
  <% groups.forEach(group => { %>
    <% if (!group.significant) { %>
* <%= group.name %> (observed <%= group.observed_pct %>%, p = <%= group.p_value %>)
    <% } %>
  <% }); %>
<% } %>
<% } %>

{{summary_chart}}


{start_show_hide}
## Explanation of Statistical Metrics


**Effect Size (Cohen's h)**: Cohen's h measures the magnitude of difference between the observed proportion and the benchmark. Values of 0.2, 0.5, and 0.8 indicate small, medium, and large effects, respectively.

**Statistical Power**: Power is the probability of correctly detecting a true difference. Values above 0.8 are generally considered adequate.

**Test Method**: The Exact Binomial Test is used for small samples (when n*p < 5 or n*(1-p) < 5). The Approximate Test uses the normal approximation without Yates' continuity correction.
{end_show_hide}


# Chart

The chart below shows the standard normal distribution. The dotted line marks the standardized test statistic (Z value), and the shaded area is the critical region at the significance level. When the Z value falls inside the shaded region, the difference from the benchmark is statistically significant.

{{probability_dist}}

The chart below shows the same test on the scale of the proportion. It is the normal distribution of the sample proportion under the assumption that the proportion equals the benchmark (centered at the benchmark proportion), with a standard deviation equal to the standard error. The dotted line marks the observed proportion, and the shaded area is the critical region at the significance level. When the observed proportion falls inside the shaded region, the difference from the benchmark is statistically significant.

{{probability_dist_prop}}

{{confidence_interval}}


`;

module.exports = template;
