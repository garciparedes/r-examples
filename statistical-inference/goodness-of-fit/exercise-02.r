## Author: Sergio García Prado
## Title: Statistical Inference - Goodness of Fit - Exercise 02

rm(list = ls())


## Test over sample 1.

y1 <- c(9, 3, 8, 14, 2, 13, 12, 19, 9, 4)

(k <- length(y))
# 10

(n1 <- sum(y1))
# 93

(e1 <- rep(1 / k * n1, k))
# 9.3 9.3 9.3 9.3 9.3 9.3 9.3 9.3 9.3 9.3

(Q1 <- sum((y1 - e1) ^ 2 / e1))
# 27.9677419354839

(pvalue1 <- 1 - pchisq(Q1, k - 1))
# 0.000965777402160084


## Test over sample 2.

y2 <- c(3, 4, 2, 14, 5, 6, 3, 17, 14, 12)

(n2 <- sum(y2))
# 80

(e2 <- rep(1 / k * n2, k))
# 8 8 8 8 8 8 8 8 8 8

(Q2 <- sum((y2 - e2) ^ 2 / e2))
# 35.5

(pvalue2 <- 1 - pchisq(Q2, k - 1))
# 4.8618021638136e-05


## Test between samples 1 and 2.

(y <- (y1 + y2))
# 12 7 10 28 7 19 15 36 23 16

a <- y * n1 / (n1 + n2)
(Qa <- sum((y1 - a) ^ 2 / a))
# 9.40743669989997

(pvaluea <- 1 - pchisq(Qa, k - 1))
# 0.400545165490795

b <- y * n2 / (n1 + n2)
(Qb <- sum((y2 - b) ^ 2 / b))
# 10.9361451636337

(pvalueb <- 1 - pchisq(Qb, k - 1))
# 0.280111283415469
