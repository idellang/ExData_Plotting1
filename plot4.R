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
png("plot4.png", width=480, height=480)

#plot the image
par(mfrow = c(2,2))
with(data, {
      plot(date_time, Global_active_power, type = 'l', xlab = '', ylab=  'Global Active Power')
      plot(date_time, Voltage, type = 'l', xlab= 'datetime', ylab = 'Voltage')
      plot(date_time, Sub_metering_1, type = 'l', xlab = '', ylab= 'Energy sub metering')
      lines(date_time, Sub_metering_2, col = 'red')
      lines(date_time, Sub_metering_3, col = 'blue')
      legend('topright',
             legend = c('sub meter 1', 'sub meter 2','sub meter 3'),
             col = c('black','red','blue'),
             lty = c(1,1,1),
             cex = .5)
      plot(date_time, Global_reactive_power, type = 'l', xlab = 'datetime')
})

dev.off()