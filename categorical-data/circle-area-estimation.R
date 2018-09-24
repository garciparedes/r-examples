#
# Title:
#   Análisis de Datos Categóricos - Circle Area Estimation
#
# Author:
#   Sergio García Prado - garciparedes.me
#
# Date:
#   September 2018
#

rm(list = ls())

# Sample Size
n <- 10000

points <- matrix(runif(n * 2), ncol=2)

# Puntual Estimation
p <- mean(rowSums(points ^ 2, 1) <= 1)
(circleArea <- p * 4)

# Confidence Interval
PI <- .5
q <- qnorm(0.975, 0, 1)
e <- q * sqrt(p * (1 - p) / n)
CI <- c(p - e, p + e)
(circleAreaCI <- CI * 4)
