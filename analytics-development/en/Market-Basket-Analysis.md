const template = `
# Analysis Results

We investigated patterns of frequent combinations of "items" within "baskets" and the strength of the relationship between these combinations.

The following table lists the rules between items.

{{data}}

**Example Interpretations**

* <%= item1 %> → <%= pair_item1 %>
    * The frequency of <%= item1 %> and <%= pair_item1 %> being selected together is higher than others.
    * The proportion of <%= item1 %> and <%= pair_item1 %> being selected together is <%= support1_pct %>% of all data.
    * When <%= item1 %> is selected, about <%= confidence1_pct %>% of the time <%= pair_item1 %> is also selected.
    * This indicates that when <%= item1 %> is selected, the probability of <%= pair_item1 %> being selected becomes <%= lift1 %> times higher than usual.

* <%= item2 %> → <%= pair_item2 %>
    * The frequency of <%= item2 %> and <%= pair_item2 %> being selected together is higher than others.
    * The proportion of <%= item2 %> and <%= pair_item2 %> being selected together is <%= support2_pct %>% of all data.
    * When <%= item2 %> is selected, about <%= confidence2_pct %>% of the time <%= pair_item2 %> is also selected.
    * This indicates that when <%= item2 %> is selected, the probability of <%= pair_item2 %> being selected becomes <%= lift2 %> times higher than usual.

* <%= item3 %> → <%= pair_item3 %>
    * The frequency of <%= item3 %> and <%= pair_item3 %> being selected together is higher than others.
    * The proportion of <%= item3 %> and <%= pair_item3 %> being selected together is <%= support3_pct %>% of all data.
    * When <%= item3 %> is selected, about <%= confidence3_pct %>% of the time <%= pair_item3 %> is also selected.
    * This indicates that when <%= item3 %> is selected, the probability of <%= pair_item3 %> being selected becomes <%= lift3 %> times higher than usual.

In Market Basket Analysis, judgments are made based on three metrics: Support, Confidence, and Lift.

**Support**

* Support is an indicator of what percentage of all data (baskets) a particular combination was selected together.
* It shows "how common is that combination" and is expressed as a percentage of the whole.
* The higher the support, the larger the percentage of the total data that combination occupies.

<math xmlns="http://www.w3.org/1998/Math/MathML" display="block">
  <mrow>
    <mtext>Support</mtext>
    <mo>=</mo>
    <mfrac>
      <mtext>Number of occurrences of a specific combination</mtext>
      <mtext>All data (baskets)</mtext>
    </mfrac>
  </mrow>
</math>

**Confidence**
* This is an indicator of what percentage of people who selected product A also selected product B.
* It shows the conditional probability of "if A is selected, what is the probability that B is also selected?". A higher confidence value means that "people who select A are highly likely to also select B".

<math xmlns="http://www.w3.org/1998/Math/MathML" display="block">
  <mrow>
    <mtext>Confidence</mtext>
    <mo>=</mo>
    <mfrac>
      <mtext>Number of times product A and B were selected</mtext>
      <mtext>Number of times product A was selected</mtext>
    </mfrac>
  </mrow>
</math>

**Lift**

* Lift shows how many times more likely product B is to be selected when product A is selected, compared to the overall selection rate of product B.
* Lift is calculated by dividing the selection rate of product B given product A (Confidence) by the overall selection rate of product B (Support of B).
* This value helps to determine if a high-confidence combination is truly a strong association, or if B is just a popular item that happens to be selected together with A by chance.

<math xmlns="http://www.w3.org/1998/Math/MathML" display="block">
  <mrow>
    <mtext>Lift</mtext>
    <mo>=</mo>
    <mfrac>
      <mtext>Confidence</mtext>
      <mtext>Support of product B</mtext>
    </mfrac>
  </mrow>
</math>

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
`;

module.exports = template; 