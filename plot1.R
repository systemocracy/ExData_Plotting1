# Load data
epconsumption <- read.table("./data/household_power_consumption.txt", sep=";", 
							na.strings = "?", dec=".", header=TRUE)
# Subset data
epconsumption<-subset (epconsumption, epconsumption$Date=="1/2/2007" | 
					   	epconsumption$Date=="2/2/2007")
# Create new Date_Time variable with class DATE from string class vars Date and Time
epconsumption$Date_Time <- paste(epconsumption$Date, epconsumption$Time)
epconsumption$Date_Time <- strptime(epconsumption$Date_Time, "%d/%m/%Y %H:%M:%S")

# Open output Device to file
png(filename = "plot1.png", width = 480, height = 480, units = "px")
# Plot 1
hist(epconsumption$Global_active_power, col="RED", xlab="Global Active Power (kilowatts)",
	 main="Global Active Power")
# Close device
dev.off()