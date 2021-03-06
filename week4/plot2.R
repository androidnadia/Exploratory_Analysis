# Loading librairies
library(dplyr)
library(ggplot2)

#loading files in R environment
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Calculate the total PM2.5 emissions in Baltimore for each year from all sources in the data.frame NEI
baltimore_data <- subset(NEI, NEI$fips == "24510")
total_emissons_balt <- baltimore_data %>% group_by(year) %>% summarize(total_emissions = sum(Emissions, na.rm = TRUE))


# Plot: total emissions in Baltimore using base plotting
png(filename = "plot2.png")

plot(total_emissons_balt, type = "b",pch = 19, cex = 2, col = "steelblue", xlab = "Year", ylab = "Total PM 2.5 Emissions [Tons]")
title("Total PM2.5 Emissions in Baltimore")

dev.off()