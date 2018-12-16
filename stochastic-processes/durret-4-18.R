## Author: Sergio García Prado
## Title: Durret - Exercise 4.16

rm(list = ls())

l <- 20
mu <- 10

Q <- matrix(c(-l,         l,             0,             0,         0,
              mu, -(l + mu),             l,             0,         0,
               0,    2 * mu, -(l + 2 * mu),             l,         0,
               0,         0,        2 * mu, -(l + 2 * mu),         l,
               0,         0,             0,        2 * mu, -(2 * mu)),
            5, 5, byrow = TRUE)

A <- cbind(Q[,1:(nrow(Q) - 1) ], rep(1, nrow(Q)))

(stationary <- solve(A)[nrow(A), ])
# 0.111111111111111 0.222222222222222 0.222222222222222
# 0.222222222222222 0.222222222222222

(comming.average <- l * (1 - stationary[4]))
# 15.5555555555556
