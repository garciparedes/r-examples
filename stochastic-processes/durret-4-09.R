## Author: Sergio García Prado
## Title: Durret - Exercise 4.3

rm(list = ls())


QGenerator <- function(l1, l2, m1, m2) {
  Q <- matrix(c(-m1,         m1,    0,
                 l1, -(l1 + l2),   l2,
                  0,         m2, -m2),
              3, 3, byrow = TRUE)
  return(Q)
}

(Q <- QGenerator(1, 2, 3, 4))
# -3	 3	 0
#  1	-4	 2
#  0	 4	-4

## Should be solved via detailed balance equations...
A <- cbind(Q[,1:(nrow(Q) - 1) ], rep(1, nrow(Q)))
(stationary <- solve(A)[nrow(A), ])
# 0.181818181818182 0.545454545454546 0.272727272727273
