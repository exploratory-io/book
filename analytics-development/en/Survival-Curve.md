const template = `

Survival curves were calculated using the [Kaplan-Meier](https://exploratory.io/note/exploratory/ITp4cVo8) algorithm based on data where the survival time for each observed row is from the value in the "<%= start_date_column %>" column to the value in the "<%= end_date_column %>" column, and "<%= event_status %>" is the event.

**Notes**

* If the end date <%= end_date_column %> is NA (missing value), the "last day" of the data is used by default. To fill with another value, you can change it in [Settings](//analytics/settings/impute_end_date).


# Survival Curve

<% if (!color_column) { %>

<% if (!group_column) { %>
The following chart visualizes the survival rate (proportion of instances where the <%= event_status %> event has not occurred) over time as a survival curve. The horizontal axis represents the time elapsed from the start (unit: <%= time_unit%>), and the vertical axis represents the survival rate (%).
<% } else { %>
Survival curve charts visualizing the survival rate (proportion of instances where the <%= event_status %> event has not occurred) over time for each <%= group_column %> are shown. The horizontal axis represents the time elapsed from the start (unit: <%= time_unit%>), and the vertical axis represents the survival rate (%).
<% } %>
<% } else { %>

<% if (!group_column) { %>
The following chart visualizes the survival rate (proportion of instances where the <%= event_status %> event has not occurred) over time as a survival curve for each <%= color_column %>. The horizontal axis represents the time elapsed from the start (unit: <%= time_unit%>), and the vertical axis represents the survival rate (%).
<% } else { %>
The following chart visualizes the survival rate (proportion of instances where the <%= event_status %> event has not occurred) over time as a survival curve for each combination of <%= color_column %> and <%= group_column %>. The horizontal axis represents the time elapsed from the start (unit: <%= time_unit%>), and the vertical axis represents the survival rate (%).
<% } %>

<% } %>

{{survival_curve}}

A steep part of the curve indicates a higher rate of <%= event_status %> events occurring, while a gentle part indicates a lower rate.

## Survival Rate Table

<% if (!color_column) { %>

<% if (!group_column) { %>
The following table shows the data from the survival curve above. Each column represents the elapsed time, and each value is the survival rate (%) at that time point.
<% } else { %>
The following table shows the data from the survival curve above. Each column represents the elapsed time, each row is for each <%= group_column %>, and each value is the survival rate (%) at that time point.
<% } %>
<% } else { %>

<% if (!group_column) { %>
The following table shows the data from the survival curve above. Each column represents the elapsed time, each row is for each <%= color_column %>, and each value is the survival rate (%) at that time point.
<% } else { %>
The following table shows the data from the survival curve above. Each column represents the elapsed time, each row is for each combination of <%= color_column %> and <%= group_column %>, and each value is the survival rate (%) at that time point.
<% } %>

<% } %>

{{survival_table}}

# Data

The following table summarizes the number of observed subjects, the number of events, the number of censored cases, the survival rate, and its 95% confidence interval for each time interval.

{{data}}

In the calculation of the survival rate, data for which it is not possible to confirm whether an event occurred during the observation period are called "censored" and are excluded from the survival rate calculation. For example, for an observed subject for whom only one month has elapsed, it is not yet known whether an event will occur after the second month. Therefore, they are excluded from calculations from the second month onwards. Such cases are called "censored".

For a detailed explanation of censoring, please refer to [this note](https://exploratory.io/note/exploratory/ITp4cVo8).

# Summary Information

<% if (color_column) { %>

## Test of Significance for Survival Curves

A log-rank test was performed to examine the significance of the difference in survival curves between the groups of <%= color_column %>.

{{summary_chart}}

The null hypothesis for this hypothesis test is that there is no difference in survival curves between the groups of <%= color_column %>. If the P-value is higher than the significance level of <%= baseline_p_pct %>%, the relationship between the selected explanatory variable and <%= target %> is not statistically significant. Conversely, if the P-value is lower than <%= baseline_p_pct %>%, it is said to be significant.

**Metric Details**

* Chi-square value
  * The Chi-square value is a standardized statistic representing the magnitude of the difference between survival curves.
  * It takes values of 0 or greater, and a larger value indicates a larger difference between survival curves.

* P-value
  * This is the probability of obtaining a difference in observed survival curves (Chi-square value) as large as or larger than the one observed.
  * If it is lower than the significance level (generally 5%), it can be judged as statistically significant.
  * The P-value tends to be smaller with more data and larger with less data.

* Degrees of Freedom
  * The degrees of freedom determine the shape of the Chi-square distribution (probability distribution) used to calculate the P-value from the Chi-square value.
  * The degrees of freedom are calculated as the number of groups being compared minus 1.

* Number of Rows
  * Number of rows is the total number of observed subjects (data) used in the analysis (sample size).

* Number of Rows (TRUE)
  * Indicates the number of data rows where the event occurred.

<% } else { %>

{{summary_chart}}

* Number of Rows
  * Number of rows is the total number of observed subjects (data) used in the analysis (sample size).

* Number of Rows (TRUE)
  * Indicates the number of data rows where the event occurred.

<% } %>


# Appendix

## Next Steps

<% if (!color_column) { %>
* Cohort analysis: By assigning a column to "Split by Color", you can compare survival curves for each group (cohort) and investigate what improves or worsens the survival curve.
<% } else { %>
<% if (!group_column) { %>
* Group-wise analysis: Creating survival curves for each group can provide a more detailed analysis of the determinants of <%= event_status %> within each group. In that case, you can select the grouping variable in "Repeat By" and re-run the analysis.
<% } %>
* We analyzed the influence of one variable, <%= color_column %>, on the survival curve. However, other variables may also be influencing the survival curve. Therefore, you can perform multivariate analysis using "Cox Regression" to simultaneously consider multiple factors.
<% } %>


`;
module.exports = template; 