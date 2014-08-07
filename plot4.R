##Plot 4
# Read data
dat <- read.table("household_power_consumption.txt", sep=";", header=T, na.strings = "?")
# Parses 'Date' column as date type
dat <- transform(dat, Date = as.Date(Date, "%d/%m/%Y"))
# Restrict data to dates from 2007-02-01 to 2007-02-02
dat0 <- subset(dat, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
# Creates a new column and concatenates date and time
dat0$datetime <- with(dat0, paste(Date,Time))
# Parses 'datetime' column as date type
dat0 <- transform(dat0, datetime = strptime(datetime, "%Y-%m-%d %H:%M:%S"))

# Opens the device
png(file = "plot4.png")

# Sets the device dimensions
par(mfrow = c(2,2))

with(dat0, {
  plot(datetime, Global_active_power, type="l", xlab="", ylab="Global active power(kilowatts)")
  with(dat0, plot(datetime, Voltage, type="l"))
  with(dat0, plot(datetime, Sub_metering_1, type="l", ylim=c(0,38), ylab = "Energy sub metering"))
  with(dat0, lines(datetime, Sub_metering_2, type="l", ylim=c(0,38), col = "red"))
  with(dat0, lines(datetime, Sub_metering_3, type="l", ylim=c(0,38), col = "blue"))
  legend("topright", pch ="-", col = c("black", "red" , "blue"), legend = colnames(dat0[,7:9]))
  with(dat0, plot(datetime, Global_reactive_power, type="l"))
})
# Closes the device
dev.off()