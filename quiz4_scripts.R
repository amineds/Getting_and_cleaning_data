# Question 1
idaho_housing=read.csv("./data/getdata_data_ss06hid.csv")
splitNames = strsplit(names(idaho_housing),"wgtp")
splitNames[[123]]

# Question 2
gdp_data <- read.csv("./data/getdata_data_GDP.csv",
                     stringsAsFactors=TRUE,
                     header = FALSE,
                     skip=5,
                     nrows=190,
                     strip.white = TRUE,
                     skipNul = TRUE
                    )
##keep the necessary data
gdp_data <- gdp_data[,c(1,2,4,5)]
## remove commas
gdp_data$V5 <- gsub(",","",gdp_data$V5)
## remove spaces
gdp_data$V5 <- str_trim(gdp_data$V5)
## convert to integers and calculate mean
gdp_data$V5 <- as.integer(gdp_data$V5)
mean(gdp_data$V5)

# Question 3
countryNames <- gdp_data$V4
grep("^United",countryNames)

# Question 4
gdp_data <- read.csv("./data/getdata_data_GDP.csv",
                     stringsAsFactors=TRUE,
                     header = FALSE,
                     skip=5,
                     nrows=190,
                     strip.white = TRUE,
                     skipNul = TRUE
                    )

gdp_data <- gdp_data[,c(1,2,4,5)]

eds_data <- read.csv("./data/getdata_data_EDSTATS_Country.csv",
                     stringsAsFactors=TRUE,
                     header = TRUE,
                     skip=0,
                     skipNul = TRUE,
                     strip.white = TRUE
)

#Merging data
merged_data = merge(gdp_data,
                    eds_data,
                    by.x="V1",
                    by.y="CountryCode",
                    all=FALSE                 
)

merged_data <- rename(merged_data,CountryCode=V1,Rank=V2,CountryName=V4,GDP=V5)

grep("Fiscal year end: June 30",merged_data$Special.Notes,value=TRUE)

# Question 5
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 
length(grep("^2012",sampleTimes))

sample2012 <- sampleTimes[grep("^2012",sampleTimes)]
sample2012 <- ymd(sample2012)
sample2012 <- format(sample2012,"%A %d %b %Y")
length(grep("^Monday",sample2012))
