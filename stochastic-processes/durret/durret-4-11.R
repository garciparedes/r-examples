## Author: Sergio García Prado
## Title: Durret - Exercise 4.11

rm(list = ls())

Stationary <- function(l, m) {
  p0 <- prod(m) / (prod(m) + l[1] * m[2] * m[3] + m[1] * l[2] * m[3] + m[1] * m[2] * l[3])
  stationary <- c(1, l / m) * p0
  return(stationary)
}


QGenerator <- function(l, m) {
  Q <- matrix(c(-sum(l), l[1],   l[2], l[3],
                   m[1], -m[1],     0,    0,
                   m[2],     0, -m[2],    0,
                   m[3],     0,     0, -m[3]),
              4, 4, byrow = TRUE)
  return(Q)
}


QGenerator(c(1/24, 1/30, 1/84), c(1/3, 1/5, 1/7))
# -0.08690476	 0.04166667	 0.03333333	 0.01190476
#  0.33333333	-0.33333333	 0.00000000	 0.00000000
#  0.20000000	 0.00000000	-0.20000000	 0.00000000
#  0.14285714	 0.00000000	 0.00000000	-0.14285714

Stationary(c(1/24, 1/30, 1/84), c(1/3, 1/5, 1/7))
# 0.727272727272727 0.0909090909090909 0.121212121212121 0.0606060606060606
