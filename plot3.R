####################################################################
#
# Plot3.R => generates time series from sub metering data
# 
# tested under Ubuntu Linux with command "Rscript plot3.R"
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
png('plot3.png')
# First we add a plot with no symbol for the points. Then we add lines
# connecting all the points.

plot(d[L],as.numeric(as.character(myDat$Sub_metering_1[L])), type="n",xlab="",ylab="Energy sub metering")
lines(d[L],as.numeric(as.character(myDat$Sub_metering_1[L])), type="l")
lines(d[L],as.numeric(as.character(myDat$Sub_metering_2[L])), type="l",col="red")
lines(d[L],as.numeric(as.character(myDat$Sub_metering_3[L])), type="l",col="blue")

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=2,col=c("black","red","blue"),cex=1,lty=c(1,1,1))

# turn off graphics device
dev.off()
