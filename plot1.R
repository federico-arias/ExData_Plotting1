##Plot 1
# Read data
dat <- read.table("household_power_consumption.txt", sep=";", header=T, na.strings = "?")
# Transform 'Date' column to type data 
dat <- transform(dat, Date = as.Date(Date, "%d/%m/%Y"))
# Restrict data to dates from 2007-02-01 to 2007-02-02
dat0 <- subset(dat, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Opens the device
png(file = "plot1.png")
# Plot the histogram
hist(dat0$Global_active_power, col = "red", main = "Global active power", xlab="Global active power (kilowatts)")
# Closes the device
dev.off()


