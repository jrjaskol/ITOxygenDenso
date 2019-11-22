setwd('~/Desktop/IT_Oxygen')

install.packages('xlsx')
library('readxl')

data <- read_excel('~/Desktop/IT_Oxygen/Product_Data/Product Data.xlsx')

dateArray=data$Date
productArray=data$product
avgPriceArray=data$Avg
price=data$price


price.function <- function(date, price, perContract, perSpot, product.amount, product, productArray, dateArray, avgPriceArray) {
  amount.Contract <- perContract*product.amount
  amount.Spot <- perSpot*product.amount
  index.contract <- match(c(product), productArray)
  
  while(productArray[index.contract] == product) {
    if (price[index.contract] == "contract") {
      print(price[index.contract])
      #priceIndex = match(c(date), dateArray)
      priceIndex = match(as.Date(date, format="%b-%d-%y"), as.Date(dateArray[index.contract], format="%b-%d-%y"))
    }
    
    index.contract = index.contract + 1
  }
  # avgContractPrice = avgPriceArray[priceIndex] * amount.Contract
  
  print(avgPriceArray[priceIndex])
}

price.function(date="2017-08-31", price, perContract=0.5, perSpot=0.5, product.amount=1000, product=1, productArray, dateArray, avgPriceArray)

str(data)
table(data$Date)
head(data)

# split up function by product and price to get 18 lists (use split function)
# scan through dates to find date closest to our input date (after break)
# look at tidyverse to see if there is a function to match up price with date
# use tidyiverse and dplyr


