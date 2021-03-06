## Author: Sergio García Prado
## Title: Durret - Exercise 4.15

rm(list = ls())

Q <- matrix(c(  -1,      1,    0,     0,
              1/20, -21/20,    1,     0,
                 0,   2/20, -3/5,   1/2,
                 0,      0, 3/20, -3/20),
            4, 4, byrow = TRUE)

## Should be solved via detailed balance equations...
A <- cbind(Q[,1:(nrow(Q) - 1) ], rep(1, nrow(Q)))
(stationary <- solve(A)[nrow(A), ])
# 0.00112654900488171 0.0225309800976342 0.225309800976342 0.751032669921142

(reparing.ratio <- stationary[1] + stationary[2])
# 0.023657529102516

(mean.working <- sum(0:3 * stationary))
# 2.72624859181374
