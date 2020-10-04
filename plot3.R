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
plot(data[,10],data[,7],col="black",type="l",ylab="Energy Sub Metering")
lines(data[,10],data[,8],col="red",type="l")
lines(data[,10],data[,9],col="blue",type="l")
legend("topright",legend=c("Sub metering 1","Sub metering 2 ","Sub metering 3"),col=c("black","red","blue"),lty=c(1,1,1))

dev.copy(png,"plot3.png")
dev.off()




