## Author: Sergio García Prado
## Title: Durret - Exercise 4.16

rm(list = ls())

Q <- matrix(c( -3,     3,     0,    0,    0,    0,
              1/6, -19/6,     3,    0,    0,    0,
                0,   2/6, -10/3,    3,    0,    0,
                0,     0,   3/6, -5/2,    2,    0,
                0,     0,     0,  3/6, -3/2,    1,
                0,     0,     0,    0,  3/6, -3/6),
            6, 6, byrow = TRUE)

## Should be solved via detailed balance equations...
A <- cbind(Q[,1:(nrow(Q) - 1) ], rep(1, nrow(Q)))
(stationary <- solve(A)[nrow(A), ])
# 7.8021377857533e-05 0.00140438480143559 0.0126394632129203 0.075836779277522
# 0.303347117110088 0.606694234220176

(complete.working.ratio <- sum(stationary[4:6]))
# 0.985878130607787
