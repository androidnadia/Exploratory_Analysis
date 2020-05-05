## PLOT 4

# loading files
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
df[,1] <- as.Date(df[,1], "%d/%m/%Y")

# subset of the data frame
power <- subset(df, Date >= "2007-02-01" & Date <= "2007-02-02")
date_time <- paste(power$Date, power$Time, sep = " ")
datetime <- strptime(date_time, "%Y-%m-%d %H:%M:%S")

# plot 
par(mfrow = c(2,2))

with(power, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global active power (kilowatts)"))

with(power, plot(datetime, Voltage, type = "l"))

with(power, plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
points(datetime, power$Sub_metering_2, type = "l", col = "red")
points(datetime, power$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(power, plot(datetime, Global_reactive_power, type = "l"))

# Save as PNG
dev.copy(png, file = "plot4.png")
dev.off()
