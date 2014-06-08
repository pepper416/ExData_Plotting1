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



### plot 2 start from here ###

png(paste(workdir,"/ExData_Plotting1/plot2.png",sep=""),
    width = 480, height = 480)

plot(y = dat$Global_active_power, x=dat$strptime,
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")

dev.off()