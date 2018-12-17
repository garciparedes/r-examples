## Author: Sergio García Prado
## Title: Durret - Exercise 4.26

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


(R <- Q[2:4, 2:4])
# -4	 4	 0
#  0	-4	 2
#  2	 4	-6


sum(Q[1, 2:nrow(Q)] / sum(Q[1, 2:nrow(Q)]) * -rowSums(solve(R)))
