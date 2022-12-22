table1 <- read.table("D:/lab/methodical/STSPS/semestr_1/for_lab5/exdata-data-household_power_consumption/household_power_consumption.txt", sep = "", header = TRUE, colClasses = 'character', na.strings = "NA")
table1$Date<-as.Date(table1$Date, "%d/%m/%Y")

table1<-table1[table1$Date>="2007-02-01" & table1$Date<="2007-02-02",] 
table1$Global_active_power <- as.numeric(table1$Global_active_power) 

png(file="plotl.png")
plot(table1$DateTime, table1$Global_active_power, type = "l", xlab = "", ylab = "")
dev.off()
