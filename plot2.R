# prepare for plotting
# setwd("~/Documents/coursera/dataScience/exploringData/ExData_Plotting1")
source('getData.R')
data <- getData()

# select file
png(file="plot2.png")

# simple plot with options right in the function call
plot(data$Time, data$Global_active_power, type="l",
     main="", xlab="", ylab="Global Active Power (kilowatts)")

# write file
dev.off()
