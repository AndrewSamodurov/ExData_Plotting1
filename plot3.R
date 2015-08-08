data <- read.table("household_power_consumption.txt", header = T, sep = ";", nrows = 1)
header <- names(data)
data <- read.table("household_power_consumption.txt", header = F, sep = ";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), skip = 66636, nrows = 2880)
names(data) <- header

dates <- data$Date
times <- data$Time
x <- paste(dates, times)
data$Time <- strptime(x, "%d/%m/%Y %H:%M:%S", tz = "GMT")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

with(data, plot(Time, Sub_metering_1, type = "l",xlab = "", ylab = "Energy sub metering"))
with(data, points(Time, Sub_metering_2, type = "l", col = "red"))
with(data, points(Time, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png")
dev.off()