#data read and manipulation for only reading from two days and correcting data types
setwd("C:\\Users\\bhutta\\Desktop\\Coursera\\EDA\\wk1")
data<-read.csv("household_power_consumption.txt", sep=";", header=T)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
df <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))

#plot and print plot1
par(mfrow=c(1,1))
hist(df$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab = "Frequency", main="Global Active Power")
dev.copy(png, file="plot1.png", width=500, height = 500)
dev.off


