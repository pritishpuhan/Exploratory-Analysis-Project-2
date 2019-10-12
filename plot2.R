## Read the file
SCC <- readRDS("C:/Users/Pritish Puhan/Downloads/exdata_data_NEI_data/summarySCC_PM25.rds")
baltimore.emissions <- SCC %>%
filter(fips =="24510") %>% ## filter Baltimore city
group_by(year) %>% 
summarise(Total.Emissions = sum(Emissions, na.rm = T)) ##Summarise Total emissions year wise
png(filename = "plot2.png") ## prepare the png file to plot
with(baltimore.emissions, plot(x=year, ## plot the relationship
y = Total.Emissions,
xlab = "Year",
ylab = "Total Annual Emissions[Tons]",
main = "Total Emissions in Baltimore",
cex = 2,
pch = 2,
lwd = 3,
col = "red"))
dev.off()
