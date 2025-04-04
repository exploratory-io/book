# FAQ - Frequently Asked Questions

# Data Security

## I have very sensitive data. Is my data safe?

Any data you import into Exploratory Desktop app always stays on your PC and never leave your PC unless you explicitly publish (share) it to Exploratory Server (exploratory.io) or use Data Wrangling with AI Prompt feature. If you decided to publish the data to Exploratory Server for sharing or scheduling, you can share it in a private way so that only you and others you have invited can view it.

The data is also stored encrypted. Please take a look at our [Privacy Policy](https://exploratory.io/privacy/) for more details.

## Where exactly my data is stored after importing?

All the data you import into Exploratory Desktop is saved as a binary form (R's Rdata format) inside your repository, which is located under '<your_home_directory>/.exploratory' on your PC.

## How Exploratory Handles Your Data When Using AI Features

When you use the Data Wrangling with AI Prompt feature in the Exploratory Desktop app, a portion of your data may be sent to our AI service provider, Anthropic (Anthropic, Inc. / https://anthropic.com), depending on your configuration:

* If you set the sample data size to a value greater than 0, a sample of your dataset is included in the prompt text sent to Anthropic’s AI service to improve the quality and relevance of the AI-generated suggestions.
* If you set the sample data size to 0, only the column names and their data types (e.g., "numeric", "character", etc.) are included in the prompt. No actual data values are sent.

Importantly, none of your data or prompts are stored on Exploratory’s servers. We simply pass the information directly to the AI service as part of the prompt, and we do not retain any of it.

In addition, Anthropic does not store or use your data or prompt content for model training purposes. For more details, please refer to Anthropic’s data privacy policy here: [How do you use personal data in model training?](https://privacy.anthropic.com/en/articles/7996885-how-do-you-use-personal-data-in-model-training)




# Subscription / License / Price / Payment

## Where can I find licensing / pricing information?

You can find it on [the pricing page](https://exploratory.io/pricing).

## How can I pay?

The most simplest way is to pay with your credit card from the [plan page](https://exploratory.io/plan).

We support issuing invoices and receipts with either credit card or bank wiring for the payment as well. But this requires the Business Plan or greater with annual subscriptions. Please take a look at the following document for more detail.

* How to Buy Exploratory Subscription Licenses with Invoice - [Link](https://exploratory.io/note/kanaugust/How-to-Buy-Exploratory-Subscription-Licenses-with-Invoice-FWS2vOl9mP)


## How is the currency for the payment?

It is US dollars.


## What happens when I change my subscription plan periods between Yearly and Monthly?

If you change the subscription plan period from Monthly to Yearly, the plan will start from the date you update through the next 12 month periods. Prorated amount for the rest of the month is subtracted from the amount charged for the newly starting Yearly plan. If you change it from Yearly to Monthly, then the amount for the rest of the year is credited to your account, and will be used for upcoming monthly charges until it is used up, at which time charges for the monthly plan will resume. Note that given the Yearly plan has a discount compared to the Monthly plan, the charges for monthly plan will resume sooner than the end of the original yearly plan.

## What happens when I upgrade or downgrade my subscription plan between Personal and Business?

When you downgrade, the prorated amount difference for the rest of the period (year or month) will be subtracted from the charge for the new plan at the beginning of the next period.

When you upgrade, the prorated amount difference for the rest of the period will be added to the charge for the new plan at the beginning of the next period.


## How can I get a receipt?

A receipt will be delivered to your email address every time the charge is made.

## How can I get a receipt in a different format?

We issue a customized version of receipt upon requests for Business plan users. Please contact [us](mailto:support@exploratory.io).

## How can I get an invoice?

We issue an invoice upon requests for Business plan users. Please contact [us](mailto:support@exploratory.io).

## How can I change my plan?

First, you can open the [Account Setting Page](https://exploratory.io/account/settings). You need to login to open this page. Click the "Upgrade Plan" link below the plan box.

<img src="https://raw.githubusercontent.com/exploratory-io/book/master/images/payment1.png" style="width:100%"/>

Then, it opens up the Plan page. Click to select a new plan that you want. If the new plan is a paid plan, choose a payment term (yearly or monthly) and payment method info. If you are still in a trial period, you don't need to enter the payment method now.

<img src="https://raw.githubusercontent.com/exploratory-io/book/master/images/payment2.png" style="width:100%"/>

You can check whether you are still in a trial period or not by looking at the top right of the Plan page.

<img src="https://raw.githubusercontent.com/exploratory-io/book/master/images/payment3.png" style="width:100%"/>

Once you update the info, check out the "Terms for the Service" and check the checkbox, then click the "Upgrade plan" to finalize it.

If you see the "You plan is updated" message, the plan update is done. If you see any error, problem, or any questions, please feel free to contact [us](mailto:support@exploratory.io).

<img src="https://raw.githubusercontent.com/exploratory-io/book/master/images/payment4.png" style="width:100%"/>



## How can I cancel my plan?

You can cancel the plan anytime from your account page with just a click of a button. Your subscription will expire at the end of the current subscription period.

## I'm currently a student or a teacher at my school and want to use Exploratory for my studying or teaching.

You can use the Academic plan, which is for free. The Academic plan is for students and teachers who are currently studying or teaching at schools.

When you sign up you need to use the accredited school email address. Once your school email is validated then you'll have your account that is setup for the Academic plan.

We will send you an email once in a half year to confirm your current status at the school. You can confirm by clicking a button in the email if you are still at a school and would like to continue using it.

If your school is not registered at Exploratory, you can request it by clicking a link at the sign up page.



## I'm currently a student or a teacher at my school, but I have mistakenly started with a different plan. How can I switch to the Academic plan?

You can switch the plan quickly. Here's [an instruction](https://community.exploratory.io/t/how-to-change-your-plan-to-the-community-plan/2006) of how you switch it.

# Install / Upgrade

## What platforms are supported?

There are MacOS and Windows versions available at our download page. Check this [Note](https://exploratory.io/note/kanaugust/8664976332176618) for more details on system requirements.

For macOS Big Sur, we tested basic operations and confirmed these work fine. There is one known issue for the fresh install case so please check this [Community Post](https://community.exploratory.io/t/r-installation-error-on-macos-big-sur/1948) for more details.
## Can I change the location of the Exploratory repository?

Yes. Here's an [instruction](https://docs.exploratory.io/howto/set_exploratory_home.html) on how to do that.


## I'm having a network connection issue, what should I do?

Exploratory Desktop requires an internet connection for authenticating the users, downloading the required software like Git and R if you don't have them installed yet, accessing to remote data sources like Google Analytics, Web Scraping, and sharing Data, Chart, and Note.

If you use a proxy server at your organizations to connect to the internet, by default it automatically tries to detect the proxy server and connect through the server.

This should work for most of the times, but unfortunately it might not work sometimes. In such cases you can manually add your proxy server information in Configuration dialog UI. Check [this note](https://exploratory.io/note/2ac8ae888097/How-to-setup-Web-Proxy-on-your-Exploratory-Dekstop-xFn0fip7Zd) for setup details.

<img src="https://raw.githubusercontent.com/exploratory-io/book/master/images/proxy-config.png" width="640px">

If you are still having the network issue please contact support@exploratory.io .

## Why are you asking my password for OS X at the initial installation time?

If you don't have R and/or Git previously installed, you will be asked to enter your Mac OS admin username and password. This is because R and Git installation requires the system administrator's privilege. We don't see or capture this information, it's completely done by R and Git installers and that's outside of Exploratory. ;)

## I have already installed R, are you going to install another R ?

No. Exploratory will check the R version on your PC and upgrade to the latest certified version if the R version is old. If the certified version of R is already installed on your PC, it will not install a new version of R, but continue to use the existing one
## I don't have R installed, what are you going to do ?

Just download Exploratory Desktop by simply clicking on Download button on the download page, and execute it. It will install the latest certified version of R as part of the initial setup. For Mac, you will be asked to enter your Mac OS admin username and password, this is because R installation would require the system administrator's privilege. We don't capture this information, it's completely done by R installer itself.

## I have installed R with Homebrew on Mac OS X, does that work ?

Unfortunately the configuration of R installed with Homebrew is not supported currently. Exploratory Desktop requires a set of R packages to make your data wrangling and analysis more efficient from the day one. To install those packages we use the binary versions of the packages, which assume that R is installed with the standard installer with '.pkg' from CRAN. If you would like to use Exploratory Desktop, the workaround is to uninstall R with Homebrew with the command below, then restart Exploratory Desktop, which will install the latest R 3.6 with the standard installer from CRAN.

```
> brew uninstall r
```

## I'm on Windows and getting error stating "Could not install R" or "Could not install Git".

If you change the installation path for R and Git during the installation, you will see these errors. Please select the locations where R and Git are installed respectively in the pop-up UI and click OK. This will register the custom R and Git installed location and use them moving forward.

## I can't open a project. How can I fix the issue?

Please refer the [Troubleshooting Guide](https://exploratory.io/note/exploratory/How-to-Fix-Common-Exploratory-Desktop-Problems-tsy2jVJ0RO) for the details.

## What version of Git is required?

The latest Exploratory Desktop requires Git 2.0.0 or greater. Unless it detects an older version of Git it won't try to install Git. Exploratory Desktop assumes that Git is installed under /usr/bin or /usr/local/bin, so for any reason if your Git is installed somewhere else then it might try to install Git because it thinks that Git is not there. If that's the case and you don't want another Git to be installed please contact support@exploratory.io .

## What R packages are you installing and why?

Exploratory Desktop uses a number of amazing R packages. You can see a list of the R packages to be installed in the initial setup UI by clicking a green text 'See a list of software and libraries to be installed.' or select 'View Licenses' from Toolbar menu / Help. These are the packages that we use to make your data access and data analysis more effective.

## Where are you installing R packages?

Exploratory Desktop installs them into Exploratory's repository, which is different from the regular R installation location. This is to avoid any conflict with your own R environment if you happen to have.

## Can I add my preferred R packages?

Yes! Here's an [introduction](https://blog.exploratory.io/installing-r-packages-from-cran-in-exploratory-desktop-36eae50cffb0#.u2iee7i5j) on how to install and use R packages from CRAN.


## Is there a server version of Exploratory Desktop?

We have a closed beta currently. If you're interested in participating, please contact support@exploratory.io so that we can put you on our beta waiting list.

## I'm having trouble installing/running Exploratory on MacOS X 10.15 Catalina. What can I do?

[Here](https://exploratory.io/note/exploratory/How-to-Run-Exploratory-on-MacOS-X-Catalina-GSA3lpz0) is a Note on known issues and solutions about installing/running Exploratory on MacOS X 10.15 Catalina.

# Share / Publish

## How can I share my insights with others privately?

You can invite others to view your insights (Data, Chart, Note, Slide, or Dashboard) privately by email addresses. They will receive an invitation email, and they can click the link to open your insights at Exploratory Cloud. If they don’t have the accounts created yet, they will be asked to create **free** accounts before opening your insights. They don’t need to subscribe any plan as long as they just want to view the shared insights. If they like to use Exploratory Desktop to customize the insights or create new ones, then they will need to subscribe one of the plans at this point.

## How many users can I share my insights (Chart / Data / Note)?

If you like to share only the named users, which means they will need to have their accounts created at Exploratory Cloud (https://exploratory.io) and sign in first, you can share as many users as your plan supports. If you like to share with anybody without asking them to create the accounts, then you could share a specially generated URL for each insight with them. This is a convenient way to share with a mass audience, though this means anybody who happens to have this URL can open the insights. There is no limitation on how many people can access your insights with this URL share option.

You can also share your insights publicly with unlimited number of people regardless of the plan you subscribe.

# User Account Information

## Can I change my email address?

Yes, you can change it from ['My Account'](https://exploratory.io/account/settings) page.

# Issues / Troubleshoot

## How can I report issues, bugs, or enhancement requests?

We have a [community page](https://community.exploratory.io) to raise any questions and suggestions or report product issues. If you need an immediate help feel free to contact [support@exploratory.io](mailto:support@exploratory.io).

# Communication

## What is the best way to keep myself updated with the news?

Please follow [@ExploratoryData](https://twitter.com/ExploratoryData) at Twitter!
