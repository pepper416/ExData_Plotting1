workdir = "C:/Users/dongxp/Dropbox/courses/DataScience/04_exploratory/project1"
setwd(workdir)

# I didn't read in the entire dataset,
# I only read data from  2007-02-01 to 2007-02-02

dat = read.table("household_power_consumption.txt", sep = ";", header=T, na.string = "?")
dim(dat)
# [1] 2880    9

### plot 1 start from here ###

png(paste(workdir,"/ExData_Plotting1/plot1.png",sep=""),
    width = 480, height = 480)

hist(dat$Global_active_power, col = "red", breaks = 12, 
      main = "Global Active Power",
      xlab = "Global Active Power (kilowatts)")


dev.off()