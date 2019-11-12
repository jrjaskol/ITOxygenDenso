library("readxl")
setwd("C:/Users/joshj/Documents/R/r-files")

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
