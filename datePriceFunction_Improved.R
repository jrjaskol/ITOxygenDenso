# This script was created by the ITO-Denso Team for the purpose of specifying a certian percentage
# of spot and contract purchases of a certain total amount of product
# The input is a specific year, percentage of spot and contract purchases respectively and the
# total number of products purchased

# One major edit needs to be made to this code, it needs to be allowed to accept a specific product
# At the moment it can only analyse product 1 in the ProductData.xlsx file, this shouldn't be too
# difficult of a fix though, and shoud come soon

# Necessary packages
library(lubridate)
library(dplyr)
library(readxl) 
setwd("C:/Users/joshj/Documents/R/r-files")

data <- read_excel('C:/Users/joshj/Documents/DensoData/ProductData.xlsx')
str(data)

# r does not like dates, this line is important
data$Date <- as.Date(data$Date) 


# Inputs: inYear: year of price data to analyze, 
# spotAmt: percentage of spot purchases
# conAmt: percentage of contract purchases
# totalProduct: total amount of product purchased
graphAvgPrice <- function(inYear, spotAmt, conAmt, totalProduct){
  
  # Setting up an array to add date positions to
  datesCon <- c(0)
  dateArrCon <- filter(data, data$product == 1 & data$price == 'contract')
  posCon <- 1
  conIter <- 1
  # Adding date positions to array
  for (i in 1:NROW(dateArrCon)){
    if ( year(ymd(data$Date[posCon])) == inYear ){
      datesCon[[conIter]] <- posCon
      conIter = conIter + 1
    }
    posCon = posCon + 1
  }
  # Fixes positions so that spot prices are accurately found in the data 
  # (A bit of a hacky fix due to the split function)
  subtractContract <- NROW(dateArrCon)
  
  # Same procedure as contract price
  datesSpot <- c(0)
  dateArrSpot <- filter(data, data$product == 1 & data$price == 'spot')
  posSpot <- 1 + subtractContract
  spotIter <- 1 
  for (i in 1:NROW(dateArrSpot)){
    if ( year(ymd(data$Date[posSpot])) == inYear ){
      datesSpot[[spotIter]] <- posSpot
      spotIter = spotIter + 1
    }
    posSpot = posSpot + 1
  }
  
  # Similar setup, empty array to add total averages to
  totalAvgPriceArr <- c(0)
  initialDate <- data$Date[datesSpot[1]]
  conMonthIter <- 1
  spotMonth <- 1
  
  # Gets average price from the dates found by the date positions
  for (i in 1:NROW(datesSpot)){
    avgCon <- ((data$Avg[datesCon[conMonthIter]]) * conAmt) * totalProduct
    avgSpot <- ((data$Avg[datesSpot[i]]) * spotAmt) * totalProduct
    
    totalAvgPriceArr[[i]] <- avgSpot + avgCon
    
    initialDate = datesSpot[i]
    
    if (month(ymd(data$Date[datesSpot[i]])) > spotMonth){
      conMonthIter = conMonthIter + 1
      spotMonth = spotMonth + 1
    }
    
  }
  
  plot(data$Date[datesSpot], totalAvgPriceArr, xlab = "Date", ylab = "Average Price ($USD)", main = paste("Product 1(", inYear, ") Average price for", totalProduct ,"Units   Contract %:", conAmt * 100, " Spot %:", spotAmt * 100))
  lines(data$Date[datesSpot], totalAvgPriceArr, col = "blue")
  
  return(totalAvgPriceArr)
}

# Example test
graphAvgPrice(2019, .8, .2, 1000)