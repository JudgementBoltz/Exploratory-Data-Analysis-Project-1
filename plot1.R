#Loads in data, since file is so large I only loaded in the first 100,000 lines to guarantee
#all of the observations we want are in the loaded in data set
data <- read.table(file="household_power_consumption.txt", header = TRUE, sep=";", nrows=100000)

#finds observations for the dats 2/1/2007 and 2/2/2007
list1 <- c("1/2/2007","2/2/2007")
data <- subset(data, data$Date %in% list1, drop=TRUE)

#retrieves only the global active power column and converts data type to numeric
data <- data[,3]
data <- as.numeric(as.character(data))

#creates the plot of the data
hist(data, breaks=12, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
#exports plot to png
dev.copy(png, file="plot1.png", width=480, height=480, units="px")

#closes the imaging device
dev.off()