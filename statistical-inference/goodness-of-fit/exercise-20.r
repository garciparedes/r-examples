## Author: Sergio García Prado
## Title: Statistical Inference - Goodness of Fit - Exercise 20


rm(list = ls())

observed <- c(1.5, 2.3, 4.2, 7.1, 10.4, 8.4, 9.3, 6.5, 2.5, 4.6)

(k <- length(observed))
# 10

(lambda.hat <-1 / mean(observed))
# 0.176056338028169

test <- ks.test(observed, pexp, rate = lambda.hat)

(D <- test$statistic[[1]])
# 0.232976217289659

(criticvalue <- quantile(replicate(1000, ks.test(rexp(k, lambda.hat), pexp, rate = lambda.hat)$statistic), 0.95))
# 0.4109577865723

D > criticvalue
# FALSE (H0 no refused)
