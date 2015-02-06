plot2 <- function()
{
  theData<-read.csv2("household_power_consumption.txt", na.strings="?", as.is = TRUE )
  for( index in 3:9 )
    theData[ ,index ] <- as.numeric( theData[ , index ])
  
  theData$datetime <- as.POSIXct( strptime( paste( theData[ , 1 ], theData[ , 2 ], sep = "T" ), format="%d/%m/%YT%H:%M:%S" ) )
  theData<-subset( theData, datetime >= as.POSIXct( "2007-02-01") )
  theData<-subset( theData, datetime < as.POSIXct( "2007-02-03") )
  
  png(file="plot2.png")
  plot(tmp$datetime,tmp$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
  lines(tmp$datetime,tmp$Global_active_power)
  dev.off()
}