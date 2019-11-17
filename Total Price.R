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
      priceIndex = match(date, dateArray[index.contract])
    }
    index.contract = index.contract + 1
  }
  # avgContractPrice = avgPriceArray[priceIndex] * amount.Contract
  
  print(avgPriceArray[priceIndex])
}

price.function(date="8/31/17", price, perContract=0.5, perSpot=0.5, product.amount=1000, product=1, productArray, dateArray, avgPriceArray)

