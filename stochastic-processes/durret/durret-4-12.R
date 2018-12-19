## Author: Sergio García Prado
## Title: Durret - Exercise 4.11

rm(list = ls())


Stationary <- function(lambda, mu, k) {
  (lambda / mu) ^ (0:k) / sum((lambda / mu) ^ (0:k))
}


Stationary(2, 1, 3)
# 0.0666666666666667 0.133333333333333 0.266666666666667 0.533333333333333
