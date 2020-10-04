dir.create("plotproject")
setwd("./plotproject")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "power")
unzip("power")
data<-read.table("household_power_consumption.txt"sep = ";",header = TRUE)
data<-data[which(data[,1]=="1/2/2007"|data[,1]=="2/2/2007"),]
hist(as.numeric(data[,3]),main="Global Active Power",xlab="Global Active Power(Kilowatts)",col = "red")
dev.copy(png,"plot1.png")
dev.off()

