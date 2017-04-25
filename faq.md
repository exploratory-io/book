# FAQ - Frequently Asked Questions

## I have very sensitive data. Is my data safe?

Any data you import into Exploratory Desktop always stays on your PC and never leave unless you explicitly publish (share) it to Exploratory Cloud (exploratory.io).

## Where exactly my data is stored after importing?

All the data you import into Exploratory Desktop is saved as a binary form (R's Rdata format) inside your repository, which is located under '<your_home_directory>/.exploratory' on your PC.

## How can I report issues, bugs, or enhancement requests?

We have a [community page](https://community.exploratory.io) to raise any questions and suggestions or report product issues. If you need an immediate help feel free to contact [support@exploratory.io](mailto:support@exploratory.io).

## What is the best way to keep myself updated with the news?

Please follow [@ExploratoryData](https://twitter.com/ExploratoryData) at Twitter or subscribe our blog: http://blog.exploratory.io .

## What platforms are supported?

There are MacOS and Windows versions available at our download page. We also have a beta version for Linux Ubuntu. [Link](https://community.exploratory.io/t/exploratory-v2-5-for-linux-is-available/266)

## Is there a server version of Exploratory Desktop?

Yes! We have a docker image of Exploratory Web Server and Exploratory Collaboration Server for beta.

**Exploratory Web Server** is a server version of Exploratory Desktop. Users can access to Exploratory through Web Browsers. This would be great when you need to work with large data sets that won't fit into your PC's memory or you have your organization's policy that prohibits an access to the data sources from your PC directly.

**Exploratory Collaboration Server** is a server version of Exploratory.io that you can install on your server or cloud services like AWS EC2. You can share your data, charts, and notes through this collaboration server inside your firewall.

Both them are available through our support. Please contact support@exploratory.io.

## Is there licensing or pricing information available?

Yes, here is [the pricing page](https://exploratory.io/pricing).

Also, here are the direct links to:

- [End User License Agreement](https://exploratory.io/eula)
- [Terms & Conditions](https://exploratory.io/terms)


## I'm having a network connection issue, what should I do?

Exploratory Desktop requires an internet connection for authenticating the users, downloading the required software like Git and R if you don't have them installed yet, accessing to remote data sources like Google Analytics, Web Scraping, and sharing Data, Chart, and Note.

If you use a proxy server to connect to the internet, as default it automatically tries to detect the proxy server and connect through the server. This should work for most of the times, but with certain scenarios it might not. In such cases you can manually add your proxy server information to a configuration file 'userconf.json', which can be found at ‘~/.exploratory’ for Mac OS X or ‘<your_user_home_folder>/.exploratory’ for Windows as follows. Here's an example.

**Set a proxy server:**

```
{
   "user": "dummy1",
   "proxy": {
     "server": "<your_proxy_server>",
     "port": <port_number>,
     "user": "<username>",
     "password": "<password>"
   }
}
```

Once the proxy server information is set, save the file and restart Exploratory Desktop. If you still encounter the network issue please contact at support@exploratory.io .

## Why are you asking my password for OS X at the initial installation time?

If you don't have R and/or Git previously installed you will be asked to enter your Mac OS admin username and password. This is because R and Git installation requires the system administrator's privilege. We don't see or capture this information, it's completely done by R and Git installers and that's outside of Exploratory. ;)

## I have already installed R (rstats) 3.3, are you going to install another R ?

No. we check the R version that is installed on your pc, but as long as it is 3.3.1 or grater then Exploratory will use that one, without installing another R.

## I don't have R installed, what are you going to do ?

Please download Exploratory Desktop by simply clicking on Download button on the download page. It will install R 3.3 as part of the initial setup. You will be asked to enter your Mac OS admin username and password, this is because R installation would require the system administrator's privilege. We don't capture this information, it's completely done by R installer itself.

## I have installed R with Homebrew on Mac OS X, does that work ?

Unfortunately the configuration of R installed with Homebrew is not supported currently. Exploratory Desktop requires a set of R packages to make your data wrangling and analysis more efficient from the day one. To install those packages we use the binary versions of the packages, which assume that R is installed with the standard installer with '.pkg' from CRAN. If you would like to use Exploratory Desktop, the workaround is to uninstall R with Homebrew with the command below, then restart Exploratory Desktop, which will install R 3.3 with the standard installer from CRAN.

```
> brew uninstall r
```

## I'm on Windows and getting error stating "Could not install R" or "Could not install Git".

If you change the installation path for R and Git during the installation you will see these errors. Please select the locations where R and Git are installed respectively in the pop-up UI and click OK. This will register the custom R and Git installed location and use them moving forward.

## I can't open a project. I'm seeing a loading icon when I try to create a new project.

One possible reason for this is, your home directory path on your PC has a space(s). If that's the case please perform the following steps to workaround it.

1. Create or pick a directory to install R packages for Exploratory, which does not have space in the path. Let’s say your home directory is '/Volumes/Another HD/kanaugust' and you created ‘/Users/KanAugust’ as a directory to install the R packages for Exploratory.
2. Open ‘/Volumes/Another HD/kanaugust/.exploratory/userconf.json’ with text editor.
3. Add “r_lib_path” attribute that specifies the directory you picked.
Your userconf.json should look something like the following.

{
    "user": "kanaugust",
    "r_lib_path": “/Users/KanAugust”
}

4. Restart Exploratory
5. Follow the setup step.

This will install the R packages to the specified location. After that, you should be able to open the project. Otherwise, please contact support@exploratory.io .

## What version of R is required ?

R 3.3.1 or greater.

## What version of Git is required?

The latest Exploratory Desktop requires Git 2.0.0 or greater. Unless it detects an older version of Git it won't try to install Git. Exploratory Desktop assumes that Git is installed under /usr/bin or /usr/local/bin, so for any reason if your Git is installed somewhere else then it might try to install Git because it thinks that Git is not there. If that's the case and you don't want another Git to be installed please contact support@exploratory.io .

## What R packages are you installing and why?

Exploratory Desktop uses a number of amazing R packages, most of which are coming from 'tidyverse' - a set of R packages to make your data wrangling and analysis more effective and fun. You can see a list of the R packages to be installed in the initial setup UI by clicking a blue text 'See a list of software and libraries to be installed.' or select 'View Licenses' from Toolbar menu / Help. These are the packages that we use to make your data access and data analysis more effective.

## Where are you installing R packages?

Exploratory Desktop installs them into Exploratory's repository, which is different from the regular R installation location. This is to avoid any conflict with your own R environment.

## Can I add my preferred R packages?

Yes! Here's an [introduction](https://blog.exploratory.io/installing-r-packages-from-cran-in-exploratory-desktop-36eae50cffb0#.u2iee7i5j) on how to install and use R packages from CRAN.

## Can I change my username?

We are not currently supporting it, but we will in future releases. If you need it to be changed now, please contact support@exploratory.io, we can manually change it at the server for you.
