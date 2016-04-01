#Read data file
data <- read.table(file = file, header = T, sep = ";", na.strings = "?")
#Subset data
data_sm <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
rm(data)
#Convert dates and times
temp_dt <- paste(data_sm$Date, data_sm$Time)
temp_dt <- strptime(temp_dt, "%d/%m/%Y %T")
data_sm$DateTime <- temp_dt
#Plot time course of energy sub metering
png(filename = "plot3.png")
cols = c("black","red","blue")
xrange = range(data_sm$DateTime)
yrange = range(data_sm$Sub_metering_1)
plot(xrange,yrange,type="n",xlab = "",ylab = "Energy sub metering")
for (i in 7:9) {
    lines(data_sm$DateTime,data_sm[,i], col = cols[i-6])
}
legend(x = "topright",legend = names(data_sm[7:9]),
       lty = 1, col = cols)
dev.off()