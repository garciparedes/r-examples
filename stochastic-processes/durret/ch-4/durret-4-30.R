## Author: Sergio García Prado
## Title: Durret - Exercise 4.30

rm(list = ls())

R <- matrix(c(-(1 + 1 / 1.5 + 1 / 3),                  1,       1 / 1.5,          1 / 3,
                                   0, -(1 / 1.5 + 1 / 3),             0,              0,
                                   0,                  0,  -(1 + 1 / 3),              0,
                                   0,                  0,             0, -(1 + 1 / 1.5)),
            4, 4, byrow = TRUE)


(g <- - solve(R) %*% rep(1, 4))
# 1.35
# 1.00
# 0.75
# 0.60

## Average length of time the boat can remain at sea
g[1]
# 1.35
