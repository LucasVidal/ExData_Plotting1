source("common.R")

data <- read_data()

par(mfrow=c(1,1))

with(data, {
  plot(ylab = "Energy Sub Metering",
       datetime, Sub_metering_1, type = "l", col = "black")
  lines(datetime, Sub_metering_2, col = "red")
  lines(datetime, Sub_metering_3, col = "blue")
  legend("topright", lty=1,
         col = c("black","red","blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})


dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
