rm(list = ls())

library(Matrix)
library(expm)

p = matrix(c(1.0, 0.0, 0.0, 0.0, 0.0,
             0.4, 0.0, 0.6, 0.0, 0.0,
             0.0, 0.6, 0.0, 0.4, 0.0,
             0.0, 0.0, 0.8, 0.0, 0.2,
             0.0, 0.0, 0.0, 0.0, 1.0), 
           5, 5, byrow = TRUE)

p %^% 3
p %^% 4

r1 <- matrix(c(0.0, 0.6, 0.0,
               0.6, 0.0, 0.4,
               0.0, 0.8, 0.0), 
             3, 3, byrow = TRUE)

solve(diag(3) - r1, c(0.4, 0.0, 0.0))

solve(diag(3) - r1, c(0.0, 0.0, 0.2))


solve(diag(3) - r1) %*% rep(1, 3)

rowSums(solve(diag(3) - r1))
