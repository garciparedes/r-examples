## Author: Sergio García Prado
## Title: Statistical Inference - Goodness of Fit - Exercise 20


rm(list = ls())

observed <- c(1.5, 2.3, 4.2, 7.1, 10.4, 8.4, 9.3, 6.5, 2.5, 4.6)

test <- ks.test(observed, pexp, rate = 1 / mean(observed))

(D <- test$statistic[[1]])
# 0.232976217289659

(pvalue <- test$p.value)
# 0.572663346985868
