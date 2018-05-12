source("common.R")
source("plot3.R")

data <- read_data()

par(mfrow=c(2,2))
with(data, {
  #Global Active Power
  plot(datetime, Global_active_power, type = "l", ylab = "Global Active Power")
  
  #Voltage
  plot(datetime, Voltage, type = "l", ylab = "Voltage")
  
  #Energy Sub Metering
  
  with(data, {
    plot(ylab = "Energy Sub Metering",
         datetime, Sub_metering_1, type = "l", col = "black")
    lines(datetime, Sub_metering_2, col = "red")
    lines(datetime, Sub_metering_3, col = "blue")
    legend("topright", lty=0, cex = 0.35,
           col = c("black","red","blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  })
  
  
  #Global Reactive Power
  plot(datetime, Voltage, type = "l", ylab = "Global Reactive Power")
})


dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()