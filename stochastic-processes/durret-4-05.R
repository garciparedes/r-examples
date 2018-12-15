## Author: Sergio García Prado
## Title: Durret - Exercise 4.5

rm(list = ls())


QGenerator <- function(l1, l2, mu1, mu2) {
  Q <- matrix(c(-(l1 + l2),          l1,          l2,            0,
                       mu1, -(mu1 + l2),           0,           l2,
                       mu2,           0, -(mu2 + l1),           l1,
                         0,         mu2,         mu1, -(mu1 + mu2)),
              4, 4, byrow = TRUE)
  return(Q)
}


Stationary <- function(l1, l2, mu1, mu2) {
  v <- c(mu1 * mu2, mu1 * l2, mu2 * l1, l1 * l2)
  return(v / sum(v))
}
