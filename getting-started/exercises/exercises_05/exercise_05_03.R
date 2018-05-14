#
# Title:
#   Ejercicios Computación Estadística - Hoja 5 - Ejercicio 3
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
x  <- seq(-5, 5, length = 200)
for (i in c(1, 0.25)) {
  for (j in c(0, 2)) {
    plot(x, dnorm(x, j, i), type = "l", ylab = "f(x)", main = paste0("N(",j, ", ", i, ")"))
  }
}
for (i in c(1, 0.25)) {
  for (j in c(0, 2)) {
    plot(x, pnorm(x, j, i), type = "l", ylab = "F(x)", main = paste0("N(",j, ", ", i, ")"))
  }
}

#
# Apartado b)
#

par(mfrow = c(1, 4))
x  <- seq(-5, 5, length = 200)
for (i in c(1, 0.25)) {
  for (j in c(0, 2)) {
    plot(x, dnorm(x, j, i), type = "l", ylab = "f(x)", main = paste0("N(",j, ", ", i, ")"))
  }
}
for (i in c(1, 0.25)) {
  for (j in c(0, 2)) {
    plot(x, pnorm(x, j, i), type = "l", ylab = "F(x)", main = paste0("N(",j, ", ", i, ")"))
  }
}

#
# Apartado c)
#

d <- rnorm(400, 3, 2)

mean(d)
median(d)
var(d)
min(d)
max(d)
quantile(d, 0.25)
quantile(d, 0.75)
IQR(d)
