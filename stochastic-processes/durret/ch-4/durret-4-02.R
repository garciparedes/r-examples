## Author: Sergio García Prado
## Title: Durret - Exercise 4.2

rm(list = ls())

Q <- matrix(c(-1,  0,  1,  0,
               2, -3,  0,  1,
               0,  2, -2,  0,
               0,  0,  2, -2),
            4, 4, byrow = TRUE)


(A <- cbind(Q[,1:(nrow(Q) - 1) ], rep(1, nrow(Q))))
# -1	 0	 1	1
#  2	-3	 0	1
#  0	 2	-2	1
#  0	 0	 2	1

(stationary <- solve(A)[nrow(A), ])
# 0.4 0.2 0.3 0.1


(sold <- (1 - stationary[1]) * 2)
# 1.2
