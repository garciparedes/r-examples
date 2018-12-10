## Author: Sergio García Prado
## Title: Statistical Inference - Goodness of Fit - Exercise 07

rm(list = ls())

observed <- c(20, 30, 20, 25, 15, 10)

(k <- length(observed))
# 6

(n <- sum(observed))
# 120

(expected <- n * 1 / k )
# 20


(Q <- sum((observed - expected) ^ 2 / expected))
# 12.5

(pvalue <- 1 - pchisq(Q, df = k - 1))
# 0.0285431233261675
