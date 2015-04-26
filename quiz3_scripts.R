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
    
}

#### Question 3 ####

#Preparing datasets

#GDP File cleansing
fileUrl1 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileUrl1,destfile="./data/gdp.csv",method="internal")
gdp_data <- read.csv("./data/gdp.csv",
                     stringsAsFactors=TRUE,
                     header = FALSE,
                     skip=5,
                     colClasses = c('character', 
                                    'numeric',
                                    'character',
                                    'character',
                                    'numeric',
                                    'character',
                                    'character',
                                    'character',
                                    'character',
                                    'character'
                                    )
                    )
gdp_data <- gdp_data[(gdp_data$V1 !="") & (gdp_data$V2 !="") ,]

#EDS State File
fileUrl2 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileUrl2,destfile="./data/edstats_country.csv",method="internal")
eds_data <- read.csv("./data/edstats_country.csv",
                     stringsAsFactors=TRUE,
                     header = TRUE,
                     skip=0,
                     skipNul = TRUE,
                     strip.white = TRUE
                    )

mergedData = merge(gdp_data,
                   eds_data,
                   by.x="V1",
                   by.y="CountryCode",
                   all=FALSE                 
)





























