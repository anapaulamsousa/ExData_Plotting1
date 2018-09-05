power_consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                                na.strings = "?", stringsAsFactors = TRUE)

power_date <- filter(power_consumption, Date == "1/2/2007" | Date == "2/2/2007")

p_date<- power_date$Date
p_time <- power_date$Time

Datetime <- paste(p_date, p_time)
Datetime <- strptime(Datetime, "%d/%m/%Y %H:%M:%S")
power_date <- cbind(Datetime, power_date)



with(power_date, plot(Datetime, Sub_metering_1, type = "l", 
                      ylab = "Energy sub metering", xlab = "") +
       lines(Datetime, Sub_metering_2, col = "red") +
       lines(Datetime, Sub_metering_3, col = "blue"))
legend("topright", col = c("black", "red", "blue"), lwd = c(1,1,1),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, "plot3.png", width = 480, height = 480)
dev.off()
