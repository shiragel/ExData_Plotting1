### loading data ###
power_consumption <- read.table("household_power_consumption.txt", header = T, sep = ";")
power_consumption <- power_consumption[power_consumption$Date == "1/2/2007" | power_consumption$Date == "2/2/2007",]
power_consumption$Date <- as.Date(power_consumption$Date, format = "%d/%m/%Y")
power_consumption$Time <- strptime(paste(power_consumption$Date, power_consumption$Time), format = "%Y-%m-%d %H:%M:%S")

weekdays <- as.POSIXct(unique(format(power_consumption$Time, "%Y-%m-%d")))
weekdays <- c(weekdays, weekdays[length(weekdays)] + 86400)

### plotting ###
png("plot3.png",  width = 480, height = 480)

plot(power_consumption$Time, 
     power_consumption$Sub_metering_1,
     type = "l",
     xlab = "", 
     xaxt = "n", 
     ylab = "Energy sub metering")
lines(power_consumption$Time,
      power_consumption$Sub_metering_2, 
      col = "red")
lines(power_consumption$Time,
      power_consumption$Sub_metering_3, 
      col = "blue")
legend(x = "topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty = 1)
axis.POSIXct(side   = 1,
             at     = weekdays,
             labels = format(weekdays, "%a"),
             las    = 1)

dev.off()
