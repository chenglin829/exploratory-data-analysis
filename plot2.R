#plot2

#load data and only be using data from the dates 2007-02-01 and 2007-02-02
data <- read.table("household_power_consumption.txt",header = TRUE,sep=";",stringsAsFactors = FALSE,dec = ".")
sampledata <- data[data$Date%in%c("1/2/2007","2/2/2007"),]
colnames(sampledata) <- tolower(names(sampledata))

#change variable class
globalactivepower <- as.numeric(sampledata$global_active_power)
weekdays <- strptime(paste(sampledata$date,sampledata$time,sep=" "),"%d/%m/%Y %H:%M:%S")

#making the plot
png("plot2.png", width=480, height=480)
plot(weekdays,globalactivepower,type="l",xlab="",ylab = "Global Active Power (kilowatts)")
dev.off()
