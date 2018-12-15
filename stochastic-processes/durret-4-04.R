## Author: Sergio García Prado
## Title: Durret - Exercise 4.4

rm(list = ls())


QGenerator <- function(l1, l2, mu1, mu2) {
  Q <- matrix(c(-(l1 + l2),          l1,          l2,    0,
                       mu1, -(mu1 + l2),           0,   l2,
                       mu2,           0, -(mu2 + l1),   l1,
                         0,           0,         mu1, -mu1),
              4, 4, byrow = TRUE)
  return(Q)
}

(Q <-QGenerator(1,3,2,4))
# -4	 1   3	 0
#  2	-5	 0	 3
#  4	 0	-5	 1
#  0	 0	 2	-2

A <- cbind(Q[,1:(nrow(Q) - 1) ], rep(1, nrow(Q)))

(stationary <- solve(A)[nrow(A), ])
# 0.350877192982456 0.0701754385964912 0.315789473684211 0.263157894736842
