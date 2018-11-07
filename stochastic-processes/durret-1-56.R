library(expm)


p <- matrix(c(1, 0, 0, 0,
              0.1, 0.8, 0.1, 0,
              0.1, 0.4, 0.4, 0.1,
              0,0,0,1), 
            4, 4, byrow = TRUE)

r <- p[2:3, 2:3]

solve(diag(2) - r, c(0.1, 0.1))


