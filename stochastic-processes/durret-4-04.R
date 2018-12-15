## Author: Sergio García Prado
## Title: Durret - Exercise 4.4

rm(list = ls())


QGenerator <- function(l1, l2, mu1, mu2) {
  Q <- matrix(c(-(l1 + l2),          l1,          l2,    0,    0,
                       mu1, -(mu1 + l2),           0,   l2,    0,
                       mu2,           0, -(mu2 + l1),    0,   l1,
                         0,           0,         mu1, -mu1,    0,
                         0,         mu2,           0,    0, -mu2),
              5, 5, byrow = TRUE)
  return(Q)
}

(Q <-QGenerator(1,3,2,4))
# -4	 1	 3	 0	 0
#	 2	-5	 0	 3	 0
#	 4	 0	-5	 0	 1
#	 0	 0	 2	-2	 0
#  0	 4	 0	 0	-4

A <- cbind(Q[,1:(nrow(Q) - 1) ], rep(1, nrow(Q)))

(stationary <- solve(A)[nrow(A), ])
# 0.341085271317829 0.124031007751938 0.27906976744186
# 0.186046511627907 0.0697674418604651
