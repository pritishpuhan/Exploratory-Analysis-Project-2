## Read the file
SCC <- readRDS("C:/Users/Pritish Puhan/Downloads/exdata_data_NEI_data/summarySCC_PM25.rds")
baltimore.emissions <- SCC %>% 
    subset(fips == "24510") %>%
    group_by(year, type) %>%
    summarize(Total.Emissions.Type = sum(Emissions, na.rm = TRUE))

png(filename = "plot3.png")
emissions.type <- ggplot(data = baltimore.emissions, aes(year, Total.Emissions.Type))

emissions.type <- emissions.type + 
    geom_point(color = "red", 
               size = 4, 
               alpha = 1/3) + 
    facet_grid(. ~ type) +
    xlab("Year") +
    ylab("Total Emissions [Tons]") +
    ggtitle("Total Annual Emissions in Baltimore by Year")

emissions.type
dev.off()
