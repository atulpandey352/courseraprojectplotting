dir.create("plotproject")
setwd("./plotproject")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "power")
unzip("power")
data<-read.table("household power consumption.txt",sep = ";",header = TRUE)
data<-data[which(data[,1]=="1/2/2007"|data[,1]=="2/2/2007"),]
datentime<-paste(data[,1],data[,2])
datentime<-as.POSIXlt(datentime,format="%d/%m/%Y %H:%M:%S")
dnt<-data.frame(dnt<-datentime)
data<-cbind(data,dnt)
par(mfrow=c(2,2), mar=c(4,4,4,4))
plot(data[,10],data[,3],ylab="Global Active Power(Kilowatts)",type="l",xlab="")
plot(data[,10],data[,5],ylab="Voltage",type="l",xlab="datetime")
plot(data[,10],data[,7],col="black",type="l",ylab="Energy Sub Metering",xlab = "")
lines(data[,10],data[,8],col="red",type="l")
lines(data[,10],data[,9],col="blue",type="l")
legend("topleft", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(data[,10],data[,4],ylab="Global_reactive_power",type="l",xlab="datetime")
dev.copy(png,"plot4.png")
dev.off()




