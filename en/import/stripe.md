# Import Stripe API Data

You can get your payment data from Stripe quickly. Take a look at this [blog post](https://blog.exploratory.io/importing-stripe-payment-data-visualize-and-schedule-with-exploratory-3b1422a9cf8b) for the details.

## 1. Select Stripe Data Menu

Click '+' button next to 'Data Frames' and select 'Import Cloud Apps Data'.

![](images/import-cloudapps.png)

Click 'Stripe'

![](images/stripe-select.png)

## 2. OAuth Setting

Create a connection following [this instruction](https://blog.exploratory.io/how-to-setup-oauth-cloud-apps-connections-in-exploratory-a5c20d18e7c7).

Note that your Stripe account needs to have [the Administrator role](https://stripe.com/docs/dashboard/teams) in allowing Exploratory to read your Stripe data.

## 3. Input parameters

Set these parameters.

* Data Type - Select a type of Stripe data set.
  * Balance History - Returns a list of transactions that have contributed to the Stripe account balance (e.g., charges, transfers, and so forth).
  * Charges - Returns a list of charges you’ve previously created.
  * Customers - Returns a list of your customers.
  * Disputes - Returns a list of your disputes. A dispute occurs when a customer questions your charge with their bank or credit card company. When a customer disputes your charge, you're given the opportunity to respond to the dispute with evidence that shows the charge is legitimate.
  * Events - List events, going back up to 30 days. A new Event data is created when an interesting event occurs. For example, when a charge succeeds, a charge.succeeded event is created.
  * File Uploads - Returns a list of the files that you have uploaded to Stripe.
  * Payouts - Returns a list of existing payouts sent to third-party bank accounts or that Stripe has sent you. A payout data is created when you receive funds from Stripe or you initiate a payout to either a bank account or debit card of a connected Stripe account.
  * Refunds - Returns a list of all refunds you’ve previously created.
  * Transfers - Returns a list of existing transfers sent to connected accounts. A transfer data is created when you move funds between Stripe accounts as part of connect.
  * Subscriptions - Returns a list of subscriptions that have not been canceled. Subscriptions allow you to charge a customer's card on a recurring basis. A subscription ties a customer to a particular plan you've created.
* Date Range - Select a type of date filtering. If you choose 'After This Date', you can indicate explicit date like '2015-11-03' in 'Value for Date Range'. If you choose 'Last N ~', you can indicate a positive integer in 'Value for Date Range' and the data is filtered by the number with the time unit in the option.
* Value for Date Range - If this is empty, all data is imported. If 'Date Range' is 'After This Date', this should be explicit date like '2015-11-03'. If 'Date Range' is 'Last N ~', this should be a positive integer.


## <a name="custom_query"></a>4. Custom Query String

To filter Stripe data, you can pass query string as `field=value` fashion. For example, if you want to filter `charges` data whose currency is jpy, you can set `currency=jpy` in this field. You can also set multiple conditions by concatenating condition with `&`. Let's say you want to fetch charges data whose currency is jpy and amount greater than 100,000, you can set following as your query string.

`currency=jpy&amount[gt]=100000`

In here `[gt]` is called child argument and `gt` means greater than. As you'd guess there are other operator available for child argument per column. For example, as for amount column, following child arguments are available.

- gt (Greater Than) 
- gte (Grater Than or Equal To)
- lt (Less Than)
- lte (Less Than or Equal To)


Here is the list of available child arguments per resource/column

### Balance

#### available_on

- gt (Greater Than)
- gte (Grater Than or Equal To)
- lt (Less Than)
- lte (Less Than or Equal To)
 
#### created

- gt (Greater Than)
- gte (Grater Than or Equal To)
- lt (Less Than)
- lte (Less Than or Equal To)

### Charges

#### created

- gt (Greater Than)
- gte (Grater Than or Equal To)
- lt (Less Than)
- lte (Less Than or Equal To)

#### source

- object (available options are `all`, `alipay_account`, `bank_account`, `bitcoin_receiver`, or `card`)

### Customers

#### created

- gt (Greater Than)
- gte (Grater Than or Equal To)
- lt (Less Than)
- lte (Less Than or Equal To)

### Disputes

#### created

- gt (Greater Than)
- gte (Grater Than or Equal To)
- lt (Less Than)
- lte (Less Than or Equal To)

### Events

#### created

- gt (Greater Than)
- gte (Grater Than or Equal To)
- lt (Less Than)
- lte (Less Than or Equal To)

### File Uploads

#### created

- gt (Greater Than)
- gte (Grater Than or Equal To)
- lt (Less Than)
- lte (Less Than or Equal To)

### Payouts

#### arrival_date

- gt (Greater Than)
- gte (Grater Than or Equal To)
- lt (Less Than)
- lte (Less Than or Equal To)

#### created

- gt (Greater Than)
- gte (Grater Than or Equal To)
- lt (Less Than)
- lte (Less Than or Equal To)

NOTE: Not all columns are available for query string. Please refer Stripe [API Doc](https://stripe.com/docs/api/node) for supported columns for each resource. For example, you can check [Charges](https://stripe.com/docs/api/node#charges) if you want to query against Charge.

## 5. Preview and Import

Click Preview button to see the data back from Stripe. If it looks ok, then you can click 'Import' to import the data into Exploratory.
