household_power_consumption_dates <- read.csv("~/Coursera/Exploratory Data Analysis/CourseProject1/household_power_consumption.txt",
                                              sep=";",na.strings = "?",skip=66636,nrows=2880)
names(household_power_consumption_dates) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                                              "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

household_power_consumption_dates$Date<-as.Date(household_power_consumption_dates$Date,format="%d/%m/%Y")
dt<-paste(household_power_consumption_dates$Date,household_power_consumption_dates$Time)
household_power_consumption_dates$datetime<-strptime(dt,format="%Y-%m-%d %H:%M:%S")

png("~/Coursera/Exploratory Data Analysis/CourseProject1/plot1.png",480,480)
hist(household_power_consumption_dates$Global_active_power,main="Global Active Power",
     xlab="Global Active Power (kilowatts)",col="red",breaks=12)
dev.off()