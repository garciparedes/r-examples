## Author: Sergio García Prado
## Title: Durret - Exercise 4.27

rm(list = ls())


Q <- matrix(c(-3,  2,    1,   0,
               0, -5,    5,   0,
               1,  0, -2.5, 1.5,
               6,  0,    0,  -6),
            4, 4, byrow=TRUE)

(rate <- - diag(Q))
# 3 5 2.5 6

(A <- cbind(Q[, 1:(nrow(Q) - 1)], rep(1, nrow(Q))))

(stationary <- solve(A)[nrow(A),])


(R <- Q[c(1, 3, 4), c(1, 3, 4)])
# -3	 1.0	 0.0
#  1	-2.5	 1.5
#  6	 0.0	-6.0

(g <- -solve(R) %*% rep(1, 3))
# 0.7500000
# 1.2500000
# 0.9166667

(stationary1 <- ( 1 / rate[2] + sum(Q[2, -2] / rate[2] * g)) ^ (-1))
# 0.689655172413793

(r <-  - (1 / diag(Q)) * Q)
# -1.0	 0.66	 0.33	 0.0
#  0.0	-1.00	 1.00	 0.0
#  0.4	 0.00	-1.00	 0.6
#  1.0	 0.00	 0.00	-1.0

(h <- - solve(r[c(1, 3), c(1, 3)]) %*% r[c(1, 3), 4])
# 0.2307692
# 0.6923077

(geom.mean <- 1 / (1 - h[1]))
# 1.3

geom.mean * h[2] * stationary1
# 0.6206897
