# script: plot3.R
# 
# pseudo-code briefing
# 1. test if "household power consumption" data set exists
# 2. if existed goto step 10 else goto step 3
# 3. set fileurl to the raw dataset's internet download link 
# 4. establish a temporary place holder for fileurl to hold the raw dataset
# 5. download the dataset from the internet cloud using fileurl
# 6. unzip downloaded raw dataset  
# 7. load raw dataset as data frame (auto type-conversion will take place)
# 8. convert Date & Time variables from character string to date-time class 
# 9. extract a working subset Date == c("2007-02-01","2007-02-02") 
# 10.plot EDA graph


if (!exists("df.hhpow")) {
      fileurl <- paste0("https://d396qusza40orc.cloudfront.net",
                        "/exdata%2Fdata%2Fhousehold_power_consumption.zip")
      filetmp <- tempfile()
      datadir <- paste(".", "data", sep="/")
      download.file(fileurl, destfile = filetmp)
      unzip(filetmp, overwrite = TRUE, exdir = datadir)
      unlink(filetmp); rm(filetmp); rm(fileurl)
      
      filein <- paste(datadir,list.files(datadir),sep = "/")
      dfhhpow <- read.delim(filein, header = TRUE, sep = ";", 
                            na.strings = "?", 
                            strip.white = TRUE,
                            stringsAsFactors = FALSE)
      unlink(filein); rm(filein); rm(datadir)
      
      dfhhpow$Time <- strptime(paste(dfhhpow$Date, dfhhpow$Time, sep = " "),
                               format = "%d/%m/%Y %H:%M:%S")
      # dfhhpow$Date <- as.Date(dfhhpow$Date, format = "%d/%m/%Y")
      
      # library(dplyr)
      # dfhhpow <- dfhhpow %>% 
      #             select(everything()) %>% 
      #             mutate(Time = strptime(paste(Date, Time, " "), 
      #                                     format = "%d/%m/%Y %H:%M:%S"),
      #                    Date = as.Date(Date, format = "%d/%m/%Y"),
      #                    Global_active_power = as.double(Global_active_power),
      #                    Global_reactive_power = as.double(Global_reactive_power),
      #                    Voltage = as.double(Voltage),
      #                    Global_intensity = as.double(Global_intensity),
      #                    Sub_metering_1 = as.double(Sub_metering_1),
      #                    Sub_metering_2 = as.double(Sub_metering_2),
      #                    Sub_metering_3 = as.double(Sub_metering_3)
      #             )
      # detach(package:dplyr, unload = TRUE)
      
      # df.hhpow <- subset(dfhhpow, Date 
      #                               %in% as.Date(c("2007-02-01","2007-02-02")))
      
      dfhhpow$Date = NULL  # drop Date column from the dataset
      colnames(dfhhpow)[which(colnames(dfhhpow) == "Time")] <- "Date_Time"
      df.hhpow <<- subset(dfhhpow, as.Date(Date_Time) 
                          %in% as.Date(c("2007-02-01","2007-02-02")))
      rm(dfhhpow)
}


# EDA graph plot3 (line chart) - Sub_metering_1/2/3

png(filename = "plot3.png", width = 480, height = 480, units = "px")
par(ann = FALSE, cex = 0.95)
with(df.hhpow, {
      plot(Date_Time, Sub_metering_1, type = "l", col = "black")
      lines(Date_Time, Sub_metering_2, type = "l", col = "red")
      lines(Date_Time, Sub_metering_3, type = "l", col = "blue")
      })
legend("topright", 
       legend = c(colnames(df.hhpow)[6:8]), 
       lty = c(1,1,1),
       col = c("black","red","blue")
       )
title(ylab = "Energy sub metering")
dev.off()


