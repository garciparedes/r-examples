#
# Title:
#   Ejercicios Computación Estadística - Hoja 6 - Ejercicio 1
#
# Author:
#   Sergio García Prado - garciparedes.me
#
# Date:
#   May 2018
#


f <- function(x, pch = 20, cex = 2, col.points = "gray", col.mean = "red",
              col.median = "green", ...) {
  plot(rep(0, length(x)), x, pch = pch, xaxt="n", xlab="", col = col.points,
       cex = cex, ...)
  points(0, mean(x), pch = pch, cex = cex,col = col.mean)
  points(0, median(x), pch = pch, cex = cex, col = col.median)
}


f((1:100)^2)
