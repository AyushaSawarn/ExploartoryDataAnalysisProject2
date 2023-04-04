#To LOAD the NEI and SCC data frames
NEI <- readRDS("summarySCC_PM25.rds") 
SCC <- readRDS("Source_Classification_Code.rds")
total_annual_emissions <- aggregate(Emissions ~ year, NEI,sum)
with(total_annual_emissions, 
     barplot(height=Emissions/1000, names.arg = year, col = "darkred", 
             xlab = "Year", ylab = "PM2.5 Emmission in Kilotons",
             main = expression('Annual Emission PM'[2.5]*' from 1999 to 2008')))
dev.off()