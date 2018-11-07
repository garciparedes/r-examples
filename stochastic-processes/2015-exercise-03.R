rm(list = ls())

library(Matrix)
library(expm)

p <- matrix(c(0.95, 0.04, 0, 0.01, 0,
              0, 0, 0.995, 0.005, 0,
              0, 0, 0.09, 0.01, 0.9,
              0,0 ,0,1, 0,
              0,0, 0, 0.01, 0.99), 5, 5,byrow=TRUE)

## a)

r1 <-  matrix(c(0.95, 0.04, 0, 0,
                0, 0, 0.995, 0,
                0, 0, 0.09, 0.9,
                0,0, 0, 0.99), 4, 4,byrow=TRUE)

solve(diag(4) - r1) %*% rep(1, 4)


A <- p - diag(5)
A[, 5] <- 1
solve(A)
