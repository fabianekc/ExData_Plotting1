getData <- function() {
        if(!file.exists("data")){dir.create("data")}
        if(file.exists('data/short.csv')) {
                data<-read.csv("./data/short.csv")
                data$Date<-as.Date(data$Date)
                data$Time<-strptime(data$Time,"%Y-%m-%d %H:%M:%S")                
        } else {
                if(!file.exists('data/household_power_consumption.txt')) {
                        fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
                        download.file(fileUrl,
                                      destfile="./data/power.zip",
                                      method="curl")
                        dateDownloaded <- date()
                        unzip("./data/power.zip", exdir="./data/")
                }
                data<-read.csv("./data/household_power_consumption.txt", 
                               sep=";", na.strings = "?")
                data$Date<-as.Date(data$Date, "%d/%m/%Y")
                data<-data[data$Date>=as.Date("2007-02-01") & 
                           data$Date<=as.Date("2007-02-02"),]
                write.csv(data, "./data/short.csv")
                data$Time<-strptime(paste(data$Date, data$Time),
                                    "%Y-%m-%d %H:%M:%S")
        }
        return(data)
}