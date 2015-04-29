#### Question 1 ####
if(!file.exists("./data")){dir.create("./data")}

if(!file.exists("./data/2006_idaho_housing.csv")){
    
    fileUrl="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
    
    download.file(fileUrl,
                  destfile="./data/2006_idaho_housing.csv",
                  method="internal"
                 )
    idaho_housing=read.csv("./data/2006_idaho_housing.csv")

    agricultureLogical <- idaho_housing$ACR==3 & idaho_housing$AGS==6
    
    which(agricultureLogical)
}

#### Question 2 ####
if(!file.exists("./data/jeff_pic.jpg")){
    
    fileUrl="https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
    
    download.file(fileUrl,
                  destfile="./data/jeff_pic.jpg",
                  method="internal",
                  mode = "wb",
    )
    
    jeff_pic=jpeg::readJPEG("./data/jeff_pic.jpg",native=TRUE)
    
    quantile(jeff_pic,c(0.30,0.80))
}

#### Question 3 ####

#GDP File
#fileUrl1 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
#download.file(fileUrl1,destfile="./data/gdp.csv",method="internal")

gdp_data <- read.csv("./data/gdp.csv",
                     stringsAsFactors=TRUE,
                     header = FALSE,
                     skip=5,
                     nrows=190,
                     strip.white = TRUE,
                     skipNul = TRUE
                    )

gdp_data <- gdp_data[,c(1,2,4,5)]


#EDS State File
#fileUrl2 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
#download.file(fileUrl2,destfile="./data/edstats_country.csv",method="internal")

eds_data <- read.csv("./data/edstats_country.csv",
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

merged_data <- arrange(merged_data,desc(Rank))

merged_data[13,1:4]

#### Question 4 ####
mean(merged_data$Rank[merged_data$Income.Group=="High income: OECD"])
mean(merged_data$Rank[merged_data$Income.Group=="High income: nonOECD"])

#### Question 5 ####
rank_breaks <- quantile(merged_data$Rank,c(0,0.2,0.4,0.6,0.8,1))

merged_data$RankGroups <- cut(merged_data$Rank,breaks=rank_breaks)

rank_income_tab <- table(merged_data$RankGroups,merged_data$Income.Group)













