---
title: "AI Function"
sidebarTitle: "AI Function"
description: "AI Function creates a function from a prompt written in your own words, and AI returns a result for each row."
---

AI Function lets you create a function from a prompt written in your own words. It applies the prompt to each row and returns a result. It was added in Exploratory v14.

![](images/en/ai-prompt-function-01.png)

## What You Can Do

With AI Functions, anyone can easily create their own “functions” simply by using natural language.

AI Functions make the following tasks simple:

- Generate company names, industries, and company size information from customer data
- Automatically create optimized campaign emails for each customer based on purchase history
- Categorize, perform sentiment analysis, and automatically label free-text survey responses

## Basic Usage

Select “Create AI Function” from the column header menu.

![](images/en/ai-prompt-function-02.png)

This will display the AI Function dialog.

![](images/en/ai-prompt-function-03.png)

To create a new column, select “Create New Column” and enter a column name. Choose the column to pass to the function (here, “Reasons for Recommendation”) in “Target Columns for Function”, select “Write a New Prompt”, enter the prompt, and click “Run”. To use a saved template, select “Use Template” and choose the template from the list.

You can create and execute new prompts, and if you find a good prompt, you can save it as a template.

![](images/en/ai-prompt-function-04.png)

Here are two use cases for AI Functions.

## Use Cases

### Sentiment Score

Surveys often include open-ended questions, which collect “free-text responses.”

For example, in the survey data below, there’s a column for free-text responses such as “Reasons for Recommendation.”

![](images/en/ai-prompt-function-05.png)

Many Exploratory customers have asked, “Is it possible to calculate sentiment scores from free-text responses?”

This is where “AI Functions” come in handy.

Execute the following prompt with AI Function:

``` text
For each provided sentence, calculate a polarity score in the range of -1.0 to +1.0.

Scoring Criteria:

Extremely Positive (+0.8 ~ +1.0)
- Expressions showing strong satisfaction or praise
- Situations where problems are completely resolved
- Mentions of outstanding performance or quality

Positive (+0.4 ~ +0.7)
- Mentions of clear advantages or strengths
- Reports of good experiences or results
- Results exceeding expectations

Mildly Positive (+0.1 ~ +0.3)
- Small improvements or advantages
- Fulfillment of basic functions
- General sense of satisfaction

Neutral (-0.1 ~ +0.1)
- Statement of facts
- Explanations without emotion
- Simple situation descriptions

Mildly Negative (-0.3 ~ -0.1)
- Small inconveniences or challenges
- Minor issues
- Points with room for improvement

Negative (-0.7 ~ -0.4)
- Clear problems or dissatisfaction
- Disappointing results
- Lack of important functions

Extremely Negative (-1.0 ~ -0.8)
- Serious problems or malfunctions
- Strong dissatisfaction or negative emotions
- Major obstacles or hindrances

Factors to Consider in Assessment:
- Strength of expressions (degree adverbs like "very," "extremely," etc.)
- Degree of problem resolution (complete resolution, partial resolution, etc.)
- Relationship between expectations and results (above expectations, as expected, below expectations)
- Specificity and importance of advantages/disadvantages
- Overall context and intent
```

![](images/en/ai-prompt-function-06.png)

By executing this, we can obtain sentiment scores determined by AI for each row.

![](images/en/ai-prompt-function-07.png)

Looking at these sentiment scores, we can see that as the score approaches negative one (-1), strongly negative content becomes more prominent.

![](images/en/ai-prompt-function-08.png)

Conversely, as the sentiment score approaches positive one (+1), we can confirm that strongly positive content is included.

![](images/en/ai-prompt-function-09.png)

Using AI Functions, we can easily generate sentiment scores for free-text responses and confirm that appropriate scores are assigned based on context.

### Text Grouping

We’ll continue targeting the free-text response column such as “Reason for recommendation.”

![](images/en/ai-prompt-function-10.png)

When you have such text, you may want to label and group each piece of text.

Previously, it was standard to use the “Topic Model” in the Analytics View to group texts, but there were cases where we wanted to label using predefined groups.

With AI Functions, “text grouping” can also be achieved.

In the prompt, specify the following. It’s possible to differentiate between “good support” and “Bad support” at the labeling stage.

``` text
Please assign labels to categorize the provided text into the following groups:

Good Support
Bad Support
High Product Rating
Low Product Rating
High Rating for Features
Low Rating for Features
Comparison with Competitor Services
Implementation-Related Content
Pricing-Related Content
Other
```

![](images/en/ai-prompt-function-11.png)

By executing this, we can create a text group column.

![](images/en/ai-prompt-function-12.png)

We can confirm that the texts are grouped according to the predefined labels.

![](images/en/ai-prompt-function-13.png)

The following shows sample rows from each group, including responses labeled Good Support and Bad Support.

