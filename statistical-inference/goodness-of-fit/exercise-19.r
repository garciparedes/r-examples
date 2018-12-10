## Author: Sergio García Prado
## Title: Statistical Inference - Goodness of Fit - Exercise 19


rm(list = ls())

library(nortest)

observed <- c(9.8, 10.2, 9.3, 12.2, 9.6, 8.6, 8.7, 15.2, 15.5, 11.6, 7.2, 6.9)

test <- sf.test(observed)

(pvalue <- test$p.value)
# 0.222472184638491
