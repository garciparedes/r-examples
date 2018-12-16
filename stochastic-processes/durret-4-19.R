## Author: Sergio García Prado
## Title: Durret - Exercise 4.19

rm(list = ls())

l <- 5
mu <- 2

(Q <- matrix(c(-l,        l,             0,              0,          0,
               mu, -(l + mu),             l,             0,          0,
                0,    2 * mu, -(l + 2 * mu),             l,          0,
                0,         0,        2 * mu, -(l + 2 * mu),          l,
                0,         0,             0,        2 * mu, -(2 * mu)),
             5, 5, byrow = TRUE))
# -5	 5	 0	 0	 0
#  2	-7	 5	 0	 0
#  0	 4	-9	 5	 0
#  0	 0	 4	-9	 5
#  0	 0	 0	 4	-4

## Should be solved via detailed balance equations...
A <- cbind(Q[,1:(nrow(Q) - 1) ], rep(1, nrow(Q)))
(stationary <- solve(A)[nrow(A), ])
# 0.0648758236188546 0.162189559047136 0.20273694880892
# 0.253421186011151  0.316776482513938



(comming.average <- l * (1 - stationary[length(stationary)]))
# 3.41611758743031
