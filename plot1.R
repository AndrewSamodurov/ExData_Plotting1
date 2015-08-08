
data <- read.table("household_power_consumption.txt", header = T, sep = ";", nrows = 1)
header <- names(data)
data <- read.table("household_power_consumption.txt", header = F, sep = ";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), skip = 66636, nrows = 2880)
names(data) <- header

with(data, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.copy(png, file = "plot1.png")
dev.off()