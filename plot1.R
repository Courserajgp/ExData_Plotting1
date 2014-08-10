
## Exploratory data analysis, Project 1, Plot 1

## Set folder
my.wd <- paste(getwd(), '/', sep='')

## Load full dataset from working directory, truncate to relevant days, set column classes
fulldata <- read.table(paste(my.wd,'household_power_consumption.txt', sep=''), sep = ";", 
                       col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                                     "Voltage", "Global_intensity", "Sub_metering_1", 
                                     "Sub_metering_2", "Sub_metering_3"), 
                       skip = 1,
                       na.strings = c("?"),
                       colClasses = c("character", "character", "numeric", "numeric","numeric",
                                      "numeric","numeric","numeric","numeric"))
L1 <- fulldata[,1] == "1/2/2007"
L2 <- fulldata[,1] == "2/2/2007"
L3 <- L1 + L2
L4 <- L3 == 1
plotdata.backup <- fulldata[L4,]
plotdata <- fulldata[L4,]
rm(fulldata)
datetime1 <- paste(plotdata.backup$Date, plotdata.backup$Time)
datetime2 <- strptime(datetime1, "%d/%m/%Y %H:%M:%S")

##Create histogram in a png file
png(filename="plot1.png")
hist(plotdata$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()

###########################################################################