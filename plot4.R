
## Exploratory data analysis, Project 1, Plot 4

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

##Create plot in a png file
png(filename="plot5.png")
Sys.setlocale(category = "LC_TIME", locale = "C") # set locale to "C" for English weekday labels 
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
plot(datetime2, plotdata$Global_active_power, type = "l", main = "", 
     ylab = "Global Active Power (kilowatts)", xlab = "")
plot(datetime2, plotdata$Voltage, type = "l", main = "", 
     ylab = "Voltage", xlab = "datetime")
plot(datetime2, plotdata$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", main = "")
points(datetime2, plotdata$Sub_metering_2, type = "l", col = "red")
points(datetime2, plotdata$Sub_metering_3, type = "l", col = "blue")
legend("topright", pch = NA_integer_, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lwd = 2)
plot(datetime2, plotdata$Global_reactive_power, type = "l", main = "", 
     ylab = "Global_reactive_power", xlab = "datetime")
dev.off()

Sys.setlocale(category = "LC_TIME", locale = "") # restore local time settings

# Plot 4 created and saved
###########################################################################