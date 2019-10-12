## Read the file
SCC <- readRDS("C:/Users/Pritish Puhan/Downloads/exdata_data_NEI_data/summarySCC_PM25.rds")
## Summarize Total Emissions year wise
Total.Emissions.yearwise <- SCC %>%
group_by(year) %>%
summarize(Total.Emissions = sum(Emissions, na.rm =T)
png(filename = "plot1.png") ## Prepare the png file
# Plot the relationship
with(Total.Emissions.yearwise,
plot(x = year,
y = Total.Emissions,
ylab = "Total Annual emissions"
xlab = "year"
main = "Total Emissions in US year wise"
cex = 2,
pch =2,
col = "red",
lwd = 3))
dev.off() ## Close the graphical device

          
## Answer
Total.Emissions.2008 <- Total.Emissions.yearwise[Total.Emissions.yearwise$year == 2008, 2]
Total.Emissions.1999 <- Total.Emissions.yearwise[Total.Emissions.yearwise$year == 1999, 2]

delta.Total.Emissions <- Total.Emissions.2008 - Total.Emissions.1999
