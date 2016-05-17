## How can I report issues, bugs, or enhancement requests ?

Please feel free to contact support@exploratory.io with any question! We would love to hear any feedback!  

## What is the best way to keep myself updated with the news ?

Please follow @kanaugust at Twitter or subscribe our blog: http://blog.exploratory.io .

## Is Mac OS X supported ?

Yes! We have certified El Capitan and Yosemite officially, but Mavericks should work as well.

## Is Windows supported ?

We are working on it to support Windows 10 and 8 first. Can't promise you an exact date but should be coming soon. We'll send you an email once that's become available, so please stay tuned!

## Is Linux supported ?

We have a plan to support Linux platform as well.

## Why are you asking my password for OS X ?

If you don't have R and/or Git previously installed you will be asked to enter your Mac OS admin username and password. This is because R and Git installation require the system administrator's privilege. We don't see or capture this information, it's completely done by R and Git installers and that's outside of Exploratory. ;)

## I have already installed R (rstats) 3.2 installed and don't want to upgrade to 3.3 right now.

Good news! We have prepared one variation of Exploratory Desktop for Mac for R 3.2. Please click 'Are you R 3.2 users?' link right below the download button on the download page. This will make the download button to download Exploratory Desktop for R 3.2. This version will check your R version, and as long as it is 3.2.0 or greater then it won't install any R.

## I have already installed R (rstats) 3.3, are you going to install another R ?

No. we check the R version that is installed on your pc, but as long as it is 3.3.0 or grater then Exploratory will use that one, without installing any R.

## I don't have R installed, what are you going to do ?

Please download Exploratory Desktop by simply clicking on Download button on the download page. It will install R 3.3 as part of the initial setup. You will be asked to enter your Mac OS admin username and password, this is because R installation would require the system administrator's privilege. We don't capture this information, it's completely done by R installer itself.

## What version of R is required ?

- R 3.2.0 or greater for Exploratory Desktop for R (rstats) 3.2 version.
- R 3.3.0 or greater for Exploratory Desktop for R (rstats) 3.3 version.

## What version of Git is required ?

Git version requirement is loosened recently and the latest Exploratory Desktop requires only Git 2.0.0 or greater. Unless it detects an older version of Git it won't try to install Git. Exploratory Desktop assumes that Git is installed under /usr/bin or /usr/local/bin, so for any reason if your Git is installed somewhere else then it might try to install Git because it thinks that Git is not there. If that's the case and you don't want another Git to be installed please contact support@exploratory.io .

## What R packages are you installing and why ?

Exploratory Desktop uses a number of amazing R packages, most of which are coming from 'Hadleyverse' - a set of R packages to make your data wrangling and analysis more effective and fun. You can see a list of the R packages to be installed in the initial setup UI by clicking a blue text 'See a list of software and libraries to be installed.' or select 'View Licenses' from Toolbar menu / Help. These are the packages that we use to make your data access and data analysis more effective.

## Where are you installing R packages ?

The recent version of Exploratory Desktop (1.4.1 or later) installs them into Exploratory's repository, which is different from the regular R installation location. This is to avoid any conflict with your own R environment.

## Can I add my preferred R packages ?

We have a plan to support this. If you have such requirement please contact support@exploratory.io . We would love to hear your requirement and discuss how to make it possible.
