EData <- read.table ("household_power_consumption.txt", header=TRUE, sep=";", dec=".")

EData$Date <- as.POSIXct(EData$Date, format= "%d/%m/%Y")
Data <- subset(EData,EData$Date >= as.POSIXct("2007-02-01") & EData$Date <= as.POSIXct("2007-02-02"))

Data$datetime <- strptime(paste(Data$Date,Data$Time, sep=" "),format = "%Y-%m-%d %H:%M:%S")
Data$Sub_metering_1 <- as.numeric(as.character(Data$Sub_metering_1))
Data$Sub_metering_2 <- as.numeric(as.character(Data$Sub_metering_2))
Data$Sub_metering_3 <- as.numeric(as.character(Data$Sub_metering_3))

plot(Data$datetime, Data$Sub_metering_1,  type="l" ,xlab="", ylab="Energy Submetering")
lines(Data$datetime, Data$Sub_metering_2, type="l", col="red")
lines(Data$datetime, Data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5,
       col=c("black", "red", "blue"), ncol =1)
dev.copy(png, file = "plot3.png",width = 480, height = 480)
dev.off() 
