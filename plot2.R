# script: plot2.R
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

      dfhhpow$Date = NULL  # drop Date column from the dataset
      colnames(dfhhpow)[which(colnames(dfhhpow) == "Time")] <- "Date_Time"
      df.hhpow <<- subset(dfhhpow, as.Date(Date_Time) 
                          %in% as.Date(c("2007-02-01","2007-02-02")))
      rm(dfhhpow)
}


# EDA graph plot2 (line chart) - Global_active_power

png(filename = "plot2.png", width = 480, height = 480, units = "px")
par(ann = FALSE, cex = 0.95)
with(df.hhpow, plot(x = Date_Time, y = Global_active_power, type = "l")) 
title(ylab = "Global Active Power (kilowatts)")
# dev.copy(png, file = "plot2.png")
dev.off()


