## Author: Sergio García Prado
## Title: Exercises with Solutions 2

rm(list = ls())

lambda <- 5
mu <- 6

(W.Q <- lambda / (mu * (mu - lambda)))
# 0.833333333333333

(L.Q <- lambda * W.Q)
# 4.16666666666667

StationaryValue <- function(state, lambda, mu) {
  (1 - lambda / mu) * (lambda / mu) ^ state
}

StationaryValue(0, lambda, mu)
# 0.166666666666667

(saturated <- 1 - sum(StationaryValue(0:3, lambda, mu)))
# 0.482253086419753
