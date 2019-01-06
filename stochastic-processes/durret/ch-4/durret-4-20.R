## Author: Sergio García Prado
## Title: Durret - Exercise 4.20

rm(list = ls())

l <- 5
mu <- 4

(Q <- matrix(c(-l,        l,          0,          0,   0,
               mu, -(l + mu),         l,          0,   0,
                0,        mu, -(l + mu),          l,   0,
                0,         0,        mu, -(l +  mu),   l,
                0,         0,             0,     mu, -mu),
             5, 5, byrow = TRUE))
# -5	 5	 0	 0	 0
#  4	-9	 5	 0	 0
#  0	 4	-9	 5	 0
#  0	 0	 4	-9	 5
#  0	 0	 0	 4	-4

## Should be solved via detailed balance equations...
A <- cbind(Q[,1:(nrow(Q) - 1) ], rep(1, nrow(Q)))
(stationary <- solve(A)[nrow(A), ])
# 0.121846739647787 0.152308424559733 0.190385530699667
# 0.237981913374583 0.297477391718229

(comming.average <- l * (1 - stationary[length(stationary)]))
# 3.51261304140885


## This case is more efficent thant two servers with mu = 2 rate due to here
## we are serving at rate = 4 for any number of clients, whereas at
## two-servers-case we only serve at rate = 4 when there are at least two
## clients.
