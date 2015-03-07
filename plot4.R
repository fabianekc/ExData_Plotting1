# prepare for plotting
# setwd("~/Documents/coursera/dataScience/exploringData/ExData_Plotting1")
source('getData.R')
data <- getData()

# select file
png(file="plot4.png")

# prepare 2x2 grid of graphs
par(mfrow = c(2,2))

# first plot in upper left corner (from plot1.R)
plot(data$Time, data$Global_active_power, type="l",
     main="", xlab="", ylab="Global Active Power (kilowatts)")

# second plot in upper right corner (simple plot)
plot(data$Time, data$Voltage, type="l",
     main="", xlab="datetime", ylab="Voltage")

# third plot in lower left corner (from plot3.R)
plot(data$Time, data$Sub_metering_1, type="l", col="black",
     main="", xlab="", ylab="Energy sub metering")
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")
legend('topright',tail(names(data),3) , lty=1, col=c('black', 'red', 'blue'))

# fourth plot in lower right corner (simple plot)
plot(data$Time, data$Global_reactive_power, type="l",
     main="", xlab="datetime", ylab="Global_reactive_power")

# write file
dev.off()
