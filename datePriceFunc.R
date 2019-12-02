#setwd('~/Desktop/IT_Oxygen')
setwd("C:/Users/joshj/Documents/R/r-files")

#install.packages('xlsx')
library('readxl')

#data <- read_excel('~/Desktop/IT_Oxygen/Product_Data/Product Data.xlsx')
data <- read_excel('C:/Users/joshj/Documents/DensoData/ProductData.xlsx')

data$Date <- as.Date(data$Date, format = "%m/%d/%y")
dateArray <- data$Date
productArray=data$product
avgPriceArray=data$Avg
price=data$price


# split up function by product and price to get 18 lists (use split function)
# scan through dates to find date closest to our input date (after break)
# look at tidyverse to see if there is a function to match up price with date
# use tidyiverse and dplyr

prodNum <- 9
date <- as.Date("9/30/2019", format = "%m/%d/%y")

temp <- split(avgPriceArray, productArray == prodNum & price == 'contract' & dateArray == date)
temp


#data %>% select(avgPriceArray, productArray, )