# Loading librairies
library(dplyr)
library(ggplot2)

#loading files in R environment
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Calculate the total emissions in Baltimore for each year from all sources in the data.frame NEI
baltimore_data <- subset(NEI, NEI$fips == "24510")
total_by_type <- baltimore_data %>% group_by(year, type) %>% summarize(total_emissions = sum(Emissions, na.rm = TRUE))

# Plot: total emissions by type in Baltimore using ggplot library
png(filename = "plot3.png")

g <- ggplot(total_by_type, aes(year,total_emissions))
g + geom_point(color = "steelblue", size = 4) + geom_line(color = "steelblue") + facet_grid(.~type) + labs(x = "Year", y = "Total PM2.5 Emissions [Tons]", title = "Total PM2.5 Emissions by Type in Baltimore")

dev.off()