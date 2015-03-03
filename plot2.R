# Load data
# data directory (source) excluded from github repo
# the following command assumes ./data exists and contains source files
epconsumption <- read.table("./data/household_power_consumption.txt", sep=";", 
							na.strings = "?", dec=".", header=TRUE)
# Subset data
epconsumption<-subset (epconsumption, epconsumption$Date=="1/2/2007" | 
					   	epconsumption$Date=="2/2/2007")
# Create new Date_Time variable with class DATE from string class vars Date and Time
epconsumption$Date_Time <- paste(epconsumption$Date, epconsumption$Time)
epconsumption$Date_Time <- strptime(epconsumption$Date_Time, "%d/%m/%Y %H:%M:%S")

# Open output Device to file
png(filename = "plot2.png", width = 480, height = 480, units = "px")
# Plot 2
plot(epconsumption$Date_Time, epconsumption$Global_active_power, type="l", 
	 xlab="", ylab="Global Active Power (kilowatts)")
# Close device
dev.off()