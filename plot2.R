
## Exploratory data analysis, Project 1, Plot 2

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
png(filename="plot2.png")
Sys.setlocale(category = "LC_TIME", locale = "C") # set locale to "C" for English weekday labels 
plot(datetime2, plotdata$Global_active_power, type = "l", main = "", 
     ylab = "Global Active Power (kilowatts)", xlab = "")
Sys.setlocale(category = "LC_TIME", locale = "") # restore local time settings
dev.off()

# Plot 2 created and saved
###########################################################################