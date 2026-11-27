---
title: "Pivot"
---

Pivot columns into rows and columns. Values are count of pairs of rows and columns or aggregation of another column.

## How to Access This Feature

![](images/command-pivot-menu.png)

* Click "+" button and select "Pivot" 

### From Column Menu
![](images/command-pivot-column-menu.png)

* You can also select "Pivot" from column menu of the column you want to pivot.


## Pivot

![](images/pivot.png)

1. `Rows` - select columns for Pivot Row.
2. `Columns`  - select colums for Pivot Columns.
3. `Value` (Optional) - A column for values in output data frame.

### Parameters

* Remove NA - The default is TRUE. If NA should be removed from value.
* Fill NA with - The default is 0. This is what should be used for missing value in groups.

<p>
<strong>Example</strong>
</p>
<p><em>Original data:</em>  </p>
<table><thead><tr><th style={{textAlign: 'left'}}>clarity</th>
<th style={{textAlign: 'left'}}>certification</th>
<th style={{textAlign: 'left'}}>colour</th><th style={{textAlign: 'right'}}>price</th></tr>
</thead><tbody><tr><td style={{textAlign: 'left'}}>VVS2</td><td style={{textAlign: 'left'}}>HRD</td>  <td style={{textAlign: 'left'}}>F</td><td style={{textAlign: 'right'}}>10796</td></tr><tr><td style={{textAlign: 'left'}}>VS1</td><td style={{textAlign: 'left'}}>GIA</td>  <td style={{textAlign: 'left'}}>F</td><td style={{textAlign: 'right'}}>1551</td></tr><tr><td style={{textAlign: 'left'}}>VS1</td>  <td style={{textAlign: 'left'}}>GIA</td>  <td style={{textAlign: 'left'}}>F</td>  <td style={{textAlign: 'right'}}>4291</td></tr>  <tr>  <td style={{textAlign: 'left'}}>VVS2</td>  <td style={{textAlign: 'left'}}>GIA</td>  <td style={{textAlign: 'left'}}>F</td>  <td style={{textAlign: 'right'}}>5881</td>  </tr>  <tr>  <td style={{textAlign: 'left'}}>VS2</td>  <td style={{textAlign: 'left'}}>GIA</td>  <td style={{textAlign: 'left'}}>H</td>  <td style={{textAlign: 'right'}}>4585</td>  </tr>  <tr>  <td style={{textAlign: 'left'}}>VVS2</td>  <td style={{textAlign: 'left'}}>GIA</td>  <td style={{textAlign: 'left'}}>H</td>  <td style={{textAlign: 'right'}}>5193</td>  </tr>  </tbody></table>    

<p> if you set <strong>row</strong>: clarify, colour <strong>columns</strong>: certification <strong>value</strong>: price <strong>fill</strong>:0
<br />  <em>it returns data frame with rows of combinations of clarity and colour and with columns of certification. Values are sum of price and missing values are filled by 0.</em></p>

<table><thead>  <tr>  <th style={{textAlign: 'left'}}>clarity_colour</th>  <th style={{textAlign: 'right'}}>GIA</th>  <th style={{textAlign: 'right'}}>HRD</th>  </tr>  </thead><tbody>  <tr>  <td style={{textAlign: 'left'}}>VS1_F</td>  <td style={{textAlign: 'right'}}>5842</td>  <td style={{textAlign: 'right'}}>0</td>  </tr>  <tr>  <td style={{textAlign: 'left'}}>VS2_H</td>  <td style={{textAlign: 'right'}}>4585</td>  <td style={{textAlign: 'right'}}>0</td>  </tr>  <tr>  <td style={{textAlign: 'left'}}>VVS2_F</td>  <td style={{textAlign: 'right'}}>5881</td>  <td style={{textAlign: 'right'}}>10796</td>  </tr>  <tr>  <td style={{textAlign: 'left'}}>VVS2_H</td>  <td style={{textAlign: 'right'}}>5193</td>  <td style={{textAlign: 'right'}}>0</td>  </tr>  </tbody></table>  
