const template = `

Normality test is a statistical method to verify if data follows a normal distribution. We are using the Shapiro-Wilk test in this analysis.

*   **W value**: Indicates how close the data is to a normal distribution, with values closer to 1 being better. 1 is the maximum value.
*   **P-value**: This is the criterion for deciding whether to reject the null hypothesis (that the data follows a normal distribution). Generally, if the P-value is less than 0.05, the data is considered not to be normally distributed.

# Normality Test Results

In this analysis, we performed a normality test on the following variables:
<% variables.forEach(function(variable) { %>
* <%= variable.column %>
<% }); %>

{{summary_chart}}


The results of the normality test are as follows:

<% if (variables.some(variable => variable.p > baseline_p)) { %>
For the following variables, since the P-value is higher than the significance level <%= baseline_p_pct %>% (<%= baseline_p %>), we can determine that the data is normally distributed.
  <% variables.forEach(variable => { %>
    <% if (variable.p > baseline_p) { %>
* **<%= variable.column %>**: The W value is <%= variable.w %> and the P-value is <%= variable.p %>.
    <% } %>
  <% }); %>
<% } %>

<% if (variables.some(variable => variable.p <= baseline_p)) { %>
For the following variables, since the P-value is lower than the significance level <%= baseline_p_pct %>% (<%= baseline_p %>), we can determine that the data is not normally distributed.
  <% variables.forEach(variable => { %>
    <% if (variable.p <= baseline_p) { %>
* **<%= variable.column %>**: The W value is <%= variable.w %> and the P-value is <%= variable.p %>.
    <% } %>
  <% }); %>
<% } %>


# Q-Q Plot

A Q-Q plot is a graph used to visually check if the data follows a normal distribution. If the data is perfectly normally distributed, the points on the plot will lie along the diagonal line.

{{qq_plot}}

*   If the points line up linearly along the diagonal line: The data is likely to follow a normal distribution.
*   If the points deviate significantly from the diagonal line: The data is likely not to follow a normal distribution.

# Histogram

A histogram visually displays the distribution of data. For a normal distribution, it shows a symmetrical bell-shaped curve.

{{histogram}}

*   If the distribution is bell-shaped and symmetrical: The data is close to a normal distribution.
*   If the distribution is skewed or has multiple peaks: The data deviates from a normal distribution.
`;

module.exports = template; 