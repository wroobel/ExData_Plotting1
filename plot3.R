setwd("~/GitHub/ExData_Plotting1")
library(ggplot2)

#loading data
data <- read.table("household_power_consumption.txt", sep = ';', header = TRUE, na.string = '?')

#converting time format
data$Datetime <- strptime(paste(data$Date, data$Time, " "), format = "%d/%m/%Y %H:%M:%S")

#subsetting data
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data_subset <- data[data$Date <= "2007-02-02" & data$Date >= "2007-02-01",]

#opening graphic device
png(filename = "plot3.png", width = 480, height = 480, bg = "transparent")

#attaching data
attach(data_subset)

#plotting
plot(Datetime, Sub_metering_1, type='l', xlab='', ylab='Energy sub-metering')
lines(Datetime, Sub_metering_2, type='l', col='red')
lines(Datetime, Sub_metering_3, type='l', col='blue')

legend('topright',
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'),
       lty = 1)

#closing graphic device
dev.off()

#detaching data
detach(data_subset)
