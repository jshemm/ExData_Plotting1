#Read data file
data <- read.table(file = file, header = T, sep = ";", na.strings = "?")
#Subset data
data_sm <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
rm(data)
#Convert dates and times
temp_dt <- paste(data_sm$Date, data_sm$Time)
temp_dt <- strptime(temp_dt, "%d/%m/%Y %T")
data_sm$DateTime <- temp_dt
#Set up graphics device
png(filename = "plot4.png")
par(mfcol = c(2,2))
#Create subplot 1
plot(data_sm$DateTime,data_sm$Global_active_power, 
     type="l", xlab = "", ylab = "Global Active Power")
#Create subplot 2
cols = c("black","red","blue")
xrange = range(data_sm$DateTime)
yrange = range(data_sm$Sub_metering_1)
plot(xrange,yrange,type="n",xlab = "",ylab = "Energy sub metering")
for (i in 7:9) {
    lines(data_sm$DateTime,data_sm[,i], col = cols[i-6])
}
legend(x = "topright",legend = names(data_sm[7:9]),
       lty = 1, col = cols, box.lty = 0)
#Create subplot 3
plot(data_sm$DateTime,data_sm$Voltage, 
     type="l", xlab = "datetime", ylab = "Voltage")
#Create subplot 4
plot(data_sm$DateTime,data_sm$Global_reactive_power, 
     type="l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()