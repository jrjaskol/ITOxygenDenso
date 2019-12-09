#setwd('~/Desktop/IT_Oxygen')
#setwd("~/Desktop")
setwd("C:/Users/joshj/Documents/R/r-files")
#install.packages('xlsx')
library('readxl') 
install.packages("dplyr")
library(dplyr)

#data <- read_excel('~/Desktop/IT_Oxygen/Product_Data/Product Data.xlsx')
#data <- read_excel('Product Data.xlsx')
data <- read_excel('C:/Users/joshj/Documents/DensoData/ProductData.xlsx')
str(data)

# Function scans through dateList to find position of date
# Probably a better way to do this in the tidyr universe, but this works for the present moment
get.Date.Pos <- function(date, dateList) {
  pos <- 1
  while (date >= dateList[pos])
    pos <- pos + 1
  return(pos)
}


# Not sure why this is needed, but without it there appears to be problems
data$Date <- as.Date(data$Date) 

# There likely is a better way of splitting up data somewhere in the tidyr universe, but this seems to work well enough
dataSplit <- split(data, list(prod=data$product, type=data$price)) 

# Proof in concept
tempPos <- get.Date.Pos(as.Date('2018-5-16'), dataSplit$`1.contract`$Date)
tempPos
dataSplit$`1.contract`$Avg[tempPos]

get.Date.Pos(as.Date('05/04/2018', '%m/%d/%Y'), temp$`1.contract`$Date)
temp$`1.contract`$Date[7]
temp$`1.contract`$Date[8]

# split up function by product and price to get 18 lists (use split function)
# scan through dates to find date closest to our input date (after break)
# look at tidyverse to see if there is a function to match up price with date
# use tidyiverse and dplyr
find <- get.Date.Pos(as.Date('2017-12-29'), dataSplit$`1.contract`$Date)
find
data$Avg[find - 1]

amtAvg <- function(date, prodType, amtSpot, amtContract, amtProd){
  #contract.1 <- data %>% select(product, price, Date, Avg) %>% filter (price == 'contract', product == prodType)
  table <- split(data, product = prodType)
  cont <- get.Date.Pos(as.Date(date), dataSplit$`1.contract`$Date)
  #cont <- get.Date.Pos(as.Date(date), split(data, data$product = prodType & data$price == 'contract'$Date))
  print(cont)
  
  spot <- get.Date.Pos(as.Date(date), dataSplit$`1.spot`$Date)
  print(spot)
     
  #list1 <- split(data, list(prodType = data$product, type = 'contract'))
  #contPrice <- list1$`1.contract`$Date
    
  contPrice <- data$Avg[cont - 1]
  numCont <- (NROW(dataSplit$`1.contract`$Date) - cont)
  print(numCont)
  print(contPrice)
     
  spotPrice <- data$Avg[(spot + numCont) - 1]
  print(spotPrice)
     
  totContPrice <- amtProd * (contPrice * amtContract)
  totSpotPrice <- amtProd * (spotPrice * amtSpot)
  print(totContPrice)
  print(totSpotPrice)
     
  totalPrice <- totContPrice + totSpotPrice
  print(totalPrice)
  return (totalPrice)
}

amtAvg('2017-12-29', 1, .5, .5, 1000)

