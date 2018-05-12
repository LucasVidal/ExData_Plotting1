source("common.R")

data <- read_data()

par(mfrow=c(1,1))
plot(data$datetime, 
     data$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
