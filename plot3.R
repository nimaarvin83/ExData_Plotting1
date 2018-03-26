## plot3.R
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
png(filename = "plot3.png",width = 480, height = 480, units = "px")
with(mydata, {
      plot(Sub_metering_1~DateTime, ylab = "Energy sub metering ",xlab="" ,pch="")
      lines(Sub_metering_1~DateTime,col="black")
      lines(Sub_metering_2~DateTime,col="red")
      lines(Sub_metering_3~DateTime,col="blue")
      
})
legend("topright",legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),col=c("black","red","blue"),lty = 1 )
dev.off()