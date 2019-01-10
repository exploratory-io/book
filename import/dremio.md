### How to use Dremio with R and Exploratory

![](https://cdn-images-1.medium.com/max/1600/1*trMe2Bxk7kGf5-AZyJ8r1w.png)

[Dremio](https://www.dremio.com/product/) provides SQL interface to various data
sources such as MongoDB, JSON file, Redshift, etc. It is often considered as
Data Fabric because it can take care of the query optimization and data cache
management across all the different type of data sources so users don’t need to
deal with the difference among the data sources. And it can accelerate the query
performance sometimes up to 1000 times by utilizing highly optimized physical
representations of source data with [Apache
Parquet](https://parquet.apache.org/), leveraging columnar in-memory processing
with [Apache Arrow](https://arrow.apache.org/) and advanced push-downs into the
underlying data sources (when dealing with RDBMS or NoSQL sources).

![](https://cdn-images-1.medium.com/max/1600/1*OlkhR5r3TQsaqTdpUX6ofA.png)

In this post, I’m going to walk you through how you can install Dremio on your
local machine and connect it to Dremio from R and
[Exploratory](https://exploratory.io/).

### Dremio Server

#### Before you start.

If your local machine does not have Java yet, you need to install it. You can
download Java from [here](https://java.com/en/download/).

#### Download

First, you need to download Dremio from Dremio [Download
Site](https://www.dremio.com/download/). In this blog post, I’ll explains the
installation on Mac for Dremio Community Edition.

![](https://cdn-images-1.medium.com/max/1600/1*4TDLmFDgiCXatOSSbrO57w.png)

#### Install

Once you downloaded the installation file (my case .dmg file), double click the
file. And you’ll see something like this. So drag the Dremio icon and move it to
Applications folder.

![](https://cdn-images-1.medium.com/max/1600/1*k7Si5UweG49DE4ig9QC9jg.png)

That’s it! Now let’s start Dremio.

#### Setup

To start Dremio, double click Dremio you just installed

![](https://cdn-images-1.medium.com/max/1600/1*d3YDQFYrkfLv7PbiQE-trg.png)

And controller window pops up like this. So click Start button.

![](https://cdn-images-1.medium.com/max/1600/1*DGd2-g98leQI3FKtKt58tw.png)

Once it started Open Dremio button becomes clickable like this. So click it.

![](https://cdn-images-1.medium.com/max/1600/1*ZF9dwj-dZ_1gbY7Kirhe7Q.png)

#### Create Admin Account

So this will open a browser (or a new tab if you already opened your browser) So
enter required fields for your Admin account.

![](https://cdn-images-1.medium.com/max/1600/1*uhEp1z50xxW00aUzg8746w.png)

Click Next, and congratulation! Now your can see Dremio page like below.

![](https://cdn-images-1.medium.com/max/1600/1*att8Co93kiln4401DUvWZQ.png)

#### Add Sample Source

Dremio prepares some Sample Source so let’s check it. Click `Add Sample Source`
Button.

![](https://cdn-images-1.medium.com/max/1600/1*RfL96G750FMYVeCEbqvXMA.png)

Now you can see `sample.dremio.com` is added to Samples data source. Click the
`sample.dremio.com`.

![](https://cdn-images-1.medium.com/max/1600/1*YaJwVRoafyQ0NU4dHzf40g.png)

And you can see there are three samples under samples.dremio.com. Let’s click
the first one called ‘SF_incidents2016.json’, which is a JSON file about
criminal incidents happened in San Francisco in 2016.

![](https://cdn-images-1.medium.com/max/1600/1*6ucbViGmOC_rt5xqDQWp4g.png)

And this will opens a dialog like below where you can preview it’s data so click
`Save`button.

![](https://cdn-images-1.medium.com/max/1600/1*N1k-KVRv6R4Mlui3HV4reQ.png)

And now it shows Dremio’s query dialog. And this means that you can access this
JSON with SQL! And not only from this Dremio’s query dialog, but also you can
access from many other applications including R and Exploratory. And that’s what
I’m going to do in the next section.

![](https://cdn-images-1.medium.com/max/1600/1*pBamVZZoOm47xEaa6XT1nA.png)

### Dremio ODBC Driver

Before accessing the data in Dremio from R and Exploratory, you need to setup
ODBC on your local machine. Below is an example for Mac.

#### Download

Now let’s download ODBC driver so that you can connect to your Dremio from R and
Exploratory. From the same Dremo [Download
Site](https://www.dremio.com/download/), you can download Dremio ODBC Driver.

![](https://cdn-images-1.medium.com/max/1600/1*UM8NmrJDwxIuMM6eoRoMmw.png)

### Install

Double clicked downloaded file (my case .dmg file). This will open up a window
like below.

![](https://cdn-images-1.medium.com/max/1600/1*KTmq80n3WiKDc_FkOolaeg.png)

And double click the Dremio ODBC.pkg file. And follow the instruction on dialog
(Basically, click continue and agree license).

![](https://cdn-images-1.medium.com/max/1600/1*g0ILGFDPY2jnh4tB0Wx8Cg.png)

That’s it!

![](https://cdn-images-1.medium.com/max/1600/1*kZaLHUACVthpbgyx_Ojegw.png)

### Setup Data Source on Exploratory

Open Connection Dialog either from Exploratory Desktop Project List page or
inside Project.

#### Open Connection inside Project

If you already opened a project, then from a project header menu, select
Connections menu.

![](https://cdn-images-1.medium.com/max/1600/1*66x_hyknxjmSyLO-uWnNIQ.png)

### Add New Dremio Connection

Click Add button on Connection List Dialog.

![](https://cdn-images-1.medium.com/max/1600/1*y2m8r3ZaG8HGaxVdDzIiFw.png)

From Connection chooser, click Dremio icon.

<br> 

![](https://cdn-images-1.medium.com/max/1600/1*029kt-jjXQ8Xku6ztUfDaA.png)

Enter following fields

* Name
* Host (in this example, localhost)
* Port (by default it’s 31010)
* Username (Username that you setup on Dremio Admin Account)
* Password (Password that you setup for Dremio Admin Account)

![](https://cdn-images-1.medium.com/max/1600/1*BxLq9IB_pmUdPfZQgMC6uA.png)

#### Test Connection

Once you entered these fields click Test Connection button to test it and make
sure you connection test went well.

![](https://cdn-images-1.medium.com/max/1600/1*ArLkEnFg-Dm-giYBvDkPSQ.png)

After confirming it, click Add button to save it.

### Query Dremio Data

### <br> 

On left hand side tree, click plus (+) button next to Data Frames label and
select `Database Data`.

![](https://cdn-images-1.medium.com/max/1600/1*_kEGZ7eLwtsWHtjp29ZBBA.png)

And select Dremio

![](https://cdn-images-1.medium.com/max/1600/1*Fqe1wGRDVjeihlWZynCwOg.png)

On Data Import Dialog, select Dremio Connection (i.e. Dremio Local Mac) that you
just created and expand `Samples.'sample.dremio.com'` and you can see
`SF_incidents2016.json` that you added at Dremio from their sample. Click the
Table name, which would automatically generate a SQL query to get the whole
data. By clicking Preview button, you will see the data returned in Exploratory
!


![](https://cdn-images-1.medium.com/max/1600/1*hjL-_4Yt68TUhJ5YNPG4MQ.png)

### Known issues

Currently, non ascii column names are not imported correctly.



### Summary

So now you know how you can install/setup Dremio and ODBC driver on your machine
and access Dremio data from Exploratory. So on the next couple of blog posts,
I’ll talk about how you can query YOUR data (JSON file, MongoDB, Redshift, etc)
with Dremio and Exploratory.
