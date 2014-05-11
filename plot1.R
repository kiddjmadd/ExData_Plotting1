####################################################################
#
# Plot1.R => generates a histogram from kw usage data 
# 
# tested under Ubuntu Linux with command "Rscript plot1.R"
#
####################################################################

# Step 1, read the data into R (assumes the household_power_consumption.txt
# is in working directory.
myDat<-read.csv("household_power_consumption.txt",sep=";")
# convert characters to dates for the Date field:
myDat$Date<-as.Date(myDat$Date, "%d/%m/%Y")
# load a variable with the rows we're interested in:
L=(myDat$Date==as.Date("2007-02-01") | myDat$Date==as.Date("2007-02-02"))
# make plot output to png type (default resolution matches what was asked for in assignment):
png('plot1.png')
# to get the histogram, kw data needed to be coerced to numeric type. looking
# online, I found it needed to be made character, then numeric. The bins from sample plots
# matched those produced by the default hist function.
hist(as.numeric(as.character(myDat[L,]$Global_active_power)), main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
# turn off graphics device
dev.off()
