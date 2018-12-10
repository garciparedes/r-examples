## Author: Sergio García Prado
## Title: Statistical Inference - Goodness of Fit - Exercise 20


rm(list = ls())

observed <- c(1.0, 2.3, 4.2, 7.1, 10.4)

test <- ks.test(observed, pexp, rate = 1 / mean(observed))

(pvalue <- test$p.value)
# 0.986386731782078
