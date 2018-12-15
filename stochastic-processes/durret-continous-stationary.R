## Author: Sergio García Prado
## Title: Stationary distribution computation from jump rate matrix Q.

rm(list = ls())

Q <- matrix(c(-1/3,    0, 1,
               1/3, -1/4, 0,
                 0, 1/4, -1),
            3, 3, byrow = TRUE)

A <- rbind(Q[1:2, ], rep(1, 3))

(stationary <- solve(A, c(0, 0, 1)))
