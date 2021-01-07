# Text Wrangling UI

With the Text Wrangling UI, you can remove, replace, and extract strings from your text data. 

## Remove
You can remove strings from your text data with various options listed below.

- Text
- Text (All)
- Text (Multiple Candidate)
- Text (Multiple Candidates: All)
- Text Inside Special Characters
- Text Inside Special Characters (All)
- Range of Text
- Alphabets
- Numbers
- First Word
- Last Word
- Spaces
- Repeated Spaces (Including Tabs and Line Breaks)
- Leading & Trailing Spaces
- Email Address
- URL
- Emoji
- Punctuations Characters

### How to Use 

You can access Text Wrangling UI Remove option from the column header menu. 

![](images/remove_text2.png)


### Text

Type in strings that you want to remove from your text. In the below example, it removes "COVID19" from the text. 

![](images/remove_text1.png)

#### Regular Expression

You can use regular expression to remove strings from your text. Click the Regular Expression radio button and type in a regular expression that you want to try. In the below example, it removes the "pandemic" at the end of the text.

![](images/remove_text3.png)


#### Ignore Case

If you select "Yes" for Ignore Case radio button, it removes string with case insensitive fashion. For example, in the below example, it removes both 'pandemic' and 'Pandemic'.

![](images/remove_text4.png)


#### Position

In the above regular expression case, you used `$` to match the string at the end. But you can do it without manually writing regular expression by selecting "end" for the `Position` parameter.

![](images/remove_text5.png)

### Text (All)

It's basically same as "Text" option. The difference is it removes the all the matches. In below example, there are two "Pandemic" in the text and both of them are removed. In case of "Text", it only removes the first match.

![](images/remove_text6.png)

### Text (Multiple Candidates)

This option removes strings using multiple candidates for matching. In below example, it removes strings that match either "pandemic" or "covid".

![](images/remove_text7.png)

### Text (Multiple Candidates: All)

It's basically same as Text (Multiple Candidates). The difference is it removes all the matches like the below screenshot.

![](images/remove_text8.png)


### Text Inside Special Characters

This option removes text inside specified special characters. It's useful when you want to remove text inside parentheses. If you select "Include Special Characters", it removes the text along with begin and end special characters.

![](images/remove_text9.png)

### Text Inside Special Characters (All)

It's basically the same as Text Inside Special Characters. The difference is it removes all the matches in the text like the below screenshot.

![](images/remove_text10.png)

### Range of Text

This option removes strings in a specified range from your text. The below example shows removing strings between 10th and 20th.

![](images/remove_text11.png)

### Alphabets

This option removes Alphabets from your text like the below screenshot.

![](images/remove_text12.png)

### Numbers

This option removes Numbers from your text like the below screenshot.

![](images/remove_text13.png)

### First Word

This option separate text into words with specified separator (space for the below example) and removes the first word like the below screenshot. 

![](images/remove_text14.png)


### Last Word

This option separate text into words with specified separator (space for the below example) and removes the last word like the below screenshot. 

![](images/remove_text15.png)

### Spaces

This option removes spaces in the text like below screenshot. By clicking "Show Invisible Characters" checkbox, you can see space with "␣" character in the preview table.

![](images/remove_text16.png)

### Repeated Spaces (Including Tabs and Line Breaks)

This option removes repeated spaces, tabs, and line breaks. In the below example, you can see double spaces are changed to single space and line breaks are removed.

![](images/remove_text17.png)

### Leading & Trailing Spaces

This option removes leading and trailing spaces. For example, in the below screenshot shows the case where the "Japan" has trailing space and it removes the trailing space.

![](images/remove_text18.png)


### Email Address

This option removes email addresses from your text like below screenshot.

![](images/remove_text19.png)


### URL

This option removes URLs from your text like below screenshot.

![](images/remove_text20.png)


### Emoji

This option removes Emojis from your text like below screenshot.

![](images/remove_text21.png)


### Punctuations Characters

This option removes Punctuation Characters from your text like below screenshot.

![](images/remove_text22.png)

## Replace

You can replace strings from your text data with various options listed below.

- Text
- Text (All)
- Text (Multiple Candidate)
- Text (Multiple Candidates: All)
- Text Inside Special Characters
- Text Inside Special Characters (All)
- Range of Text
- Alphabets
- Numbers
- First Word
- Last Word
- Spaces
- Email Address
- URL
- Punctuations Characters

