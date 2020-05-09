# Loading librairies
library(dplyr)
library(ggplot2)

#loading files in R environment
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Track changes in emissions sources from coal
SCC_sub <- SCC %>% select(SCC, Data.Category, Short.Name)
SCC_coal <- SCC_sub[grep("[cC]oal", SCC_sub$Short.Name),]
coal <- merge(NEI, SCC_coal, by = "SCC")
total_emissons_coal <- coal %>% group_by(year) %>% summarize(total_emissions = sum(Emissions, na.rm = TRUE))

# Plot: total PM2.5 emissions from coal in the US using base plotting
png(filename = "plot4.png")

plot(total_emissons_coal, type = "b", pch = 19, cex = 2, col = "steelblue", xlab = "Year", ylab = "Total PM 2.5 Emissions [Tons]")
title("Total PM2.5 Emissions from coal in the US")

dev.off()