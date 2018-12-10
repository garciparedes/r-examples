## Author: Sergio García Prado
## Title: Statistical Inference - Goodness of Fit - Exercise 17


rm(list = ls())

library(nortest)

observed <- c(0.962, 1.066, 0.900, 0.846,0.807, 0.797, 0.814, 0.710, 0.676)

test <- sf.test(observed)

(pvalue <- test$p.value)
# 0.7936275820887
