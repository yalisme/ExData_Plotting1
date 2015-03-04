#Sys.setlocale("LC_TIME", "English")

#Read from source file 
mydata <- read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings='?')
my2007data <- mydata[mydata$Date=='1/2/2007' | mydata$Date=='2/2/2007',]

#Tidy up data
my2007data$DateTime <- paste(my2007data$Date, my2007data$Time)
my2007data$DateTime <- strptime(my2007data$DateTime, "%d/%m/%Y %H:%M:%S")
my2007data$Global_active_power <- as.numeric(my2007data$Global_active_power)
my2007data <- my2007data[, c(10,3:9)]
rownames(my2007data) <- NULL

#Write tidy data to PNG file
png(filename='plot2.png', width=480, height=480, units='px')
plot(my2007data$DateTime, my2007data$Global_active_power, ylab='Global Active Power (kilowatts)', xlab='', type='l')
x<-dev.off()
