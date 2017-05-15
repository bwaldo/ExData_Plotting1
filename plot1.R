##################################################
## Name: plot1.r
## Create by: Bryan Waldo
## Description: This script will create plot1.png 
##################################################

#load data
basedata <- read.csv("household_power_consumption.txt", sep=";")

#subset data
subdata <- basedata[basedata$Date %in% c("1/2/2007","2/2/2007"),]

# remove any ? which is the NA value
isna <- apply(subdata,1,function(x){any(x=="?")})
subdata <- subdata[!isna,]

# convert the date and time variabls to date and time classes
subdata <- as.numeric(as.character(subdata$Global_active_power))

#produce output file
png(filename="plot1.png", width=480, height=480)
hist(subdata, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# clear workspace
rm(list=ls())

# Always close the device
dev.off()

