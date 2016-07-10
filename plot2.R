
rawData <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")
rawData[,1] <- as.Date(rawData[,1],format="%d/%m/%Y")

neededData <- subset(rawData,rawData$Date=="2007-02-01" | rawData$Date=="2007-02-02")

rm(rawData)

neededData$DateTime <- paste(neededData$Date,neededData$Time)

neededData$DateTime <- strptime(neededData$DateTime, format = "%Y-%m-%d %H:%M:%S")

cleaner <- complete.cases(neededData$Global_active_power)
neededData <- neededData[cleaner,]

png(filename = "plot2.png",width = 480, height = 480)
with(neededData,plot(DateTime,Global_active_power,type = "l",xlab="",ylab = "Global Active Power (killowatts)"))
dev.off()