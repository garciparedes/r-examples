## Author: Sergio García Prado
## Title: Durret - Exercise 4.3

rm(list = ls())


QGenerator <- function(l, mu1, mu2) {
  Q <- matrix(c( -l,         l/2,        l/2,                0,           0,
                mu1,  -(mu1 + l),          0,                l,           0,
                mu2,           0, -(mu2 + l),                l,           0,
                  0,         mu2,        mu1, -(mu1 + mu2 + l),           l,
                  0,           0,          0,        mu1 + mu2, -(mu1 + mu2)),
              5, 5, byrow = TRUE)
  return(Q)
}

(Q <- QGenerator(2, 3, 3))
# -2	 1	 1	 0 	 0
#  3	-5	 0	 2	 0
#  3	 0	-5	 2	 0
#  0	 3	 3	-8	 2
#  0	 0	 0	 6	-6

A <- cbind(Q[,1:(nrow(Q) - 1) ], rep(1, nrow(Q)))

(stationary <- solve(A)[nrow(A), ])
# 0.509433962264151 0.169811320754717 0.169811320754717
# 0.113207547169811 0.0377358490566037
