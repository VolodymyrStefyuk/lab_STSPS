table1 <- read.table("D:/lab/methodical/STSPS/semestr_1/for_lab5/exdata-data-household_power_consumption/household_power_consumption.txt", sep = "", header = TRUE, colClasses = 'character', na.strings = "NA")
table1$Date<-as.Date(table1$Date, "%d/%m/%Y")

table1<-table1[table1$Date>="2007-02-01" & table1$Date<="2007-02-02",] 


table1$Global_active_power <- as.numeric(table1$Global_active_power) 
table1$Global_reactive_power<-as.numeric(table1$Global_reactive_power)
table1$Voltage<-as.numeric(table1$Voltage)
table1$Global_intensity<-as.numeric(table1$Global_intensity)
table1$Sub_metering_1<-as.numeric(table1$Sub_metering_1)
table1$Sub_metering_2<-as.numeric(table1$Sub_metering_2)
table1$Sub_metering_3<-as.numeric(table1$Sub_metering_3)

png(file="plot4.png")
par(mfcol=c(2,2))


plot(table1$DateTime, table1$Global_active_power,type="l",
     xlab="",ylab="Global Active Power")

plot(table1$DateTime,table1$Sub_metering_1,
     ylab="Energy sub metering",
     xlab="", col="black",
     type="l")

points(table1$DateTime,table1$Sub_metering_2,col="red",type="l")
points(table1$DateTime,table1$Sub_metering_3,col="blue",type="l")

legend("topright",lwd=1,col=c("black","red","blue"),
       legend=c("Sub_metering_1",
                "Sub_metering_2",
                "Sub_metering_3"))


plot(table1$DateTime,table1$Voltage,
     xlab="datetime",
     type="l")


plot(table1$DateTime,table1$Global_reactive_power,
     xlab="datetime",
     type="l")

dev.off()
