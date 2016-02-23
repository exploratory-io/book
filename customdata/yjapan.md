# Yahoo Japan Finance Data

### Pre-requisite

Install RFinanceJ R package.

RFinanceJ package home page

https://github.com/teramonagi/RFinanceJ

Installation

```
library(devtools)
install_github('teramonagi/RFinanceJ')
```


### Create a data frame

R Script

```
library(RFinanceJ, quietly = TRUE)
df <- rfinancej(c('4716', '4755', '2432'), "data.frame", "2014-1-1", "2016-1-15", "daily", "yahoo")
df_all <- bind_rows(df, .id = "ID")
df_all
```
