## Author: Sergio García Prado
## Title: Statistical Inference - Goodness of Fit - Exercise 15


rm(list = ls())

observed <- c(1.0, 2.3, 4.2, 7.1, 10.4)


(k <- length(observed))
# 5

(lambda.hat <- 1 / mean(observed))
# 0.2

test <- ks.test(observed, pexp, rate = 1 / mean(observed))

(D <- test$statistic[[1]])
# 0.181269246922018

(criticvalue <- quantile(replicate(1000, ks.test(rexp(k, lambda.hat), pexp, rate = lambda.hat)$statistic), 0.95))
# 95%: 0.56811734613071

D > criticvalue
# FALSE (H0 no refused)
