EData <- read.table ("household_power_consumption.txt", header=TRUE, sep=";", dec=".")

EData$Date <- as.POSIXct(EData$Date, format= "%d/%m/%Y")
Data <- subset(EData,EData$Date >= as.POSIXct("2007-02-01") & EData$Date <= as.POSIXct("2007-02-02"))

Data$datetime <- strptime(paste(Data$Date,Data$Time, sep=" "),format = "%Y-%m-%d %H:%M:%S")
Data$Sub_metering_1 <- as.numeric(as.character(Data$Sub_metering_1))
Data$Sub_metering_2 <- as.numeric(as.character(Data$Sub_metering_2))
Data$Sub_metering_3 <- as.numeric(as.character(Data$Sub_metering_3))
Data$Global_reactive_power <- as.numeric(as.character(Data$Global_reactive_power))
Data$Voltage <- as.numeric(as.character(Data$Voltage))

par(mfrow = c(2, 2))

plot(Data$datetime, Data$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(Data$datetime, Data$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(Data$datetime, Data$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(Data$datetime, Data$Sub_metering_2, type="l", col="red")
lines(Data$datetime, Data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5,
       col=c("black", "red", "blue"), bty="o")
plot(Data$datetime, Data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.copy(png, file = "plot4.png",width = 480, height = 480)
dev.off() 
