d1 = date()
class(d1)

d2 = Sys.Date()
class(d2)

# Formatting dates
# %d = day as number (0-31)
# %a = abbreviated weekday
# %A = unabbreviated weekday
# %m = month (00-12)
# %b = abbreviated month
# %B = unabbrevidated month
# %y = 2 digit year
# %Y = four digit year

format(d2,"%a %b %d")

#Creating dates
x = c("1jan1960", "2jan1960", "31mar1960", "30jul1960")
z = as.Date(x, "%d%b%Y")

#Converting to Julian
weekdays(d2)
months(d2)
julian(d2)

library(lubridate)
#http://www.r-statistics.com/2012/03/do-more-with-dates-and-times-in-r-with-lubridate-1-1-0/
ymd("20140108")
mdy("08/04/2013")
dmy("03-04-2013")
ymd_hms("2011-08-03 10:15:03")
ymd_hms("2011-08-03 10:15:03",tz="Pacific/Auckland")
?Sys.timezone

#Some functions have slightly different syntax
x = dmy(c("1jan2013", "2jan2013", "31mar2013", "30jul2013"))
wday(x[1])
wday(x[1],label=TRUE)
