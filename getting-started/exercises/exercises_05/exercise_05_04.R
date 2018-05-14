#
# Title:
#   Ejercicios Computación Estadística - Hoja 5 - Ejercicio 4
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

par(mfrow = c(2, 4))
x  <- seq(0, 20, length = 200)
for (i in c(6, 0.5)) {
  for (j in c(0.5, 4)) {
    plot(x, dgamma(x, j, i), type = "l", ylab = "f(x)", main = paste0("Gamma(",j, ", ", i, ")"))
  }
}
for (i in c(6, 0.5)) {
  for (j in c(0.5, 4)) {
    plot(x, pgamma(x, j, i), type = "l", ylab = "F(x)", main = paste0("Gamma(",j, ", ", i, ")"))
  }
}

#
# Apartado b)
#

par(mfrow = c(1, 4))
for (i in c(6, 0.5)) {
  for (j in c(0.5, 4)) {
    plot(x, dgamma(x, j, i), type = "l", ylab = "f(x)", main = paste0("Gamma(",j, ", ", i, ")"))
  }
}
for (i in c(6, 0.5)) {
  for (j in c(0.5, 4)) {
    plot(x, pgamma(x, j, i), type = "l", ylab = "F(x)", main = paste0("Gamma(",j, ", ", i, ")"))
  }
}
