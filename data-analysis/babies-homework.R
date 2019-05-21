## Advanced Analysis of Data - UNIBO
## Sergio García Prado
## Babies - Homework 3

babies <- read.table("datasets/babies.data", header = TRUE)

summary(babies)

# Data Wrangling 

babies <- babies[babies$smoke != 9,]
babies <- babies[babies$bwt != 999,]
babies <- babies[babies$gestation != 999,]
babies <- babies[babies$parity != 9,]
babies <- babies[babies$age != 99,]
babies <- babies[babies$height != 99,]
babies <- babies[babies$weight != 999,]


babies$smoke <- factor(babies$smoke, labels = c("non smokers", "smokers"))

# Determinants of Birth Weight:
#   Smooking seems to be a more significant determinant of birth weight than the
#   mother's pre-pregnancy height, weight, parity or age. Is it true? What is 
#   the most important factor? What is the joint effect of all covariates?


## Modelling

models <- list()
models$full = lm(bwt ~ ., data = babies)
models$no.gestation = update(models$full, bwt ~ . - gestation)
models$no.parity = update(models$full, bwt ~ . - parity)
models$no.age = update(models$full, bwt ~ . - age)
models$no.height = update(models$full, bwt ~ . - height)
models$no.weight = update(models$full, bwt ~ . - weight)
models$no.smoke = update(models$full, bwt ~ . - smoke)


## Analyzing

### Full model

summary(models$full)


### R squared

(r.squared <- 
  sort(sapply(models, function(x) { 
    summary(x)$r.squared 
  })))

par(mai=c(0.5,1.5,0.5,0.5))
bp <- barplot(r.squared, horiz = TRUE, las=1, main = "R Squared by model")
text(r.squared, bp, round(r.squared, 5), pos=2)


### Ranks

rank <- rev(sapply(r.squared[-length(r.squared)], function(x) {
  (r.squared[length(r.squared)] - x) / x * 100
}))
names(rank) <- sapply(strsplit(names(rank), split='\\.'), function(x){
  x[2]
})

par(mai=c(0.5,1,0.5,0.5))
bp <- barplot(rank, horiz = TRUE, las=1, main = "R Squared percentage difference by variable")


## Results

### Smooking is the  most significant factor?
rank['smoke'] == max(rank)
#### FALSE

### Most important variable
rank[rank == max(rank)]
#### Gestation

### Joint effect of all covariates
summary(models$full)$r.squared
#### 0.2579535


### Extra: Ranking with correlated covariates.

# install.packages("polycor")
# install.packages("corrplot")
# install.packages("relaimpo")

library(polycor)
library(corrplot)
library(relaimpo)

corrplot(as.matrix(hetcor(babies)))
sort(calc.relimp(models$full)$lmg)
