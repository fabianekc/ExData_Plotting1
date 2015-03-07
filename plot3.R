# prepare for plotting
# setwd("~/Documents/coursera/dataScience/exploringData/ExData_Plotting1")
source('getData.R')
data <- getData()

# select file
png(file="plot3.png")

# since this is a combined plot create individual data series ...
plot(data$Time, data$Sub_metering_1, type="l", col="black",
     main="", xlab="", ylab="Energy sub metering")
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")
# ... and add legend
legend('topright',tail(names(data),3) , lty=1, col=c('black', 'red', 'blue'))

# write file
dev.off()
