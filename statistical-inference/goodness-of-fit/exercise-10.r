## Author: Sergio García Prado
## Title: Statistical Inference - Goodness of Fit - Exercise 10


rm(list = ls())

observed <- c(40, 32, 15, 7, 6)

(k <- length(observed))
# 5

(n <- sum(observed))
# 100

(expected <- n * c(dgeom(0:(k - 2), prob = 0.5), 1 - pgeom(k - 2, prob = 0.5)))
# 50 25 12.5 6.25 6.25

(Q <- sum((observed - expected)^2 / expected))
# 4.56

(pvalue <- 1- pchisq(Q, df = k - 1))
# 0.335492198026963
