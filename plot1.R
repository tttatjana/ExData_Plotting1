plot1 <- function(){

      #load the packages necessary
      library(dtplyr)
      #read in dataset
      full_data <- fread('household_power_consumption.txt', na.strings = "?")

      #subset February 1 and 2, 2007
      february <- subset(full_data, (Date == "1/2/2007"| Date == "2/2/2007"))
      
      #title and axis label      
      xaxis <- "Global Active Power (kilowatts)"
      title <- "Global Active Power"
      #open file device
      png(filename = "plot1.png", width = 480, height = 480)
      # create plot
      hist(february$Global_active_power, main = title , col = "red", xlab = xaxis)
      #close file device
      dev.off()
}