
## do_svd.kv

**Summary**   
Calculates coordinations by reducing dimensionality using SVD (Singular Value Decomposition).

**Syntax**   
do_svd.kv(```<subject_column>```, ```<key_column>```, ```<value_column>```, type=```"group"|"dimension"|"variance"```, fill=```<numeric>```, fun.aggregate=```<aggregate_function>```, n_component=```<integer>```, centering=```<logical>```, output=```"wide"|"long"```)

**Arguments**

* type (Optional) - The default is "group".
  * "group" is to see how groups are projected to a new coordinations. This corresponds to u matrix of svd.
  * "dimension" is to see what direction the new coordinations face. This corresponds to v matrix of svd.
  * "variance" is to see how data is scattered in each of the new coordinations. This corresponds to d vector of svd.
* fill (Optional) - The default is 0. This is what should be used for missing value in groups.
* fun.aggregate (Optional) - The default is mean. This is how duplicated data should be aggregated.
* n_component (Optional) - The default is 3. Set number of dimensions to reduce to.
* centering (Optional) - The default is TRUE. Set if data should be centralized to the origin.
* output (Optional) - The defualt is "wide". If wide, the components will be in columns. If long, component will be in row.

**Return Value**   
Data frame

**Example**   

_Original data:_

|author_name |keywords      | tfidf_value|
|:-----------|:-------------|-----------:|
|Cathy       |party         |         3.2|
|Cathy       |exciting      |         1.3|
|Cathy       |friends       |         0.8|
|Mary        |study         |         2.4|
|Mary        |exam          |         2.1|
|Mary        |hard          |         1.5|
|Lisa        |sports        |         1.9|
|Lisa        |exciting      |         1.8|
|Lisa        |hard          |         1.6|

**do_svd.kv**(document_name, keywords, tfidf_value, **n_component=2**)  
_Reducing the number of the dimensions (keywords) to 2 and returning the result in a 'long' data form._  

|author_name | new.dimension|  svd.value|
|:-----------|-------------:|----------:|
|Cathy       |             1| -0.7131255|
|Cathy       |             2|  0.3976414|
|Lisa        |             1|  0.0121952|
|Lisa        |             2| -0.8164055|
|Mary        |             1|  0.7009303|
|Mary        |             2|  0.4187641|

**do_svd.kv**(name, key, value, n_component=2, **output="wide"**)  
_Reducing the number of the dimensions (keywords) to 2 and returning the result in a 'wide' data form._  

|author_name |      axis1|      axis2|
|:-----------|----------:|----------:|
|Cathy       | -0.7131255|  0.3976414|
|Lisa        |  0.0121952| -0.8164055|
|Mary        |  0.7009303|  0.4187641|

**do_svd.kv**(name, key, value, n_component=2, **type="dimension"**)
_Reducing the number of the dimensions (keywords) to 2 and returning the result by 'dimensions' instead of by 'group'._  

|top_key_words | new.dimension|  svd.value|
|:-------------|-------------:|----------:|
|exam          |             1|  0.4163953|
|exam          |             2|  0.3259924|
|exciting      |             1| -0.2560436|
|exciting      |             2| -0.3531243|
|friends       |             1| -0.1613866|
|friends       |             2|  0.1179235|
|hard          |             1|  0.3029449|
|hard          |             2| -0.2513704|
|party         |             1| -0.6455466|
|party         |             2|  0.4716940|
|sports        |             1|  0.0065547|
|sports        |             2| -0.5750138|
|study         |             1|  0.4758803|
|study         |             2|  0.3725628|

**do_svd.kv**(name, key, value, n_component=2, **type="variance"**)  
_Reducing the number of the dimensions (keywords) to 2 and returning the 'variance' values for each dimension_  

| new.dimension| svd.value|
|-------------:|---------:|
|             1|  3.534991|
|             2|  2.697623|



## build_lm

**Summary**   
Builds a linear regression model (lm) and returns the summary of the model or the augmented data depending on the parameter value. It would use all the existing columns as predictors and use a specified column as a target column.

**Syntax**   
build_lm(```<formula>```, keep.source=```<logical>```, weights=```<numeric_vector>```, subset=```<numeric_vector>```,
    na.action=```"na.fail"|"na.exclude"|"na.omit"|NULL```, method = ```"qr"|"model.frame"```, model = ```<logical>```,
    x = ```<logical>```, y = ```<logical>```, qr = ```<logical>```, singular.ok = ```<logical>```, contrasts = ```<numeric_vector>```, augment=```<logical>```)

