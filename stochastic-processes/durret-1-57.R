library(expm)


r <- matrix(c(0, 2/3, 0,
              1/3, 0, 2/3,
              0, 1/3, 0), 
            3, 3, byrow = TRUE)


solve(diag(3) - r, c(0, 0, 2/3))