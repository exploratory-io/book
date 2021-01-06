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

You can access Text Wrangling UI from the column header menu. 

![](images/remove_text2.png)


### Remove Text

Type in strings that you want to remove from your text. In the below example, it removes "COVID19" from the text. 

![](images/remove_text1.png)

#### Regular Expression

You can use regular expression to remove strings from your text. Click the `Regular Expression` radio button and type in a regular expression that you want to try. In the below example, it removes the `pandemic` at the end of the text.

![](images/remove_text3.png)


#### Ignore Case

If you select "Yes" for `Ignore Case`, it removes string with case insensitive fashion. For example, in the below example, it removes both 'pandemic' and 'Pandemic'.

![](images/remove_text4.png)


#### Position

In the above regular expression case, you used `$` to match the string at the end. But you can do it without manually writing regular expression by selecting "end" for the `Position` parameter.

![](images/remove_text5.png)

### Remove Text (All)

It's basically same as Remove Text. The difference is it removes the all the matches. In below example, there are two "Pandemic" in the text and both of them are removed.

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




