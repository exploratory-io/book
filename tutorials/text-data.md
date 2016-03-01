# Working with Text data

### What you are going to learn

Extracting and Manipulating Text Data by:

- Scraping text data from Web
- Extracting and Replacing text
- Using Basic Regular Expression
- Separate a text into two columns
- Joining with another data

# Data


http://www.thearda.com/Archive/Files/Codebooks/RCMSST10_CB.asp

# Import Data

Religion code and name mapping

```
## Load 'rvest' package
library(rvest)

## Scrape church code and name mapping from this web site
church_code_scrape <- read_html("http://www.thearda.com/Archive/Files/Codebooks/RCMSST10_CB.asp")

## Use 'rvest' functions to get the text
code_text <- church_code_scrape %>% html_nodes("#content dt") %>%
  html_text()

## Convert Character vector to Data Frame
code <- data.frame(text = code_text)

## Return a data frame 'code'
code

```

Religion code and family mapping
