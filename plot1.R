#Load data
data = read.table("Exploratory data analysis/household_power_consumption.txt", header=TRUE, sep=";",na.strings="?", stringsAsFactors=FALSE, dec=".")
data$Date = as.Date(data$Date, format="%d/%m/%Y")

Subset_Data = subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) #Subsetting data
rm(data)

#converting date and time
datetime <- paste(as.Date(Subset_Data$Date), Subset_Data$Time)
Subset_Data$Datetime <- as.POSIXct(datetime)

#plot histrogram
with(Subset_Data, hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power(kilowatts)", ylab = "Frequency", col = "red" ))

#save to png file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()