
#Preparing data
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/restaurants.csv",method="internal")
restData <- read.csv("./data/restaurants.csv")

#making summary
summary(restData)
str(restData)

#Quantiles of quantitative variables
quantile(restData$councilDistrict,na.rm=TRUE)

#make table (consolidation, one axis)
table(restData$zipCode,useNA="ifany")

#make table (consolidation, 2 axes)
table(restData$councilDistrict,restData$zipCode)

#checking for missing values
sum(is.na(restData$councilDistrict))
any(is.na(restData$councilDistrict))
all(restData$zipCode > 0)

#Row and column sums
colSums(is.na(restData))
all(colSums(is.na(restData))==0)

#Values with specific characteristics -- summary
table(restData$zipCode %in% c("21212","21213"))

#Values with specific characteristics -- subset and keep the rows
restData[restData$zipCode %in% c("21212","21213"),]

#cross tabs
data(UCBAdmissions)
DF = as.data.frame(UCBAdmissions)
xt <- xtabs(Freq ~ Gender + Admit,data=DF)

#flat tables
warpbreaks$replicate <- rep(1:9, len = 54)
xt = xtabs(breaks ~.,data=warpbreaks)
xt
ftable(xt)

#size of dataset
fakeData = rnorm(1e5)
print(object.size(fakeData),units="Mb")

