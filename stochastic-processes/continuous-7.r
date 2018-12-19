## Author: Sergio García Prado
## Title: Exercises with Solutions 6

rm(list = ls())

la <- 10
lb <- 5
mu1 <- 3 / 60
mu2 <- 4 / 60

(Q <- matrix(c(-(la + lb),                 la,            lb,                0,
                    1/mu1, -(1/mu1 + lb + la),             0,          lb + la,
                    1/mu2,                  0, -(1/mu2 + la),               la,
                        0,              1/mu2,         1/mu1, -(1/mu1 + 1/mu2)),
             4, 4, byrow = TRUE))
# -15	 10  	5	  0
#  20	-35	  0	 15
#  15	  0	-25	 10
#   0	 15	 20	-35

(A <- cbind(Q[, 1:(nrow(Q) - 1)], rep(1, nrow(Q))))
# -15	 10   5	1
#  20	-35	  0	1
#  15	  0	-25	1
#   0	 15	 20	1

(stationary <- solve(A)[nrow(A), ])
# 0.461538461538462 0.192307692307692 0.205128205128205 0.141025641025641

(la * (1 - (stationary[4])))
# 8.58974358974359

lb * (1 - (stationary[3] + stationary[4]))
# 3.26923076923077
