## Author: Sergio García Prado
## Title: Exercises with Solutions 4

rm(list = ls())

Q <- matrix(c(-4/10, 4/10,      0,      0,    0,
                1/2, -4/5,   3/10,      0,    0,
                  0,  3/4, -19/20,   2/10,    0,
                  0,    0,      1, -11/10, 1/10,
                  0 ,   0,      0,      1,    -1),
              5, 5, byrow = TRUE)


A <- cbind(Q[, 1:(nrow(Q) - 1)], rep(1, nrow(Q)))

## Should be solved via detailed balance equations...
(stationary <- solve(A)[nrow(Q), ])
# 0.456537618699781 0.365230094959825 0.14609203798393 0.029218407596786 0.00292184075967864

(machines.mean <- sum(4:0 * stationary))
# 3.24324324324324

(all.busy.ratio <- sum(stationary[3] / 2, stationary[4:5]))
# 0.10518626734843
