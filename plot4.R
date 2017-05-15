##################################################
## Name: plot4.r
## Create by: Bryan Waldo
## Description: This script will create plot4.png 
##################################################

#load data
basedata <- read.csv("household_power_consumption.txt", sep=";")

#subset data
subdata <- basedata[basedata$Date %in% c("2/1/2007","2/2/2007"),]

isna <- apply(subdata, 1, function(x){any(x=="?")})
subdata <- subdata[!row.has.na,]

# make column that is easy to read so that format can be built.
subdata$Timestamp <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# clean these two up as are in diff format and return incorrect data w/o as.char
subdata$subMet1 <- as.numeric(as.character(subdata$Sub_metering_1))
subdata$subMet2 <- as.numeric(as.character(subdata$Sub_metering_2))
subdata$subMet3 <- as.numeric(subdata$Sub_metering_3)
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)
subdata$Voltage <- as.numeric(as.character(subdata$Voltage))
subdata$Global_reactive_power <-as.numeric(as.character(subdata$Global_reactive_power))

# produce output file
png(filename = "plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2), mfcol=c(2,2))
plot(subdata$datetime, subdata$Global_active_power/500, type="l", ylab="Global Active Power", xlab="", lwd=1)
plot(subdata$datetime, subdata$subMet1, col="black", type="l", ylab="Energy sub metering", xlab="", lwd=1 )
lines(subdata$datetime, subdata$subMet2, col='red', type="l", lwd=1)
lines(subdata$datetime, subdata$subMet3, col='blue', type="l", lwd=1)
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), bty="n", cex=0.9)
plot(subdata$datetime, subdata$Voltage, type="l", ylab="Voltage", xlab="datetime", lwd=1)
plot(subdata$datetime,subdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power", lwd=0.25, cex.lab=0.8, cex.axis=0.8))

# clear workspace
rm(list=ls())

# Always close the device
dev.off()
