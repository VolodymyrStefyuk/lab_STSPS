table1 <- read.table("D:/lab/methodical/STSPS/semestr_1/for_lab5/exdata-data-household_power_consumption/household_power_consumption.txt", sep = "", header = TRUE, colClasses = 'character', na.strings = "NA")
table1$Date<-as.Date(table1$Date, "%d/%m/%Y")

table1<-table1[table1$Date>="2007-02-01" & table1$Date<="2007-02-02",] 
table1$Global_active_power <- as.numeric(table1$Global_active_power) 

table1$Sub_metering_1<-as.numeric(table1$Sub_metering_1)
table1$Sub_metering_2<-as.numeric(table1$Sub_metering_2)
table1$Sub_metering_3<-as.numeric(table1$Sub_metering_3)

png(file="plot3.png")
plot(table1$DateTime,table1$Sub_metering_1,
     xlab="", ylab="Energy sub metering", col="black", type="l")

points(table1$DateTime,table1$Sub_metering_2,col="red",type="l")
points(table1$DateTime,table1$Sub_metering_3,col="blue",type="l")

legend("topright",lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1",
                                                             "Sub_metering_2","Sub_metering_3"))
dev.off()
