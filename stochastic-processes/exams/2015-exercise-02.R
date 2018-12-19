rm(list = ls())

library(Matrix)
library(expm)

p <- matrix(c(1/2, 1/2, 0,
              1/3, 1/3, 1/3,
                0, 1/2, 1/2), 
            3, 3, byrow = TRUE)

## a)
(p %^% 3)[1, 1]

# b)
r1 <- matrix(c(1/2, 1/2,
               1/3, 1/3), 
             2, 2, byrow = TRUE)
solve(diag(2) - r1) %*% c(1,1)

# c)
A <- p - diag(ncol(p))
A[, ncol(A)] <- 1 
c(0, 0, 1) %*% solve(A)
