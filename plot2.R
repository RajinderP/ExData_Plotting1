#data read and manipulation for only reading from two days and correcting data types
setwd("C:\\Users\\bhutta\\Desktop\\Coursera\\EDA\\wk1")
data<-read.csv("household_power_consumption.txt", sep=";", header=T)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
df <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))

df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

#plot and print plot2
par(mfrow=c(1,1))
plot(df$timestamp,df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=1000, height=1000)
dev.off()
