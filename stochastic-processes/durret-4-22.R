## Author: Sergio García Prado
## Title: Durret - Exercise 4.20

rm(list = ls())

l <- 2
mu <- 3

(Q <- matrix(c(-l,         l,             0,          0,
               mu, -(l + mu),             l,          0,
                0,    2 * mu, -(l + 2 * mu),          l,
                0,         0,        3 * mu, - (3 * mu)),
             4, 4, byrow = TRUE))
# -2	 2	 0   0
#  3	-5	 2	 0
#  0	 6	-8	 2
#  0	 0	 9	-9

## Should be solved via detailed balance equations...
A <- cbind(Q[,1:(nrow(Q) - 1) ], rep(1, nrow(Q)))
(stationary <- solve(A)[nrow(A), ])
# 0.515923566878981 0.343949044585987 0.114649681528662
# 0.0254777070063694


(busy.ratio <- stationary[length(stationary)])
# 0.0254777070063694

(clients.mean <- sum(0:(length(stationary) - 1) * stationary))
# 0.64968152866242
