power_consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                                na.strings = "?", stringsAsFactors = TRUE)

power_date <- filter(power_consumption, Date == "1/2/2007" | Date == "2/2/2007")

p_date<- power_date$Date
p_time <- power_date$Time

Datetime <- paste(p_date, p_time)
Datetime <- strptime(Datetime, "%d/%m/%Y %H:%M:%S")
power_date <- cbind(Datetime, power_date)




hist(power_date$Global_active_power, main = "Global Active Power", 
          xlab = "Global Active Power (kilowatts)", col = "red")
dev.copy(png, "plot1.png", width = 480, height = 480)
dev.off()






