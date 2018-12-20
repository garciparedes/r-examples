## Author: Sergio García Prado
## Title: Durret - Exercise 4.10

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
