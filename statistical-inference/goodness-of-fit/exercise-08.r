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

(Q <- sum((observed - expected) ^ 2 / expected))
# 8.2

(pvalue <- 1 - pchisq(Q, df = k - 1))
# 0.0845206445489823
