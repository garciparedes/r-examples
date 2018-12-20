## Author: Sergio García Prado
## Title: Durret - Exercise 4.8

rm(list = ls())


QGenerator <- function(l, m1, m2) {
  Q <- matrix(c(-l,   l,    0,        0,
                 0, -m1,   m1,        0,
                m2,   0, -m1, m1 - m2,
                 0,  m2,  m1, -(m1 + m2)),
              4, 4, byrow = TRUE)
  return(Q)
}

(Q <- QGenerator(2, 4, 2))
# -2	 2	 0	 0
#  0	-4	 4	 0
#  2	 0	-4	 2
#  0	 2	 4	-6

A <- cbind(Q[,1:(nrow(Q) - 1) ], rep(1, nrow(Q)))

(stationary <- solve(A)[nrow(A), ])
# 0.333333333333333 0.222222222222222 0.333333333333333 0.111111111111111

(entering <- 1 - stationary[1])
# 0.666666666666667

(finishing <- stationary[3] + stationary[4])
# 0.444444444444444
