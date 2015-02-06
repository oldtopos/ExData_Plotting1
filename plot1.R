plot1 <- function()
{
  theData<-read.csv2("household_power_consumption.txt", na.strings="?", as.is = TRUE )
  for( index in 3:9 )
    theData[ ,index ] <- as.numeric( theData[ , index ])
  
  theData$datetime <- as.POSIXct( strptime( paste( theData[ , 1 ], theData[ , 2 ], sep = "T" ), format="%d/%m/%YT%H:%M:%S" ) )
  theData<-subset( theData, datetime >= as.POSIXct( "2007-02-01") )
  theData<-subset( theData, datetime < as.POSIXct( "2007-02-03") )
  
  png(file="plot1.png")
  plot(hist(tmp$Global_active_power),border="black",col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
  dev.off()
}