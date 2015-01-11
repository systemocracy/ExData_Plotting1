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
png(filename = "plot4.png", width = 480, height = 480, units = "px")
# Plot 4
# 2 Rows and 2 columns
par(mfrow=c(2,2))
# Upper left
plot(epconsumption$Date_Time, epconsumption$Global_active_power, type="l", 
	 xlab="", ylab="Global Active Power")
# Upper right
plot(epconsumption$Date_Time, epconsumption$Voltage, type="l", 
	 xlab="datetime", ylab="Voltage")
# Lower left
plot(epconsumption$Date_Time, epconsumption$Sub_metering_1, type="l", 
	 xlab="", ylab="Energy sub metering")
lines(epconsumption$Date_Time, epconsumption$Sub_metering_2, col="RED")
lines(epconsumption$Date_Time, epconsumption$Sub_metering_3, col="BLUE")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
	   lty = c(1,1,1), col=c('BLACK','RED','BLUE'))
#Lower right
plot(epconsumption$Date_Time, epconsumption$Global_reactive_power, type="l", 
	 xlab="datetime", ylab="Global_reactive_power")
# Close device
dev.off()