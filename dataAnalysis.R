library("readxl")
setwd('~/Desktop/IT_Oxygen')

name <- "Product 6"
nameSpot <- "Product 6 Spot Price"
nameContract <- "Product 6 Contract Price"

# 
#  Spot Price
#
dat <- read_excel(file.choose())


high_Spot <- dat$High
low_Spot <- dat$Low
avg_Spot <- dat$Avg
date_Spot <- dat$Date

hist(high_Spot)
hist(low_Spot)
hist(avg_Spot)


boxplot(high_Spot, ylab = "High price USD ($)", xlab = nameSpot)
boxplot(low_Spot, ylab = "Low price USD ($)", xlab = nameSpot)
boxplot(avg_Spot, ylab = "Average price USD ($)", xlab = nameSpot)

plot(date_Spot, avg_Spot, type = "b", col = "blue")


# 
#  Contract Price
#
dat2 <- read_excel(file.choose())


high_Contract <- dat2$High
low_Contract <- dat2$Low
avg_Contract <- dat2$Avg
date_Contract <- dat2$Date

hist(high_Contract)
hist(low_Contract)
hist(avg_Contract)


boxplot(high_Contract, ylab = "High price USD ($)", xlab = nameContract)
boxplot(low_Contract, ylab = "Low price USD ($)", xlab = nameContract)
boxplot(avg_Contract, ylab = "Average price USD ($)", xlab = nameContract)

plot(date_Contract, avg_Contract, type = "b", col = "blue")

plot(date_Contract, avg_Contract, main = name, ylab = "Average", xlab = "Date", type = "l", col = "blue", ylim = c(5, 15))
lines(date_Spot, avg_Spot, col = "red")
legend("topleft", legend = c( "Contract Price", "Spot Price"), col = c("blue", "red"), lty = 1:2, cex = .8)
grid()
#title = nameSpot ~ " and " ~ nameContract ~ " Average Price"


#PRODUCT 9#

product9.CP<- read_xlsx('/Users/lydiasavatsky/Desktop/IT_Oxygen/Product_Data/product9_ContractPrice_flash_4Gb_512Mx8_SLC.xlsx')
product9.SP <- read_xlsx('/Users/lydiasavatsky/Desktop/IT_Oxygen/Product_Data/product9_flash_spotPrice_SLC_4gig_512MBx8.xlsx')

plot(product9.CP$Date,product9.CP$Avg , type = "l", col = "blue")

name <- "Product 9"
plot(product9.CP$Date,product9.CP$Avg , main = name, ylab = "Average", xlab = "Date", type = "l", col = "blue", ylim = c(1, 4))
lines(product9.SP$Date,product9.SP$Avg , col = "red")
legend("topleft", legend = c( "Contract Price", "Spot Price"), col = c("blue", "red"), lty = 1:2, cex = .8)
grid()

#Product 10#

product10.CP <- read_xlsx('/Users/lydiasavatsky/Desktop/IT_Oxygen/Product_Data/product10_ContractPrice_flash_64Gb_8Gx8_MLC.xlsx')
product10.SP <- read_xlsx('/Users/lydiasavatsky/Desktop/IT_Oxygen/Product_Data/product10_flash_spotPrice_MLC_64gig_8GBx8.xlsx')

plot(product10.CP$Date,product10.CP$Avg , type = "l", col = "blue")

name <- "Product 10"
plot(product10.CP$Date,product10.CP$Avg , main = name, ylab = "Average", xlab = "Date", type = "l", col = "blue", ylim = c(1, 6))
lines(product10.SP$Date,product10.SP$Avg , col = "red")
legend("topleft", legend = c( "Contract Price", "Spot Price"), col = c("blue", "red"), lty = 1:2, cex = .8)
grid()

#Product 11#
product11.CP <- read_xlsx('/Users/lydiasavatsky/Desktop/IT_Oxygen/Product_Data/product11_ContractPrice_flash_8Gb_1024Mx8_SLC.xlsx')
product11.SP <- read_xlsx('/Users/lydiasavatsky/Desktop/IT_Oxygen/Product_Data/product11_flash_spotPrice_SLC_8gig_1GBx8.xlsx')

plot(product11.CP$Date,product11.CP$Avg , type = "l", col = "blue")
plot(product11.SP$Date, product11.SP$Avg , type = "l", col="red")

name <- "Product 11"
plot(product11.CP$Date,product11.CP$Avg , main = name, ylab = "Average", xlab = "Date", type = "l", col = "blue", ylim = c(3, 9))
lines(product11.SP$Date,product11.SP$Avg , col = "red")
legend("topleft", legend = c( "Contract Price", "Spot Price"), col = c("blue", "red"), lty = 1:2, cex = .8)
grid()



