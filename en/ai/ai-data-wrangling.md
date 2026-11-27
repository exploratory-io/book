---
title: "Wrangle Data with AI Prompts"
sidebarTitle: "AI Data Wrangling"
description: "Describe the data wrangling you want in natural language, and AI suggests an R command that you can run as a step."
---

The AI Prompt feature lets you enter what you want to do for data wrangling (processing, formatting), such as formatting, calculating, aggregating, joining, and processing text, in natural language, and AI suggests R code to do it. It was added in v12.

![](images/en/ai-data-wrangling-01.png)

## What You Can Do

You no longer need to manipulate various UIs or master complex functions for data wrangling. You can freely and quickly process data by simply entering what you want to do, such as:

- “Extract only the company names”
- “Convert date-related columns to the correct data type”
- “Join with the ‘prefecture information’ data”
- “Calculate the retention rate”
- “Filter the data to the last 7 days”
- “Calculate the customer lifetime value”

![](images/en/ai-data-wrangling-02.GIF)

## What AI Suggests

When you submit a prompt, three things are output: “R Command,” “Function Used,” and “Expected Results.”

![](images/en/ai-data-wrangling-03.png)

### Run the R Command

In the R Command section, the data wrangling tasks necessary to process the queried content are output as R code, so you can apply that processing by pressing “Run as Step.”

![](images/en/ai-data-wrangling-04.png)

### Edit the R Command

If you want to modify the R Command, click the edit button.

![](images/en/ai-data-wrangling-05.png)

From the edit mode, you can change or modify the generated column names and make other adjustments.

![](images/en/ai-data-wrangling-06.png)

### Check the Function Used

The **Function Used** section explains the functions and arguments in the R command.

![](images/en/ai-data-wrangling-07.png)

### Check the Expected Results

The “Expected Results” section explains what results will be obtained by executing this code.

![](images/en/ai-data-wrangling-08.png)

## Writing Prompts

The basic structure for writing prompts in English is typically “verb + column name + processing content” using a command form.

For example, let’s say we’re using sales data from an e-commerce site where each row represents one ordered product.

![](images/en/ai-data-wrangling-09.png)

If we want to create a column that determines whether the sales are 1000 or more, on the Table tab, we click **AI Wrangling**, then enter “Determine if sales are 1000 or more.”

![](images/en/ai-data-wrangling-10.png)

By executing the prompt, we get the R command result to determine if sales are 1000 or more. So, we click the “Run as Step” button.

![](images/en/ai-data-wrangling-11.png)

In this example, the new column is called `High_Sales`. It contains TRUE when Sales is at least 1000 and FALSE otherwise.

![](images/en/ai-data-wrangling-12.png)

### Aggregate by Group

If you want to aggregate by customer and then determine if sales are 1000 or more, add the “group unit” to the beginning of the original question.

For example, change the question to “For each customer, determine if total sales are 1000 or more”

![](images/en/ai-data-wrangling-13.png)

This allows us to aggregate to one row per customer and then determine if the total sales column is 1000 or more.

![](images/en/ai-data-wrangling-14.png)

### Tips for Writing Prompts

There are two points to keep in mind when writing prompts:

- Keep it concise: Use short, clear expressions starting with a verb (like “Calculate…”, “Convert…”, “Extract…”)
- Use specific column names: Include the names of the columns you want to process in the prompt
