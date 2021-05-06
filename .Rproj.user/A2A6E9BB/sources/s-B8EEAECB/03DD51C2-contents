# Made by
# Tarun Luthra
# 2018 CSC 1023

# Getting to know the dataset
data(USArrests)
help(USArrests)

names(USArrests)

dim(USArrests)

View(USArrests)

summary(USArrests)

cor(USArrests)

with(USArrests, plot(UrbanPop, Murder))

with(USArrests, plot(UrbanPop, Assault))

with(USArrests, plot(UrbanPop, Rape))

# most and least assault
x <- which(USArrests$Assault == max(USArrests$Assault))
rownames(USArrests)[x]

assault.median = median(USArrests$Assault)
assault.median


subset(USArrests, Assault > assault.median, select= c(UrbanPop, Assault))

bottomQuartileMurderRate <- quantile(USArrests$Murder)[2]
bottomQuartileMurderRate
subset(USArrests, Murder < bottomQuartileMurderRate, select= c(UrbanPop, Murder))

topQuartileMurderRate <- quantile(USArrests$Murder)[4]
topQuartileMurderRate
subset(USArrests, Murder > topQuartileMurderRate, select= c(UrbanPop, Murder))
