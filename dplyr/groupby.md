# Group By

Converts the data set into a grouped data set where the following operations will be performed based on the groups. Grouping should be done before you want to aggregate values.

**Syntax**

group_by(```<column(s)>```)

**Example**  

Group the data by COUNTRY.
```
group_by(COUNTRY)  
```
 
Group the data by REGION and COUNTRY.
```
group_by(REGION, COUNTRY)  
```

Group by a dynamically generated value of 'FIRSTNAME + LASTNAME'
```
group_by(FIRSTNAME + LASTNAME)  
```
 