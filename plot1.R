# reading data 
data <- read.table('household_power_consumption.txt', sep = ';', dec = '.',
                   header = TRUE, stringsAsFactors = FALSE)

# subsetting all rows whose Date value is either first or second of feb 2007
data <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

#converting the Global_active_power column to numeric type
globalActivePower <- as.numeric(data$Global_active_power)

# creating a graphics device - png
png("plot1.png", width = 480, height = 480)

hist(globalActivePower, col = "red", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")

# as always, closing the graphics device after use
dev.off()