### How to Use 

You can access Text Wrangling UI Replace option from the column header menu. 

![](images/replace_text1.png)

### Text

Type in strings that you want to replace. In the below example, it replaces "COVID19" with "Corona Virus".


![](images/replace_text2.png)

#### Regular Expression

You can use regular expression to replace strings in your text. Click the "Regular Expression" radio button and type in a regular expression that you want to try. In the below example, with the regular expression it can replace the strings like "New York" to NYC.

![](images/replace_text3.png)


#### Ignore Case

If you select "No" for Ignore Case radio button, it replaces string with case sensitive fashion. For example, in the below example, it replace 'new York' but not 'New York'.

![](images/replace_text4.png)


#### Position

If you select the "End" for the Position, it only matches the string at the end of the text. In the below example, it only matches "COVID19" at the end of the text and ignore the rest.

![](images/replace_text5.png)

### Text (All)

It's basically same as "Text" option. The difference is it replaces the ALL the matches. In below example, there are two "new" in the text and both of them are replaced with "NEW". In case of "Text", only the first one got replaced.

![](images/replace_text6.png)

### Text (Multiple Candidates)

This option replace strings using multiple candidates for matching. In below example, it replaces strings that match either "covid" or "corona" to "New". You can enter comma separate values to the From input field as candidates. 

![](images/replace_text7.png)

### Text (Multiple Candidates: All)

It's basically same as Text (Multiple Candidates). The difference is it replaces all the matches like the below screenshot.

![](images/replace_text8.png)


### Text Inside Special Characters

This option replaces text inside specified special characters with the value entered in "Replace With" input field. It's useful when you want to replace text inside parentheses. If you select No for "Include Special Characters", it keeps the begin and end special characters and replace strings inside of these.

![](images/replace_text9.png)

### Text Inside Special Characters (All)

It's basically the same as Text Inside Special Characters. The difference is it replaces all the matches in the text like the below screenshot.

![](images/replace_text10.png)

### Range of Text

This option replaces strings in a specified range in your text with the value entered in "Replace With" input field. The below example shows replacing strings between 10th and 20th with "Special".

![](images/replace_text11.png)

### Alphabets

This option replaces Alphabets in your text with the value entered in "Replace With" input field like the below screenshot.

![](images/replace_text12.png)

### Numbers

This option replaces Numbers in your text like the below screenshot.

![](images/replace_text13.png)

### First Word

This option separate text into words with specified separator (space for the below example) and replaces the first word like the below screenshot. 

![](images/replace_text14.png)


### Last Word

This option separate text into words with specified separator (space for the below example) and replaces the last word like the below screenshot. 

![](images/replace_text15.png)

### Spaces

This option replaces spaces in the text like below screenshot. By clicking "Show Invisible Characters" checkbox, you can see space with "␣" character in the preview table.

![](images/replace_text16.png)


### Email Address

This option replaces email addresses in your text like below screenshot.

![](images/replace_text17.png)


### URL

This option replaces URLs in your text like below screenshot.

![](images/replace_text18.png)


### Punctuations Characters

This option replaces Punctuation Characters in your text like below screenshot.

![](images/replace_text19.png)

## Extract

You can replace strings from your text data with various options listed below.

- Text
- Text (All)
- Text (Multiple Candidate)
- Text (Multiple Candidates: All)
- Text Inside Special Characters
- Text Inside Special Characters (All)
- Range of Text
- Alphabets
- Numbers
- First Word
- Last Word
- Nth Word (2nd, 3rd, etc.)
- Email Address
- URL


### How to Use 

You can access Text Wrangling UI Extract option from the column header menu. 

![](images/extract_text1.png)

### Text

Type in strings that you want to replace. In the below example, it extracts "COVID" from text.


![](images/extract_text2.png)

#### Regular Expression

You can use regular expression to replace strings in your text. Click the "Regular Expression" radio button and type in a regular expression that you want to try. In the below example, with the regular expression it can extracts the strings like "New York".

![](images/extract_text3.png)


#### Ignore Case

If you select "No" for Ignore Case radio button, it extracts string with case sensitive fashion. For example, in the below example, it extracts 'new York' but not 'New York'.

![](images/extract_text4.png)


#### Position

If you select the "End" for the Position, it only matches the string at the end of the text. In the below example, it only matches "COVID19" at the end of the text and ignore the rest.