![](images/en/ai-prompt-function-14.png)

## Writing Prompts

### Define Clear Criteria and Evaluation Factors

For AI Functions, it’s important to **provide specific judgment criteria and clearly indicate what factors should be considered in the evaluation**.

**Good Example (Sentiment Score):**

``` text
For each provided sentence, calculate a polarity score in the range of -1.0 to +1.0.

Scoring Criteria:

Extremely Positive (+0.8 ~ +1.0)
- Expressions showing strong satisfaction or praise
- Situations where problems are completely resolved
- Mentions of outstanding performance or quality

Positive (+0.4 ~ +0.7)
- Mentions of clear advantages or strengths
- Reports of good experiences or results
- Results exceeding expectations

...(omitted)...

Extremely Negative (-1.0 ~ -0.8)
- Serious problems or malfunctions
- Strong dissatisfaction or negative emotions
- Major obstacles or hindrances

Factors to Consider in Assessment:
- Strength of expressions (degree adverbs like "very," "extremely," etc.)
- Degree of problem resolution (complete resolution, partial resolution, etc.)
- Relationship between expectations and results (above expectations, as expected, below expectations)
- Specificity and importance of advantages/disadvantages
- Overall context and intent
```

Rather than vague instructions, **clearly listing the score ranges, judgment conditions, and factors to consider** enables AI to analyze from multiple perspectives, significantly improving judgment accuracy.

### Clearly Specify Output Format

By specifying what format you want AI to return results in, you can get results in your desired format.

**For returning numeric values only:**

``` text
Predict the virality of the provided social media post with a score from 0-100.

Evaluation criteria:
- Elements that evoke emotions
- Topicality/timeliness
- Elements that make people want to share
- Call-to-action prompts

Return only the score as a numeric value.
```

**For comma-separated returns:**

``` text
List 5 well-known American companies for each American industry classification.
Return multiple company names separated by commas for each industry.
Return the official company name.

Example: A, B, C, D, E
```

**For specific format returns:**

``` text
Extract the customer's specific request in one sentence from the provided email body,
and score the business impact from 1-10.

Output format: Request content | Score
Example: Add batch invoice generation feature | 8
```

### Provide Concrete Examples

By including **concrete examples** in your prompts, AI’s understanding deepens and success rates for similar patterns increase.

**Good Example:**

``` text
This is name and email information.
Based on the name and email information, please estimate and return the correct "last name" 
in "Japanese" and "kanji." Even if the original information is in romaji, the result you 
return must be the last name in "kanji."

Example: Kato Kota -> 加藤

If you don't know, please return "Unknown."
```

Concrete examples are especially effective for:

- Format conversions (romaji → kanji, unit normalization, etc.)
- How to assign classification labels
- Name order arrangement

### Specify Handling of Edge Cases

Specify in advance **how to handle unknown cases** and **special cases**.

**Good Example:**

``` text
You are a specialized assistant for identifying regions from school names.
Based on the provided school name, please determine whether the school is located in the 
Kanto region (Tokyo, Kanagawa, Chiba, Saitama, Ibaraki, Tochigi, Gunma).

If the school is in the Kanto region, answer "Kanto," if outside the Kanto region, 
answer "Non-Kanto."
If the school name is unclear, answer "NA."
```

This provides an “escape route” for AI when it’s uncertain, preventing errors and inappropriate guesses.

### Make Classification Labels Specific and Comprehensive

When performing label classification, **list all label candidates in advance**.

**Good Example:**

``` text
Please assign labels to categorize the provided text into the following groups:

Good Support
Bad Support
High Product Rating
Low Product Rating
High Rating for Features
Low Rating for Features
Comparison with Competitor Services
Implementation-Related Content
Pricing-Related Content
Other
```

**Always include an “Other” category** to handle cases that don’t fit into any of the defined categories.

### Specify Official Names and Notation Rules

When handling company names or proper nouns, **clearly define notation rules**.

**Good Example:**

``` text
Return the official legal entity name for each organization name.
```

``` text
From the provided investor data, correct notation inconsistencies and standardize 
company names as much as possible.

Example: 
Softbank -> Softbank
Softbank Group -> Softbank
Softbank Corp -> Softbank
Softbank Capital -> Softbank

Sequoia Capital -> Sequoia Capital
Sequoia Capital China -> Sequoia Capital
```

## When to Use AI Prompts

The AI Prompts feature generates **R scripts** from data processing instructions written in natural language. AI Functions return a result for each row, whereas AI Prompts generate R code to efficiently execute processing based on conditional expressions and calculations.

### Cases Where AI Prompts Are Suitable

AI Prompts are suitable for the following types of **rule-based processing and calculations**:

**Concrete Examples:**

