
##################################################
## Name: plot2.r
## Create by: Bryan Waldo
## Description: This script will create plot2.png 
##################################################

#load data
basedata <- read.csv("household_power_consumption.txt", sep=";")

#subset data
subdata <- basedata[basedata$Date %in% c("1/2/2007","2/2/2007"),]

# remove any ? which is the NA value
isna <- apply(subdata,1,function(x){any(x=="?")})
subdata <- subdata[!isna,]

# convert the date and time variabls to date and time classes
subdata$Timestamp <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# convert the date and time variabls to date and time classes
subdata <- as.numeric(as.character(subdata$Global_active_power))

#produce output file
png(filename="plot2.png", width=480, height=480)
plot(subdata, subdata$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

# clear workspace
rm(list=ls())

# Always close the device
dev.off()