plot4 <- function() {
      #load the packages necessary
      library(dtplyr)
      # read in dataset
      full_data <- fread('household_power_consumption.txt', na.strings = "?")
      # subset February 1 and 2, 2007
      february <- as_data_frame(subset(full_data, (Date == "1/2/2007"| Date == "2/2/2007")))
      #convert date and time columns, create new date_time variable
      february <- mutate(february, date_time = strptime(paste(Date,Time), format = "%d/%m/%Y %H:%M:%S"))
      #plot into png file device
      png(filename = "plot4.png", width = 480, height = 480)
      #set up the 4 plots
      par(mfcol = c(2,2))
      
      #top left
      plot(february$date_time, february$Global_active_power, type = "l", 
           xlab = "", ylab = "Global Active Power (kilowatts)")
      #bottom left
      with(february, plot(date_time, Sub_metering_1, col = "black", type = "l",
                          xlab = "", ylab = "Energy sub metering"))
      with(february, lines(date_time, Sub_metering_2, col = "red"))
      with(february, lines(date_time, Sub_metering_3, col = "blue"))
      legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
      #top right
      with(february, plot(date_time, Voltage, col = "black",type = "l", 
                          xlab = "datetime", ylab = "Voltage"))
      #bottom right
      with(february, plot(date_time, Global_reactive_power, col = "black", type = "l"))
      #close file device
      dev.off()
      
}