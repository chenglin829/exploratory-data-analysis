#plot1

#load dataset
data <- read.table("household_power_consumption.txt",header = TRUE,sep=";",stringsAsFactors = FALSE,dec = ".")

#We will only be using data from the dates 2007-02-01 and 2007-02-02
sampledata <- data[data$Date%in%c("1/2/2007","2/2/2007"),]

#avoid to make mistake from capital letters
colnames(sampledata) <- tolower(names(sampledata))

#make the variable become numeric
globalactivepower <- as.numeric(sampledata$global_active_power)

#Making Plots
png("plot1.png", width=480, height=480)
hist(globalactivepower,col = "red",main = "Global Active Power",xlab = "Global Active Power(Kilowatts")
dev.off()
