## Author: Sergio García Prado
## Title: Durret - Exercise 4.20

rm(list = ls())

l <- 3
mu <- 1

(Q <- matrix(c(-l,         l,   0,
               mu, -(l + mu),   l,
                0,        mu, -mu),
             3, 3, byrow = TRUE))
# -3	 3	 0
#  1	-4	 3
#  0	 1	-1

## Should be solved via detailed balance equations...
A <- cbind(Q[,1:(nrow(Q) - 1) ], rep(1, nrow(Q)))
(stationary <- solve(A)[nrow(A), ])
# 0.0769230769230769 0.230769230769231 0.692307692307692
