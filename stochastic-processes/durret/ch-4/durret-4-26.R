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

(rate <- - diag(Q))
# 2 4 4 6


A <- cbind(Q[,1:(nrow(Q) - 1) ], rep(1, nrow(Q)))

(stationary <- solve(A)[nrow(A), ])
# 0.333333333333333 0.222222222222222 0.333333333333333 0.111111111111111


(R <- Q[2:4, 2:4])
# -4	 4	 0
#  0	-4	 2
#  2	 4	-6

(g <- -solve(R) %*% rep(1, nrow(R)))
# 1.00
# 0.75
# 1.00


sum(Q[1, -1] / rate[1]  * g)
# 1

(1 / (stationary * rate) - 1 / rate)[1]
# 1
