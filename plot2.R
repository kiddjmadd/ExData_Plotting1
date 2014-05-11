####################################################################
#
# Plot2.R => generates time series from kw usage data
# 
# tested under Ubuntu Linux with command "Rscript plot2.R"
#
####################################################################

# Step 1, read the data into R (assumes the household_power_consumption.txt
# is in working directory.)
myDat<-read.csv("household_power_consumption.txt",sep=";")
# make time series from date and time fields 

d<-strptime(paste(myDat$Date, myDat$Time), format="%d/%m/%Y %H:%M:%S")

# load a variable with the rows we're interested in:
L=(as.Date(myDat$Date,format="%d/%m/%Y")==as.Date("2007-02-01") | as.Date(myDat$Date,format="%d/%m/%Y")==as.Date("2007-02-02"))
# make plot output to png type (default resolution matches what was asked for in assignment):
png('plot2.png')
# First we add a plot with no symbol for the points. Then we add lines
# connecting all the points.

plot(d[L],as.numeric(as.character(myDat$Global_active_power[L])), type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(d[L],as.numeric(as.character(myDat$Global_active_power[L])), type="l")

# turn off graphics device
dev.off()
