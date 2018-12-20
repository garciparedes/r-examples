## Author: Sergio García Prado
## Title: Durret - Exercise 4.20

rm(list = ls())

stationary <- c(1 / 2, 1 / 4, 1 / 4)


Q <- matrix(c(-4,  2, 2,
               3, -4, 1,
               5,  0, -5),
            3, 3, byrow = TRUE)

(rate <- -diag(Q))
# 4 4 5

(R <- Q[-1, -1])
# -4	 1
#  0	-5


(g <- solve(-R) %*% rep(1, nrow(R)))
# 0.3
# 0.2

(Q[1, -1] / rate[1]) %*% g
# 0.25


1 / (stationary * rate) - 1 / rate
# 0.25
