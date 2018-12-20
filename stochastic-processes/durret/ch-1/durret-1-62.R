library(expm)

p <- matrix(c(0.7,  0.2,  0.1,
                0, 0.95, 0.05,
                0,    0,    1),
            3, 3, byrow = TRUE)


r <- p[1:2, 1:2]

(solve(diag(2) - r) %*% c(1, 1))[1]
