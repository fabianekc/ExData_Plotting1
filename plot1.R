# prepare for plotting
# setwd("~/Documents/coursera/dataScience/exploringData/ExData_Plotting1")
source('getData.R')
data <- getData()

# select file
png(file="plot1.png")

# simple histogram with options right in the function call
hist(data$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

# write file
dev.off()
