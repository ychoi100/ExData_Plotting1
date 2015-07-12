#
#	plot2.R
#
#											part of Project 1
#
#	Internationalization...
#

Sys.setlocale("LC_TIME", "English")

File <- "household_power_consumption.txt"
P1 <-read.table ( File , sep=";" , na.strings = "?" , header=TRUE , stringsAsFactors=FALSE , colClasses = c ( rep("character",2) , rep("numeric",7) ) )

P11 <- P1 [ ( P1$Date == "1/2/2007" ) | ( P1$Date == "2/2/2007" ) , ]

P12 <- transform ( P11 , DateTime = as.POSIXct(strptime ( paste (Date,Time,sep=" "), format="%e/%m/%Y %H:%M:%S" ) ) )
XLab <- ""
YLab <- "Global Active Power (kilowatts)"
Main <- ""

with(P12,plot(DateTime,Global_active_power,xlab=XLab,ylab=YLab,main=Main,type="o",pch="",cex=1))

dev.copy(png,"plot2.png")
dev.off()
