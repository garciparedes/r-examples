babies <- read.table("datasets/babies.data", header = TRUE)


summary(babies)


# Data Wrangling 

## missing data

babies <- babies[babies$smoke != 9,]
babies <- babies[babies$bwt != 999,]
babies <- babies[babies$gestation != 999,]
babies <- babies[babies$parity != 9,]
babies <- babies[babies$age != 99,]
babies <- babies[babies$height != 99,]
babies <- babies[babies$weight != 999,]

babies$smoke <- factor(babies$smoke, labels = c("non smokers", "smokers"))



dim(babies)

## Exploratory Data Analysis

summary(babies)

by(babies, babies$smoke, summary)

boxplot(bwt ~ smoke, data=babies)


## Smoke affects bwt?

t.test(bwt ~ smoke, data=babies)
### p-value < 2.2e-16


## Smoke affects gestation?

breaks <-  quantile(babies$gestation, seq(0, 1, 0.2))

babies$gestation.bins <- cut(babies$gestation, breaks)

babies.table1 <- table(babies$gestation.bins, babies$smoke)
babies.table2 <- prop.table(babies.table1, 1)
babies.table3 <- prop.table(babies.table1, 2)

barplot(t(babies.table2), beside = TRUE, legend = colnames(babies.table2))

chisq.test(babies.table1)
### p-value = 0.03393

## smoke affects bwt, conditioned by gestational?

babies.table4 <- tapply(babies$bwt, list(babies$gestation.bins, babies$smoke), mean )


## parity affects gestational?

t.test(gestation ~ parity, data = babies)

