## Author: Sergio García Prado
## Title: Durret - Exercise 4.14

rm(list = ls())

Q <- matrix(c(-1/2,    1/2,    0,     0,
              1/20, -11/20,  1/2,     0,
                 0,   2/20, -3/5,   1/2,
                 0,      0, 2/20, -3/20),
            4, 4, byrow = TRUE)

## Should be solved via detailed balance equations...
A <- cbind(Q[,1:(nrow(Q) - 1) ], rep(1, nrow(Q)))
(stationary <- solve(A)[nrow(A), ])
# 0.00321543408360129 0.0321543408360129 0.160771704180064 0.803858520900322

(two.machines <- stationary[3] + stationary[4])
# 0.964630225080386
