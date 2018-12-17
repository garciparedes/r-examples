## Author: Sergio García Prado
## Title: Durret - Exercise 4.20

rm(list = ls())

stationary <- c(1 / 2, 1 / 4, 1 / 4)


Q <- matrix(c(-4,  2, 2,
               3, -4, 1,
               5,  0, -5),
            3, 3, byrow = TRUE)


(R <- Q[2:nrow(Q),2:nrow(Q)])
# -4	 1
#  0	-5


sum(Q[1, 2:nrow(Q)] / sum(Q[1, 2:nrow(Q)]) * rowSums(solve(-R)))