**Arguments**   

* keep.source - The default is FALSE. It will make .source.data column to preserve source data. You can see the original information with fitting result using `augment(.model, .source.data)` as the next step.
* weights - Weights vector.
* subset - A vector to subset data.
* na.action - The default is "na.fail". This changes the behaviour of NA data.
* model - The default is TRUE. If model object should be returned.
* x - The default is FALSE. If x should be returned.
* y (Optional) - The default is FALSE. If y should be returned.
* qr (Optional) - The default is TRUE. If qr should be returned.
* method (Optional) - The default is "qr". The method to be used in fitting the model.   
* contrasts (Optional) - Replacement values for contrasts.
* augment (Optional) - The default is FALSE. Whether the model data should be augmented with the source data immediately or not.

**Return Value**   
Data frame

**Example**   
build_lm(ARR_DELAY ~ DEP_DELAY + DISTANCE)    
_Returns a column of lm model which predicts ARR_DELAY from DEP_DELAY and DISTANCE. It also returns a column of original data. You can use augment(.model, .source.data), tidy(.model) and glance(.model) to see information in those models._



## build_glm

**Summary**   
Builds a generalized linear models (glm) and returns the summary of the model or the augmented data depending on the parameter value. It would use all the existing columns as predictors and use a specified column as a target column.   

**Syntax**   
build_glm(```<formula>```, keep.source=```<logical>```, family = ```binomial|gaussian|Gamma|inverse.gaussian|poisson|quasi|quasibinomial|quasipoisson```, weights=```<numeric_vector>```, subset=```<numeric_vector>```,
    na.action=```"na.fail"|"na.exclude"|"na.omit"|NULL```, start = ```<numeric_vector>```, etastart=```<numeric_vector>```, mustart=```<numeric_vector>```, offset=```<numeric_vector>```,
    control = list(...), model = TRUE, method = ```"glm.fit"|"model.frame"|function```,
    x = ```<logical>```, y = ```<logical>```, contrasts = ```<numeric_vector>```, augment=```<logical>```)

**Arguments**   

* keep.source - The default is FALSE. It will make .source.data column to preserve source data. You can see the original information with fitting result using `augment(.model, .source.data)` as the next step.
* family - The default is gaussian. You can use other families like poisson, Gamma.
* weights - Weights vector.
* subset - A vector to subset data.
* na.action - The default is "na.fail". This changes the behaviour of NA data.
* start - Values of parameters to start.
* etastart - Values of predictors to start.
* mustart - Means to start.
* offset - Set to be included in fitting.
* control - Parameters to control fitting.
* model - The default is TRUE. If model should be returned or not.
* method - The default is "glm.fit". Fitting method.
* x - The default is FALSE. If x should be returned.
* y - The default is TRUE. If y should be returned.
* contrasts - Replacement values for contrasts.
* augment (Optional) - The default is FALSE. Whether the model data should be augmented with the source data immediately or not.

**Example**   
build_glm(ARR_DELAY ~ DEP_DELAY + DISTANCE)   
_Returns a column of glm model which predicts ARR_DELAY from DEP_DELAY and DISTANCE. It also returns a column of original data. You can use augment(.model, .source.data), tidy(.model) and glance(.model) to see information in those models._



## build_kmeans.cols

**Summary**   
Builds a clustering model (k-means) from variable columns and returns the summary of the model or the augmented data depending on the parameter value.

**Syntax**   
build_kmeans.cols(```<column(s)>```, centers = ```<integer>```, seed = ```<integer>```, iter.max = ```<integer>```, nstart = ```<integer>```, algorithm = ``` "Hartigan-Wong"|"Lloyd"|"Forgy"|"MacQueen"```, trace = ```<logical>```, augment=```<logical>```, keep.source = ```<logical>```)

**Arguments**

