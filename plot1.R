### loading data ###
power_consumption <- read.table("household_power_consumption.txt", header = T, sep = ";")
power_consumption <- power_consumption[power_consumption$Date == "1/2/2007" | power_consumption$Date == "2/2/2007",]
power_consumption$Date <- as.Date(power_consumption$Date, format = "%d/%m/%Y")
power_consumption$Time <- strptime(power_consumption$Time, format = "%H:%M:%S")

power_consumption$Global_active_power <- as.numeric(power_consumption$Global_active_power)  

### plotting ###
png("plot1.png", width = 480, height = 480)

hist(power_consumption$Global_active_power, 
     col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")

dev.off()
