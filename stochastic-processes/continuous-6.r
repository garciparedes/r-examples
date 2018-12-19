## Author: Sergio García Prado
## Title: Exercises with Solutions 6

rm(list = ls())


P <- matrix(c(  0, 1/3, 2/3,
              1/3,   0, 2/3,
                1,   0,   0),
            3, 3, byrow = TRUE)

lambdas <- 1 / c(8, 3, 6)

(Q <- P * lambdas + diag(-lambdas))
# -0.1250000	 0.04166667  0.08333333
#  0.1111111	-0.33333333	 0.22222222
#  0.1666667	 0.00000000	-0.16666667

(A <- cbind(Q[, 1:(nrow(Q) - 1)], rep(1, nrow(Q))))
# -0.1250000	 0.04166667	1
#  0.1111111	-0.33333333	1
#  0.1666667	 0.00000000	1

(stationary <- solve(A)[nrow(A), ])
# 0.558139534883721 0.0697674418604651 0.372093023255814

(non.playing.ratio <- stationary[3])
# 0.372093023255814

(mean.pay <- sum(stationary * c(40, 30, 20)))
# 31.8604651162791
