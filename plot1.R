## PLOT 1

# loading files
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
df[,1] <- as.Date(df[,1], "%d/%m/%Y")

# subset of the data frame
power <- subset(df, Date >= "2007-02-01" & Date <= "2007-02-02")

# plot 1
hist(power$Global_active_power, xlab = "Global active power (kilowatts)", ylab = "Frequency", main = 'Global Active Power', col = "red")

# Save as PNG
dev.copy(png, file = "plot1.png")
dev.off()
