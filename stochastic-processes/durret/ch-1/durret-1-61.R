library(expm)

p <- matrix(c(1,   0,   0,   0,
              1/2, 0, 1/2,   0,
              0, 1/2,   0, 1/2,
              0,   0,   0,   1), 
            4, 4, byrow = TRUE)


r <- p[2:3, 2:3]
r

solve(diag(2) - r, c(0, 1/2))[1]
(solve(diag(2) - r) %*% c(1, 1))[1]
