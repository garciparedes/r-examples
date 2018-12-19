## Author: Sergio García Prado
## Title: Exercises with Solutions 1

rm(list = ls())


Q <- matrix(c(-1/3,  1/3,   0,
              1/20, -1/4,  1/5,
               1/2,    0, -1/2),
            3, 3, byrow = TRUE)

(A <- cbind(Q[, 1:(nrow(Q) - 1)], rep(1, nrow(Q))))
# -0.3333333	 0.3333333	1
#  0.0500000	-0.2500000	1
#  0.5000000	 0.0000000	1

(stationary <- solve(A)[nrow(A), ])
# 0.348837209302326 0.465116279069767 0.186046511627907

R <- Q[1:2, 1:2]
(between.rainy <- (- solve(R) %*% rep(1, nrow(R)))[1])
# 8.75

r <-  - Q / diag(Q)
(a <- cbind(r[, 1:(nrow(r) - 1)], rep(1, nrow(r))))
# -1.0	 1	1
#  0.2	-1	1
#  1.0 	 0	1

solve(a)[nrow(a), ]
# 0.357142857142857 0.357142857142857 0.285714285714286
