rm(list = ls())

library(Matrix)
library(expm)


p <- matrix(c(5/7, 2/7, 0, 0, 
              0, 1/2, 1/3, 1/6, 
              0, 0, 1/2, 1/2, 
              0, 0, 1/4, 3/4), 
            nrow=4, ncol = 4, byrow = TRUE)

## a)
p[1, 1] ^ 5

## b)

A <- p - diag(4)
A[,4] <- 1
solve(A)
