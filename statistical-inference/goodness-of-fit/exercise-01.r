## Author: Sergio García Prado
## Title: Statistical Inference - Goodness of Fit - Exercise 01

rm(list = ls())


observed <- c(967, 1008, 975, 1022, 1003, 989, 1001, 981, 1043, 1011)

(n <- sum(observed))
# 10000

(k <- length(observed))
# 10

(expected <- 1 / k * n)
# 1000

(Q <- sum((observed - expected) ^ 2 / expected))
# 4.724

(pvalue <- 1 - pchisq(Q, k - 1))
# 0.857673749486367
