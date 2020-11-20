# reading data 
data <- read.table('household_power_consumption.txt', sep = ';', dec = '.',
                   header = TRUE, stringsAsFactors = FALSE)

# subsetting all rows whose Date value is either first or second of feb 2007
data <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

#converting the sub metering columns to numeric type
sub1 <- as.numeric(data$Sub_metering_1)
sub2 <- as.numeric(data$Sub_metering_2)
sub3 <- as.numeric(data$Sub_metering_3)

datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# creating a graphics device - png
png("plot3.png", width = 480, height = 480)

# plotting the data
plot(datetime, sub1, type = 'l', xlab = "", ylab = "Energy sub metering")
lines(datetime, sub2, type = 'l', col = "red")
lines(datetime, sub3, type = 'l', col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1, lwd = 2)

# closing the graphics device
dev.off()




