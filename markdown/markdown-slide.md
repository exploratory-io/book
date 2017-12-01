# A Guide for Creating Presentation Slides with Markdown Editor

You can use Simple Markdown Editor to create Presentation Slides to communicate your insights with others easily. This guide shows  how you can use it.

##### Table of Contents  

* Basic Markdown formatting  
  * [Slide Separators](#slide-separators)  
  * [Headers](#headers)  
  * [Emphasis](#emphasis)  
  * [Lists](#lists)  
  * [Links](#links)  
  * [Images](#images)  
  * [Code](#code)  
  * [Tables](#tables)  
  * [Blockquotes](#blockquotes)  
  * [Inline HTML](#inline-html)  
  * [Horizontal Rule](#horizontal-rule)  
  * [Line Breaks](#line-breaks)  
* [Charts from Visualization View](#exploratory-charts)  
* [Charts from Analytics](#exploratory-analytics-viz)　　
* [R Script - Code Block](#r-script-code-block)
* [R Script - Inline](#r-script-inline)
* [Publish and Share](#publish-and-share)


## Slide Separators

Three dashes inserts the slide separators. 

```no-highlight
---
```



## Headers

```no-highlight
# H1
## H2
### H3
#### H4
##### H5
###### H6

Alternatively, for H1 and H2, an underline-ish style:

Alt-H1
======

Alt-H2
------
```

# H1
## H2
### H3
#### H4
##### H5
###### H6

Alternatively, for H1 and H2, an underline-ish style:

Alt-H1
======

Alt-H2
------

## Emphasis

```no-highlight
Emphasis, aka italics, with *asterisks* or _underscores_.

Strong emphasis, aka bold, with **asterisks** or __underscores__.

Combined emphasis with **asterisks and _underscores_**.

Strikethrough uses two tildes. ~~Scratch this.~~
```

Emphasis, aka italics, with *asterisks* or _underscores_.

Strong emphasis, aka bold, with **asterisks** or __underscores__.

Combined emphasis with **asterisks and _underscores_**.

Strikethrough uses two tildes. ~~Scratch this.~~

## Lists

If you want a nested list, you can add 4 spaces or 1 tab at the beginning. 

 (In this example, leading and trailing spaces are shown with with dots: ⋅)

```no-highlight
1. First ordered list item
2. Another item
⋅⋅⋅⋅* Unordered sub-list.
1. Actual numbers don't matter, just that it's a number
⋅⋅⋅⋅1. Ordered sub-list
4. And another item.

⋅⋅⋅⋅You can have properly indented paragraphs within list items. Notice the blank line above, and the 4 leading spaces. 

⋅⋅⋅⋅To have a line break without a paragraph, you will need to use 2 trailing spaces.⋅⋅
⋅⋅⋅⋅Note that this line is separate, but within the same paragraph.⋅⋅
⋅⋅⋅⋅(This is contrary to the typical GFM line break behaviour, where trailing spaces are not required.)

* Unordered list can use asterisks
- Or minuses
+ Or pluses
```

1. First ordered list item
2. Another item
    * Unordered sub-list.
1. Actual numbers don't matter, just that it's a number
    1. Ordered sub-list
4. And another item.

    You can have properly indented paragraphs within list items. Notice the blank line above, and the 4 leading spaces.

    To have a line break without a paragraph, you will need to use 2 trailing spaces.  
    Note that this line is separate, but within the same paragraph.  
    (This is contrary to the typical GFM line break behavior, where trailing spaces are not required.)

* Unordered list can use asterisks
- Or minuses
+ Or pluses

## Links

There are two ways to create links.

```no-highlight
[I'm an inline-style link](https://exploratory.io)

[I'm an inline-style link with title](https://exploratory.io "Exploratory's Homepage")

[I'm a reference-style link][Arbitrary case-insensitive reference text]

[I'm a relative reference to a repository file](../../index.html)

[You can use numbers for reference-style link definitions][1]

Or leave it empty and use the [link text itself].

URLs and URLs in angle brackets will automatically get turned into links.
http://exploratory.io or <http://exploratory.io> and sometimes
example.com (but not on Github, for example).

Some text to show that the reference links can follow later.

[arbitrary case-insensitive reference text]: https://www.mozilla.org
[1]: http://slashdot.org
[link text itself]: http://www.reddit.com
```

[I'm an inline-style link](https://exploratory.io)

[I'm an inline-style link with title](https://exploratory.io "Exploratory's Homepage")

[I'm a reference-style link][Arbitrary case-insensitive reference text]

[I'm a relative reference to a repository file](../../index.html)

[You can use numbers for reference-style link definitions][1]

Or leave it empty and use the [link text itself].

URLs and URLs in angle brackets will automatically get turned into links.
http://exploratory.io or <http://exploratory.io> and sometimes
example.com (but not on Github, for example).

Some text to show that the reference links can follow later.

[arbitrary case-insensitive reference text]: https://www.mozilla.org
[1]: http://slashdot.org
[link text itself]: http://www.reddit.com


## Images

```no-highlight
Here's our logo (hover to see the title text):

Inline-style:
![alt text](file://Users/exploratory/images/logo_top.png "Logo Title Text 1")

Reference-style:
![alt text][logo]

[logo]: file://Users/exploratory/images/logo_top.png "Logo Title Text 2"
```

Here's our logo (hover to see the title text):

Inline-style:
![alt text](images/logo_top.png "Logo Title Text 1")

Reference-style:
![alt text][logo]

[logo]: images/logo_top.png "Logo Title Text 2"


## Code

Code blocks are part of the Markdown spec and Exploratory uses R Markdown's pygments for syntax highlighting.

```no-highlight
`r now()` is the best time to learn Inline R codes that have `back-ticks around` it.
```

2017-08-18 21:23:21 is the best time to learn Inline R codes that have `back-ticks around` it.

Blocks of code are either fenced by lines with three back-ticks <code>```</code>, or are indented with four spaces. I recommend only using the fenced code blocks -- they're easier and only they support syntax highlighting.

<pre lang="no-highlight"><code>```{r}
summary(mtcars)
```

```
No language indicated, so no syntax highlighting.
But let's throw in a &lt;b&gt;tag&lt;/b&gt;.
```
</code></pre>

```r
summary(mtcars)
```

<pre><code>
##       mpg             cyl             disp             hp       
##  Min.   :10.40   Min.   :4.000   Min.   : 71.1   Min.   : 52.0  
##  1st Qu.:15.43   1st Qu.:4.000   1st Qu.:120.8   1st Qu.: 96.5  
##  Median :19.20   Median :6.000   Median :196.3   Median :123.0  
##  Mean   :20.09   Mean   :6.188   Mean   :230.7   Mean   :146.7  
##  3rd Qu.:22.80   3rd Qu.:8.000   3rd Qu.:326.0   3rd Qu.:180.0  
##  Max.   :33.90   Max.   :8.000   Max.   :472.0   Max.   :335.0  
##       drat             wt             qsec             vs        
##  Min.   :2.760   Min.   :1.513   Min.   :14.50   Min.   :0.0000  
##  1st Qu.:3.080   1st Qu.:2.581   1st Qu.:16.89   1st Qu.:0.0000  
##  Median :3.695   Median :3.325   Median :17.71   Median :0.0000  
##  Mean   :3.597   Mean   :3.217   Mean   :17.85   Mean   :0.4375  
##  3rd Qu.:3.920   3rd Qu.:3.610   3rd Qu.:18.90   3rd Qu.:1.0000  
##  Max.   :4.930   Max.   :5.424   Max.   :22.90   Max.   :1.0000  
##        am              gear            carb      
##  Min.   :0.0000   Min.   :3.000   Min.   :1.000  
##  1st Qu.:0.0000   1st Qu.:3.000   1st Qu.:2.000  
##  Median :0.0000   Median :4.000   Median :2.000  
##  Mean   :0.4062   Mean   :3.688   Mean   :2.812  
##  3rd Qu.:1.0000   3rd Qu.:4.000   3rd Qu.:4.000  
##  Max.   :1.0000   Max.   :5.000   Max.   :8.000
</code></pre>


```
No language indicated, so no syntax highlighting in.
But let's throw in a <b>tag</b>.
```


## Tables

They are an easy way of adding tables to your email -- a task that would otherwise require copy-pasting from another application.

```no-highlight
Colons can be used to align columns.

| Tables        | Are           | Cool  |
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |

There must be at least 3 dashes separating each header cell.
The outer pipes (|) are optional, and you don't need to make the
raw Markdown line up prettily. You can also use inline Markdown.

Markdown | Less | Pretty
--- | --- | ---
*Still* | `renders` | **nicely**
1 | 2 | 3
```

Colons can be used to align columns.

| Tables        | Are           | Cool |
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |

There must be at least 3 dashes separating each header cell. The outer pipes (|) are optional, and you don't need to make the raw Markdown line up prettily. You can also use inline Markdown.

Markdown | Less | Pretty
--- | --- | ---
*Still* | `renders` | **nicely**
1 | 2 | 3

## Blockquotes

```no-highlight
> Blockquotes are very handy in email to emulate reply text.
> This line is part of the same quote.

Quote break.

> This is a very long line that will still be quoted properly when it wraps. Oh boy let's keep writing to make sure this is long enough to actually wrap for everyone. Oh, you can *put* **Markdown** into a blockquote.
```

> Blockquotes are very handy in email to emulate reply text.
> This line is part of the same quote.

Quote break.

> This is a very long line that will still be quoted properly when it wraps. Oh boy let's keep writing to make sure this is long enough to actually wrap for everyone. Oh, you can *put* **Markdown** into a blockquote.


## Inline HTML

You can also use raw HTML in your Markdown, and it'll mostly work pretty well.

```no-highlight
<dl>
  <dt>Definition list</dt>
  <dd>Is something people use sometimes.</dd>

  <dt>Markdown in HTML</dt>
  <dd>Does *not* work **very** well. Use HTML <em>tags</em>.</dd>
</dl>
```

<dl>
  <dt>Definition list</dt>
  <dd>Is something people use sometimes.</dd>

  <dt>Markdown in HTML</dt>
  <dd>Does *not* work **very** well. Use HTML <em>tags</em>.</dd>
</dl>


## Horizontal Rule

```
Three or more...

---

Hyphens

***

Asterisks

___

Underscores
```

Three or more...

---

Hyphens

***

Asterisks

___

Underscores


## Line Breaks

My basic recommendation for learning how line breaks work is to experiment and discover -- hit &lt;Enter&gt; once (i.e., insert one newline), then hit it twice (i.e., insert two newlines), see what happens. You'll soon learn to get what you want. "Markdown Toggle" is your friend.

Here are some things to try out:

```
Here's a line for us to start with.

This line is separated from the one above by two newlines, so it will be a *separate paragraph*.

This line is also a separate paragraph, but...
This line is only separated by a single newline, so it's a separate line in the *same paragraph*.
```

Here's a line for us to start with.

This line is separated from the one above by two newlines, so it will be a *separate paragraph*.

This line is also begins a separate paragraph, but...  
This line is only separated by a single newline, so it's a separate line in the *same paragraph*.



## Exploratory Charts

On Exploratory Desktop, You can select Exploratory Charts when you create Presentation Slides. Click Chart Icon on Toolbar.

![](images/slide-insert-chart.png)

This will open up Chart Selector Dialog like this.

![](images/slide-insert-chart-dialog.png)

After you select a Chart and Click OK, following Exploratory Code block is inserted into your Markdown content. Syntax is `/<dataframe_name>/<type>/<index>`

<pre><code>
```{exploratory}
/flight_delay/viz/3
```
</code></pre>

And when you click Run, this code block is converted to Exploratory Chart like below.

![](images/slide-insert-chart-preview.png)


## Exploratory Analytics Viz

On Exploratory Desktop, You can select Exploratory Analytics Viz when you writing Presentation Slides. Click Analytics Icon on Toolbar.

![](images/slide-insert-analytics.png)

This will open up Chart Selector Dialog like this.

![](images/slide-insert-analytics-dialog.png)

After you select a Chart and Click OK, following Exploratory Code block is inserted into your Markdown content. Syntax is `/<dataframe_name>/<type>/<index>`

<pre><code>
```{exploratory}
/airline_delay_2016_09/analytics/1/4
```
</code></pre>


<a name="rcodeblock"></a>

## R Script - Code block

Here is some example of R code block.

<pre><code>

![](/Users/kannishida/Dropbox/Documents/Analytics/blog/airplane-at-airport-cropped.jpeg)

# Flight Analysis Report 

I have analyzed the **September** flight delay data on  `r format(today(), "%A, %B, %d, %Y")`. The data size is `r format(nrow(airline_delay_2016_09), big.mark=",")` rows. 

* Which Carriers had more departure delays? 
* How the trend of the flight delay times? 
* Which US States are similar in terms of the delay times? 

## Which Carriers had more departure delays? 

```{exploratory}
/airline_delay_2016-08/viz/1
```

## Useful Information to Identify Carriers


```{exploratory}
/airline_delay_2016_09/analytics/2/1
```

## Distribution of the number of the flights

```{r echo=FALSE, cache = TRUE}
suppressPackageStartupMessages(library(ggplot2))
ggplot(airline_delay_2016_09, aes(FL_NUM, color = CARRIER_NAME)) +
  geom_density()

```
</code></pre>

And the result would look like this.

![](images/code-block-example.png "Code Block example")

## R Script - Inline

<pre><code>
I have analyzed the **September** flight delay data on  `r format(today(), "%A, %B, %d, %Y")`. The data size is `r format(nrow(airline_delay_2016_09), big.mark=",")` rows. 
</code></pre>

This inline code becomes like this.

```
I have analyzed the September flight delay data on Monday, September, 04, 2017. The data size is 1,000 rows.
```

## Export 

You can export the Presentation Slides in a zippped format. 


<a name="publishandshare"></a>

## Publish and Share

To publish and share your Presentation Slides, click Share button.

![](images/markdown-share.png "Share Presentation Slides")

And on the Share dialog, check 'Private' if you want to privately share the Presentation Slides and Click `Share` button.

![](images/markdown-share-scope.png "Export to HTML")
