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


### plot 3 start from here ###

png(paste(workdir,"/ExData_Plotting1/plot3.png",sep=""),
    width = 480, height = 480)

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
       lty = c(1,  1, 1))

dev.off()