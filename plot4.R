power_consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                                na.strings = "?", stringsAsFactors = TRUE)

power_date <- filter(power_consumption, Date == "1/2/2007" | Date == "2/2/2007")

p_date<- power_date$Date
p_time <- power_date$Time

Datetime <- paste(p_date, p_time)
datetime <- strptime(Datetime, "%d/%m/%Y %H:%M:%S")
power_date <- cbind(Datetime, power_date)



par(mfrow = c(2,2))

with(power_date, {
     plot(datetime, Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
     plot(datetime, Voltage, type = "l")
     plot(datetime, Sub_metering_1, type = "l", 
                  ylab = "Energy sub metering", xlab = "") 
            lines(datetime, Sub_metering_2, col = "red") 
            lines(datetime, Sub_metering_3, col = "blue")
     legend("topright", col = c("black", "red", "blue"), lwd = c(1,1,1),
            c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(datetime, Global_reactive_power, type = "l")
     
})
dev.copy(png, "plot4.png", width = 480, height = 480)
dev.off()
