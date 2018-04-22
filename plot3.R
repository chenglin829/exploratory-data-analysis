#load dataset
data <- read.table("household_power_consumption.txt",header = TRUE,sep=";",stringsAsFactors = FALSE,dec = ".")
sampledata <- data[data$Date%in%c("1/2/2007","2/2/2007"),]
colnames(sampledata) <- tolower(names(sampledata))

#change data's class
weekdays <- strptime(paste(sampledata$date,sampledata$time,sep=" "),"%d/%m/%Y %H:%M:%S")
sub_metering_1 <- as.numeric(sampledata$sub_metering_1)
sub_metering_2 <- as.numeric(sampledata$sub_metering_2)
sub_metering_3 <- as.numeric(sampledata$sub_metering_3)

#making the plot
png("plot3.png", width=480, height=480)
plot(weekdays,sub_metering_1,type="l",xlab = "",ylab = "Energy sub metering")
lines(weekdays,sub_metering_2,type="l",col="red")
lines(weekdays,sub_metering_3,type="l",col="blue")
legend("topright",c("sub_metering_1","sub_metering_2","sub_metering_3"),lty=1,lwd = 2.5,col=c("black", "red", "blue"))
dev.off()
