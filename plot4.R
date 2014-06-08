workdir = "C:/Users/dongxp/Dropbox/courses/DataScience/04_exploratory/project1"
setwd(workdir)

# I didn't read in the entire dataset,
# I only read data from  2007-02-01 to 2007-02-02

dat = read.table("household_power_consumption.txt", sep = ";", header=T, na.string = "?")
dim(dat)
# [1] 2880    9

#add week to original data
dat$datetime <- paste(dat$Date, dat$Time)
dat$strptime <- strptime(dat$datetime, "%d/%m/%Y %H:%M:%S")
dat$weekday <-  weekdays(dat$strptime, abbreviate =T)
dat$weekday <- as.numeric(dat$weekday)


### plot 4 start from here ###

png(paste(workdir,"/ExData_Plotting1/plot4.png",sep=""),
    width = 480, height = 480)

op=par(mfrow = c(2,2))
  
  ####################
  ## plot4.1 Global Active Power
  
  plot(y = dat$Global_active_power, x=dat$strptime,
       type = "l",
       ylab = "Global Active Power",
       xlab = "")

  ####################
  ## plot4.2 Voltage

  plot(y = dat$Voltage, x=dat$strptime,
       type = "l",
       ylab = "Voltage",
       xlab = "datetime")

  ####################
  ## plot4.3 Energy sub metering

  #plot Sub_metering_1 and set up plot area
  plot(y = dat$Sub_metering_1, x=dat$strptime,
       type = "l",
       ylab = "Energy sub metering",
       xlab = "")
  #plot Sub_metering_2
  lines(y = dat$Sub_metering_2, x=dat$strptime, type="l", col = "red")
  #plot Sub_metering_3
  lines(y = dat$Sub_metering_3, x=dat$strptime, type="l", col = "blue")
  #add legend
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col = c("black", "red", "blue"),
         lty = c(1,  1, 1),
         bty = "n")

  ####################
  ## plot4.4 Global_reactive_power
  plot(y = dat$Global_reactive_power, x=dat$strptime,
       type = "l",
       ylab = "Global_reactive_power",
       xlab = "datetime")

par(op)

dev.off()