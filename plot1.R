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

#open png file
png("plot1.png", width=480, height=480)

#plot the data
with(data, hist(Global_active_power, main = 'Global Active Power', 
                xlab = 'Global Active Power (kilowatts)', 
                col = 'Red'))

dev.off()