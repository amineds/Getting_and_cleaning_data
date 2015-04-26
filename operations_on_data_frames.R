#subsetting data frames
set.seed(13435)
X <- data.frame("var1"=sample(1:5),"var2"=sample(6:10),"var3"=sample(11:15))
X <- X[sample(1:5),]; X$var2[c(1,3)] = NA

X[,"var1"] ; X[1:2,"var2"]

#logical vectors
X[(X$var1 <= 3 & X$var3 > 11),] ; X[(X$var1 <= 3 | X$var3 > 15),]

#sorting vectors
sort(X$var1,decreasing=TRUE) ; sort(X$var2,na.last=TRUE)

#ordering dataframes
X[order(X$var1),] ; X[order(X$var1,X$var3),]

#Ordering with plyr
library(plyr)
arrange(X,var1) ; arrange(X,desc(var1))

#Adding rows and columns
X$var4 <- rnorm(5) ; Y <- cbind(X,var5 = rnorm(5)) ; Y <- cbind(var6 = rnorm(5),Y)