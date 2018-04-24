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


)

par(mfrow = c(3,2))
n <- 20
x <- 1:n
for(p in c(0.1, 0.3, 0.5, 0.7, 0.9, 0.95)) {
  plot(x, dbinom(x, 20, p), ylab = "p(x)", pch = 20,
       main = paste0("b(", n, ", ", p, ")"))
}
