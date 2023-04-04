NEI <- readRDS("summarySCC_PM25.rds") 
SCC <- readRDS("Source_Classification_Code.rds")
library(ggplot2)
baltimoreNEI <- NEI[NEI$fips=="24510",]
aggTotalsBaltimore <- aggregate(Emissions ~ year, baltimoreNEI,sum)

png("plot3.png",width=480,height=480,units="px",bg="transparent")
g<- ggplot(baltimoreNEI,aes(factor(year),Emissions,fill=type,colore="black")) +
  geom_bar(stat="identity") +
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y="Total PM2.5 Emission (Tons)") + 
  labs(title="PM 2.5 Emissions, Baltimore City 1999-2008 by Source Type")

print(g)

dev.off()