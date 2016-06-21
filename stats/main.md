

## do_cor.cols  

**Summary**   
Calculates correlations for all the pairs of the variables (columns).

**Syntax**   
do_cor.cols(```<column(s)>```, use = ```<cor_na_operation>```,  method = ```<cor_method>```, distinct=```<logical>```, diag=```<logical>```)   


**Arguments**   

* use (Optional) - The default is "pairwise.complete.obs". Set an operation type for dealing with missing values.
* method (Optional) - The default is "pearson". Set a method to compute correlation coefficient among "pearson", "kendall", or "spearman".
* distinct (Optional) - The default is FALSE. Whether the pair of output should be unique. If this is TRUE, a pair appears only once but if it's FALSE, a pair appears twice in swapped order. If you want to filter the pairs by names, it's better to be FALSE.
* diag (Optional) - The default is FALSE. Whether the output should contain the similarity of documents with itself.

**Return Value**   
Data frame

**Example**   

_Original data:_  

| year|      Als| Bea|      Bor|
|----:|--------:|---:|--------:|
| 1900| 35.02899|  18| 18.14896|
| 1901| 24.02899|  10| 10.64896|
| 1902| 45.02899|  27| 20.64896|

**do_cor.cols**(-year)   

|pair.name.1 |pair.name.2 | cor.value|
|:-----------|:-----------|---------:|
|Als         |Bea         | 0.9981135|
|Als         |Bor         | 0.9680283|
|Bea         |Als         | 0.9981135|
|Bea         |Bor         | 0.9508014|
|Bor         |Als         | 0.9680283|
|Bor         |Bea         | 0.9508014|

**Tags**   
Statistics, Similarity   

**Category**
data frame operation


## do_cor.kv

**Summary**   
Calculates correlations for all the pairs of subject columns.

**Syntax**   
do_cor.kv(```<subject_column>```, ```<key_column>```, ```<value_column>```, use = ```<cor_na_operation>```,  method = ```<cor_method>```, distinct=```<logical>```, diag=```<logical>```)   

**Arguments**   

* use (Optional) - The default is "pairwise.complete.obs". Set an operation type for dealing with missing values.
* method (Optional) - The default is "pearson". Set a method to compute correlation coefficient among "pearson", "kendall", or "spearman".
* distinct (Optional) - The default is FALSE. Whether the pair of output should be unique. If this is TRUE, a pair appears only once but if it's FALSE, a pair appears twice in swapped order. If you want to filter the pairs by names, it's better to be FALSE.
* diag (Optional) - The default is FALSE. Whether the output should contain the similarity of documents with itself.

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

**do_cor.kv**(location, year, harvest_date)   

|pair.name.1 |pair.name.2 | cor.value|
|:-----------|:-----------|---------:|
|Als         |Bea         | 0.9981135|
|Als         |Bor         | 0.9680283|
|Bea         |Als         | 0.9981135|
|Bea         |Bor         | 0.9508014|
|Bor         |Als         | 0.9680283|
|Bor         |Bea         | 0.9508014|

**Tags**   
Statistics, Similarity   

**Category**
data frame operation

## do_dist.kv

**Summary**   
Calculate the distances between each of the pairs.

**Syntax**  
do_dist.kv(```<subject_column>```, ```<key_column>```, ```<value_column>```, distinct=```<logical>```, diag=```<logical>```, method=```"euclidean"|"maximum"|"manhattan"|"canberra"|"binary"|"minkowski"```, fill=```<numeric>```, fun.aggregate=```<aggregate_function>```, p=```<numeric>``` )

**Arguments**

* distinct (Optional) - The default is FALSE. Whether the pair of output should be unique. If this is TRUE, a pair appears only once but if it's FALSE, a pair appears twice in swapped order. If you want to filter the pairs by names, it's better to be FALSE.
* diag (Optional) - The default is FALSE. Whether the output should contain the similarity of documents with itself.
* method (Optional) - The default is "euclidean".
  * euclidean - The most common measurement of distance. sqrt(sum((x - y)^2))
  * maximum - Maximum difference between elements of two vectors.
  * manhattan - Sum of difference in each elements of two vectors.
  * canberra - Manhattan distance weighted by the elements. sum(|x_i - y_i| / |x_i + y_i|)
  * binary - non-zero elements are regarded as 1 and zero elements are regarded as 0. The distance is the number of elements only one is 1 divided by numbers of them at least one is 1.
  * minkowski - This is generalized case of euclidean and manhattan. If p=2, it becomes euclidean and if p=1, it becomes manhattan. sum((x - y)^p)^(1/p)
* fill (Optional) - The default is 0. This is what should be used for missing value in groups.
* fun.aggregate (Optional) - The default is mean. This is how duplicated data should be aggregated.

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

**do_dist.kv**(location, year, harvest_date)  

|pair.name.1 |pair.name.2 | dist.value|
|:-----------|:-----------|----------:|
|Als         |Bea         |  28.492868|
|Als         |Bor         |  32.532238|
|Bea         |Als         |  28.492868|
|Bea         |Bor         |   6.385847|
|Bor         |Als         |  32.532238|
|Bor         |Bea         |   6.385847|

**Tags**   

**Category**   
data frame operation

## do_dist.cols

**Summary**   
Calculate distances of each of the pairs.

**Syntax**  
do_dist.cols(```<column(s)>```, distinct=```<logical>```, diag=```<logical>```, method=```"euclidean"|"maximum"|"manhattan"|"canberra"|"binary"|"minkowski"```, p=```<numeric>``` )

**Arguments**

* distinct (Optional) - The default is FALSE. Whether the pair of output should be unique. If this is TRUE, a pair appears only once but if it's FALSE, a pair appears twice in swapped order. If you want to filter the pairs by names, it's better to be FALSE.
* diag (Optional) - The default is FALSE. Whether the output should contain the similarity of documents with itself.
* label (Optional) - A column to be considered as label of rows. If this is not indicated, row number becomes the label.
* method (Optional) - The default is "euclidean".
  * euclidean - The most common measurement of distance. sqrt(sum((x - y)^2))
  * maximum - Maximum difference between elements of two vectors.
  * manhattan - Sum of difference in each elements of two vectors.
  * canberra - Manhattan distance weighted by the elements. sum(|x_i - y_i| / |x_i + y_i|)
  * binary - non-zero elements are regarded as 1 and zero elements are regarded as 0. The distance is the number of elements only one is 1 divided by numbers of them at least one is 1.
  * minkowski - This is generalized case of euclidean and manhattan. If p=2, it becomes euclidean and if p=1, it becomes manhattan. sum((x - y)^p)^(1/p)
* p (Optional) - This works if method is minkowski. The default is 2. If p=2, it becomes euclidean and if p=1, it becomes manhattan. sum((x - y)^p)^(1/p)

**Return Value**   
Data frame

**Example**   

_Original data:_

|location |     1900|     1901|     1902|
|:--------|--------:|--------:|--------:|
|Als      | 35.02899| 24.02899| 45.02899|
|Bea      | 18.00000| 10.00000| 27.00000|
|Bor      | 18.14896| 10.64896| 20.64896|

**do_dist.cols**(-location, label=location)

|pair.name.1 |pair.name.2 | dist.value|
|:-----------|:-----------|----------:|
|Als         |Bea         |  28.492868|
|Als         |Bor         |  32.532238|
|Bea         |Als         |  28.492868|
|Bea         |Bor         |   6.385847|
|Bor         |Als         |  32.532238|
|Bor         |Bea         |   6.385847|

**Tags**   

**Category**   
data frame operation

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


**Tags**   

**Category**   
Data frame operation
