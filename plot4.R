#Loads in data, since file is so large I only loaded in the first 100,000 lines to guarantee
#all of the observations we want are in the loaded in data set
data <- read.table(file="household_power_consumption.txt", header = TRUE, sep=";", nrows=100000, stringsAsFactors=FALSE)

#finds observations for the dats 2/1/2007 and 2/2/2007
list1 <- c("1/2/2007","2/2/2007")
data <- subset(data, data$Date %in% list1, drop=TRUE)

#gets my x variables to be plotted
x <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#legend labels
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

#gets my y variables to be plotted
y <- data$Global_active_power
y1 <- as.numeric(data$Sub_metering_1)
y2 <- as.numeric(data$Sub_metering_2)
y3 <- as.numeric(data$Sub_metering_3)
y4 <- as.numeric(data$Voltage)
y5 <- as.numeric(data$Global_reactive_power)

#Creates a png to plot in
formatting <- c(2,2)
png(file="plot4.png", width=480, height=480)
par(mfrow=formatting)

######PLOT 1#########
#plots the data for the top left plot
plot(x,y, type="l", xlab="", ylab="Global Active Power (kilowatts)")

######PLOT 2#########
#plots the data for the top right plot
plot(x,y4, type="l", xlab="datetime", ylab="Voltage")


######PLOT 3#########
#plots the data for the bottom left plot
plot(x,y1, type="l", xlab="", ylab="Energy sub metering")
lines(x,y2, type="l", col="red")
lines(x,y3, type="l", col="blue")
legend("topright", labels, lty=1, lwd=2, col=c("black", "red", "blue"))

######PLOT 4#########
#plots the data for the bottom left plot
plot(x,y5, type="l", xlab="datetime", ylab="Global_reactive_power")

#closes the imaging device
dev.off()