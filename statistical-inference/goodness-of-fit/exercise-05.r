## Author: Sergio García Prado
## Title: Statistical Inference - Goodness of Fit - Exercise 05

rm(list = ls())


observed <- c(34, 10, 20)

(k <- length(observed))
# 3

(n <- sum(observed))
# 64

proportion <- c(9, 3, 2)

(expected <- n * proportion / sum(proportion))
# 41.1428571428571 13.7142857142857 9.14285714285714

(Q <- sum((observed - expected) ^ 2 / expected))
# 15.1388888888889

(pvalue <- 1 - pchisq(Q, df = k - 1))
# 0.000515979024014124
