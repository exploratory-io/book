const template = `
# Analysis Results

In this analysis, we used Bayesian A/B testing to examine which group performs better in terms of <%= target %> by <%= explanatory %>.

{{summary_chart}}

<% if (!repeat_by) { %>
<% if (improve_probability > 0.95) { %>
As a result, the probability that Group A is superior to Group B is <%= improve_probability_pct %>% (<%= improve_probability %>), which exceeds the 95% confidence threshold. This means we can say with high confidence that Group A is superior to Group B.
  
The expected improvement rate is <%= expected_improvement_pct %>% (<%= expected_improvement %>), with a confidence interval ranging from <%= confidence_lower_pct %>% to <%= confidence_upper_pct %>%.
  
<% if (expected_loss < 0.001) { %>
The expected loss rate is <%= expected_loss_pct %>% (<%= expected_loss %>), which is extremely low, indicating that the risk of choosing Group A is minimal.
<% } else if (expected_loss < 0.01) { %>
The expected loss rate is <%= expected_loss_pct %>% (<%= expected_loss %>), which is low, indicating that the risk of choosing Group A is low.
<% } else { %>
The expected loss rate is <%= expected_loss_pct %>% (<%= expected_loss %>).
<% } %>
<% } else if (improve_probability > 0.75) { %>
As a result, the probability that Group A is superior to Group B is <%= improve_probability_pct %>% (<%= improve_probability %>). While it doesn't reach the 95% confidence threshold, there is a reasonable possibility that Group A is superior to Group B.
  
The expected improvement rate is <%= expected_improvement_pct %>% (<%= expected_improvement %>), with a confidence interval ranging from <%= confidence_lower_pct %>% to <%= confidence_upper_pct %>%.
  
<% if (expected_loss > 0.05) { %>
The expected loss rate is <%= expected_loss_pct %>% (<%= expected_loss %>), which is relatively high, suggesting there is still risk in choosing Group A.
<% } else { %>
The expected loss rate is <%= expected_loss_pct %>% (<%= expected_loss %>).
<% } %>
<% } else if (improve_probability > 0.5) { %>
As a result, the probability that Group A is superior to Group B is <%= improve_probability_pct %>% (<%= improve_probability %>). There is no clear difference between Group A and Group B, and there is high uncertainty about which one is superior.
  
The expected improvement rate is <%= expected_improvement_pct %>% (<%= expected_improvement %>), with a confidence interval ranging from <%= confidence_lower_pct %>% to <%= confidence_upper_pct %>%. Since this confidence interval includes 0, there is a significant possibility that there is no improvement effect.
  
The expected loss rate is <%= expected_loss_pct %>% (<%= expected_loss %>).
<% } else { %>
As a result, the probability that Group A is superior to Group B is <%=  improve_probability_pct %>% (<%= improve_probability %>). From this result, we can say that Group B is likely to be superior to Group A.
  
The expected improvement rate is <%= expected_improvement_pct %>% (<%= expected_improvement %>), with a confidence interval ranging from <%= confidence_lower_pct %>% to <%= confidence_upper_pct %>%.
  
<% if (expected_loss > 0.05) { %>
The expected loss rate is <%= expected_loss_pct %>% (<%= expected_loss %>), which is high, indicating that the risk of choosing Group A is significant.
<% } else { %>
The expected loss rate is <%= expected_loss_pct %>% (<%= expected_loss %>).
<% } %>
<% } %>
<% } %>

## Key Statistical Indicators

* Probability of Improvement
  * Shows the probability that Group A will improve compared to Group B.
  * Values range from 0 to 1, where closer to 1 indicates that Group A is superior.
  * In Bayesian analysis, this probability is directly calculated and serves as the basis for determining which variation (A or B) is superior.

* Expected Improvement Rate
  * Shows the expected value of improvement for Group A compared to Group B.
  * Positive values mean Group A is superior, while negative values mean Group B is superior.
  * The larger this value, the greater the improvement effect.

* Conversion Rate
  * Shows the rate of conversion occurrence in each group.
  * Values range from 0 to 1, where closer to 1 means higher conversion rate.
  * The difference in conversion rates between groups forms the basis for the improvement rate.

* Confidence Interval
  * An interval indicating that the true improvement rate is likely to be within this range.
  * If the confidence interval does not include 0, it indicates that one group is likely superior to the other.
  * The narrower the interval, the higher the precision of the estimate.

* Expected Loss Rate
  * Shows the improvement rate that could potentially be lost if the wrong choice is made.
  * Smaller values indicate lower risk from incorrect decisions.

# Probability Distributions

## Distribution of Improvement Rate

The distribution of improvement rate shows the probability distribution of how much Group A improves compared to Group B.

{{improvement_distribution}}

The X-axis represents the improvement rate (how much A is superior to B), and each bar value represents the probability of improvement.

## Posterior Probability Distribution

The posterior probability distribution represents the distribution of conversion rates for Group A and Group B after the test.

{{distribution}}

When distributions do not overlap or have little overlap, it indicates a clear difference between groups and high certainty about which is superior. From the positional relationship of the distributions, you can visually determine which group has the higher conversion rate.

# Pivot Table

The cross-tabulation table of conversion rates for each group is as follows:

{{pivot_table}}

# Ratio Chart

The bar chart of conversion rates by group is as follows:

{{ratio}}

# Next Steps

<% if (!repeat_by) { %>
<% if (improve_probability > 0.95) { %>
* Implementation Consideration: Since Group A is clearly superior to Group B, consider implementing Group A in the production environment.
<% } else if (improve_probability > 0.75) { %>
* Implementation Consideration: Group A is likely superior to Group B, but consider collecting additional data or conducting further analysis to increase reliability.
<% } else if (improve_probability > 0.5) { %>
* Additional Testing: Since it's not clear which group is superior at this point, consider increasing sample size or reviewing the test design and conducting the test again.
<% } else { %>
* Consider Adopting Group B: The analysis results suggest that Group B is likely superior, so consider implementing Group B or designing new A/B tests with Group B as the baseline for improvement strategies.
<% } %>
<% } %>
<% if (!repeat_by) { %>
* This Bayesian A/B test was conducted on the entire dataset, but it is also possible to perform it for each group. In that case, you can select the variable to group by in "Repeat By" and run it again.
<% } %>
* If you want to investigate factors related to conversion rates, you can use multivariate analysis such as "Logistic Regression" to simultaneously consider multiple factors.
`;

module.exports = template; 