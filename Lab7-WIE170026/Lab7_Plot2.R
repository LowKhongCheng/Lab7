setwd("C:/Users/User/Documents/WIE2003 data science/")

install.packages("data.table")
library(data.table)

DT <- fread("./household_power_consumption.txt",na.strings = "?")

DT$strDate <- as.Date(DT$Date,"%d/%m/%Y")

DT.filter<-DT[DT$strDate=="2007-02-01" | DT$strDate=="2007-02-02",]
rm(DT)

datetime <- paste(as.Date(DT.filter$Date), DT.filter$Time)
DT.filter$Datetime <- as.POSIXct(datetime)

plot(DT.filter$Global_active_power~DT.filter$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()