data <- read.table("household_power_consumption.txt", header = T, sep = ";", nrows = 1)
header <- names(data)
data <- read.table("household_power_consumption.txt", header = F, sep = ";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), skip = 66636, nrows = 2880)
names(data) <- header

dates <- data$Date
times <- data$Time
x <- paste(dates, times)
data$Time <- strptime(x, "%d/%m/%Y %H:%M:%S", tz = "GMT")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

with(data, plot(Time, Global_active_power, type = "l",xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.copy(png, file = "plot2.png")
dev.off()