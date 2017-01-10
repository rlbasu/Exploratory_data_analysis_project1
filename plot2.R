#Load data
data = read.table("Exploratory data analysis/household_power_consumption.txt", header=TRUE, sep=";",na.strings="?", stringsAsFactors=FALSE, dec=".")
data$Date = as.Date(data$Date, format="%d/%m/%Y")

Subset_Data = subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) #Subsetting data
rm(data)

#converting date and time
datetime <- paste(as.Date(Subset_Data$Date), Subset_Data$Time)
Subset_Data$Datetime <- as.POSIXct(datetime)

#plot
with(Subset_Data, plot(Global_active_power~Datetime, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
#save plot to file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()