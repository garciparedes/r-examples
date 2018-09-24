#
# Title:
#   Análisis de Datos Categóricos - Getting Started
#
# Author:
#   Sergio García Prado - garciparedes.me
#
# Date:
#   September 2018
#

rm(list = ls())

rep = 1000

r <- array(NA, rep)
PI <- .5
for (i in 1:rep) {
  n <- 100
  x <- rbinom(n, 1, PI)
  p <- mean(x)
  q <- qnorm(0.975, 0, 1)
  e <- q * sqrt(p * (1 - p) / n)
  IC <- c(p - e, p + e)
  r[i] <- (IC[1] <= PI) * (IC[2] >= PI)
}
r
sum(r) / 1000 * 100