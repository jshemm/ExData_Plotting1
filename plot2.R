#Read data file
data <- read.table(file = file, header = T, sep = ";", na.strings = "?")
#Subset data
data_sm <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
rm(data)
#Convert dates and times
temp_dt <- paste(data_sm$Date, data_sm$Time)
temp_dt <- strptime(temp_dt, "%d/%m/%Y %T")
data_sm$DateTime <- temp_dt
#Plot line chart of Global Active Power
png(filename = "plot2.png")
plot(data_sm$DateTime,data_sm$Global_active_power, 
     type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()