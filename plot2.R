#Loads in data, since file is so large I only loaded in the first 100,000 lines to guarantee
#all of the observations we want are in the loaded in data set
data <- read.table(file="household_power_consumption.txt", header = TRUE, sep=";", nrows=100000, stringsAsFactors=FALSE)

#finds observations for the dats 2/1/2007 and 2/2/2007
list1 <- c("1/2/2007","2/2/2007")
data <- subset(data, data$Date %in% list1, drop=TRUE)

#gets my x and y variables to be plotted
x <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
y <- data$Global_active_power

#plots the data then exports to png
plot(x,y, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480, units="px")
#closes imaging device
dev.off()