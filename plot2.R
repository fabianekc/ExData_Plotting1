setwd("~/Documents/coursera/dataScience/exploringData/ExData_Plotting1")
source('getData.R')
data <- getData()
png(file="plot2.png")
plot(data$Time, data$Global_active_power, type="l",
     main="", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
