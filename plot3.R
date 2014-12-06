household_power_consumption_dates <- read.csv("~/Coursera/Exploratory Data Analysis/CourseProject1/household_power_consumption.txt",
                                              sep=";",na.strings = "?",skip=66636,nrows=2880)
names(household_power_consumption_dates) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                                              "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

household_power_consumption_dates$Date<-as.Date(household_power_consumption_dates$Date,format="%d/%m/%Y")
dt<-paste(household_power_consumption_dates$Date,household_power_consumption_dates$Time)
household_power_consumption_dates$datetime<-strptime(dt,format="%Y-%m-%d %H:%M:%S")

png("~/Coursera/Exploratory Data Analysis/CourseProject1/plot3.png",480,480)
plot(household_power_consumption_dates$Sub_metering_1, type="l",xaxt="n",
     ylab="Energy Sub Metering",xlab="")
axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
lines(household_power_consumption_dates$Sub_metering_2, type="l",col="red")
lines(household_power_consumption_dates$Sub_metering_3, type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1),col=c("black","red","blue")) 
dev.off()