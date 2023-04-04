NEI <- readRDS("summarySCC_PM25.rds") 
SCC <- readRDS("Source_Classification_Code.rds")
library(ggplot2)
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesSummary <- NEI[NEI$SCC %in% vehiclesSCC,]
vehiclesBaltimoreS <- vehiclesSummary[vehiclesSummary$fips=="24510",]
vehiclesBaltimoreS$city <- "Baltimore City"
vehiclesLANEI <- vehiclesSummary[vehiclesSummary$fips=="06037",]
vehiclesLANEI$city <- "Los Angeles County"
bothNEI <- rbind(vehiclesBaltimoreS,vehiclesLANEI)
png("plot6.png",width=480,height=480,units="px",bg="transparent")
g <- ggplot(bothNEI, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(scales="free", space="free", .~city) +
  guides(fill=FALSE) + theme_bw() +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))

print(g)

dev.off()
