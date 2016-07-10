rawData <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")
rawData[,1] <- as.Date(rawData[,1],format="%d/%m/%Y")

neededData <- subset(rawData,rawData$Date=="2007-02-01" | rawData$Date=="2007-02-02")

rm(rawData)

neededData$DateTime <- paste(neededData$Date,neededData$Time)

neededData$DateTime <- strptime(neededData$DateTime, format = "%Y-%m-%d %H:%M:%S")

cleaner <- complete.cases(neededData$Global_active_power)
neededData <- neededData[cleaner,]

png(filename = "plot4.png",width = 480, height = 480)
par(mfcol=c(2,2))
with(neededData,plot(DateTime,Global_active_power,type = "l",xlab="",ylab = "Global Active Power"))



with(neededData,plot(DateTime,Sub_metering_1,type = "l",xlab="",ylab = "Energy sub metering"))
with(neededData,points(DateTime,Sub_metering_2,type = "l",xlab="",ylab = "",col="red"))
with(neededData,points(DateTime,Sub_metering_3,type = "l",xlab="",ylab = "",col="blue"))
legend(max(neededData$DateTime)-129000,max(neededData$Sub_metering_1)+2,bty = "n",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1), col = c("black","red","blue"))

with(neededData,plot(DateTime,Voltage,type = "l",xlab="datetime",ylab = "Voltage"))

with(neededData,plot(DateTime,Global_reactive_power,type = "l",xlab="datetime"))

dev.off()