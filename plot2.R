plot2 <- function(){

      #load the packages necessary
      library(dtplyr)
      # read in dataset
      full_data <- fread('household_power_consumption.txt', na.strings = "?")
      # subset February 1 and 2, 2007
      february <- as_data_frame(subset(full_data, (Date == "1/2/2007"| Date == "2/2/2007")))
      #convert date and time columns, create new date_time variable
      february <- mutate(february, date_time = strptime(paste(Date,Time), format = "%d/%m/%Y %H:%M:%S"))
      #plot into png file device
      png(filename = "plot2.png", width = 480, height = 480)
      plot(february$date_time, february$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
      #close file device
      dev.off()
}