# reading data 
data <- read.table('household_power_consumption.txt', sep = ';', dec = '.',
                   header = TRUE, stringsAsFactors = FALSE)

# subsetting all rows whose Date value is either first or second of feb 2007
data <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

#converting the Global_active_power column to numeric type
globalActivePower <- as.numeric(data$Global_active_power)

# required date format
datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# creating a graphics device - png
png("plot2.png", width = 480, height = 480)

# line graph
plot(datetime, globalActivePower, xlab = "", ylab = "Global Active Power (kilowatts)", 
     type = 'l')

# as always, close the graphics device
dev.off()

