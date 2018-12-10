## Author: Sergio García Prado
## Title: Statistical Inference - Goodness of Fit - Exercise 08

rm(list = ls())

observed <- c(38, 55, 54, 41, 62)



(k <- length(observed))
# 5

(n <- sum(observed))
# 250

(expected <- n * 1 / k )
# 50

ks <- ks.test(observed, expected)

(D <- ks$statistic)
# 0.6,

(pvalue <- ks$p.value)
# 1
