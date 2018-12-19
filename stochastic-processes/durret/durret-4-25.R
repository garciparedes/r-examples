## Author: Sergio García Prado
## Title: Durret - Exercise 4.20

rm(list = ls())

stationary <- c(1 / 2, 1 / 4, 1 / 4)


Q <- matrix(c(-4,  2, 2,
               3, -4, 1,
               5,  0, -5),
            3, 3, byrow = TRUE)


(r <- - Q / diag(Q) )
# -1.00	 0.5	 0.50
#  0.75	-1.0	 0.25
#  1.00  0.0	-1.00

(R <- Q[2:nrow(Q),2:nrow(Q)])
# -4	 1
#  0	-5

r[1, c(2, 3)] %*% solve(-R) %*% rep(1, nrow(R))
# 0.25


1 / (stationary * - diag(Q)) + 1 / diag(Q)
# 0.25