* centers (Optional) - Set an integer number to decide how many clusters (groups) to build.
* seed (Optional) - The default is 0. This is random seed. You can change the result if you change this number.
* iter.max (Optional) - The default is 10. The maximum number of cluster update iteration.
* nstart (Optional) - The default is 1. This works only when the centers argument is a number. How many random initial configuration should be tried. The best result is chosen as output.
* algorithm (Optional) - The default is Hartigan-Wong. You can choose it from Lloyd, Forgy and MacQueen algorithm.
* trace (Optional) - This works only when algorighm is Hartigan-Wong. If the output should contain information in the process of calculation.
* augment (Optional) - The default is FALSE. Whether the cluster label should be augmented immediately or not.
* keep.source - The default is FALSE. It will make source.data column to preserve source data. You can see the original information using `augment_kmeans(model, source.data)`

**Return Value**
Data frame

**Example**   

_Original data:_  

|location |     1900|     1901|     1902|
|:--------|--------:|--------:|--------:|
|Als      | 35.02899| 24.02899| 45.02899|
|Bea      | 18.00000| 10.00000| 27.00000|
|Bor      | 18.14896| 10.64896| 20.64896|

**build_kmeans.cols**(-location, centers=2, **augment=TRUE**)  
_Builds a K-means clustering model selecting all the columns other than 'location' and setting 2 as the number of the clusters, and scoring the original data right away. If you want to evaluate the model set 'augment' to FALSE._  

|location |    X1900|    X1901|    X1902|.cluster |
|:--------|--------:|--------:|--------:|:--------|
|Als      | 35.02899| 24.02899| 45.02899|2        |
|Bea      | 18.00000| 10.00000| 27.00000|1        |
|Bor      | 18.14896| 10.64896| 20.64896|1        |



## build_kmeans.kv

**Summary**   
Builds a clustering model (k-means) from key-value columns and store the model into a generated data frame or augment the original data with the clustered ID.

**Syntax**   
build_kmeans.kv(```<subject_column>```, ```<key_column>```, ```<value_column>```, centers = ```<integer>```, seed = ```<integer>```, iter.max = ```<integer>```, nstart = ```<integer>```, algorithm = ``` "Hartigan-Wong"|"Lloyd"|"Forgy"|"MacQueen"```, trace = ```<logical>```, augment=```<logical>```, keep.source = ```<logical>```)

**Arguments**

* centers (Optional) - Set an integer number to decide how many clusters (groups) to build.
* seed (Optional) - The default is 0. This is random seed. You can change the result if you change this number.
* iter.max (Optional) - The default is 10. The maximum number of cluster update iteration.
* nstart (Optional) - The default is 1. This works only when the centers argument is a number. How many random initial configuration should be tried. The best result is chosen as output.
* algorithm (Optional) - The default is Hartigan-Wong. You can choose it from Lloyd, Forgy and MacQueen algorithm.
* trace (Optional) - This works only when algorighm is Hartigan-Wong. If the output should contain information in the process of calculation.
* augment (Optional) - The default is FALSE. Whether the cluster label should be augmented immediately or not.
* keep.source - The default is FALSE. It will make source.data column to preserve source data. You can see the original information using `augment_kmeans(model, source.data)`

**Return Value**
Data frame

**Example**   

_Original data:_  

|location | year| harvest_date|
|:--------|----:|------------:|
|Als      | 1900|     35.02899|
|Als      | 1901|     24.02899|
|Als      | 1902|     45.02899|
|Bea      | 1900|     18.00000|
|Bea      | 1901|     10.00000|
|Bea      | 1902|     27.00000|
|Bor      | 1900|     18.14896|
|Bor      | 1901|     10.64896|
|Bor      | 1902|     20.64896|

**build_kmeans.kv**(location, year, harvest_date, centers=2, augment=TRUE)  

_Builds a K-means clustering model selecting 'location' as the subject to cluster, 'year' as the dimension, and 'harvest_date' as the value, and setting 2 as the number of the clusters, and scoring the original data right away. If you want to evaluate the model set 'augment' to FALSE._  

|location | year| harvest_date| .cluster|
|:--------|----:|------------:|--------:|
|Als      | 1900|     35.02899|        2|
|Als      | 1901|     24.02899|        2|
|Als      | 1902|     45.02899|        2|
|Bea      | 1900|     18.00000|        1|
|Bea      | 1901|     10.00000|        1|
|Bea      | 1902|     27.00000|        1|
|Bor      | 1900|     18.14896|        1|
|Bor      | 1901|     10.64896|        1|
|Bor      | 1902|     20.64896|        1|


