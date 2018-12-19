## Author: Sergio García Prado
## Title: Durret - Exercise 4.29

rm(list = ls())

lambda <- 1.5
mu <- 0.5

(Q <- matrix(c(-lambda,         lambda,                  0,                  0,        0,
                    mu, -(mu + lambda),             lambda,                  0,        0,
                     0,         2 * mu, -(2 * mu + lambda),             lambda,        0,
                     0,              0,             3 * mu, -(3 * mu + lambda),   lambda,
                     0,              0,                  0,             4 * mu, -(4 * mu)),
            5, 5, byrow = TRUE))
# -1.5	 1.5	 0.0	 0.0	 0.0
#  0.5	-2.0 	 1.5	 0.0	 0.0
#  0.0	 1.0	-2.5	 1.5	 0.0
#  0.0	 0.0	 1.5	-3.0	 1.5
#  0.0	 0.0	 0.0	 2.0	-2.0


(A <- cbind(Q[, 1:(nrow(Q) - 1)], rep(1, nrow(Q))))
# -1.5	 1.5	 0.0	 0.0	1
#  0.5	-2.0	 1.5	 0.0	1
#  0.0	 1.0	-2.5	 1.5	1
#  0.0	 0.0	 1.5	-3.0	1
#  0.0	 0.0	 0.0	 2.0	1


(stationary <- solve(A)[nrow(A), ])
# 0.0610687022900763 0.183206106870229 0.274809160305344 0.274809160305344
# 0.206106870229008


(saturated.rate <- lambda * stationary[length(stationary)])
# 0.309160305343511


(R <- Q[1:4, 1:4])
# -1.5	 1.5	 0.0	 0.0
#  0.5	-2.0	 1.5	 0.0
#  0.0 	 1.0	-2.5	 1.5
#  0.0	 0.0 	 1.5	-3.0

(g <- - solve(R) %*% rep(1, nrow(R)))
# 4.740741
# 4.074074
# 3.185185
# 1.925926

## TODO: d)
