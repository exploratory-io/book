const template = `
# Analysis Results

We investigated patterns of frequent combinations of "items" within "baskets" and the strength of the relationship between these combinations.

## Graph

The following network diagram visually represents the patterns of frequent combinations of "items" and the strength of the relationship between these combinations.

{{graph}}

**How to read the graph**:

*   The circles (nodes) represent "items", and considering the lines extending from the items, they represent "combinations of items".
*   The lines show the tendency of combinations (which items appear together with other items).
*   The direction of the arrow indicates direction, meaning that if the starting item is selected, the ending item is also likely to be selected.
*   The size of the point represents the "frequency of that combination (support)", and a larger point means a combination with a higher frequency (probability).
*   The color of the point represents the "certainty of being selected together (confidence)", and a darker color indicates a higher likelihood that "if one is present, the other is also selected".

## Scatter Plot

The following scatter plot displays item combinations (rules) using three metrics: "Support", "Confidence", and "Lift".

{{scatter_plot}}

**How to read the scatter plot**:

*   Each circle represents one rule (item combination pattern).
*   The X-axis (horizontal axis) represents "Support", indicating the probability of occurrence of that combination.
*   The Y-axis (vertical axis) represents "Confidence", indicating the "certainty of being selected together (confidence)", and a darker color indicates a higher likelihood that "if the starting item is present, the ending item is also selected together".
*   The size of the circle represents "Lift", and a larger circle represents the "strength of synergy", meaning how much the probability of the ending item being selected is increased when the starting item is present. A value greater than 1 indicates strong synergy.

**Interpretation of each area of the graph**:

*   Upper right area (High Support, High Confidence)
    *   Large circles: "Most important rules" with high frequency of appearance, strong association, and high synergy.
    *   Small circles: "Stable patterns" with high frequency of appearance, strong association, but limited synergy.

*   Upper left area (Low Support, High Confidence)
    *   Large circles: "Hidden gems" with low frequency of appearance but very strong synergy when they occur.
    *   Small circles: "Niche patterns" with low frequency of appearance but a certain level of association.

*   Lower right area (High Support, Low Confidence)
    *   Large circles: "Notable general patterns" with high frequency of appearance and some synergy.
    *   Small circles: "Obvious patterns" with high frequency of appearance but weak specific association.

*   Lower left area (Low Support, Low Confidence)
    *   Large circles: "Unexpected discoveries" with low frequency of appearance but unexpected synergy.
    *   Small circles: Rules with low importance and a high possibility of being coincidental.

## Data

The following table lists the rules between items.

{{data}}

**How to read the table**:

*   Item List: The item that is the premise of the rule (the "when ... is purchased" part). Represents the "starting" item.
*   Items purchased together: The item that is the result of the rule (the "... is also purchased" part). Represents the "ending" item.
*   Support: Represents the probability of that combination occurring. A larger value means that the pattern is a combination frequently observed in the entire data.
*   Confidence: Indicates the proportion of times the ending item was selected when the starting item was present. A value closer to 1 means a higher certainty that the ending item will be selected when the starting item is present.
*   Lift: The strength of synergy, indicating how much the probability of the ending item being selected is increased when the starting item is present. A value greater than 1 indicates a stronger association.
`;

module.exports = template; 