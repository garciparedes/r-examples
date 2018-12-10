## Author: Sergio García Prado
## Title: Statistical Inference - Goodness of Fit - Exercise 13


rm(list = ls())


observed <- c(1, 10, 20, 36, 23, 10)

(k <- length(observed))
# 6

(n <- sum(observed))
# 100

## common p = 0.5

(expected.equilibred <- n * dbinom(0:(k - 1), size = k - 1, prob = 0.5))
# 3.125 15.625 31.25 31.25 15.625 3.125

(Q.equilibred <- sum((observed - expected.equilibred)  ^ 2 / expected.equilibred))
# 26.848

(pvalue.equilibred <- 1 - pchisq(Q.equilibred, k - 1))
# 6.10645404716115e-05

## common p

(p.hat <- sum(observed * 0:(k - 1)) / (n * (k - 1)))
# 0.6

(expected.common <- n * dbinom(0:(k - 1), size = k - 1, prob = p.hat))
# 1.024 7.68 23.04 34.56 25.92 7.776


(Q.common <- sum((observed - expected.common)  ^ 2 / expected.common))
# 2.12753986625515

(pvalue.common <- 1 - pchisq(Q.common, (k - 1) - 1))
# 0.712314637750688
