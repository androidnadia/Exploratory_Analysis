# Loading librairies
library(dplyr)
library(ggplot2)

#loading files in R environment
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Calculate the total PM2.5 emissions in Baltimore for each year from all sources in the data.frame NEI
baltimore_data <- subset(NEI, NEI$fips == "24510")
losAngeles_data <- subset(NEI, NEI$fips == "06037")
SCC_sub <- SCC %>% select(SCC, Data.Category, Short.Name)
SCC_motor <- SCC_sub[SCC_sub$Data.Category == "Onroad",]
motor_vehicle_balt <- merge(baltimore_data, SCC_motor, by = "SCC")
motor_vehicle_LA <- merge(losAngeles_data, SCC_motor, by = "SCC")
total_emissons_motor_balt <- motor_vehicle_balt %>% group_by(year) %>% summarize(total_emissions = sum(Emissions, na.rm = TRUE))
total_emissons_motor_LA <- motor_vehicle_LA %>% group_by(year) %>% summarize(total_emissions = sum(Emissions, na.rm = TRUE))

# Plot: total PM2.5 emissions from all motor vehicles in Baltimore vs Los Angeles using base plotting
png(filename = "plot6.png")

rng <- range(total_emissons_motor_balt, total_emissons_motor_LA)
plot(total_emissons_motor, type = "b", pch = 19, cex = 2, col = "steelblue", xlab = "Year", ylab = "Total PM 2.5 Emissions [Tons]", ylim = rng)
points(total_emissons_motor_LA, type = "b", pch = 19, cex = 2, col = "springgreen3")
title("Total PM2.5 Emissions from Motor Vehicles in Baltimore and LA")

dev.off()
