rm(list = ls())

library(expm)


p <- matrix(c(  0, 1/4,   0, 1/4, 1/4, 1/4,
              1/4,   0, 1/4,   0, 1/4, 1/4,
                0,   0,   0,   0,   0,   1,
                0,   0,   0,   1,   0,   0,
              1/4, 1/4,   0, 1/4,   0, 1/4,
                0,   0,   1,   0,   0,   0), 
            6, 6, byrow = TRUE,
            dimnames = list(row=c("D", "H", "J", "M", "S", "T"),
                            colum=c("D", "H", "J", "M", "S", "T")))

r <- p[c("D", "H", "S"), 
       c("D", "H", "S")]

solve(diag(3) - r, c(1/4, 0, 1/4))[1]


