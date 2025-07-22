const template = `


Correspondence analysis was conducted to analyze the relationships between the following variables:

<% variables.forEach(variable => { %>
  - <%= variable.name %>
<% }); %>

Correspondence analysis is a statistical technique that visually represents the associations between values of multiple variables.

# Group Relationships

The following plot visualizes the relationships between the values (categories) of selected variables by placing each value in a two-dimensional space. Values positioned close to each other indicate strong associations.

{{category_plot}}

How to interpret this plot:

* Categories positioned in the same direction have positive associations
* Categories positioned in opposite directions have negative associations
* Categories farther from the origin (0,0) have more distinctive characteristics
* Categories positioned near the origin (0,0) do not have particularly distinctive characteristics


# Variable Relationships

The following plot places the selected variables themselves in a two-dimensional space. Variables positioned close to each other indicate strong associations.

{{variables_plot}}

# Weights

The following table shows the weight of each variable for each dimension (the strength of influence that dimension has on the variable). Weights range from 0-100, and all categories for each dimension sum to 100. Higher weight values mean that the category plays an important role in that dimension.

{{weight_table}}

# Appendix

## Contribution Rate
The following chart visualizes the "contribution rate," which represents how much of the information content (variance) in the original data is explained by the axes created through correspondence analysis. The cumulative contribution rate shows how much can be represented when these contribution rates are added up sequentially.

{{contribution_chart}}

## Data

The following shows the original data with scores for each dimension created by correspondence analysis added.

{{data}}

## By Sample

The following chart visualizes individual samples (data points) using dimensions 1 and 2 created through correspondence analysis.

{{sample_plot}}


`;

module.exports = template; 