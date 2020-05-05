## PLOT 2

# loading files
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
df[,1] <- as.Date(df[,1], "%d/%m/%Y")

# subset of the data frame
power <- subset(df, Date >= "2007-02-01" & Date <= "2007-02-02")
date_time <- paste(power$Date, power$Time, sep = " ")
datetime <- strptime(date_time, "%Y-%m-%d %H:%M:%S")

# plot 
with(power, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global active power (kilowatts)"))

# Save as PNG
dev.copy(png, file = "plot2.png")
dev.off()