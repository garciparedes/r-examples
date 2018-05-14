#
# Title:
#   Ejercicios Computación Estadística - Hoja 7 - Ejercicio 3
#
# Author:
#   Sergio García Prado - garciparedes.me
#
# Date:
#   May 2018
#

rm(list = ls())

library(MASS)
library(lattice)

data(singer)

histogram(~ height | voice.part, data = singer)

densityplot(~ height, group = voice.part, data = singer)
densityplot(~ height | voice.part, data = singer)

qqmath( ~ height | voice.part, data = singer,  aspect = 1, layout = c(2,4),
       xlab = "Unit Normal Quantile", ylab="Height (inches)",
       prepanel = prepanel.qqmathline,
       panel = function(x, ...) {
         panel.grid()
         panel.qqmathline(x, ...)
         panel.qqmath(x, ...)
       })
