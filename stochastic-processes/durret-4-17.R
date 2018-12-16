## Author: Sergio García Prado
## Title: Durret - Exercise 4.16

rm(list = ls())

lambda <- 20

mu <- 10

Q <- matrix(c(-lambda,         lambda,      0,
                   mu, -(lambda + mu), lambda,
                    0,             mu,    -mu),
            3, 3, byrow = TRUE)

A <- cbind(Q[,1:(nrow(Q) - 1) ], rep(1, nrow(Q)))

(stationary <- solve(A)[nrow(A), ])
# 0.142857142857143 0.285714285714286 0.571428571428571

(comming.average <- lambda * sum(stationary[1:2]))
# 8.57142857142857
