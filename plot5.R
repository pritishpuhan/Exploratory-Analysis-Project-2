NEI <- readRDS("C:/Users/Pritish Puhan/Downloads/exdata_data_NEI_data/summarySCC_PM25.rds") ## reading the file
SCC <- readRDS("C:/Users/Pritish Puhan/Downloads/exdata_data_NEI_data/Source_Classification_Code.rds") ## reading the file

vehicle.scc <- SCC[grep("[Vv]eh", SCC$Short.Name), ]

emissions.motor.baltimore <- NEI %>% 
    subset(fips == "24510" & NEI$SCC %in% vehicle.scc$SCC) %>%
    merge(y = vehicle.scc, by.x = "SCC", by.y = "SCC") %>%
    group_by(year) %>%
    summarize(Vehicle.Emissions.Type = sum(Emissions, na.rm = TRUE))

png(filename = "plot5.png")
emissions.motor.baltimore.plot <- ggplot(emissions.motor.baltimore, aes(year, Vehicle.Emissions.Type)) +
    geom_point(color = "red", 
               size = 4, 
               alpha = 1/3) + 
    xlab("Year") +
    ylab("Total Emissions [Tons]") +
    ggtitle("Total Annual Vehicle Emissions in Baltimore City")

emissions.motor.baltimore.plot
dev.off()


## Answer
emissions.motor.baltimore.2008 <- emissions.motor.baltimore[emissions.motor.baltimore$year  == 2008, 2]
emissions.motor.baltimore.1999 <- emissions.motor.baltimore[emissions.motor.baltimore$year  == 1999, 2]

delta.baltimore <- emissions.motor.baltimore.2008 - emissions.motor.baltimore.1999
