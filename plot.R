table1 <- read.table("D:/lab/methodical/STSPS/semestr_1/for_lab5/exdata-data-household_power_consumption/household_power_consumption.txt", sep = "", header = TRUE, colClasses = 'character', na.strings = "NA")
table1$DateTime <- strptime(paste(table1$Date, table1$Time), "%d/%m/%Y %H:%M:%S")

table1$Date<-as.Date(hhconsump$Date, "%d/%m/%Y")

table1<-table1[table1$Date>="2007-02-01" & table1$Date<="2007-02-02",] 
table1$Global_active_power <- as.numeric(table1$Global_active_power) 
png(file="plotl.png")
hist(table1$Global_active_power,col="blue",main="Global Active Power", xlab="Global Active Power (kilowatts)") 
dev.off()
