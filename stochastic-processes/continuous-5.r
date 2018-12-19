## Author: Sergio García Prado
## Title: Exercises with Solutions 5

rm(list = ls())


Q <- matrix(c(-20,  20,   0,   0,
               10, -30,   0,  20,
                5,   0, -25,  20,
                0,   5,  10, -15),
            4, 4, byrow = TRUE)

(A <- cbind(Q[, 1:(nrow(Q) - 1)], rep(1, nrow(Q))))
# -20	 20	  0	1
#  10	-30	  0	1
#   5	  0	-25	1
#   0	  5	 10	1


(stationary <- solve(A)[nrow(A), ])
# 0.135802469135802 0.172839506172839 0.197530864197531 0.493827160493827


stationary[2] + (5 / (10 + 5)) * stationary[4]
# 0.337448559670782


20 * (1 - stationary[4])
# 10.1234567901235
