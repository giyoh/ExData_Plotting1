
rawData <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")
rawData[,1] <- as.Date(rawData[,1],format="%d/%m/%Y")

neededData <- subset(rawData,rawData$Date=="2007-02-01" | rawData$Date=="2007-02-02")

rm(rawData)

png(filename = "plot1.png",width = 480, height = 480)
with(neededData,hist(Global_active_power,main = paste("Global Active Power"),col = "red",xlab = "Global Active Power (killowatts)"))
dev.off()