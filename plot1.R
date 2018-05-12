source("common.R")

data <- read_data()

par(mfrow=c(1,1))
hist(data$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     ylab = "Frequency")

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
