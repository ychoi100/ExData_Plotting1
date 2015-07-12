#
#	plot1.R
#
#											part of Project 1
#

File <- "household_power_consumption.txt"
P1 <-read.table ( File , sep=";" , na.strings = "?" , header=TRUE , stringsAsFactors=FALSE , colClasses = c ( rep("character",2) , rep("numeric",7) ) )

P11 <- P1 [ ( P1$Date == "1/2/2007" ) | ( P1$Date == "2/2/2007" ) , ]

XLab <- "Global Active Power (kilowatts)"
YLab <- "Frequency"
Main <- "Global Active Power"

hist(P11$Global_active_power,col="red",xlab=XLab,ylab=YLab,main=Main)

dev.copy(png,"plot1.png")
dev.off()
