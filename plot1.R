EData <- read.table ("household_power_consumption.txt", header=TRUE, sep=";", dec=".")

EData$Date <- as.POSIXct(EData$Date, format= "%d/%m/%Y")
Data <- subset(EData,EData$Date >= as.POSIXct("2007-02-01") & EData$Date <= as.POSIXct("2007-02-02"))

Data$Global_active_power <- as.numeric(as.character(Data$Global_active_power))
hist(Data$Global_active_power,main="Global active power", xlab="Global active power (kilowatts)", col = "red")
dev.copy(png, file = "plot1.png",width = 480, height = 480)
dev.off() 
