## Author: Sergio García Prado
## Title: Statistical Inference - Goodness of Fit - Exercise 20


rm(list = ls())

CummulativeFunction <- function(x) {
  ifelse(x < 0,
    0,
  ifelse(1 < x,
    1,
  x ^ 2 * (3 - 2 * x)))
}

observed <- c(95, 80, 40, 52, 60, 80, 82, 58, 65, 50)

test <- ks.test(observed, CummulativeFunction)

(pvalue <- test$p.value)
# 4.1223072733132e-09