## str_clean

**Summary**   
Cleans up text by removing escape characters (e.g. \n, \t), extra white spaces, extra period, and leading and trailing spaces.

**Syntax**  
str_clean(```<column_text>```)

**Arguments**


**Return Value**   
Character

**Example**   
str_clean(" Exploratory ..io ")   
_returns "Exploratory.io"._



## str_count_all

**Summary**   
Count patterns from texts

**Syntax**    
str_count_all(```<column_text>```, patterns=```<character_vector>```, remove.zero=```<logical>```)

**Arguments**

* patterns - Pattern to count. They can be regex.
* remove.zero - The default is TRUE. Set whether you want to keep the text patterns with zero count.

**Return Value**   
List of data frame

**Example**   
str_count_all("I ate banana, apple, and peach yesterday, and banana, peach today.", patterns=c("apple", "banana"), remove.zero=TRUE)   
_Returns a list column of data frames with 'apple' and 'banana' columns._



## get_stopwords

**Summary**  
Returns English stop words like "a", "the", "and", etc.

**Syntax**  
get_stopwords(lexicon =```"snowball"|"onix"|"SMART"```)

**Arguments**

* lexicon (Optional) - The default is "snowball". Set a dictionary type for English stop words from 'snowball', 'onix', 'SMART'.

**Return Value**  
Character

**Example**  
get_stopwords()   
_Return a list of the stop words like "a", "the", "and"._


## get_sentiment

**Summary**  
Returns sentiment types of positive or negative based on a given word(s).

**Syntax**  
get_sentiment(```<column_text>```, lexicon=```"nrc"|"bing"|"AFINN"```)

**Arguments**

* lexicon (Optional) - The default is "bing". Set a type of dictionary among 'nrc', 'bing', and 'AFINN'.

**Return Value**  
Character (If lexicon is "AFINN", Numeric)

**Example**  
get_sentiment("good")   
_Return "positive"._

get_sentiment("bad", lexicon="AFINN")   
_Return -3._



## stem_word

**Summary**  
Stem word so that almost the same words which have a little different spells can be recognized as the same words.

**Syntax**  
stem_word(```<column_text>```, language=```"porter"|"english"|"french"```)

**Arguments**

* language (Optional) - The default is "porter". It uses Porter's stemming algorithm, which is very popular in natural language processing. This can also be a kind of languages which use alphabets like "english" or "french".

**Return Value**  
Character

**Example**  
stem_word(c("stand","stands", "cheerful", "cheering"))   
_Return c("stand","stand","cheer","cheer")._



## is_stopword

**Summary**   
Returns TRUE if a given word is included in a list of the stop words defined by one of the dictionary.

**Syntax**  
is_stopword(```<column_text>```, lexicon=```"snowball"|"onix"|"SMART"```)

**Arguments**

* lexicon (Optional) - The default is "snowball". Set a dictionary type for English stop words from 'snowball', 'onix', 'SMART'.

**Return Value**   
Logical

**Example**   
is_stopword(c("a", "and", "stopword", "the"))
_Return c(TRUE, TRUE, FALSE, TRUE)._



## is_alphabet

**Summary**   
Returns TRUE if a given text contains only alphabets.

**Syntax**  
is_alphabet(```<column_text>```)

**Arguments**

**Return Value**   
Data frame

**Example**   
is_alphabet(c("1", "132", "32MB", "hello"))
_Return c(FALSE, FALSE, FALSE, TRUE)._



## parse_pdf

**Summary**  
Parses PDF document of a given URL or file path and return the content text.

**Syntax**  
parse_pdf(```<column_text>```)

**Arguments**

**Return Value**  
Character  

**Example**  

mutate(text = **parse_pdf**(path)) %>% select(name, text)

_Before:_

| name | path  |
|------|-------|
|PDF_with_URL  |http://www.eddiebauer.com/static/pdf/California_Transparency_Supply_Chain.pdf |
|PDF_with_File |~/Downloads/mitsuwa-supply-chain-act-2010.pdf |

_After:_

| name | text  |
|------|-------|
|PDF_with_URL  |    California Transparency in Supply Chains Act of 2010 Disclosure\nThe following statement is made in compliance... |
|PDF_with_File |California Transparency in Supply Chains Act of 2010\nMitsuwa Marketplace is committed to conducting its business... |




