NEI <- readRDS("summarySCC_PM25.rds") 
SCC <- readRDS("Source_Classification_Code.rds")
baltimoreNEI <- NEI[NEI$fips=="24510",]
aggTotalsBaltimore <- aggregate(Emissions ~ year, baltimoreNEI,sum)
png("plot2.png",width=480,height=480,units="px",bg="transparent")
with(aggTotalsBaltimore,
     barplot(height=Emissions/1000, names.arg = year, col = 'blue', 
             xlab = "Year", ylab = 'PM2.5 in Kilotons',
             main = 'Baltimore, Maryland Emissions from 1999 to 2008')
)
dev.off()