## Author: Sergio García Prado
## Title: Statistical Inference - Goodness of Fit - Exercise 09


rm(list = ls())

observed <- c(8, 46, 55, 40, 11)

(k <- length(observed))
# 5

(n <- sum(observed))
# 160

(p.hat <- sum(observed * 0:(k-1)) / (n * (k - 1)))
# 0.5

(expected <- n * dbinom(0:(k - 1), size = k - 1, prob = p.hat))
# 10 40 60 40 10

(Q <- sum((observed - expected ) ^ 2 / expected))
# 1.81666666666666

(pvalue <- 1 - pchisq(Q, df = (k - 1) - 1))
# 0.611314815940897
