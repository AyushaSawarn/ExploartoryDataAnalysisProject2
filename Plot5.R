NEI <- readRDS("summarySCC_PM25.rds") 
SCC <- readRDS("Source_Classification_Code.rds")
library(ggplot2)
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesSummary <- NEI[NEI$SCC %in% vehiclesSCC,]
baltimoreVehiclesS <- vehiclessummary[vehiclessummary$fips=="24510",]
png("plot5.png",width=480,height=480,units="px",bg="transparent")
g <- ggplot(baltimoreVehiclesS,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="pink",width=0.5) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

print(g)

dev.off()