## Author: Sergio García Prado
## Title: Durret - Exercise 4.1

rm(list = ls())

Q <- matrix(c(-4,  2, 2,
               3, -4, 1,
               5,  0, -5),
            3, 3, byrow = TRUE)


A <- cbind(Q[,1:(nrow(Q) - 1) ], rep(1, nrow(Q)))

(stationary <- solve(A)[nrow(A), ])


(trips.boston.atlanta <- 12 * stationary[2] * Q[2, 1])
