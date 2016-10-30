setwd("~/GitHub/ExData_Plotting1")
library(ggplot2)

#loading data
data <- read.table("household_power_consumption.txt", sep = ';', header = TRUE, na.string = '?')

#subsetting data
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data_subset <- data[data$Date <= "2007-02-02" & data$Date >= "2007-02-01",]

#opening graphic device
png(filename = "plot1.png", width = 480, height = 480, bg = "transparent")

#plotting
hist(data_subset$Global_active_power,
     col = 'red',
     xlab = 'Global Active Power (kilowatt)',
     main = 'Global Actlve Power')

#closing graphic device
dev.off()