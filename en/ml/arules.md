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

* Minimum Item Length - Minimum number of items on the left-hand side of the rules to find.
* Maximum Item Length - Maximum number of items on the left-hand side of the rules to find.
* Selection of Minimum Support Value - How minimum support value is set. This can be one of the following.
  * Search Automatically - Automatically search a minimum support value that finds some rules.
  * Specify Value - Manually specify the minimum support value.
* Minimum Support Value - Minimum support value for the rules to find. Takes effect when "Specify Value" is chosen for "Selection of Minimum Support Value".
* Maximum Support Value - Maximum support value for the rules to find.
* Minimum Confidence Value - Minimum confidence value for the rules to find.
* Maximum Number of Items in a Basket - Maximum number of most frequent items in a basket to keep before running rule mining algorithm (Apriori algorithm). Less frequent items are dropped so that rule mining completes within reasonable time.
* Left Hand Side Items, Right Hand Side Items (Optional) - The default is NULL. What subjects should come to lhs or rhs.

## Step-by-Step Tutorial with Grocery store data.

* [Introduction to Association Rules (Market Basket Analysis) in R](https://blog.exploratory.io/introduction-to-association-rules-market-basket-analysis-in-r-7a0dd900a3e0)
