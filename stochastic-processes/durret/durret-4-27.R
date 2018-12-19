## Author: Sergio García Prado
## Title: Durret - Exercise 4.27

rm(list = ls())


Q <- matrix(c(-3,  2,    1,   0,
               0, -5,    5,   0,
               1,  0, -2.5, 1.5,
               6,  0,    0,  -6),
            4, 4, byrow=TRUE)

(R <- Q[c(1, 3, 4), c(1, 3, 4)])
# -3	 1.0	 0.0
#  1	-2.5	 1.5
#  6	 0.0	-6.0

(exit.time <- -solve(R) %*% rep(1, 3))
# 0.7500000
# 1.2500000
# 0.9166667

(stationary1 <-  - Q[2, 2] / (1 + Q[2, c(1, 3, 4)] %*% exit.time))
# 0.689655172413793

(r <-  - (1 / diag(Q)) * Q)
# -1.0	 0.66	 0.33	 0.0
#  0.0	-1.00	 1.00	 0.0
#  0.4	 0.00	-1.00	 0.6
#  1.0	 0.00	 0.00	-1.0

(exit.hitting <- - solve(r[c(1, 3), c(1, 3)]) %*% r[c(1, 3), 4])
# 0.2307692
# 0.6923077

sum(pgeom(1:10000-2, prob = 1 - exit.hitting[1], lower.tail = FALSE)) * exit.hitting[2] * stationary1
# 0.6206897
