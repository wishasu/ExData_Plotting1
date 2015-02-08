library(data.table)
setwd("~/Desktop/Exploratory Data Analysis/project1")

##load data,subset data,turn date/time class.
##useing data.table is faster,fread() was good at process bigdata.
data<-fread("household_power_consumption.txt",header=T,na.strings="?")
subdata<-data[data$Date %in% c("1/2/2007","2/2/2007") ,]


datetime<-strptime(paste(subdata$Date,subdata$Time), "%d/%m/%Y %H:%M:%S")
globalActivePower<-as.numeric(subdata$Global_active_power)


## Plot 2
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()