![](images/extract_text5.png)

### Text (All)

It's basically same as "Text" option. The difference is it extracts the ALL the matches. In below example, there are two "new" in the text and both of them are replaced with "NEW". In case of "Text", only the first one got replaced.

![](images/extract_text6.png)

### Text (Multiple Candidates)

This option extracts strings using multiple candidates for matching. In below example, it extracts strings that match either "covid" or "corona" to "New". You can enter comma separate values to the From input field as candidates. 

![](images/extract_text7.png)

### Text (Multiple Candidates: All)

It's basically same as Text (Multiple Candidates). The difference is it extracts all the matches like the below screenshot.

![](images/extract_text8.png)


### Text Inside Special Characters

This option extracts text inside specified special characters. It's useful when you want to extract text inside parentheses.

![](images/extract_text9.png)

### Text Inside Special Characters (All)

It's basically the same as Text Inside Special Characters. The difference is it extracts all the matches in the text like the below screenshot.

![](images/extract_text10.png)

### Range of Text

This option extracts strings in a specified range from your text. The below example shows extracting strings between 10th and 20th.

![](images/extract_text11.png)

### Alphabets

This option extracts Alphabets from your text like the below screenshot.

![](images/extract_text12.png)

### Numbers

This option extracts Numbers from your text like the below screenshot.

![](images/extract_text13.png)

### First Word

This option separates text into words with specified separator (space for the below example) and extracts the first word like the below screenshot. 

![](images/extract_text14.png)

### Last Word

This option separates text into words with specified separator (space for the below example) and extracts the last word like the below screenshot. 

![](images/extract_text15.png)

### N th Word

This option separates text into words with specified separator (space for the below example) and extracts the nth word (e.g. 2nd word) like the below screenshot. 

![](images/extract_text16.png)

### Email Address

This option extracts email addresses in your text like below screenshot.

![](images/extract_text17.png)


### URL

This option extracts URLs in your text like below screenshot.

![](images/extract_text18.png)


## Convert

You can replace strings from your text data with various options listed below.

- UPPERCASE
- lowercase
- Title Case
- Normalize (Zenkaku/Hankaku)
- Country
- US State
- US County
- IP Address - Country
- Anonymize
- Detect a Given Text (TRUE/FALSE)
- Character Encoding


### How to Use 

You can access Text Wrangling UI Extract option from the column header menu. 

![](images/convert_text1.png)

### UPPERCASE

It converts text to uppercase like the below screenshot.

![](images/convert_text2.png)

#### lowercase

It converts text to lowercase like the below screenshots.

![](images/convert_text3.png)


#### Title Case

If you select "No" for Ignore Case radio button, it extracts string with case sensitive fashion. For example, in the below example, it extracts 'new York' but not 'New York'.

![](images/convert_text4.png)


#### Normalize (Zenkaku/Hankaku)

It normalize text. In the below example, it converts Zenakaku numbers Hankaku numbers.

![](images/convert_text5.png)

### Country

You can convert country code to country name or vice versa.
The supported country codes are:

- Correlates of War (Character)
- Correlates of War (Numeric)
- ISO3 (Character)
- ISO3 (Numeric)
- ISO2 (Character)
- IMF (Numeric)
- FIPS (ederal Information Processing Standard) 10-4 (Numeric)
- FAO (Numeric)
- United Nations (Numeric)
- Word Bank (Character)

![](images/convert_text6.png)

### US State

It converts US State code to US State Name or vice versa.
The supported US State codes are:

- US States Abbreviation
- US States Number


![](images/convert_text7.png)

Also, you can convert US state to Division like "Pacific", "Middle Atlantic", etc. or to Region like "West", "Northeast", etc.

![](images/convert_text8.png)


### US County

It generates US county code (FIPS - Federal Information Processing Standard) based on US State and County names. To use this operation, you need to specify the column includes US State Names for the US County.

![](images/convert_text9.png)


### IP Address - Country

It converts IP address to country name.

![](images/convert_text10.png)

### Anonymize

it anonymizes values by hashing algorithms.

![](images/convert_text12.png)

### Detect a Give Text (TRUE/FALSE)

it returns TRUE or FALSE based on whether Text data contains a given text or not.

![](images/convert_text11.png)

### Character Encoding

It converts column character encoding. Below example, converts encoding from Japanese cp932 to UTF-8.

![](images/convert_text13.png)

