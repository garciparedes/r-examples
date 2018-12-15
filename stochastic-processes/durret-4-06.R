## Author: Sergio García Prado
## Title: Durret - Exercise 4.4

rm(list = ls())


Stationary <- function(l1, l2, mu1, mu2) {
  v <- c(mu1 * mu2, mu1 * l2, mu2 * l1, l1 * l2)
  return(v / sum(v))
}

(stationary <- Stationary(1, 1, 3, 3))
# 0.5625 0.1875 0.1875 0.0625


QGenerator <- function(l1, l2, mu1, mu2) {
  Q <- matrix(c(-(l1 + l2),               l1,               l2,            0,
                       mu1, -(mu1 + l1 + l2),               l1,           l2,
                       mu2,               l2, -(mu2 + l1 + l2),           l1,
                         0,              mu2,              mu1, -(mu1 + mu2)),
              4, 4, byrow = TRUE)
  return(Q)
}

(Q <- QGenerator(1, 1, 3, 3))
# -2	 1	 1	 0
#  3	-5	 1	 1
#  3	 1	-5	 1
#  0	 3 	 3	-6
