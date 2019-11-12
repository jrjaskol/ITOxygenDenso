setwd('~/Desktop/IT_Oxygen')

#PRODUCT 9 CONTRACT PRICE

product9.ContractPrice<-read.csv(file='/Users/lydiasavatsky/Desktop/IT_Oxygen/Product_Data/product9_ContractPrice_flash_4Gb_512Mx8_SLC.csv')

hist(product9.ContractPrice$High)
hist(product9.ContractPrice$Low)
hist(product9.ContractPrice$Avg)

boxplot(product9.ContractPrice$High)
boxplot(product9.ContractPrice$Low)
boxplot(product9.ContractPrice$Avg)

plot(product9.ContractPrice$Date,product9.ContractPrice$High)

#PRODUCT 9 SPOT PRICE

product9.SpotPrice<-read.csv(file='/Users/lydiasavatsky/Desktop/IT_Oxygen/Product_Data/product9_flash_spotPrice_SLC_4gig_512MBx8.csv')

hist(product9.SpotPrice$High)
hist(product9.SpotPrice$Low)
hist(product9.SpotPrice$Avg)

boxplot(product9.SpotPrice$High)
boxplot(product9.SpotPrice$Low)
boxplot(product9.SpotPrice$Avg)

#PRODUCT 10 CONTRACT PRICE

product10.ContractPrice<-read.csv(file='/Users/lydiasavatsky/Desktop/IT_Oxygen/Product_Data/product10_ContractPrice_flash_64Gb_8Gx8_MLC.csv')

hist(product10.ContractPrice$High)
hist(product10.ContractPrice$Low)
hist(product10.ContractPrice$Avg)

boxplot(product10.ContractPrice$High)
boxplot(product10.ContractPrice$Low)
boxplot(product10.ContractPrice$Avg)

#PRODUCT 10 SPOT PRICE

product10.SpotPrice<-read.csv(file='/Users/lydiasavatsky/Desktop/IT_Oxygen/Product_Data/product10_flash_spotPrice_MLC_64gig_8GBx8.csv')

hist(product10.SpotPrice$High)
hist(product10.SpotPrice$Low)
hist(product10.SpotPrice$Avg)

boxplot(product10.SpotPrice$High)
boxplot(product10.SpotPrice$Low)
boxplot(product10.SpotPrice$Avg)

#PRODUCT 11 CONTRACT PRICE

product11.ContractPrice<-read.csv(file='/Users/lydiasavatsky/Desktop/IT_Oxygen/Product_Data/product11_ContractPrice_flash_8Gb_1024Mx8_SLC.csv')

hist(product11.ContractPrice$High)
hist(product11.ContractPrice$Low)
hist(product11.ContractPrice$Avg)

boxplot(product11.ContractPrice$High)
boxplot(product11.ContractPrice$Low)
boxplot(product11.ContractPrice$Avg)

#PRODUCT 11 SPOT PRICE

product11.SpotPrice<-read.csv(file='/Users/lydiasavatsky/Desktop/IT_Oxygen/Product_Data/product11_flash_spotPrice_SLC_8gig_1GBx8.csv')

hist(product11.SpotPrice$High)
hist(product11.SpotPrice$Low)
hist(product11.SpotPrice$Avg)

boxplot(product11.SpotPrice$High)
boxplot(product11.SpotPrice$Low)
boxplot(product11.SpotPrice$Avg)

