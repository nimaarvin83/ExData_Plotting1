## plot1.R
library(lubridate)
url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"./file.zip", method = "curl")
unzip("./file.zip")
maindata<-read.table("./household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, dec = ".", na.strings = "?")
str(maindata)
mydata<-maindata[maindata$Date %in% c("1/2/2007","2/2/2007"),]
mydata$DateTime<-paste(mydata$Date,mydata$Time)
mydata$DateTime<-dmy_hms(mydata$DateTime)
class(mydata$DateTime)
png(filename = "plot1.png",width = 480, height = 480, units = "px")
hist(mydata$Global_active_power, main = "Global Active Power", col = "red" , xlab = "Global Active Power(Kilowatts)")
dev.off()