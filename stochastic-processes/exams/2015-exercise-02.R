rm(list = ls())

library(Matrix)
library(expm)

p <- matrix(c(1/2, 1/2, 0,
              1/3, 1/3, 1/3,
                0, 1/2, 1/2),
            3, 3, byrow = TRUE)

## a)
(p %^% 3)[1, 1]

# b)
r1 <- matrix(c(1/2, 1/2,
               1/3, 1/3),
             2, 2, byrow = TRUE)
(g <- solve(diag(2) - r1) %*% c(1,1))
# 7
# 5

(EiT3 <- 1 + p[, -3] %*% g)
# 7.0
# 5.0
# 3.5

# c)
(A <- cbind((p - diag(nrow(p)))[, 1:(nrow(p) -1)], rep(1, nrow(p))))
# -0.5000000	 0.5000000	1
#  0.3333333	-0.6666667	1
#  0.0000000	 0.5000000	1

(stationary <- solve(A)[nrow(A),])
# 0.285714285714286 0.428571428571429 0.285714285714286

(EiTi <- 1 / stationary)
# 3.5 2.33333333333333 3.5

(EiVi <- EiTi - 1)
# 2.5 1.33333333333333 2.5
