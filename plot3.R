## PLOT 3

# loading files
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
df[,1] <- as.Date(df[,1], "%d/%m/%Y")

# subset of the data frame
power <- subset(df, Date >= "2007-02-01" & Date <= "2007-02-02")
date_time <- paste(power$Date, power$Time, sep = " ")
datetime <- strptime(date_time, "%Y-%m-%d %H:%M:%S")

# plot 
with(power, plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
points(datetime, power$Sub_metering_2, type = "l", col = "red")
points(datetime, power$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Save as PNG
dev.copy(png, file = "plot3.png")
dev.off()