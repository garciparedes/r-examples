## Author: Sergio García Prado
## Title: Statistical Inference - Goodness of Fit - Exercise 20


rm(list = ls())

observed <- c(0.59, 0.72, 0.47, 0.44, 0.31, 0.56, 0.22, 0.90, 0.96, 0.78, 0.66, 0.18, 0.73, 0.43, 0.58, 0.11)

test <- ks.test(observed, punif)

(pvalue <- test$p.value)
# 0.614776160341058
