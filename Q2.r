# Made by
# Tarun Luthra
# 2018 CSC 1023

# 2. Download the file Set3.csv and write the correct code for each of the following : [15]
# I. Read the contents of the file
# II. Count of the number of records
# III. View the data in a tabular format
# IV. Filter the offences on the basis of Locality (QA only) and Type_of_offence (PHYSICAL OFFENSE only).
# V. Group the offences by Zone.
# VI. Get a count of the number of records for each group
# VII. Using ggplot(), plot a barchart displaying the number of offences in each Zone. (use all the possible parameters)
# VIII. Create a new column called Year_of_event containing the only the year of the event
# IX. Group the data by year and summarize
# X. Plot a barchart with column Year_of_event that displays the number of offences by year
# XI. Create another bar chart that displays the number of offences by month instead of year
# XII. Group and summarize the data by month.
# XIII. Rename the columns to make them more user friendly and view the results
# XIV. What’s the need of filtering the data? Show examples using appropriate commands
# XV. What other charts can you plot for XI ? Which one will leverage more information and why?( elaborate in comments)

library(dplyr)
library(ggplot2)
library(lubridate)

# I. Read the contents of the file
df <- read.csv('Set3.csv')


# II. Count of the number of records
count(df)


# III. View the data in a tabular format
View(df)


# IV. Filter the offences on the basis of Locality (QA only) and Type_of_offence (PHYSICAL OFFENSE only).
filteredDf <- df %>% filter(Locality == 'QA' & Type_of_offence=='PHYSICAL OFFENSE')
View(filteredDf)


# V. Group the offences by Zone.
zoneGroups <- df %>% group_by(Zone)
zoneGroups


# VI. Get a count of the number of records for each group
count(zoneGroups)
count(zoneGroups)$Zone

# VII. Using ggplot(), plot a barchart displaying the number of offences in each Zone. (use all the possible parameters)
barplot(sort(table(zoneGroups$Zone), decreasing = T), 
        las = 2, main = "Zone.")

ggplot(count(zoneGroups), aes(x=Zone,y=n)) + 
  geom_bar(stat="identity" )


# VIII. Create a new column called Year_of_event containing the only the year of the event
df$Year_of_event <- df %>% with(year(mdy(Date_of_event)))
View(df)


# IX. Group the data by year and summarize
yearGroup <- df %>% group_by(Year_of_event)
summary(yearGroup)


# X. Plot a barchart with column Year_of_event that displays the number of offences by year
barplot(table(yearGroup$Year_of_event), 
        las = 2, main = "Year of event")


# XI. Create another bar chart that displays the number of offences by month instead of year
df$Month_of_event <- df %>% with(month(mdy(Date_of_event)))
                                 
monthGroup <- df %>% group_by(Month_of_event)

barplot(table(monthGroup$Month_of_event), 
        las = 2, main = "Month of event")


# XII. Group and summarize the data by month.
df$Month_of_event <- df %>% with(month(mdy(Date_of_event)))

monthGroup <- df %>% group_by(Month_of_event)

summary(monthGroup)

# XIII. Rename the columns to make them more user friendly and view the results
names(df)[names(df) == "Summary_of_offence"] <- "Summary"
names(df)[names(df) == "Type_of_offence"] <- "Type"
View(df)


# XIV. What’s the need of filtering the data? Show examples using appropriate commands


# XV. What other charts can you plot for XI ? Which one will leverage more information and why?( elaborate in comments)

