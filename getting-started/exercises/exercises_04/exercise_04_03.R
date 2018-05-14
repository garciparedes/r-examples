#
# Title:
#   Ejercicios Computación Estadística - Hoja 4 - Ejercicio 3
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


x1 <- seq(- 5, 5, length = 400)
x2 <- seq(- 2, 2, length = 100)
a <- 3
b <- 2

plot(x1, x1 ^ 2 - 15, type = "l", lty = 2, col = "red",
     xlab = "Eje x", ylab = "Eje y", main = "Parábola y elipse")
points(0, 0, col = "green")
lines(x2, sqrt(1 - (x2 / 2) ^ 2) * 3,  type = "l", col = "green")
lines(x2, - sqrt(1 - (x2 / 2) ^ 2) * 3,  type = "l", col = "green")
