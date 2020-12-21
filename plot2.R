#load libraries

library(data.table)
library(tidyverse)
library(lubridate)

#read data
data = fread('household_power_consumption.txt', na.strings = '?')


#transform into date format and filter
data = data %>%
      mutate(Date = dmy(Date)) %>%
      filter(Date <= '2007-02-02', Date>= '2007-02-01')

#add neww column datetime
data = data %>%
      mutate(date_time = ymd_hms(paste0(Date, Time)))

#open png file
png("plot2.png", width=480, height=480)

with(data, plot(date_time ,Global_active_power, type = 'l',
                main = '', 
                xlab = '', 
                ylab  = 'Global Active Power (kilowats)'))



dev.off()