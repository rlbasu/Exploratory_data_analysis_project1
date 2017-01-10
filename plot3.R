#Load data
data = read.table("Exploratory data analysis/household_power_consumption.txt", header=TRUE, sep=";",na.strings="?", stringsAsFactors=FALSE, dec=".")
data$Date = as.Date(data$Date, format="%d/%m/%Y")

Subset_Data = subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) #Subsetting data
rm(data)

#converting date and time
datetime <- paste(as.Date(Subset_Data$Date), Subset_Data$Time)
Subset_Data$Datetime <- as.POSIXct(datetime)

#plot
with(Subset_Data,{
                  plot(Sub_metering_1~Datetime, type = "l", xlab = "", ylab = "Energy sub metering")
                  lines(Sub_metering_2~Datetime, col = "red")
                  lines(Sub_metering_3~Datetime, col = "blue")
})
legend("topright", col=c("black", "red","blue"),lty =1, lwd = 2.5,bty = "o" ,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.6)

#save file to png
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()