- “Determine whether sales are 1000 or more”
- “Create age group categories (teens, 20s, …) from age”
- “Label as ‘Order Required’ if inventory is 10 or less, otherwise ‘In Stock’”

For example, suppose you want to create an age group column from an age column.

Even with AI Functions, it’s possible to create an age group column for such cases.

![](images/en/ai-prompt-function-15.png)

However, using AI Prompts allows you to create the age group column faster and with better reproducibility.

![](images/en/ai-prompt-function-16.png)

Since AI Prompts return R scripts, they excel at returning labels based on conditions and calculations. On the other hand, when you want to return labels from text or product names—cases requiring understanding of context based on individual values—AI Functions are more suitable.

When using AI Prompts for labeling and calculations based on conditions, there are advantages in the following areas:

**Performance**

Because they execute as R scripts, there are no row limitations compared to AI Functions. Furthermore, since they don’t return values one by one, they are superior to AI Functions in terms of execution time and cost.

**Reproducibility**

Because they use conditional expressions in R scripts, the same data will always return the same results. With AI Functions, since AI judges the labels, slight variations may occur depending on the data or the task being instructed.

For more details on AI Prompts, please see [this note](https://exploratory.io/note/exploratory/AI-Data-Wrangling-xvU2Syy0).

## Share Prompt Templates

Prompts you use in AI Functions and the AI Note Editor can be registered as templates. If you want to share the templates you’ve created with others, you can publish them to the Exploratory server to share prompts as a team and even collaborate on updates.

### Publishing AI Prompt Templates

From the project menu, select “AI Prompt Template”.

![](images/en/ai-prompt-function-17.png)

The AI Prompt Template dialog will appear, displaying the prompts you have created.

![](images/en/ai-prompt-function-18.png)

You can check whether a template is an “AI Function” or “AI Editor” from its type.

![](images/en/ai-prompt-function-19.png)

Select the template you want to publish and share.

![](images/en/ai-prompt-function-20.png)

The AI Prompt Template editing screen will appear; click the “Publish” button.

When publishing, if you want to share the prompt template as a team, select the team before publishing.

![](images/en/ai-prompt-function-21.png)

The publishing completion screen will appear; click the “Configure Share Setting” button.

![](images/en/ai-prompt-function-22.png)

The prompt published to the Exploratory server can be viewed in the browser, and the sharing dialog will appear.

![](images/en/ai-prompt-function-23.png)

In the “To” field, enter a user’s email address or select a team, then click “Share”.

![](images/en/ai-prompt-function-24.png)

Alternatively, if you want to share via URL, click “Enable” for URL sharing.

![](images/en/ai-prompt-function-25.png)

When sharing via URL, you can choose to share with a password-protected URL.

![](images/en/ai-prompt-function-26.png)

If published as a team, members of that team can view and import this prompt.

![](images/en/ai-prompt-function-27.png)

### Importing AI Prompt Templates

From the project menu, select “AI Prompt Template”.

![](images/en/ai-prompt-function-28.png)

The AI Prompt Template dialog will appear; click the “Import” button.

![](images/en/ai-prompt-function-29.png)

AI prompt templates published on the server will be displayed.

![](images/en/ai-prompt-function-30.png)

If you want to import an AI prompt template published as a team, select the specific team.

![](images/en/ai-prompt-function-31.png)

Clicking the “Open” button allows you to view the prompt in your browser.

![](images/en/ai-prompt-function-32.png)

You can check what kind of prompt is actually being used.

![](images/en/ai-prompt-function-33.png)

Select the AI prompt template you want to import and click the “Import” button.

![](images/en/ai-prompt-function-34.png)

This allows you to import the AI prompt template into your Exploratory Desktop environment.

![](images/en/ai-prompt-function-35.png)

Imported templates are selected and used in “AI Functions” and “AI Note Editor”.

**Example of an AI Function template**

In the Create AI Function dialog, select “Use Template” and choose “Sentiment_Score” from the list.

![](images/en/ai-prompt-function-36.png)

**Example of an AI Note Editor template**

Select “Select Registered Template” as the Type, then choose the template from the Template list (here, “Analysis Blog Post…”).

![](images/en/ai-prompt-function-37.png)

### Collaborative Editing of Prompts

Suppose you update a prompt template and want to reflect those changes for team members.

After updating the prompt, select “AI Prompt Template” from the project menu.

![](images/en/ai-prompt-function-38.png)

The AI Prompt Template dialog will appear; select the template you want to publish and share.

![](images/en/ai-prompt-function-39.png)

Clicking the “Republish” button allows you to update the AI prompt template.

![](images/en/ai-prompt-function-40.png)

Open the template page on the Exploratory server, then open the menu in the upper-right corner and select “Version History” to view its version history.

![](images/en/ai-prompt-function-41.png)

From the version history, you can also restore a specific version.

![](images/en/ai-prompt-function-42.png)
