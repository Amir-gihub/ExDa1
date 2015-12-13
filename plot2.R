EData <- read.table ("household_power_consumption.txt", header=TRUE, sep=";", dec=".")

EData$Date <- as.POSIXct(EData$Date, format= "%d/%m/%Y")
Data <- subset(EData,EData$Date >= as.POSIXct("2007-02-01") & EData$Date <= as.POSIXct("2007-02-02"))


Data$datetime <- strptime(paste(Data$Date,Data$Time, sep=" "),format = "%Y-%m-%d %H:%M:%S")
plot(Data$datetime, Data$Global_active_power,  type="l" ,xlab="", ylab="Global active power (kilowatts)")
dev.copy(png, file = "plot2.png",width = 480, height = 480)
dev.off() 
