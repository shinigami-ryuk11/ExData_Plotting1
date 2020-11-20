# reading data 
data <- read.table('household_power_consumption.txt', sep = ';', dec = '.',
                   header = TRUE, stringsAsFactors = FALSE)

# subsetting all rows whose Date value is either first or second of feb 2007
data <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

#converting the Global_active_power column to numeric type
globalActivePower <- as.numeric(data$Global_active_power)

# converting Voltage column to numeric type
volt <- as.numeric(data$Voltage)

#converting the sub metering columns to numeric type
sub1 <- as.numeric(data$Sub_metering_1)
sub2 <- as.numeric(data$Sub_metering_2)
sub3 <- as.numeric(data$Sub_metering_3)

#converting Global reactive power to numeric type
globalReactivePower <- as.numeric(data$Global_reactive_power)

datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# creating a graphics device - png
png("plot4.png", width = 480, height = 480)

# setting up the plotting environment
par(mfrow = c(2, 2))

plot(datetime, globalActivePower, xlab = "", ylab = "Global Active Power", type = "l")

plot(datetime, volt, ylab = "Voltage", type = "l")

plot(datetime, sub1, type = 'l', xlab = "", ylab = "Energy sub metering")
lines(datetime, sub2, type = 'l', col = "red")
lines(datetime, sub3, type = 'l', col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "o")

plot(datetime, globalReactivePower, ylab = "Global_reactive_power", type = 'l')

# closing graphcis device
dev.off()