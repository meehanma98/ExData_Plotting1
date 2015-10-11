## Filemname: plot1.R
## Create the first plot for the first project in the Exploratory Data Analysis course
## Read in the data
## Once you've read in the data once you can comment out the file reads to save time if doing this
## more than once

energy <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE,  na.strings = "?")

##subset on the data that represent 2007-02-01 to 2007-02-02 inclusive 

sub_energy <- subset(energy, as.Date(energy$Date, format = "%d/%m/%Y") >= "2007/02/01" & as.Date(energy$Date, format = "%d/%m/%Y") <= "2007/02/02")

#create the container for the png file

png(filename = "data/plot1.png")

#create the output plot

hist(sub_energy$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

#close the device so you actually end up with a valid file 

dev.off(which = dev.cur())
