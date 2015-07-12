#
#	plot4.R
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

par ( mfrow = c ( 2 , 2 ) )

XLab <- ""
YLab <- "Global Active Power (kilowatts)"
Main <- ""

with(P12,plot(DateTime,Global_active_power,xlab=XLab,ylab=YLab,main=Main,type="o",pch="",cex=1))


XLab <- "datetime"
YLab <- "Voltage"
Main <- ""

with(P12,plot(DateTime,Voltage,xlab=XLab,ylab=YLab,main=Main,type="o",pch="",cex=1))


XLab <- ""
YLab <- "Energy submetering"
Main <- ""

with(P12,plot(DateTime,Sub_metering_1,xlab=XLab,ylab=YLab,main=Main,type="o",pch="",cex=1))
with(P12,points(DateTime,Sub_metering_2,type="o",pch="",cex=1,col="red"))
with(P12,points(DateTime,Sub_metering_3,type="o",pch="",cex=1,col="blue"))
legend("topright",col=c("black","red","blue"),pch='--',legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

XLab <- "datetime"
YLab <- "Global Reactive Power"
Main <- ""

with(P12,plot(DateTime,Global_reactive_power,xlab=XLab,ylab=YLab,main=Main,type="o",pch="",cex=1))

dev.copy(png,"plot4.png")
dev.off()
