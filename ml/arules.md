# Market Basket Analysis - Association Rules

## Introduction

Find rules of what tend to occur at the same time from transaction data.

## How to Access?

You can access from 'Add' (Plus) button.

![](images/arules_add.png)

## How to Use?

#### Column Selection

![](images/arules_dialog.png)

* Product (Subject Column) - Set a column to find rules for. If it's purchasing data, this should be a column of product names.
* Basket (Key Column) - Set a column to use as an id of transactions.

### Parameters

* Minimum Item Length, Maximum Item Length (Optional) - As default, minlen is 1 and maxlen is 5. How many subjects should appear in a rule.
* Minimum Support Value, Maximum Support Value (Optional) - As default, min_support is 0.1 and max_support is 1. The range of support value for results.
* Minimum Confidence Value (Optional) - The default is 0.5. The minimum value of confidence.
* Left Hand Side Items, Right Hand Side Items (Optional) - The default is NULL. What subjects should come to lhs or rhs.
* Maximum Number of Items in a Basket - Maximum number of most frequent items in a basket to keep before running rule mining algorithm (Apriori algorithm). Less frequent items are dropped so that rule mining completes within reasonable time.

## Step-by-Step Tutorial with Grocery store data.

* [Introduction to Association Rules (Market Basket Analysis) in R](https://blog.exploratory.io/introduction-to-association-rules-market-basket-analysis-in-r-7a0dd900a3e0)
