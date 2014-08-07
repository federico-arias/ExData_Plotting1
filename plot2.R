## Plot 2
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
png(file = "plot2.png")
# Plots the plot
with(dat0, plot(datetime, Global_active_power, type="l", xlab="", ylab="Global active power(kilowatts)"))
# Closes the device
dev.off()