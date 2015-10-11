## Filemname: plot3.R
## Create the second plot for the first project in the Exploratory Data Analysis course
## Once you've read in the data once you can comment out the file reads to save time if doing this
## more than once

## Read in the data

#energy <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE,  na.strings = "?")

##subset on the data that represent 2007-02-01 to 2007-02-02 inclusive 

sub_energy <- subset(energy, as.Date(energy$Date, format = "%d/%m/%Y") >= "2007/02/01" & as.Date(energy$Date, format = "%d/%m/%Y") <= "2007/02/02")
#Put the time variable into the correct time object type
sub_energy$Time <- strptime(sub_energy$Time, "%H:%M:%S")
sub_energy$Time <- strftime(sub_energy$Time, "%H:%M:%S")
sub_energy <- mutate(sub_energy, as.POSIXct(paste(sub_energy$Date, sub_energy$Time), format = "%d/%m/%Y %H:%M:%S"))

names(sub_energy)[10] <- "DateTime"

#create the container for the png file

png(filename = "data/plot3.png")

#create the output plots
ylim <- range(c(sub_energy$Sub_metering_1, sub_energy$Sub_metering_2, sub_energy$Sub_metering_3))
xlim <-range(c(sub_energy$DateTime))

plot(sub_energy$DateTime, sub_energy$Sub_metering_3, type = "l", ylab = "Energy Sub metering", xlab = "")
legend("topright", lty = 1, c("Sub metering 1", "Sub metering 2", "Sub metering 3"), col = c("black","red","blue"), cex = 0.6)

lines(sub_energy$Sub_metering_1)
lines(sub_energy$Sub_metering_2, col = "red")
lines(sub_energy$Sub_metering_3, col = "blue")
#close the device so you actually end up with a valid file 

dev.off(which = dev.cur())
