#
# Title:
#   Ejercicios Computación Estadística - Hoja 7 - Ejercicio 2
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

data(Cars93)


xyplot(MPG.city ~ Weight | Type, data = Cars93, type = c("p", "r"),
       main = "Cars (1993 Makes & Models)", ylab = "Gallons per 100 miles",
       col.line = "black", lty = "dashed", aspect = 0.7, layout = c(3,2))