## do_tokenize

**Summary**  
Returns one token (e.g. word) per row after tokenizing a given text.

**Syntax**  
do_tokenize(```<column_text>```, token = ```"words"|"characters"| "sentences"|"lines"|"paragraphs"|"regex"```, to_lower = ```<logical>```, drop = ```<logical>```, output=```<new_column_name>```, with_id = ```<logical>```)

**Arguments**

* input - Set a column of which you want to split the text or tokenize.
* token (Optional) - The default is "words". Select the unit of token from "characters", "words", "sentences", "lines", "paragraphs", and "regex".  
* to_lower (Optional) - The default is TRUE. Whether output should be lower cased.
* drop (Optional) - The default is TRUE. Whether input column should be removed.
* output (Optional) - The default is "token". Set a column name for the new column to store the tokenized values.
* with_id (Optional) - The default is TRUE. Whether output should contain original document id and sentence id in each document.

**Return Value**  
Data frame

**Example**  

_Original data:_

|index  |text                                         |
|:------|:--------------------------------------------|
|First  |It was a great party.                        |
|Second |She has just left. She will be off tomorrow. |

**do_tokenize**(text)   

|index  | document_id| sentence_id|token    |
|:------|-----------:|-----------:|:--------|
|First  |           1|           1|it       |
|First  |           1|           1|was      |
|First  |           1|           1|a        |
|First  |           1|           1|great    |
|First  |           1|           1|party    |
|Second |           2|           1|she      |
|Second |           2|           1|has      |
|Second |           2|           1|just     |
|Second |           2|           1|left     |
|Second |           2|           2|she      |
|Second |           2|           2|will     |
|Second |           2|           2|be       |
|Second |           2|           2|off      |
|Second |           2|           2|tomorrow |

**do_tokenize**(text, **token="sentences"**)   

|index  |token                     |
|:------|:-------------------------|
|First  |it was a great party.     |
|Second |she has just left.        |
|Second |she will be off tomorrow. |



## do_tfidf

**Summary**  
Calculates TF-IDF for each term against a given group. TF-IDF is a weighting mechanism that calculates the importance of each word to each document by increasing the importance based on the term frequency while decreasing the importance based on the document frequency.

**Syntax**  
do_tfidf(```<document_column>```, ```<token_column>```, tf_weight=```"ratio"|"raw_frequency"|"binary"|"log_normalization"|"k_normalization"```, tf_k=```<numeric>```, idf_log_scale = ```<function>```)

**Arguments**

* document_column - Set a grouping column for a set of the tokens. In most of the cases this would be a document id column.
* tf_weight (Optional) - The default is "ratio".
  * "raw_frequency" is count of a term in a document.
  * "ratio" is "raw_frequency" devided by the total number of tokens in the document.
  * "binary" is if it exists or not. If it exists, it is 1 and if not, it is 0.
  * "log_normalization" is ```1+log(count of a term in a document)```
  * "k_normalization" is ```k+(1-k)*(count of a term in a document)/max(counts of all terms in a document)```. If k is large, tf values increase relatively slowly as the count of the term in a document increases.
* tf_k (Optional) - The default is 0.5. This works only if you choose "k_normalization" in tf_weight. How rapidly tf value should increase.
* idf_log_scale (Optional) - The default is log. This is a function to suppress the increase of idf value. Idf is calculated by ```log_scale_function((the total number of documents)/(the number of documents which have the token))```. It's how rare the token is in the set of documents. It might be worth trying log2 or log10. log2 increases the value more easily and log10 increases it more slowly.

**Return Value**  
Data frame

**Example**  

_Original data:_

| document_id|token  |
|-----------:|:------|
|           1|this   |
|           1|is     |
|           1|what   |
|           1|it     |
|           1|is     |
|           2|which  |
|           2|is     |
|           2|better |

**do_tfidf**(document_id, token)

| document_id|token  | count_per_doc| count_of_docs|     tfidf|
|-----------:|:------|-------------:|-------------:|---------:|
|           1|is     |             2|             2| 0.0000000|
|           1|it     |             1|             1| 0.1386294|
|           1|this   |             1|             1| 0.1386294|
|           1|what   |             1|             1| 0.1386294|
|           2|better |             1|             1| 0.2310491|
|           2|is     |             1|             2| 0.0000000|
|           2|which  |             1|             1| 0.2310491|



