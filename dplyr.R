library(dplyr)

chicago <- readRDS("./data/chicago.rds")


#using select to point out columns
head(select(chicago, 1:5))
head(select(chicago, city:dptp))

#remove columns from the select
head(select(chicago, -(city:dptp)))

#do the select based on indexes
i <- match("city", names(chicago))
j <- match("dptp", names(chicago))
head(chicago[, -(i:j)])

#filter
chic.f <- filter(chicago, pm25tmean2 > 30)
head(select(chic.f, 1:3, pm25tmean2), 10)
chic.f <- filter(chicago, pm25tmean2 > 30 & tmpd > 80)
head(select(chic.f, 1:3, pm25tmean2, tmpd), 10)

#arrange (ascending, descending)
chicago <- arrange(chicago, date)
head(select(chicago, date, pm25tmean2), 3)
tail(select(chicago, date, pm25tmean2), 3)
chicago <- arrange(chicago, desc(date))

#rename
head(chicago[, 1:5], 3)
chicago <- rename(chicago, 
                  dewpoint = dptp,
                  pm25 = pm25tmean2
                  )
head(chicago[, 1:5], 3)

#mutate
chicago <- mutate(chicago,
            pm25detrend=pm25-mean(pm25, na.rm=TRUE))
head(select(chicago, pm25, pm25detrend))

#group_by ##1
chicago <- mutate(chicago,
                  tempcat = factor(tmpd > 80,labels = c("cold", "hot"))
                )

hotcold <- group_by(chicago, tempcat)

summarize(hotcold, 
          pm25 = mean(pm25, na.rm = TRUE),
          o3 = max(o3tmean2),
          no2 = median(no2tmean2)
         )
                                   
#group_by ##2
chicago <- mutate(chicago,year = as.POSIXlt(date)$year + 1900)

years <- group_by(chicago, year)

summarize(years, 
          pm25 = mean(pm25, na.rm = TRUE),
          o3 = max(o3tmean2, na.rm = TRUE),
          no2 = median(no2tmean2, na.rm = TRUE)
          )

#cascades of transformation
chicago %>% mutate(month = as.POSIXlt(date)$mon + 1) %>% group_by(month) 
%>% summarize(pm25 = mean(pm25, na.rm = TRUE),
              o3 = max(o3tmean2, na.rm = TRUE),
              no2 = median(no2tmean2, na.rm = TRUE))
