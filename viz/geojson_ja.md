# Map - Extension

## How to Use

### Open GeoJSON Map Extension Dialog

In Viz view, you can click ‘Setup’ button after selecting ‘Map — GeoJSON’ chart type.

![](images/geojson4.png)

### Find GeoJSON Map in Extensions Dialog inside Exploratory

Once you find the one you like, you can click ‘Install’ button, and now you are ready to start using it under Viz tab.

![](images/geojson.png)

Once you find the one you like, you can click ‘Install’ button, and now you are ready to start using it under Viz tab.

### Choosing a Key Property from GeoJSON

Each GeoJSON file provides a list of the properties that you can use to map with your data the way it works the best.

![](images/geojson2.png)

### Mapping between GeoJSON’s key property and your data

The example below, I’m using ISO standard country codes found in the data and map them with ‘ISO_A2’ property of World Map GeoJSON.

![](images/geojson3.png)

## How to Create My GeoJSON?

Here's how you can create your own GeoJSON files from existing ESRI Shapefile or other formats using R.

* [Creating GeoJSON out of Shapefile in R](https://blog.exploratory.io/creating-geojson-out-of-shapefile-in-r-40bc0005857d)






## Column Assignments

* Area Type - Select the area type you want to use.   
* Key Property - Select the key property that you wan to use in the selected area type.  
* Key Column - Assign a column that has the values to bind the key property values. 
* Color By - Assign a column for color. If you assign a categorical column, it will be also used as a groupby column. Take a look at [Color](color.md) section for more details.
* Label - Assign a column you want to show in the balloon help that you see when you hover circles on the map. 



## Highlight 

You can change the color of the specific reigons that you pick to stand out from others. It is available only when you assgin a categorical column to color. See [Highlight](highlight.md) for the detail. 


## Category 

You can categorize numeric values inside the chart. See [Category(Binning)](category.md) for the detail.

## Limit Values

You can use Limit Values to filter the categories by the aggregated values. See [Limit Values](limit.md) for the detail.


## Custom Function

You can use the Custom Function feature to define your own aggregation function. See [Custom Function](custom-function.md) for the detail.

## Show Detail

You can show the detailed data underlying the chart by clicking the chart figure. See [Show Detail](show-detail.md) for the detail.


## Save as an Image

You can save the chart as an image file. See [Save as PNG/SVG](save.md) for more details.
