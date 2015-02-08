library(data.table)
setwd("~/Desktop/Exploratory Data Analysis/project1")

##load data,subset data,turn date/time class.
##useing data.table is faster,fread() was good at process bigdata.
data<-fread("household_power_consumption.txt",header=T,na.strings="?")
subdata<-data[data$Date %in% c("1/2/2007","2/2/2007") ,]
subdata$datetime<-as.POSIXct(strptime(paste(subdata$Date,subdata$Time), "%d/%m/%Y %H:%M:%S"))

##make plot1,and get plot1.png.
subdata$Global_active_power<-as.numeric(subdata$Global_active_power)
hist(subdata$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()