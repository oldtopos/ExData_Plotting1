plot3 <- function()
{
  theData<-read.csv2("household_power_consumption.txt", na.strings="?", as.is = TRUE )
  for( index in 3:9 )
    theData[ ,index ] <- as.numeric( theData[ , index ])
  
  theData$datetime <- as.POSIXct( strptime( paste( theData[ , 1 ], theData[ , 2 ], sep = "T" ), format="%d/%m/%YT%H:%M:%S" ) )
  theData<-subset( theData, datetime >= as.POSIXct( "2007-02-01") )
  theData<-subset( theData, datetime < as.POSIXct( "2007-02-03") )
  
  png(file="plot3.png")
  colors<-c("#000000FF","#FF0000FF","#0000FFFF")
  plot(theData$datetime,theData$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  lines(theData$datetime,theData$Sub_metering_1)
  lines(theData$datetime,theData$Sub_metering_2,col="red")
  lines(theData$datetime,theData$Sub_metering_3,col="blue")
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=colors,lwd=1)
  dev.off()
}