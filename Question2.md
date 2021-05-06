### Question 2
2. Download the file Set3.csv and write the correct code for each of the following : [15]
I. Read the contents of the file
II. Count of the number of records
III. View the data in a tabular format
IV. Filter the offences on the basis of Locality (QA only) and Type_of_offence (PHYSICAL OFFENSE only).
V. Group the offences by Zone.
VI. Get a count of the number of records for each group
VII. Using ggplot(), plot a barchart displaying the number of offences in each Zone. (use all the possible parameters)
VIII. Create a new column called Year_of_event containing the only the year of the event
IX. Group the data by year and summarize
X. Plot a barchart with column Year_of_event that displays the number of offences by year
XI. Create another bar chart that displays the number of offences by month instead of year
XII. Group and summarize the data by month.
XIII. Rename the columns to make them more user friendly and view the results
XIV. What’s the need of filtering the data? Show examples using appropriate commands
XV. What other charts can you plot for XI ? Which one will leverage more information and why?( elaborate in comments)


### Library Imports
```r
library(dplyr)
```

#### I. Read the contents of the file
```r
df <- read.csv('Set3.csv')
```

#### II. Count of the number of records
```r
count(df)
```
![](2.2.png)

#### III. View the data in a tabular format
```r
View(df)
```
![](./2.3.png)

#### IV. Filter the offences on the basis of Locality (QA only) and Type_of_offence (PHYSICAL OFFENSE only).
```r
filteredDf <- df %>% filter(Locality == 'QA' & Type_of_offence=='PHYSICAL OFFENSE')
View(filteredDf)
```
![](./2.4.png)

#### V. Group the offences by Zone.
```r
zoneGroups <- df %>% group_by(Zone)
zoneGroups
```
![](./2.5.png)

#### VI. Get a count of the number of records for each group
```r
count(zoneGroups)
```
![](./2.6.png)

#### VII. Using ggplot(), plot a barchart displaying the number of offences in each Zone. (use all the possible parameters)
```r
barplot(sort(table(zoneGroups$Zone), decreasing = T), 
        las = 2, main = "Zone.")
```
![](2.7.png)

#### VIII. Create a new column called Year_of_event containing the only the year of the event
```r
df$Year_of_event <- df %>% with(year(mdy(Date_of_event)))
View(df)
```
![](./2.8.png)


#### IX. Group the data by year and summarize
```r
yearGroup <- df %>% group_by(Year_of_event)
summary(yearGroup)
```
![](2.9.png)

#### X. Plot a barchart with column Year_of_event that displays the number of offences by year
```r
barplot(table(yearGroup$Year_of_event), 
        las = 2, main = "Year of event")
```
![](./2.10.png)

#### XI. Create another bar chart that displays the number of offences by month instead of year
```r
df$Month_of_event <- df %>% with(month(mdy(Date_of_event)))
                                 
monthGroup <- df %>% group_by(Month_of_event)

barplot(table(monthGroup$Month_of_event), 
        las = 2, main = "Month of event")
```
![](2.11.png)

#### XII. Group and summarize the data by month.
```r
df$Month_of_event <- df %>% with(month(mdy(Date_of_event)))

monthGroup <- df %>% group_by(Month_of_event)

summary(monthGroup)
```
![](2.12.png)


#### XIII. Rename the columns to make them more user friendly and view the results
```r
names(df)[names(df) == "Summary_of_offence"] <- "Summary"
names(df)[names(df) == "Type_of_offence"] <- "Type"
View(df)
```
![](2.13.png)

