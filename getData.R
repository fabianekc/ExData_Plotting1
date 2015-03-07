# load and return data
getData <- function() {
        if(!file.exists("data")){dir.create("data")}
        if(file.exists('data/short.csv')) {
                # if a shortcut exists just load the subset and prepare data
                data<-read.csv("./data/short.csv")
                data$Date<-as.Date(data$Date)
                data$Time<-strptime(paste(data$Date, data$Time),
                                    "%Y-%m-%d %H:%M:%S")
        } else {
                # if the original file is not available yet, download and unzip
                if(!file.exists('data/household_power_consumption.txt')) {
                        fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
                        download.file(fileUrl,
                                      destfile="./data/power.zip",
                                      method="curl")
                        dateDownloaded <- date()
                        unzip("./data/power.zip", exdir="./data/")
                }
                # read the data, convert to correct classes, and subset
                data<-read.csv("./data/household_power_consumption.txt", 
                               sep=";", na.strings = "?")
                data$Date<-as.Date(data$Date, "%d/%m/%Y")
                data<-data[data$Date>=as.Date("2007-02-01") & 
                           data$Date<=as.Date("2007-02-02"),]
                # store subset for later use
                write.csv(data, "./data/short.csv")
                # convert to correct classes
                data$Time<-strptime(paste(data$Date, data$Time),
                                    "%Y-%m-%d %H:%M:%S")
        }
        return(data)
}