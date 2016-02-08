

# Set Working Directory:
# setwd("C:/Users/edoua_000/Dropbox/@ DOCUMENTS/$ MOBINT/CURSOS/COURSERA - Johns Hopkins Specialization in Data/COURSERA - 04 - Exploratory Data Analysis/Week 01/Course Project 1/ExData_Plotting1-master")


#########################################
# Loading Dataset, 2,075,259 rows and 9 columns:
    
    data1 <- read.table(  'household_power_consumption.txt',
                          sep=';',
                          header=TRUE,
                          na.strings='?',
                          )
    
    data1$DateTime <- strptime(paste(data1$Date, data1$Time),"%d/%m/%Y %H:%M:%S")


    
# We will only be using data from the dates 2007-02-01 and 2007-02-02:

    sdata1 <- data1[data1$Date == "1/2/2007" | data1$Date == "2/2/2007", ]


 
#########################################
# plot1.png:
    
    png("plot1.png", height=480, width=480)
    hist(sdata1$Global_active_power, 
         xlab = "Global Active Power (kilowatts)",
         main = "Global Active Power",
         col = "red")
    dev.off()
    

#########################################    
# plot2.png:    
    png("plot2.png", height=480, width=480)
    plot(sdata1$DateTime, 
         sdata1$Global_active_power, 
         pch=NA, 
         xlab="", 
         ylab="Global Active Power (kilowatts)")
    lines(sdata1$DateTime, sdata1$Global_active_power)
    dev.off()


#########################################        
# plot3.png:     
    png('plot3.png', height=480, width=480 )
    plot(sdata1$DateTime, 
         sdata1$Sub_metering_1,       
         xlab="", 
         pch=NA,
         ylab="Energy sub metering"
         )
    lines(sdata1$DateTime, sdata1$Sub_metering_1)
    lines(sdata1$DateTime, sdata1$Sub_metering_2, col='red')
    lines(sdata1$DateTime, sdata1$Sub_metering_3, col='blue')
    legend  ('topright', 
              c("Sub_metering_1", 
                "Sub_metering_2", 
                "Sub_metering_3"
                ), 
            lty = c(1,1,1),
            col = c('black', 'red', 'blue')
            )
    dev.off()
    

 
#########################################        
# plot4.png:
    png('plot4.png', height=480, width=480 )
    
    
    par(mfrow=c(2,2)) # Create multi-plot

        
# global active power 
    plot(sdata1$DateTime, 
         sdata1$Global_active_power, 
         pch=NA, 
         xlab="", 
         ylab="Global Active Power")
    lines(sdata1$DateTime, sdata1$Global_active_power)

        
# voltage 
    plot(sdata1$DateTime, sdata1$Voltage, ylab="Voltage", xlab="datetime", pch=NA)
    lines(sdata1$DateTime, sdata1$Voltage)

        
# submetering
   plot(sdata1$DateTime, 
         sdata1$Sub_metering_1,       
         xlab="", 
         pch=NA,
         ylab="Energy sub metering"
        )
    lines(sdata1$DateTime, sdata1$Sub_metering_1)
    lines(sdata1$DateTime, sdata1$Sub_metering_2, col='red')
    lines(sdata1$DateTime, sdata1$Sub_metering_3, col='blue')
    legend  ('topright', 
             c("Sub_metering_1", 
               "Sub_metering_2", 
               "Sub_metering_3"
             ), 
             lty = c(1,1,1),
             col = c('black', 'red', 'blue'),
             bty = 'n'
             )
 
       
# global reactive power
    with(sdata1, plot(DateTime, Global_reactive_power, xlab='datetime', pch=NA))
    with(sdata1, lines(DateTime, Global_reactive_power))
    
    
    

    dev.off()
