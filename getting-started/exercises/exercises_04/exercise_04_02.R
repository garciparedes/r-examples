#
# Title:
#   Ejercicios Computación Estadística - Hoja 4 - Ejercicio 2
#
# Author:
#   Sergio García Prado - garciparedes.me
#
# Date:
#   April 2018
#


rm(list = ls())


x <- seq(0, 3 * pi, length = 400)

#
# Apartado a)
#

plot(x, sin(x), col="red", type = "l")
lines(x, sin(2 * x), col = "blue")
lines(x, sin(3 * x), col = "green")
lines(x, rep(0, length(x)))
lines(x, rep(1, length(x)), lty = 3)
lines(x, rep(- 1, length(x)),lty = 3)

#
# Apartado b)
#

plot(x, sin(x), col="red", type = "l")
lines(x, rep(0, length(x)))
lines(x, rep(1, length(x)), lty = 3)
lines(x, rep(- 1, length(x)),lty = 3)

plot(x, sin(2 * x), col = "blue", type = "l")
lines(x, rep(0, length(x)))
lines(x, rep(1, length(x)), lty = 3)
lines(x, rep(- 1, length(x)),lty = 3)

plot(x, sin(3 * x), col = "green", type = "l")
lines(x, rep(0, length(x)))
lines(x, rep(1, length(x)), lty = 3)
lines(x, rep(- 1, length(x)),lty = 3)


#
# Apartado c)
#

pdf("prueba.pdf")

plot(x, sin(2 * x), col = "blue", type = "l")
lines(x, rep(0, length(x)))
lines(x, rep(1, length(x)), lty = 3)
lines(x, rep(- 1, length(x)),lty = 3)

plot(x, sin(3 * x), col = "green", type = "l")
lines(x, rep(0, length(x)))
lines(x, rep(1, length(x)), lty = 3)
lines(x, rep(- 1, length(x)),lty = 3)

dev.off()
