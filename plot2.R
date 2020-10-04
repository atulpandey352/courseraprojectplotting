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
plot(data[,10],data[,3],ylab="Global Active Power(Kilowatts)",type="l",xlab="")
dev.copy(png,"plot2.png")
dev.off()

