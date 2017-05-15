##################################################
## Name: plot3.r
## Create by: Bryan Waldo
## Description: This script will create plot3.png 
##################################################

#load data
basedata <- read.csv("household_power_consumption.txt", sep=";")

#subset data
subdata <- basedata[basedata$Date %in% c("2/1/2007","2/2/2007"),]

# remove any ? which is the NA value
isna <- apply(subdata,1,function(x){any(x=="?")})
subdata <- subdata[!isna,]

subdata$ts <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

subMet1 <- as.numeric(as.character(subdata$Sub_metering_1))
subMet2 <- as.numeric(as.character(subdata$Sub_metering_2))
subMet3 <- as.numeric(as.character(subdata$Sub_metering_3))

#produce output file
png(filename="plot3.png", width=480, height=480)
plot(subdata$ts,  subMet1, type = "1", ylab = "Energy sub metering", xlab = "")
lines(subdata$ts, subMet2, type = "1", col = "red")
lines(subdata$ts, subMet3, type = "1", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col = c("black", "red", "blue"))

# clear workspace
rm(list=ls())

# Always close the device
dev.off()