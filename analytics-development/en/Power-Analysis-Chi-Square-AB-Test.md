const template = `
# Power Analysis - Chi-Square Test

Power analysis is a method for calculating the required sample size to detect a meaningful effect in statistical testing.

## Summary

{{summary}}

Based on the results of this power analysis, the required sample size is estimated to be **<%= sample_size %>**.

The main statistical indicators calculated based on the set parameters are displayed. The following information can be confirmed here:

* Type 1 Error
  * Type 1 error is the probability of incorrectly concluding that there is an effect when there is actually no effect.
  * It is generally set to 0.05 (5%).

* Type 2 Error
  * Type 2 error is the probability of incorrectly concluding that there is no effect when there is actually an effect.
  * It is generally desirable to be 0.2 (20%) or less.

* Power
  * Power is the probability of correctly detecting an effect when there is actually one.
  * It is generally desirable to be 0.8 (80%) or more.
  * Power = 1 - Type 2 Error.

* Effect Size (Cohen's W)
  * This is an indicator of effect size in the Chi-square test.
  * Generally, 0.1 is interpreted as a "small effect", 0.3 as a "medium effect", and 0.5 or more as a "large effect".
  * The smaller the effect size, the larger the sample size required to achieve the same power.

* Degrees of Freedom
  * In the Chi-square test, the degrees of freedom are calculated as (Number of categories 1 - 1) × (Number of categories 2 - 1).
  * As the number of categories increases, the degrees of freedom also increase, and thus the required sample size also increases.

* Required Sample Size
  * This is the number of samples required to achieve the specified effect size, Type 1 error, and power.
  * The smaller the effect size and the higher the desired power, the more samples are required.

## Probability Distribution

The following chart shows the probability distributions for the null hypothesis (no effect) and the alternative hypothesis (specified effect size).

{{probability_chart}}

- The blue curve represents the distribution of the null hypothesis (no effect).
- The orange curve represents the distribution of the alternative hypothesis (with the specified effect size).

The blue filled area to the right of the blue curve of the null hypothesis distribution (the area to the right of the significance level) represents the Type 1 error. This is the probability of incorrectly concluding that there is an effect when there is actually no effect.

The orange filled area to the left of the orange curve of the alternative hypothesis distribution (the area to the left of the significance level) represents the Type 2 error. This is the probability of incorrectly concluding that there is no effect when there is actually an effect.


## Sample Size Simulation

The following is a line chart showing the relationship between sample size and power.

{{sample_size_chart}}

The horizontal axis (X-axis) represents the sample size, and the vertical axis (Y-axis) represents the power. It can be seen that as the sample size increases, the power (the probability of correctly detecting an effect when there is actually one) increases. It is also possible to estimate the sample size required to achieve a specific power with the specified effect size and significance level.
`;

module.exports = template; 