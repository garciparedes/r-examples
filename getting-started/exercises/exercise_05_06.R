#
# Title:
#   Ejercicios Computación Estadística - Hoja 5 - Ejercicio 2
#
# Author:
#   Sergio García Prado - garciparedes.me
#
# Date:
#   April 2018
#


rm(list = ls())


#
# Apartado a)
#

(tabla.normal <- pnorm(t(matrix(seq(0.0, 4.49, by = 0.01), nrow = 10))))


#
# Apartado b)
#

alpha <- c(0.4, 0.25, 0.1, 0.05, 0.025, 0.01, 0.005, 0.0025, 0.001, 0.0005)
v <- 1:100

(tabla.t <- t(sapply(v, qt, p = alpha, lower.tail = FALSE )))


#
# Apartado c)
#
alpha <- c(0.995, 0.990, 0.975, 0.95, 0.9, 0.5, 0.1, 0.05, 0.025, 0.01, 0.005 )
v <- 1:100
(tabla.chi <- t(sapply(v, qchisq, p = alpha, lower.tail = FALSE )))
