library(reshape2)
library(plyr)

#Melting data frames
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars,id=c("carname","gear","cyl"),measure.vars=c("mpg","hp"))
head(carMelt,n=3)
tail(carMelt,n=3)

#casting data frames
cylData <- dcast(carMelt, cyl ~ variable,length)
cylData <- dcast(carMelt, cyl ~ variable,mean)
cylData

#Averaging values
tapply(InsectSprays$count,InsectSprays$spray,sum)

#Another way - split & apply
spIns =  split(InsectSprays$count,InsectSprays$spray)
sprCount = lapply(spIns,sum)
unlist(sprCount)
sapply(spIns,sum)

#Using the plyr package
ddply(InsectSprays,.(spray),summarize,sum=sum(count))