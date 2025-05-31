const template = `
# Power Analysis - t-test

Power analysis is a method for calculating the sample size needed to detect meaningful effects in statistical tests.

## Summary

{{summary}}

Based on the results of this power analysis, the required sample size is estimated to be **<%= sample_size %>**.

The key statistical indicators calculated based on the set parameters are displayed. Here you can confirm the following information:

* Type I Error
  * Type I error is "the probability of incorrectly concluding that there is an effect when there actually isn't one."
  * It is generally set to 0.05 (5%).

* Type II Error
  * Type II error is "the probability of incorrectly concluding that there is no effect when there actually is one."
  * Generally, 0.2 (20%) or less is considered desirable.

* Power
  * Power is "the probability of correctly detecting an effect when there actually is one."
  * Generally, 0.8 (80%) or higher is considered desirable.
  * There is a relationship: Power = 1 - Type II Error.

* Effect Size (Cohen's D)
  * Cohen's D is an indicator showing the magnitude of the effect, calculated by dividing the difference between groups by the data's variability (standard deviation).
  * A value of 0.2 is interpreted as a "small effect," 0.5 as a "medium effect," and 0.8 or higher as a "large effect."
  * The smaller the effect size, the larger the sample size needed to achieve the same power.

* Required Sample Size
  * The number of samples needed to achieve the specified effect size, Type I error, and power.
  * The smaller the effect size and the higher the desired power, the more samples are required.

## Probability Distribution

The following chart shows the probability distributions for the null hypothesis (when there is no effect) and the alternative hypothesis (when there is an effect).

{{probability_chart}}

- The blue curve represents the distribution under the null hypothesis (when there is no effect).
- The orange curve represents the distribution under the alternative hypothesis (when there is a specified effect size).

The blue shaded area on the right side of the null hypothesis distribution (the area to the right of the significance level) represents Type I error. This is "the probability of incorrectly concluding that there is an effect when there actually isn't one."

The orange shaded area on the left side of the alternative hypothesis distribution (the area to the left of the significance level) represents Type II error. This is "the probability of incorrectly concluding that there is no effect when there actually is one."


## Sample Size Simulation

The following line chart shows the relationship between sample size and power.

{{sample_size_chart}}

The horizontal axis (X-axis) represents sample size, and the vertical axis (Y-axis) represents power. You can see that as sample size increases, power (the probability of correctly detecting an effect when there actually is one) increases. You can also estimate the sample size needed to achieve a specific power level with the specified effect size and significance level.
`;

module.exports = template;