## do_ngram

**Summary**  
Construct n-grams or skip-grams for each group. Make sure the data frame is grouped by an unit of sentence so that n-gram can connect words only within a sentence, not across two sentences.

**Syntax**  
do_ngram(```<token_column>```, n=```<numeric_vector>```, skip=```<numeric_vector>```)

**Arguments**

* token column - Set a column to construct n-grams based on.
* n (Optional) - The default is 1:2. How many tokens should be connected.
* skip (Optional) - The default is 0. How many tokens can be skipped to connect tokens. If n=3 and skip=0:1 (== c(0, 1)), "this" "is" "a" "good" "pen" become "this_is_a" "this_is_good" "this_a_good"  "this_a_pen" "is_a_good" "is_a_pen" "is_good_pen" "a_good_pen".

**Return Value**  
Data frame

**Example**  

_Original data:_

**Grouped by document_id and sentence_id**

|  document_id|  sentence_id| token   |
|------------:|------------:|:--------|
|            1|            1|it       |
|            1|            1|is       |
|            1|            1|good     |
|            2|            1|she      |
|            2|            1|left     |
|            2|            2|she      |
|            2|            2|will     |
|            2|            2|come     |
|            2|            2|tomorrow |

**do_ngram**(token)  

|  document_id|  sentence_id| token        |
|------------:|------------:|:-------------|
|            1|            1|it            |
|            1|            1|is            |
|            1|            1|good          |
|            1|            1|it_is         |
|            1|            1|is_good       |
|            2|            1|she           |
|            2|            1|left          |
|            2|            1|she_left      |
|            2|            2|she           |
|            2|            2|will          |
|            2|            2|come          |
|            2|            2|tomorrow      |
|            2|            2|she_will      |
|            2|            2|will_come     |
|            2|            2|come_tomorrow |

**do_ngram**(token, n=2, skip=c(0,1))  

|  document_id|  sentence_id| token        |
|------------:|------------:|:-------------|
|            1|            1|it_is         |
|            1|            1|it_good       |
|            1|            1|is_good       |
|            2|            1|she_left      |
|            2|            2|she_will      |
|            2|            2|she_come      |
|            2|            2|will_come     |
|            2|            2|will_tomorrow |
|            2|            2|come_tomorrow |


## do_cosine_sim.kv

**Summary**  
Calculates the similarity between each pair of the documents using the cosine similarity algorithm. Cosine similarity measures the cosine of the angle between two vectors in the multi-dimensional space.

**Syntax**  
do_cosine_sim.kv(```<subject_column>```, ```<key_column>```, ```<value_column>```, distinct=```<logical>```, diag=```<logical>```)

**Arguments**

* subject column - Set a column to find the similarity for. In text mining this would be often a document name or id column.
* key column - Set a column to use as a dimension. In text mining this would be often a term or word column.
* value column - Set a column to use as a dimension value. In text mining this would be often a TF-IDF column.
* distinct (Optional) - The default is FALSE. Whether the pair of output should be unique. If this is TRUE, a pair appears only once but if it's FALSE, a pair appears twice in swapped order. If you want to filter the pairs by names, it's better to be FALSE.
* diag (Optional) - The default is FALSE. Whether the output should contain the similarity of documents with itself.

**Return Value**   
Data frame

**Example**   

_Original data:_

|  document_id| token |     value|
|------------:|:------|---------:|
|         Lisa|it     | 0.8966972|
|         Lisa|was    | 0.2655087|
|         Lisa|good   | 0.3721239|
|        Emily|she    | 0.5728534|
|        Emily|is     | 0.9082078|
|        Emily|nice   | 0.2016819|
|         John|she    | 0.8983897|
|         John|is     | 0.9446753|
|         John|good   | 0.6607978|

**do_cosine_sim.kv**(document_id, token, value)

|pair.name.1 |pair.name.2 | sim.value|
|:-----------|:-----------|---------:|
|Lisa        |Emily       | 0.0000000|
|Lisa        |John        | 0.1671574|
|Emily       |Lisa        | 0.0000000|
|Emily       |John        | 0.8595770|
|John        |Lisa        | 0.1671574|
|John        |Emily       | 0.8595770|
