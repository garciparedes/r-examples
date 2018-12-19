rm(list = ls())

library(Matrix)
library(expm)

p = matrix(rep(0, 16), 
           4, 4, byrow = TRUE)

p[1, 1:4] <- dbinom(0:3, 3, 1/6)
p[2, 2:4] <- dbinom(0:2, 2, 1/6)
p[3, 3:4] <- dbinom(0:1, 1, 1/6)
p[4, 4] <- 1

p %^% 3

r1 <- p[1:3, 1:3]

solve(diag(3) - r1) %*% rep(1, 3)

