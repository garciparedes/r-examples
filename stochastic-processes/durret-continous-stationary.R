## Author: Sergio García Prado
## Title: Stationary distribution computation from jump rate matrix Q.

rm(list = ls())

Q <- matrix(c(-1/3,  1/3,   0,
                 0, -1/4, 1/4,
                 1,    0,  -1),
            3, 3, byrow = TRUE)


A <- cbind(Q[,1:(nrow(Q) - 1) ], rep(1, nrow(Q)))

(stationary <- c(rep(0, nrow(Q) - 1), 1) %*% solve(A))
